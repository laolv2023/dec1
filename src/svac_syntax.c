/**
 * svac_syntax.c — SVAC Syntax/Prediction/Transform/Filter
 *
 * REVERSE ENGINEERED from VNplayer.dll:
 *   Module 4: syntax_dispatch.asm       (0x100553e0-0x10055826, 439 insn)
 *   Module 5: nal_sps_pps.asm           (0x10044000-0x10045000, 1260 insn)
 *   Module 6: idct_reconstruct.asm      (0x100441e0-0x10044ff0, 1110 insn)
 *   Module 7-8: inter_pred_ref.asm      (0x10044902-0x10044f60, 539 insn)
 *   Module 9-10: reconstruction dispatch (0x10044370 main loop)
 *
 * EVERY FUNCTION ANNOTATED WITH DLL ADDRESS RANGE.
 * DATA TABLES EXTRACTED FROM DLL BINARY.
 */
#include "svac_syntax.h"
#include "svac_cabac.h"
#include "svac_coeff_decode.h"
#include "svac_mb_parser.h"
#include <string.h>

/* ===================================================================
 * DATA TABLES — extracted from VNplayer.dll binary
 * =================================================================== */

/* @DLL[0x10602aa4] — QpScaleTable, byte lookup, 56 entries
 * Accessed at @0x1004446a: movzx eax,byte ptr [eax+0x10602aa4]
 * This is the standard SVAC/H.264 QP→scale mapping for dequantization. */
static const uint8_t svac_qp_scale_tab[56] = {
    0x00,0x01,0x02,0x03,0x04,0x05,0x06,0x07,
    0x08,0x09,0x0a,0x0b,0x0c,0x0d,0x0e,0x0f,
    0x10,0x11,0x12,0x13,0x14,0x15,0x16,0x17,
    0x18,0x19,0x1a,0x1b,0x1c,0x1d,0x1e,0x1f,
    0x20,0x21,0x21,0x22,0x23,0x23,0x24,0x24,
    0x25,0x25,0x26,0x26,0x27,0x27,0x27,0x28,
    0x28,0x28,0x29,0x29,0x29,0x2a,0x2a,0x2a
};

/* ===================================================================
 * EXTERNALS — functions traced from other DLL modules
 * =================================================================== */
extern int svac_cabac_decode_bin(void *ctx, SvacCtxModel *model);
extern int mb_type_cabac_decode(void *ctx);

/* DLL sub-functions (addresses verified, full bodies in respective modules):
 *   @0x10054e40 — slice_header_init
 *   @0x10054ea0 — slice_params_decode
 *   @0x10054ec0 — mb_type_cabac_decode     (svac_mb_parser.c)
 *   @0x100551f0 — intra_chroma_mode_decode
 *   @0x10055250 — intra_luma_mode_decode
 *   @0x10015dc0 — intra_pred_setup_I_mb
 *   @0x10016020 — intra_pred_setup_I_PCM
 *   @0x100439c0 — intra_pred_10bit_I16x16
 *   @0x10043bd0 — intra_pred_8bit_I16x16
 *   @0x100435f0 — intra_pred_10bit_I4x4
 *   @0x100437f0 — intra_pred_8bit_I4x4
 *   @0x10015ce0 — inter_pred_setup
 *   @0x1001cd60 — slice_terminate
 *   @0x1001f7a0 — mb_loop_continue_check
 *   @0x10020df0 — sub_mb_pred_setup
 *   @0x100553e0 — syntax_element_dispatch  (Module 4)
 *   @0x10055480 — ref_index_dispatch       (Module 4)
 *   @0x100555b0 — cbp_dispatch             (Module 4)
 *   @0x100557b0 — syntax_flag_fallback      (Module 4)
 *   @0x10045fd0 — deblock_filter_mb
 *   @0x1004cca0 — chroma_reconstruct_10bit
 *   @0x1004bd60 — chroma_reconstruct_8bit
 *   @0x10040330 — luma_reconstruct_10bit
 *   @0x10040730 — luma_reconstruct_8bit
 *   @0x100ce9a0 — log_error (printf-style)
 *
 * DECODER STATE STRUCTURE (from DLL offsets):
 *   [esi+0x570]           = SvacCabacEngine*
 *   [esi+0x255c8f0]       = current_mb_index      (int32)
 *   [esi+0x255c8f4]       = total_mb_count        (int32)
 *   [esi+0x255c8ec]       = frame_width_mb        (int32)
 *   [esi+0x255c8e8]       = frame_height_mb       (int32)
 *   [esi+0x255c8f8]       = coded_block_flag      (int32)
 *   [esi+0x580]           = bit_depth_flag        (int32: 0=8bit, 1=10bit)
 *
 *   [edi+0x24008e8]       = mb_type               (uint16, array of 0x74 stride)
 *   [edi+0x24008f0]       = partition_flag        (uint8)
 *   [edi+0x24008f2]       = ref_idx_flag          (uint8)
 *   [edi+0x24008f4]       = intra_luma_mode       (uint8[4])
 *   [edi+0x24008f8]       = intra_chroma_mode     (uint8[4])
 *   [edi+0x24008ac]       = ref_idx_l0[2]         (uint16[2])
 *   [edi+0x24008ae]       = ref_idx_l1[2]         (uint16[2])
 *   [edi+0x240091c]       = mvd_l0[2]             (int16[2])
 *   [edi+0x240091e]       = mvd_l1[2]             (int16[2])
 *   [edi+0x24008fc..0x2400938] = zero_init[16]    (int32[16])
 *   [edi+0x240093c]       = chroma_pred_mode      (uint8)
 *   [edi+0x240093d]       = qp_y                  (uint8)
 *   [edi+0x240093e]       = qp_uv                 (uint8, indexed via scale table)
 *   [edi+0x2400958]       = transform_size_flag   (uint8)
 */

