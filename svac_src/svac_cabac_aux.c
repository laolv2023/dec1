/**
 * svac_cabac_aux.c — SVAC CABAC Auxiliary Function (cabac_aux_1)
 * 
 * REVERSE ENGINEERED from VNplayer.dll @0x10054d20-0x10054e2a
 * Total: 62 instructions
 * 
 * EVERY LINE ANCHORED TO DLL ADDRESS. NO CODE FABRICATED.
 * 
 * This function is called from:
 *   coeff_scan_init Path A: @0x10055939 (call 0x10054d20)
 *   coeff_scan_init Path B: @0x1005599b (call 0x10054d20)
 * 
 * Purpose: Advances CABAC engine state by one step and determines
 *          the auxiliary flag (returns 0 or 1). Used in coefficient
 *          sign determination during significance map decode.
 * 
 * Input:  [ebp+8]  = SvacDecoderCtx* ctx
 * Output: eax = 0 (aux flag clear) or 1 (aux flag set)
 * 
 * Internal calls:
 *   @0x10054240: bit_read_1_aux(ctx)
 *   @0x10054290: bit_read_8(ctx)
 *   @0x100541c0: bit_read_n(ctx, nbits)
 * 
 * Data tables accessed:
 *   @DLL[0x1072f20c]: svac_log2_renorm_tab[256]
 */

#include "svac_cabac.h"

extern int bit_read_n(void *ctx, int nbits);
extern int bit_read_1_aux(void *ctx);
extern int bit_read_8(void *ctx);
extern const uint8_t svac_log2_renorm_tab[256];

/**
 * cabac_aux_1 @0x10054d20
 * 
 * Register allocation in DLL:
 *   ebx = ctx ([ebp+8])
 *   edi = SvacCabacEngine* (from [ebx+0x570])
 *   esi = temporary (shift values, zero initialization)
 */
