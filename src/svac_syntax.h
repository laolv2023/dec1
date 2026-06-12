/**
 * svac_syntax.h — SVAC Syntax Element Dispatch + NAL/SPS/PPS + IDCT + Prediction + Filter
 * COMBINED MODULES 4-10 REVERSE ENGINEERED from VNplayer.dll
 *
 * Modules covered:
 *   M4: Syntax element dispatch @0x100553e0-0x10055830
 *   M5: NAL/SPS/PPS parsing @0x10044000-0x10045000
 *   M6: Inverse transform (IDCT) @0x100441e0+0x10044dc2
 *   M7: Intra prediction (37 modes)
 *   M8: Inter prediction + motion compensation
 *   M9: MB reconstruction @0x10044201+0x10044df2
 *   M10: Deblocking + SAO + ALF
 *
 * EVERY OFFSET AND FUNCTION ADDRESS IS FROM DLL DISASSEMBLY.
 */
#ifndef SVAC_SYNTAX_H
#define SVAC_SYNTAX_H
#include <stdint.h>
#include "svac_cabac.h"
#include "svac_coeff_decode.h"

#ifdef __cplusplus
extern "C" {
#endif

/* ===================================================================
 * MODULE 4: SYNTAX ELEMENT DISPATCH
 * =================================================================== */

/** syntax_element_decode @0x100553e0
 *  Dispatches syntax element decoding to appropriate CABAC context.
 *  Called from the slice-level decode loop for each syntax element.
 *  Uses context tables at [cabac+0x18] for context model lookup.
 */
int syntax_element_decode(void *ctx, int syntax_id);

/* ===================================================================
 * MODULE 5: NAL / SPS / PPS / SLICE HEADER
 * =================================================================== */

/** NAL unit types from GB/T 25724-2017 Table 30 */
typedef enum {
    SVAC_NAL_SLICE_NON_IDR = 1,
    SVAC_NAL_SLICE_IDR     = 2,
    SVAC_NAL_SVC_ENHANCE   = 3,
    SVAC_NAL_SPS           = 7,
    SVAC_NAL_PPS           = 8,
    SVAC_NAL_AUD           = 9,
    SVAC_NAL_EOS           = 10,
    SVAC_NAL_FILLER        = 12,
} SvacNalType;

/** SPS (Sequence Parameter Set) — parsed @0x10045d01 area */
typedef struct {
    int profile_idc;          /* u(8) */
    int level_idc;            /* u(8) */
    int pic_width;            /* u(16) */
    int pic_height;           /* u(16) */
    int chroma_format_idc;    /* u(2) */
    int bit_depth;            /* u(2) */
    int ctu_size;             /* 64 or 32 */
    int min_cu_size;          /* 8 or 4 */
    int max_cu_depth;
} SvacSPS;

/** PPS (Picture Parameter Set) — parsed @0x10045d10 area */
typedef struct {
    int pps_id;
    int sps_id;
    int entropy_coding_mode;  /* 0=VLC, 1=CABAC */
    int num_ref_idx_l0;
    int num_ref_idx_l1;
    int weighted_pred_flag;
    int deblocking_filter_control_present_flag;
} SvacPPS;

/** Slice Header — parsed in slice decode path */
typedef struct {
    int first_mb_in_slice;
    int slice_type;           /* 0=P, 1=B, 2=I */
    int pps_id;
    int frame_num;
    int slice_qp_delta;
} SvacSliceHeader;

/** nal_parse @0x10045d01
 *  Parses NAL unit header and dispatches to SPS/PPS/Slice parsers.
 *  Returns NAL type on success, -1 on error.
 *  String ref: "Unsupport NAL code: %d" @0x10602ed0
 */
int nal_parse(const uint8_t *bitstream, int len, SvacNalType *type,
              const uint8_t **rbsp, int *rbsp_len);

/** sps_parse — from SPS NAL unit RBSP
 *  String ref: "sps_buf malloc failed" @0x105fe2b0
 */
int sps_parse(const uint8_t *rbsp, int len, SvacSPS *sps);

/** pps_parse — from PPS NAL unit RBSP
 *  String ref: "pps_buf malloc failed" @0x105fe290
 *              "pps_id out of range!"    @0x10602d5b
 */
int pps_parse(const uint8_t *rbsp, int len, SvacPPS *pps);

/** slice_header_parse — from slice NAL unit RBSP
 *  Parsed as part of slice decode path @0x10045083
 *  String ref: "Decoding Slice: error in decoding MB (CABAC path)!" @0x10602e84
 */
int slice_header_parse(const uint8_t *rbsp, int len,
                       SvacSliceHeader *sh, SvacSPS *sps, SvacPPS *pps);

/* ===================================================================
 * MODULE 6: INVERSE TRANSFORM (IDCT / IADST)
 * =================================================================== */

/** 4×4 integer IDCT — executed in ext_coeff_combine @0x1006b530 */
void idct_4x4(int32_t *block);

/** 8×8 integer IDCT */
void idct_8x8(int32_t *block);

/** Inverse quantization — applies scaling matrix and QP
 *  String ref: "idct_mb error" @0x10602dc0
 *              "cabac_idct_mb error" @0x10602dfc
 */
void iquant_4x4(int32_t *coeff, int qp);

/* ===================================================================
 * MODULE 7: INTRA PREDICTION (37 modes)
 * =================================================================== */

/** Intra prediction mode decode + reconstruction
 *  Loads reference samples from neighboring reconstructed blocks,
 *  applies angular/DC/planar prediction per SVAC standard.
 */
void intra_pred_luma_4x4(int32_t *dst, int stride,
                          const uint8_t *top, const uint8_t *left,
                          int mode);
void intra_pred_luma_8x8(int32_t *dst, int stride,
                          const uint8_t *top, const uint8_t *left,
                          int mode);
void intra_pred_chroma(int32_t *dst, int stride,
                        const uint8_t *top, const uint8_t *left,
                        int mode);

/* ===================================================================
 * MODULE 8: INTER PREDICTION + MOTION COMPENSATION
 * =================================================================== */

/** Motion vector decode — from CABAC bitstream
 *  String ref: "not support read reference index of B slice in CABAC yet!!"
 *              @0x10602e14, xref @0x10044902
 */
int mvd_decode(void *ctx, int16_t *mv_x, int16_t *mv_y,
               int ref_idx, int list);

/** Motion compensation — luma 4×4 block
 *  Uses interpolation filters from DLL data tables.
 *  Calls IPPCODE optimized functions for SIMD paths.
 */
void mc_luma_4x4(uint8_t *dst, int dst_stride,
                  const uint8_t *ref, int ref_stride,
                  int16_t mv_x, int16_t mv_y);

/** Motion compensation — chroma blocks */
void mc_chroma_4x4(uint8_t *dst, int dst_stride,
                    const uint8_t *ref, int ref_stride,
                    int16_t mv_x, int16_t mv_y);

/** Reference picture list construction */
void build_ref_pic_list(void *ctx, SvacSliceHeader *sh);

/* ===================================================================
 * MODULE 9: MB RECONSTRUCTION
 * =================================================================== */

/** mb_reconstruct @0x10044201 + @0x10044df2
 *  Combines prediction + residual for a macroblock.
 *  String ref: "reconstruct_mb error" @0x10602da4
 */
void mb_reconstruct(uint8_t *pred, int32_t *residual,
                     uint8_t *recon, int stride, int mb_size);

/** mb_decode @0x10044eba area
 *  Full MB decode: prediction + coeff_decode + IDCT + reconstruct
 *  String ref: "cabac_mb error" @0x10602dec
 */
int mb_decode_cabac_path(void *ctx, int mb_x, int mb_y);

/* ===================================================================
 * MODULE 10: DEBLOCKING + SAO + ALF
 * =================================================================== */

/** Deblocking filter
 *  String ref: "luma_bitdepth: %d" @0x105d7925
 *  Applies SVAC deblocking per §5.4.7.2
 */
void deblock_frame(uint8_t *recon, int stride,
                   int width, int height, int qp);

/** SAO (Sample Adaptive Offset)
 *  String ref: "sao_enable = %d" @0x10603f6e
 *  Applies band offset or edge offset per §5.4.8
 */
void sao_filter(uint8_t *recon, int stride,
                 int ctu_x, int ctu_y, int ctu_size);

/** ALF (Adaptive Loop Filter)
 *  String ref: "alf_enable = %d" @0x10603f86
 *  Applies Wiener-based adaptive filter per §5.4.9
 */
void alf_filter(uint8_t *recon, int stride,
                 int ctu_x, int ctu_y, int ctu_size);

#ifdef __cplusplus
}
#endif
#endif /* SVAC_SYNTAX_H */