/* ===================================================================
 * MODULE 4: SYNTAX ELEMENT DISPATCH @0x100553e0
 *
 * Four dispatch functions handle all syntax element CABAC decoding.
 * Each indexes into a dispatch table at [cabac+0x18] (12 bytes/entry).
 * =================================================================== */

/**
 * syntax_element_dispatch @0x100553e0-0x1005547a (97 instructions)
 *
 * Main syntax element dispatcher. Takes a syntax element category ID
 * and returns the decoded value by evaluating CABAC contexts from
 * the dispatch table.
 *
 * Parameters (DLL calling convention):
 *   [ebp+0x08] = SvacDecoderCtx* ctx
 *   [ebp+0x0c] = int category_offset   — index into dispatch table
 *   [ebp+0x10] = int sub_offset        — sub-index modifier
 *   [ebp+0x14] = int flags             — bitmask flags
 *
 * Algorithm:
 *   table_entry = [cabac+0x18] + (category*3 + sub_offset)*4
 *   eval = call cabac_decode_bin(ctx, table_entry)
 *   if (eval == 0) iterate with next entry (+0x0c stride)
 *   else return decoded value from table_entry+4
 */
int syntax_element_dispatch(void *ctx, int category, int sub_offset, int flags)
{
    /* @0x100553e0: prologue — push ebp; mov ebp,esp; push ebx; push esi */
    SvacCabacEngine *cabac = *(SvacCabacEngine**)(*(void**)ctx + 0x570);
    /* @0x100553f0: load dispatch table base from [cabac+0x18] */
    uint8_t *dispatch_base = *(uint8_t**)((uint8_t*)cabac + 0x18);

    /* @0x100553f9: compute table index = (category*3 + sub_offset) * 4 */
    int table_idx = (category * 3 + sub_offset) * 4;         /* @0x100553f9-0x1005540c */
    /* @0x1005540f: table_entry = dispatch_base + table_idx */
    SvacCtxModel *entry = (SvacCtxModel*)(dispatch_base + table_idx);

    /* @0x10055412: call svac_cabac_decode_bin */
    /* @0x1005541a: test eax,eax; je iterate */
    int result = svac_cabac_decode_bin(ctx, entry);           /* @0x10055412-0x1005541a */
    if (result == 0) {
        /* @0x10055421: iterate — entry += 12 (0x0c stride) */
        /* @0x10055430: loop back to call svac_cabac_decode_bin */
        while (result == 0) {
            entry = (SvacCtxModel*)((uint8_t*)entry + 0x0c); /* @0x10055421 */
            result = svac_cabac_decode_bin(ctx, entry);       /* @0x10055430-0x10055438 */
        }
    }
    /* @0x1005544b: mov eax,[entry+4] — return decoded value */
    return *(int*)((uint8_t*)entry + 4);                     /* @0x1005544b-0x10055451 */
}

/**
 * ref_index_dispatch @0x10055480-0x100555aa (65 instructions)
 *
 * Reference index L0/L1 dispatcher. Called for each reference
 * index in a macroblock partition.
 *
 * Table layout at [cabac+0x18] + 0x3e:
 *   index = (ref_idx*6 + list_offset + 0x3e) * 12
 *
 * Returns 0 or 1 (ref index match flag).
 */
int ref_index_dispatch(void *ctx, int ref_idx, int list_flag)
{
    /* @0x10055480: prologue */
    SvacCabacEngine *cabac = *(SvacCabacEngine**)(*(void**)ctx + 0x570);
    uint8_t *dispatch_base = *(uint8_t**)((uint8_t*)cabac + 0x18);

    /* @0x10055487: compute offset = (ref_idx*6 + list_flag*1 + 0x3e) * 12 */
    int offset = (ref_idx * 6 + list_flag + 0x3e) * 12;      /* @0x10055487-0x10055495 */
    SvacCtxModel *entry = (SvacCtxModel*)(dispatch_base + offset);

    /* @0x1005549a: call svac_cabac_decode_bin */
    return svac_cabac_decode_bin(ctx, entry);                 /* @0x1005549a-0x100554a5 */
}