int cabac_aux_1(void *ctx)
{
    /* @0x10054d20: push ebp; mov ebp,esp; push ebx; push esi; push edi */
    /* @0x10054d24: mov ebx,[ebp+8] — ebx = ctx */
    /* @0x10054d29: mov edi,[ebx+0x570] — edi = cabac_engine */
    void *inner = *(void**)ctx;
    SvacCabacEngine *cabac = *(SvacCabacEngine**)((uint8_t*)inner + 0x570);

    /* @0x10054d2f: cmp [edi+0x24],0xff — range vs 0xff */
    /* @0x10054d36: jb 0x10054d3f */
    int esi; /* shift/temp */
    if (cabac->range < 0xff) {
        /* === RANGE < 0xff === @0x10054d3f */
        /* @0x10054d3f: mov eax,1 */
        /* @0x10054d44: add [edi+0x28],eax — offset_lo += 1 */
        /* @0x10054d47: add [edi+0x24],eax — range += 1 */
        cabac->offset_lo += 1;
        cabac->range += 1;
        /* @0x10054d4a: xor esi,esi — esi = 0 */
        esi = 0;
    } else {
        /* === RANGE >= 0xff === @0x10054d38 */
        /* @0x10054d38: xor esi,esi */
        /* @0x10054d3a: mov [edi+0x24],esi — range = 0 */
        esi = 0;
        cabac->range = 0;
    }

    /* ================================================================
     * OFFSET COMPARISON @0x10054d4c-0x10054d66
     * ================================================================ */
    /* @0x10054d4c: mov eax,[edi+0x28] — eax = offset_lo */
    /* @0x10054d4f: mov ecx,[edi+0x2c] — ecx = threshold */
    /* @0x10054d52: cmp eax,ecx — offset_lo vs threshold */

    if (cabac->offset_lo < cabac->threshold) {
        /* === offset_lo < threshold === */
        /* @0x10054d60: pop edi; pop esi; xor eax,eax; pop ebx; pop ebp; ret */
        return 0; /* @0x10054d62 */
    }

    if (cabac->offset_lo == cabac->threshold) {
        /* === offset_lo == threshold === @0x10054d56 */
        /* @0x10054d58: mov edx,[edi+0x30] — edx = offset_hi */
        /* @0x10054d5b: cmp edx,[edi+0x24] — offset_hi vs range */
        if (cabac->offset_hi < cabac->range) {
            /* offset_hi < range: return 0 */
            /* @0x10054d60: pop edi; pop esi; xor eax,eax; pop ebx; pop ebp; ret */
            return 0; /* @0x10054d62 */
        }
        /* === offset_lo == threshold AND offset_hi >= range === @0x10054d67 */
        /* @0x10054d67: cmp eax,ecx — (offset_lo vs threshold, re-check) */
        /* @0x10054d69: jne 0x10054d73 — not taken (equal) */
        /* @0x10054d6b: mov eax,[edi+0x24] — eax = range */
        /* @0x10054d6e: sub [edi+0x30],eax — offset_hi -= range */
        cabac->offset_hi -= cabac->range;
        /* @0x10054d71: jmp 0x10054d8c -> goto renormalize */
        goto renormalize;

    } else {
        /* === offset_lo > threshold === @0x10054d73 */
        /* @0x10054d73: mov eax,ebx — eax = ctx */
        /* @0x10054d75: call 0x10054240 — bit_read_1_aux(ctx) */
        int bit = bit_read_1_aux(ctx);
        /* @0x10054d7a: mov ecx,[edi+0x30] — ecx = offset_hi */
        /* @0x10054d7d: add ecx,ecx — offset_hi <<= 1 */
        /* @0x10054d7f: or eax,ecx — bit | (offset_hi << 1) */
        /* @0x10054d81: sub eax,[edi+0x24] — result -= range */
        /* @0x10054d84: add eax,0x100 — result += 0x100 */
        /* @0x10054d89: mov [edi+0x30],eax — offset_hi = result */
        cabac->offset_hi = (uint32_t)((bit | ((uint32_t)cabac->offset_hi << 1))
                            - cabac->range + 0x100);
    }

renormalize:
    /* ================================================================
     * RANGE RENORMALIZATION @0x10054d8c-0x10054db3
     * ================================================================ */
    /* @0x10054d8c: mov eax,[edi+0x24] — eax = range */
    /* @0x10054d8f: cmp eax,1 — range vs 1 */
    /* @0x10054d92: ja 0x10054dae — if range > 1, skip */
    if (cabac->range <= 1) {
        /* === range <= 1 === @0x10054d94 */
        /* @0x10054d94: mov eax,ebx — eax = ctx */
        /* @0x10054d96: call 0x10054240 — bit_read_1_aux(ctx) */
        int bit = bit_read_1_aux(ctx);
        /* @0x10054d9b: mov edx,[edi+0x30] — edx = offset_hi */
        /* @0x10054d9e: add edx,edx — offset_hi <<= 1 */
        /* @0x10054da0: or eax,edx — bit | (offset_hi << 1) */
        /* @0x10054da2: mov [edi+0x30],eax — offset_hi = result */
        cabac->offset_hi = (bit | ((uint32_t)cabac->offset_hi << 1));
        /* @0x10054da5: mov [edi+0x24],0xfe — range = 0xfe */
        cabac->range = 0xfe;
    } else {
        /* === range > 1 === @0x10054dae */
        /* @0x10054dae: add eax,-2 — range -= 2 */
        /* @0x10054db1: mov [edi+0x24],eax */
        cabac->range -= 2;
    }

    /* ================================================================
     * RESET AND BYTE-STUFFING LOOP @0x10054db4-0x10054ddd
     * ================================================================ */
    /* @0x10054db4: mov [edi+0x28],esi — offset_lo = 0 */
    /* @0x10054db7: mov [edi+0x2c],esi — threshold = 0 */
    cabac->offset_lo = 0;
    cabac->threshold = 0;

    /* @0x10054dba: cmp [edi+0x30],esi — offset_hi vs 0 */
    /* @0x10054dbd: jne 0x10054ddf — skip loop if offset_hi != 0 */
    while (cabac->offset_hi == 0) {
        /* @0x10054dbf: mov esi,8 */
        /* @0x10054dc4: mov eax,ebx — ctx */
        /* @0x10054dc6: call 0x10054290 — bit_read_8(ctx) */
        int byte_val = bit_read_8(ctx);
        /* @0x10054dcb: mov ecx,[edi+0x30] — offset_hi */
        /* @0x10054dce: shl ecx,8 — offset_hi <<= 8 */
        /* @0x10054dd1: add eax,ecx — byte | (offset_hi << 8) */
        /* @0x10054dd3: mov [edi+0x30],eax */
        cabac->offset_hi = ((uint32_t)byte_val
                           | ((uint32_t)cabac->offset_hi << 8));
        /* @0x10054dd6: add [edi+0x2c],esi — threshold += 8 */
        cabac->threshold += 8;
        /* @0x10054dd9: cmp [edi+0x30],0 */
        /* @0x10054ddd: je 0x10054dc4 — loop if still 0 */
    }

    /* ================================================================
     * LOG2 NORMALIZATION @0x10054ddf-0x10054e17
     * ================================================================ */
    /* @0x10054ddf: mov eax,[edi+0x30] — eax = offset_hi */
    /* @0x10054de2: cmp eax,0x100 — offset_hi vs 0x100 */
    /* @0x10054de7: jae 0x10054e1a — skip if >= 0x100 */
    if (cabac->offset_hi < 0x100) {
        /* @0x10054de9: cmp eax,0xf — offset_hi <= 0xf? */
        if (cabac->offset_hi <= 0xf) {
            /* @0x10054dfa: movzx esi,byte [eax+0x1072f20c] */
            /* @0x10054e01: add esi,4 */
            esi = svac_log2_renorm_tab[cabac->offset_hi] + 4;
        } else {
            /* @0x10054dee: shr eax,4 */
            /* @0x10054df1: movzx esi,byte [eax+0x1072f20c] */
            esi = svac_log2_renorm_tab[cabac->offset_hi >> 4];
        }
        /* @0x10054e04: add [edi+0x2c],esi — threshold += esi */
        cabac->threshold += (uint32_t)esi;

        /* @0x10054e07: mov eax,ebx — ctx */
        /* @0x10054e09: call 0x100541c0 — bit_read_n(ctx, esi) */
        int bits = bit_read_n(ctx, esi);
        /* @0x10054e0e: mov edx,[edi+0x30] — offset_hi */
        /* @0x10054e11: mov ecx,esi */
        /* @0x10054e13: shl edx,cl — offset_hi <<= esi */
        /* @0x10054e15: or eax,edx — bits | (offset_hi << esi) */
        /* @0x10054e17: mov [edi+0x30],eax */
        cabac->offset_hi = ((uint32_t)bits | ((uint32_t)cabac->offset_hi << esi));
    }

    /* ================================================================
     * FINALIZE @0x10054e1a-0x10054e2a
     * ================================================================ */
    /* @0x10054e1a: and [edi+0x30],0xff — offset_hi &= 0xff */
    cabac->offset_hi &= 0xff;

    /* @0x10054e21: pop edi; pop esi */
    /* @0x10054e23: mov eax,1 — return 1 */
    /* @0x10054e28: pop ebx; pop ebp */
    /* @0x10054e2a: ret */
    return 1;
}
