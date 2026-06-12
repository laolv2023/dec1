/**
 * svac_coeff_decode.h — SVAC Coefficient Decode Module
 * REVERSE ENGINEERED from VNplayer.dll, GB/T 25724-2017 SVAC 2.0 decoder
 */
#ifndef SVAC_COEFF_DECODE_H
#define SVAC_COEFF_DECODE_H
#include <stdint.h>
#include "svac_cabac.h"

#ifdef __cplusplus
extern "C" {
#endif

/* ===================================================================
 * DATA TABLES — extracted from VNplayer.dll
 * =================================================================== */

/** scan_tab_lo/hi: zigzag→raster coordinate mapping for 4×4 blocks
 *  @DLL[0x10625790+0x10625794] accessed at 0x10056186/0x1005618d */
extern const uint32_t svac_scan_tab_lo[128];
extern const uint32_t svac_scan_tab_hi[128];

/** dequant_tab: inverse quantization scaling factors
 *  @DLL[0x1072f220] accessed at 0x1006aa31 */
extern const uint32_t svac_dequant_tab[128];

/* ===================================================================
 * STRUCTURE OFFSETS (from DLL instruction evidence)
 * =================================================================== */

/**
 * Per-coefficient CABAC context: 192 bytes per coefficient index (i)
 * base = [cabac+0x1c] + 0xeb8 + i*192
 *
 * Offsets within each 192-byte slice:
 *   +0x0C: sig_flag path A  — lea ecx,[ebx+0x0c] @0x100558f0
 *   +0x18: last_pos path A  — lea edi,[ebx+0x18] @0x10055905
 *   +0x30: sig_flag path B  — lea ecx,[ebx+0x30] @0x10055993
 *   +0x3C: last_pos path B  — (paired with +0x30)
 *   +0x48: secondary_flag    — lea edx,[ebx+0x48] @0x10055947
 *   +0x54: last_pos path C   — add ebx,0x54    @0x10055963
 */
#define COEFF_CTX_SLICE   192
#define COEFF_SIG_A        12
#define COEFF_LAST_A       24
#define COEFF_SIG_B        48
#define COEFF_LAST_B       60
#define COEFF_SEC_A        72
#define COEFF_LAST_C       84

/** CABAC context base offset for coefficient tables */
#define COEFF_CTX_OFFSET  0xeb8   /* add ecx,0xeb8 @0x1005585e */

/* ===================================================================
 * FUNCTION DECLARATIONS
 * =================================================================== */

/** coeff_scan_init @0x10055830
 *  Decodes significance map + last_position + secondary flags.
 *  esi=ctx, [ebp+8]=coeff_out, edx=count_out.
 *  Returns loop_index (65 on completion). */
int coeff_scan_init(void *ctx, int32_t *coeff_out, int32_t *count_out);

/** coeff_scan_variant_b @0x10055a60 — chroma or 8×8 variant */
int coeff_scan_variant_b(void *ctx, int32_t *coeff_out, int32_t *count_out);

/** coeff_scan_variant_c @0x10055c80 */
int coeff_scan_variant_c(void *ctx, int32_t *coeff_out, int32_t *count_out);

/** coeff_scan_variant_d @0x10055e90 */
int coeff_scan_variant_d(void *ctx, int32_t *coeff_out, int32_t *count_out);

/** coeff_decode_main @0x100560a0
 *  Main coefficient decode for a 4×4 sub-block.
 *  x=[ebp+8], y=[ebp+0xc], ctx=[ebp+0x10], ctx2=[ebp+0x14],
 *  unused=[ebp+0x18], nC=[ebp+0x1c]
 *  Returns 0 on success, -1 on error. */
int coeff_decode_main(int x, int y, void *ctx, void *ctx2, int unused, int nC);

/** ext_coeff_process @0x1006aa00
 *  Decode + dequantize a single coefficient via CABAC.
 *  Returns decoded coefficient value. */
int32_t ext_coeff_process(int32_t *coeff_buf, void *ctx, int qp_param, int scan_pos);

/** ext_coeff_combine @0x1006b530
 *  Apply IDCT butterfly to combine decoded coefficients into residual block.
 *  coeff_buf = 16 int32 values, writeback = destination in frame buffer. */
void ext_coeff_combine(int32_t *coeff_buf, void *writeback);

#ifdef __cplusplus
}
#endif
#endif /* SVAC_COEFF_DECODE_H */