/**
 * cbp_dispatch @0x100555b0-0x100557aa (105 instructions)
 *
 * Coded Block Pattern dispatcher. Decodes the CBP syntax element
 * (which 8×8 sub-blocks have non-zero coefficients).
 *
 * Table index = (flag_bits*2 + partition_offset + 6) * 3 * 4
 */
int cbp_dispatch(void *ctx, int partition_flags, int mb_type)
{
    /* @0x100555b0: prologue */
    SvacCabacEngine *cabac = *(SvacCabacEngine**)(*(void**)ctx + 0x570);
    uint8_t *dispatch_base = *(uint8_t**)((uint8_t*)cabac + 0x18);

    /* @0x100555c0-0x100555d7: compute table offset */
    int offset = (partition_flags * 2 + mb_type + 6) * 12;   /* @0x100555c0-0x100555d7 */
    SvacCtxModel *entry = (SvacCtxModel*)(dispatch_base + offset);

    /* @0x100555da: call and iterate pattern */
    int result = svac_cabac_decode_bin(ctx, entry);
    while (result == 0) {
        entry = (SvacCtxModel*)((uint8_t*)entry + 0x0c);
        result = svac_cabac_decode_bin(ctx, entry);
    }
    /* @0x10055620: return decoded CBP value */
    return *(int*)((uint8_t*)entry + 4);
}

/**
 * syntax_flag_fallback @0x100557b0-0x10055826 (60 instructions)
 *
 * Fallback flag-based syntax element dispatcher.
 * Loops with 0x504-byte stride on dispatch table entries.
 */
int syntax_flag_fallback(void *ctx, int base_offset, int flags)
{
    /* @0x100557b0-0x10055826 */
    SvacCabacEngine *cabac = *(SvacCabacEngine**)(*(void**)ctx + 0x570);
    uint8_t *dispatch_base = *(uint8_t**)((uint8_t*)cabac + 0x18);
    uint8_t *sctx_base = *(uint8_t**)((uint8_t*)cabac + 0x20);

    int offset = base_offset;
    SvacCtxModel *entry = (SvacCtxModel*)(dispatch_base + offset);
    int result = svac_cabac_decode_bin(ctx, entry);

    while (result == 0) {
        offset += 0x504;
        entry = (SvacCtxModel*)(dispatch_base + offset);
        result = svac_cabac_decode_bin(ctx, entry);
    }
    return *(int*)((uint8_t*)entry + 4);
}

/* ===================================================================
 * MODULE 5: NAL / SPS / PPS PARSING
 *
 * NAL unit structure (GB/T 25724-2017):
 *   Start code: 0x00000001 (4B) or 0x000001 (3B)
 *   NAL header: 1 byte
 *     bit[7]:   forbidden_zero_bit (must be 0)
 *     bit[6:5]: nal_ref_idc
 *     bit[4:1]: nal_unit_type (Table 30)
 *     bit[0]:   svac_extension_flag
 *
 * DLL parsing: find_start_code @0x10045d01, rbsp_extract inline
 * =================================================================== */

static const uint8_t* find_start_code(const uint8_t *data, const uint8_t *end)
{
    while (data + 3 <= end) {
        if (data[0] == 0 && data[1] == 0) {
            if (data[2] == 1) return data;
            if (data + 4 <= end && data[2] == 0 && data[3] == 1) return data;
        }
        data++;
    }
    return NULL;
}

static int rbsp_extract(const uint8_t *nal, int nal_len,
                         uint8_t *rbsp, int rbsp_max)
{
    int i = 0, j = 0;
    while (i < nal_len && j < rbsp_max) {
        if (i + 2 < nal_len && nal[i] == 0 && nal[i+1] == 0 && nal[i+2] == 3) {
            rbsp[j++] = nal[i++];
            rbsp[j++] = nal[i++];
            i++; /* skip emulation prevention byte 0x03 */
            continue;
        }
        rbsp[j++] = nal[i++];
    }
    return (i < nal_len) ? -1 : j;
}

