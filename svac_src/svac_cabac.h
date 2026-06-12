/**
 * svac_cabac.h — SVAC CABAC Binary Arithmetic Decoder Engine
 *
 * INSTRUCTION-BY-INSTRUCTION REVERSE ENGINEERING from VNplayer.dll
 * (PE32 x86, MSVC 14.0, ImageBase=0x10000000)
 *
 * EVERY structure offset is anchored to a specific DLL instruction address.
 * NO offset is guessed or inferred from standards.
 */
#ifndef SVAC_CABAC_H
#define SVAC_CABAC_H
#include <stdint.h>

#ifdef __cplusplus
extern "C" {
#endif

/* ===================================================================
 * DATA TABLES — extracted from VNplayer.dll binary
 * =================================================================== */

/** @DLL[0x10602688] bit_mask_tab[33] — indexed by num_bits
 *  Accessed: "and eax, [esi*4 + 0x10602688]" @0x1005420f, @0x10054229 */
extern const uint32_t svac_bit_mask_tab[33];

/** @DLL[0x1072f20c] log2_renorm_tab[256] — dual-use: tab[val]+4 for val<=0xf; tab[val>>4] for val>0xf
 *  Accessed: "movzx esi, [eax + 0x1072f20c]" @0x1005442e */
extern const uint8_t svac_log2_renorm_tab[256];

/* ===================================================================
 * STRUCTURES — exact layout matching DLL memory
 * =================================================================== */

/** SvacBitReader — bitstream cursor state
 *  [+0x00] buf   — "add edx,[edi]"    @0x100541d2
 *  [+0x08] limit — "cmp ecx,[edi+0x08]" @0x100541da
 *  [+0x0c] pos   — "mov eax,[edi+0x0c]" @0x100541ca */
typedef struct {
    const uint8_t *buf;
    uint32_t       _pad04;
    uint32_t       limit;
    uint32_t       pos;
} SvacBitReader;

/** SvacCabacEngine — arithmetic decoder registers
 *  [+0x24] range     — "mov eax,[edi+0x24]" @0x10054397
 *  [+0x28] offset_lo — "mov edx,[edi+0x28]" @0x1005439a
 *  [+0x2c] threshold — "mov esi,[edi+0x2c]" @0x1005439d
 *  [+0x30] offset_hi — "mov edx,[edi+0x30]" @0x10054455 */
typedef struct {
    uint8_t  _pad00[0x24];
    uint32_t range;
    uint32_t offset_lo;
    uint32_t threshold;
    uint32_t offset_hi;
} SvacCabacEngine;

/** SvacCtxModel — context probability model (12 bytes)
 *  [+0x00] ctx_val    — "mov ebx,[eax]"      @0x1005438d
 *  [+0x04] bin_val    — "mov eax,[eax+4]"    @0x100543cf
 *  [+0x08] model_type — "cmp ecx,3" (@0x100543b7, loaded from [eax+8]) */
typedef struct {
    uint32_t ctx_val;
    uint32_t bin_val;
    uint32_t model_type;
} SvacCtxModel;

/** SvacDecoderCtx — decoder context (partial, from CABAC engine perspective)
 *  [+0x00] → inner ptr — "mov ecx,[eax]"         @0x100541c4
 *  [+0x18] → BitReader  — "mov edi,[ecx+0x18]"   @0x100541c7
 *  [+0x570]→ CABAC       — "mov edi,[ecx+0x570]" @0x10054391 */
/* Full structure defined by usage; accessed via pointer chains */

/* ===================================================================
 * FUNCTION DECLARATIONS
 * =================================================================== */

/** bit_read_n @0x100541c0
 *  Reads nbits (1-8) from bitstream. Returns value or -1 on overflow.
 *  eax = SvacDecoderCtx*, esi = num_bits */
int bit_read_n(void *ctx, int nbits);

/** bit_read_1_aux @0x10054240
 *  Reads 1 bit with rollback on overflow. Returns 0/1 or -1.
 *  eax = SvacDecoderCtx* */
int bit_read_1_aux(void *ctx);

/** bit_read_8 @0x10054290
 *  Reads 8 bits. Returns 0x100 on overflow (NOT -1).
 *  eax = SvacDecoderCtx* */
int bit_read_8(void *ctx);

/** svac_cabac_engine_init @0x100542f0
 *  Initializes CABAC decoder state: offset_lo=0, range=0xff,
 *  reads initial offset_hi from bitstream, performs renorm.
 *  [ebp+8] = SvacDecoderCtx* */
void svac_cabac_engine_init(void *ctx);

/** svac_cabac_decode_bin @0x10054380
 *  Core binary arithmetic decode. Decodes one bin.
 *  Returns decoded bin value (0 or 1).
 *  [ebp+8] = SvacDecoderCtx*, [ebp+0xc] = SvacCtxModel* */
int svac_cabac_decode_bin(void *ctx, SvacCtxModel *model);

/** svac_cabac_terminate @0x10054910
 *  Checks if CABAC engine can terminate (end of slice).
 *  Returns 0 = can terminate, non-0 = continue.
 *  [ebp+8] = SvacDecoderCtx* */
int svac_cabac_terminate(void *ctx);

/** svac_cabac_renorm_adapt @0x10054a40
 *  Renormalization + adaptive probability update.
 *  Combined function: adjusts range, offset, and updates context model.
 *  [ebp+8]=ctx, [ebp+0xc]=SvacCtxModel*, [ebp+0x10]=SvacAdaptState* */
int svac_cabac_renorm_adapt(void *ctx, void *model, void *adapt);

#ifdef __cplusplus
}
#endif
#endif /* SVAC_CABAC_H */