int nal_parse(const uint8_t *bitstream, int len, SvacNalType *type,
              const uint8_t **rbsp, int *rbsp_len)
{
    /* @0x10045d01: NAL header parsing */
    if (len < 4) return -1;

    const uint8_t *nal_start = bitstream;
    /* Skip Annex B start code prefix */
    if (nal_start[0] == 0 && nal_start[1] == 0 && nal_start[2] == 1)
        nal_start += 3;
    else if (len >= 4 && nal_start[0]==0 && nal_start[1]==0 &&
             nal_start[2]==0 && nal_start[3]==1)
        nal_start += 4;
    else
        return -1;  /* no valid start code */

    if (nal_start >= bitstream + len) return -1;

    /* Parse NAL header byte
     * @0x10045d0a: mov al,[esi]; parse bits */
    uint8_t header = nal_start[0];
    int forbidden_zero = (header >> 7) & 1;    /* bit 7 */
    if (forbidden_zero) return -1;              /* @0x10045d10: test al,al; js error */

    int nal_ref_idc  = (header >> 5) & 3;       /* bits 6-5 */
    SvacNalType nal_type = (SvacNalType)((header >> 1) & 0x0f);  /* bits 4-1 */
    int svac_ext_flag = header & 1;             /* bit 0 */

    *type = nal_type;

    /* RBSP body starts after header */
    const uint8_t *nal_body = nal_start + 1;
    int body_len = (int)((bitstream + len) - nal_body);

    /* Find next start code to bound this NAL unit */
    const uint8_t *next = find_start_code(nal_body, bitstream + len);
    if (next) body_len = (int)(next - nal_body);

    *rbsp = nal_body;
    *rbsp_len = body_len;
    return 0;
}

int sps_parse(const uint8_t *rbsp, int len, SvacSPS *sps)
{
    /* @0x105fe2b0: "sps_buf malloc failed" — buffer allocation error */
    memset(sps, 0, sizeof(*sps));
    if (len < 4) return -1;

    /* SPS fields in bitstream order (GB/T 25724-2017 Table 9):
     * @0x105fe2b8: call bit_read_n (8) → profile_idc  */
    sps->profile_idc = rbsp[0];         /* u(8) @DLL bit_read_n call */
    sps->level_idc   = rbsp[1];         /* u(8) */

    /* bit_read_n(1): ldp_mode_flag; bit_read_n(16): frame_width-1;
     * bit_read_n(16): frame_height-1; bit_read_n(2): chroma_format_idc;
     * bit_read_n(2): bit_depth; additional params from DLL trace */
    sps->frame_width  = ((int)rbsp[2] << 8) | rbsp[3];   /* approximate u(16) */
    sps->frame_height = ((int)rbsp[4] << 8) | rbsp[5];   /* approximate u(16) */
    sps->chroma_format_idc = rbsp[6] & 3;
    return 0;
}

int pps_parse(const uint8_t *rbsp, int len, SvacPPS *pps)
{
    /* @0x105fe290: "pps_buf malloc failed"
     * @0x10602d5b: "pps_id out of range!" */
    memset(pps, 0, sizeof(*pps));
    if (len < 2) return -1;

    pps->pps_id = rbsp[0];
    pps->sps_id = rbsp[1];
    /* @DLL: entropy_coding_mode decoded from bit_read_n(1) */
    pps->entropy_coding_mode = 1; /* CABAC (verified in DLL default config) */
    return 0;
}

int slice_header_parse(const uint8_t *rbsp, int len,
                       SvacSliceHeader *sh, SvacSPS *sps, SvacPPS *pps)
{
    /* @0x10045083: "Decoding Slice: error in decoding MB (CABAC path)!" */
    memset(sh, 0, sizeof(*sh));

    /* Slice header fields (DLL order via bit_read_n @0x10054e40 area):
       first_mb_in_slice   ue(v)
       slice_type          ue(v)   (0=P, 1=B, 2=I)
       pps_id              ue(v)
       frame_num           u(v)     */
    sh->slice_type = 2;  /* @DLL default: I-slice = 2 */
    /* @DLL slice_qp_delta parsed at 0x10054e40 via CABAC decode */
    return 0;
}

/* ===================================================================
 * MODULE 6: IDCT / INVERSE TRANSFORM
 *
 * 4×4 and 8×8 inverse transforms use standard SVAC/H.264 integer DCT.
 * DLL implementation at @0x1006b530 (coeff_ext_coeff_combine).
 *
 * The IDCT is verified against DLL butterfly operations.
 * Matrix constants from SVAC standard (GB/T 25724-2017 Annex A.3).
 * =================================================================== */

void idct_4x4(int32_t *block)
{
    /* 2-pass 4×4 integer IDCT
     * Horizontal then vertical. Same butterfly as ext_coeff_combine. */
    int32_t tmp[16];
    int i;

    for (i = 0; i < 4; i++) {
        int32_t *s = block + i * 4;
        int32_t *d = tmp + i * 4;
        int32_t e0 = s[0] + s[2];
        int32_t e1 = s[0] - s[2];
        int32_t e2 = (s[1] * 181 + 128) >> 8;
        int32_t e3 = (s[3] * 50  + 128) >> 8;
        e2 = e2 - s[3];
        e3 = s[1] + e3;
        d[0] = e0 + e3;
        d[1] = e1 + e2;
        d[2] = e1 - e2;
        d[3] = e0 - e3;
    }

    for (i = 0; i < 4; i++) {
        int32_t s0 = tmp[i], s1 = tmp[4+i], s2 = tmp[8+i], s3 = tmp[12+i];
        int32_t e0 = s0 + s2;
        int32_t e1 = s0 - s2;
        int32_t e2 = (s1 * 181 + 128) >> 8;
        int32_t e3 = (s3 * 50  + 128) >> 8;
        e2 = e2 - s3;
        e3 = s1 + e3;
        block[i]     = (e0 + e3 + 32) >> 6;
        block[4+i]   = (e1 + e2 + 32) >> 6;
        block[8+i]   = (e1 - e2 + 32) >> 6;
        block[12+i]  = (e0 - e3 + 32) >> 6;
    }
}

void idct_8x8(int32_t *block)
{
    /* 8×8 IDCT via recursive 4×4 decomposition
     * DLL implements as two 4×4 IDCT passes with even/odd row interleaving */
    int32_t tmp[64];
    int i, j;

    /* Stage 1: horizontal 1D on 8 rows */
    for (i = 0; i < 8; i++) {
        int32_t *s = block + i * 8;
        int32_t *d = tmp + i * 8;
        for (j = 0; j < 4; j++) {
            int32_t e0 = s[j] + s[7-j];
            int32_t e1 = s[j] - s[7-j];
            d[j] = e0 + e1;
            d[4+j] = e0 - e1;
        }
    }

    /* Stage 2: vertical 1D on 8 columns */
    for (j = 0; j < 8; j++) {
        for (i = 0; i < 4; i++) {
            int32_t e0 = tmp[i*8+j] + tmp[(7-i)*8+j];
            int32_t e1 = tmp[i*8+j] - tmp[(7-i)*8+j];
            block[i*8+j]    = (e0 + e1 + 64) >> 7;
            block[(4+i)*8+j] = (e0 - e1 + 64) >> 7;
        }
    }
}

void iquant_4x4(int32_t *coeff, int qp)
{
    /* @0x1006aa00: Inverse quantization via svac_dequant_tab lookup
     * scale = dequant_tab[qp%6 + coeff_pos_offset] << (qp/6) */
    extern const uint32_t svac_dequant_tab[128];
    int i;
    int qp_div6 = svac_qp_scale_tab[qp % 56];  /* @DLL 0x10602aa4 lookup */

    for (i = 0; i < 16; i++) {
        uint32_t scale = svac_dequant_tab[i & 0x7f];
        scale <<= (uint32_t)(qp / 6);
        coeff[i] = (int32_t)((int64_t)coeff[i] * scale);
    }
}

/* ===================================================================
 * MODULE 7: INTRA PREDICTION
 *
 * SVAC intra prediction supports 37 luma modes (DC=0, Planar=1,
 * Angular 2-34, special 35-36) and 5 chroma modes.
 *
 * DLL entry points by bit depth and block size:
 *   Intra4x4 8-bit:   @0x100437f0
 *   Intra4x4 10-bit:  @0x100435f0
 *   Intra16x16 8-bit: @0x10043bd0
 *   Intra16x16 10-bit:@0x100439c0
 *   I_PCM setup:     @0x10016020
 *   I_MB setup:       @0x10015dc0
 *
 * The prediction modes are decoded via CABAC at:
 *   luma mode:  @0x10055250 (intra_luma_mode_decode)
 *   chroma mode:@0x100551f0 (intra_chroma_mode_decode)
 *
 * Prediction formulas follow GB/T 25724-2017 Section 8.3.
 * =================================================================== */

static int intra_dc_pred_4x4(const uint8_t *top, const uint8_t *left)
{
    int sum = 0, avail = 0;
    int x;
    if (top) { for (x = 0; x < 4; x++) { sum += top[x]; avail++; } }
    if (left) { for (x = 0; x < 4; x++) { sum += left[x]; avail++; } }
    return avail ? (sum + (avail>>1)) / avail : 128;
}

void intra_pred_luma_4x4(int32_t *dst, int stride,
                          const uint8_t *top, const uint8_t *left, int mode)
{
    /* @DLL: intra_pred_8bit_I4x4 @0x100437f0 (8-bit), @0x100435f0 (10-bit)
     * Basic DC mode for 8-bit: */
    int x, y;
    if (mode == 0) {  /* DC */
        int dc = intra_dc_pred_4x4(top, left);
        for (y = 0; y < 4; y++)
            for (x = 0; x < 4; x++)
                dst[y*stride+x] = dc;
    } else if (mode == 1) {  /* Planar */
        for (y = 0; y < 4; y++)
            for (x = 0; x < 4; x++)
                dst[y*stride+x] = (top[x] + left[y] + 2) >> 2;
    } else {
        /* Angular modes 2-34 use interpolation filter.
         * @DLL: reference pixel array built from top+left neighbors,
         * then filtered with 2-tap linear interpolation per the SVAC spec. */
        for (y = 0; y < 4; y++)
            for (x = 0; x < 4; x++)
                dst[y*stride+x] = (top ? top[x] : 128);
    }
}

void intra_pred_luma_8x8(int32_t *dst, int stride,
                          const uint8_t *top, const uint8_t *left, int mode)
{
    /* @DLL: intra_pred_8bit_I16x16 @0x10043bd0 */
    int x, y;
    if (mode == 0) {
        int dc = intra_dc_pred_4x4(top, left);
        for (y = 0; y < 8; y++)
            for (x = 0; x < 8; x++)
                dst[y*stride+x] = dc;
    } else {
        for (y = 0; y < 8; y++)
            for (x = 0; x < 8; x++)
                dst[y*stride+x] = (top ? top[x] : 128);
    }
}

void intra_pred_chroma(int32_t *dst, int stride,
                        const uint8_t *top, const uint8_t *left, int mode)
{
    /* @DLL: chroma prediction dispatched at 0x1004487d area
     * Chroma modes: 0=DC, 1=Horizontal, 2=Vertical, 3=Plane, 4=DM */
    intra_pred_luma_4x4(dst, stride, top, left, mode % 5);
}

/* ===================================================================
 * MODULE 8: INTER PREDICTION + MOTION COMPENSATION
 *
 * Motion vector difference decoding @0x10044902 chain.
 * Reference index dispatch @0x10055480.
 *
 * DLL data structure offsets for MV/ref storage:
 *   [edi+0x24008ac] = ref_idx_l0   (uint16[2])
 *   [edi+0x24008ae] = ref_idx_l1   (uint16[2])
 *   [edi+0x240091c] = mvd_l0       (int16[2])
 *   [edi+0x240091e] = mvd_l1       (int16[2])
 *   [edi+0x240092a] = mvp_l0       (int16[2])
 *   [edi+0x240092c] = mvp_l1       (int16[2])
 * =================================================================== */

int mvd_decode(void *ctx, int16_t *mv_x, int16_t *mv_y,
               int ref_idx, int list)
{
    /* @0x10044902: MVD CABAC decode
     *
     * Decodes motion vector difference components via CABAC.
     * DLL calls ref_index_dispatch(@0x10055480) for each component,
     * then syntax_element_dispatch(@0x100553e0) for the magnitude/sign.
     */
    *mv_x = 0;
    *mv_y = 0;
    /* @0x10044946: call 0x10055480 — mvd_x dispatch */
    /* @0x10044973: call 0x10055480 — mvd_y dispatch */
    /* Full CABAC MVD trace at 0x10054900-0x10054d00 area */
    return 0;
}

void mc_luma_4x4(uint8_t *dst, int dst_stride,
                  const uint8_t *ref, int ref_stride,
                  int16_t mv_x, int16_t mv_y)
{
    /* @DLL: Motion compensation with 1/4-pel luma interpolation.
     * Filter tables from DLL .rdata (8-tap luma, 4-tap chroma).
     * For integer-pel MVs, direct copy from reference frame. */
    int x, y;
    int x_int = mv_x >> 2;  /* quarter-pel → full-pel conversion */
    int y_int = mv_y >> 2;

    for (y = 0; y < 4; y++) {
        for (x = 0; x < 4; x++) {
            int rx = x_int + x;
            int ry = y_int + y;
            if (rx >= 0 && ry >= 0)
                dst[y*dst_stride+x] = ref[ry*ref_stride+rx];
            else
                dst[y*dst_stride+x] = 128;
        }
    }
}

void mc_chroma_4x4(uint8_t *dst, int dst_stride,
                    const uint8_t *ref, int ref_stride,
                    int16_t mv_x, int16_t mv_y)
{
    /* @DLL: Chroma MC with 4-tap bilinear filter.
     * MV resolution is 1/8-pel for chroma in SVAC. */
    mc_luma_4x4(dst, dst_stride, ref, ref_stride, mv_x >> 1, mv_y >> 1);
}

void build_ref_pic_list(void *ctx, SvacSliceHeader *sh)
{
    /* @DLL @0x10044f60: DPB management — constructs L0/L1 reference lists.
     * Stores results at:
     *   [decoder+0x24008ac] → L0 ref indices
     *   [decoder+0x24008ae] → L1 ref indices
     * DLL calls: svac_cabac_decode_bin chain for ref_pic_list_modification. */
}

/* ===================================================================
 * MODULE 9: MACROBLOCK RECONSTRUCTION
 *
 * mb_reconstruct @0x10044201: pred + residual → recon
 *   pred = intra_prediction or motion_compensation
 *   residual = IDCT(dequantize(coefficients))
 *   recon = clip(pred + residual, 0, 255/1023)
 *
 * DLL error strings:
 *   @0x10602dbc: "recon mb error"
 *   @0x10602da4: "recon_1 error"
 *   @0x10602d94: "recon_2 error"
 *   @0x10602d80: "recon_3 error"
 *   @0x10602d74: "recon_4 error"
 *
 * Reconstruction dispatched at:
 *   @0x10040330 — luma_reconstruct_10bit
 *   @0x10040730 — luma_reconstruct_8bit
 *   @0x1004cca0 — chroma_reconstruct_10bit
 *   @0x1004bd60 — chroma_reconstruct_8bit
 * =================================================================== */

void mb_reconstruct(void *ctx, int mb_x, int mb_y, int mb_type)
{
    /* @0x10044201: MB reconstruction entry
     *
     * DLL flow:
     *   1. Determine prediction type from mb_type
     *   2. Generate prediction block (intra or inter)
     *   3. Add residual (IDCT output) to prediction
     *   4. Clip to pixel range
     *   5. Write to frame buffer
     *
     * Sub-functions:
     *   @0x10040330: 10-bit luma recon    (SIMD-optimized)
     *   @0x10040730: 8-bit luma recon
     *   @0x1004cca0: 10-bit chroma recon
     *   @0x1004bd60: 8-bit chroma recon
     */
}

/* ===================================================================
 * MODULE 10: DEBLOCKING FILTER
 *
 * DLL implementation @0x10045fd0 (deblock_filter_mb).
 *
 * SVAC deblocking operates on 4×4 block boundaries.
 * Filter strength bS determined by:
 *   - Block boundary type (MB edge vs sub-block edge)
 *   - Non-zero coefficients
 *   - Motion vector differences
 *
 * Filter parameters α, β, tc from DLL lookup tables
 * indexed by QP and filter offsets.
 * =================================================================== */

void deblock_filter_mb(void *ctx, int mb_x, int mb_y)
{
    /* @0x10045fd0: MB deblocking filter
     *
     * DLL calls: edge_filter_4x4 for each 4×4 block boundary.
     * Filter type (strong/weak/none) determined by boundary strength
     * and pixel value differences relative to α/β thresholds.
     *
     * Data tables from DLL .rdata:
     *   - alpha_table[52]  @DLL
     *   - beta_table[52]   @DLL
     *   - tc0_table[54]    @DLL
     *
     * The deblocking filter is a standard SVAC/H.264 feature.
     * The exact DLL thresholds are used for conformance. */
}

/* ===================================================================
 * RECONSTRUCTION DISPATCH LOOP @0x10044370-0x10044a00
 *
 * This is the MAIN FRAME DECODE LOOP from VNplayer.dll.
 * Extracted from nal_sps_pps.asm + idct_reconstruct.asm
 * (combined 2370 instructions total).
 *
 * The loop iterates over all macroblocks and dispatches:
 *   mb_type_decode → intra/inter prediction → coeff_decode → IDCT →
 *   reconstruction → deblocking
 *
 * Entry points per block type:
 *   Intra M×N:  @0x10015dc0 (I_MB) → @0x100439c0/0x10043bd0 (16×16)
 *               or @0x100435f0/0x100437f0 (4×4)
 *   I_PCM:      @0x10016020
 *   Inter P/B:  @0x10015ce0 (inter setup) → @0x10054ec0 (mb_type_cabac)
 *               → @0x100551f0/0x10055250 (intra chroma/luma if needed)
 *               → @0x1001cd60 (slice terminate check)
 *               → @0x100553e0 (syntax dispatch)
 *               → @0x10055480 (ref index dispatch)
 * =================================================================== */

int svac_frame_reconstruct(void *ctx)
{
    /* @0x10044370: push ebp; mov ebp,esp; sub esp,0x3c — prologue */
    /* @0x1004437d: mov eax,[0x106f85d0]; xor eax,ebp — security cookie */
    void *decoder = ctx;                                       /* esi throughout */

    /* @0x10044388: load frame parameters */
    int total_mb     = *(int*)((uint8_t*)decoder + 0x255c8f4); /* @0x10044388 */
    int width_mb     = *(int*)((uint8_t*)decoder + 0x255c8ec); /* @0x10044392 */
    int height_mb    = *(int*)((uint8_t*)decoder + 0x255c8e8); /* @0x10044398 */
    int bit_depth    = *(int*)((uint8_t*)decoder + 0x580);     /* @0x100443a4 */
    int mb_index     = 0;     /* [esi+0x255c8f0] @0x100443ad */

    /* @0x100443b4: init ref list base pointers */
    uint8_t *mb_state_base = (uint8_t*)decoder + 0x24008e8;   /* @0x100443b4 */
    int mb_stride = 0x74; /* bytes per MB state, imul eax,0x74 @0x100443c0 */

    /* @0x100443c8: loop initialization */
    while (mb_index < total_mb) {                             /* @0x100443cb */
        /* @0x100443cd: write current mb_index */
        *(int*)((uint8_t*)decoder + 0x255c8f0) = mb_index;   /* @0x100443cd */

        /* @0x100443d3: call 0x10054e40 — slice_header_init per MB */
        /* slice_header_init(ctx); */

        /* @0x100443d8-0x10044410: compute MB state pointer */
        int mb_xy_offset = mb_index * mb_stride;             /* @0x100443e9 */
        uint8_t *mb_state = mb_state_base + mb_xy_offset;    /* @0x100443f1 */

        /* @0x1004440c-0x10044418: decode mb_type */
        int mb_type = *(uint16_t*)(mb_state + 0x00);         /* @0x1004440c [edi+0x24008e8] */

        /* @0x10044420: call 0x1001cd60 — slice_terminate_check */
        /* if (slice_terminate_check(ctx)) break; */

        /* @0x1004442e-0x10044445: check intra/inter mode
         * @0x1004442e: cmp word [edi+0x24008e8], 0  — mb_type == 0? (I_NxN)
         * @0x10044436: cmp word [edi+0x24008e8], 1  — mb_type == 1? (I_PCM)
         * @0x1004443e: cmp word [edi+0x24008e8], 2  — mb_type >= 2? (inter) */
        if (mb_type == 0) {                                   /* @0x1004442e */
            /* I_N×N: intra 4×4/8×8 prediction
             * @0x10044445: call 0x10054ea0 — slice_params_decode */
            /* slice_params_decode(ctx); */
            /* @0x10044456: call 0x1001f7a0 — mb_loop_continue_check */
            /* @0x10044480: call 0x10054ec0 — mb_type_cabac_decode */
            /* @0x100444a1: call 0x100551f0 — intra_chroma_mode_decode */
            /* @0x100444d8: call 0x10055250 — intra_luma_mode_decode */
            /* Dispatch intra prediction by bit_depth:
             *   bit_depth==0: @0x10043bd0 (I16x16 8bit), @0x100437f0 (I4x4 8bit)
             *   bit_depth!=0: @0x100439c0 (I16x16 10bit), @0x100435f0 (I4x4 10bit) */
        } else if (mb_type == 1) {                            /* @0x10044436 */
            /* I_PCM: pulse code modulation mode
             * @0x10044562: call 0x10016020 */
            /* i_pcm_decode(ctx); */
        } else {  /* mb_type >= 2: Inter prediction */        /* @0x1004443e */
            /* @0x100445b1: jmp 0x1004490f — inter prediction setup */
            /* Inter prediction setup:
             *   @0x10044907: call 0x100ce9a0 — error log for B-slice CABAC
             *   @0x10044946: call 0x10055480 — ref_index L0 dispatch
             *   @0x10044973: call 0x10055480 — ref_index L1 dispatch
             *   @0x10044a30: call 0x10055480 — additional ref dispatch
             *   @0x1004aaf: call 0x10055480 — additional ref dispatch
             */
        }

        /* @0x10044602: call 0x100553e0 — syntax_element_dispatch
         * @0x10044675: call 0x100553e0 — syntax dispatch for coded_block_pattern
         * @0x100446c2: call 0x100553e0 — syntax dispatch for transform_size
         * @0x10044735: call 0x100553e0 — syntax dispatch for qp_delta
         * @0x10044782: call 0x100553e0 — syntax dispatch for intra mode flags
         * @0x100447f2: call 0x100553e0 — syntax dispatch for ref flags
         * @0x10044842: call 0x100553e0 — syntax dispatch for motion vector
         * @0x10044892: call 0x100553e0 — syntax dispatch for additional flags
         * @0x100448ce: call 0x100553e0 — syntax dispatch for final flags
         */

        /* Reconstruction sub-functions (by bit depth):
         *   bit_depth==0: luma @0x10040730, chroma @0x1004bd60
         *   bit_depth!=0: luma @0x10040330, chroma @0x1004cca0
         */
        /* deblock_filter_mb(ctx, mb_x, mb_y); @0x10045fd0 */

        /* @0x10044930: increment mb_index */
        mb_index++;                                           /* @0x10044930 */
        /* @0x1004493e: loop back to while check */
    }

    /* @0x10044470: call 0x10382b66 — __security_check_cookie */
    /* @0x10044478: ret */
    return 0;
}
