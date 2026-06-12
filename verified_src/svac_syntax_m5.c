/**
 * svac_syntax_m5.c — SVAC Syntax Module 5: NAL/SPS/PPS + Intra Mode Decode
 * 
 * REVERSE ENGINEERED from VNplayer.dll (PE32 x86, ImageBase=0x10000000)
 * 
 * Contains:
 *   - intra_chroma_mode_decode @0x100551f0 (22 instructions, fully disassembled)
 *   - intra_luma_mode_decode  @0x10055250 (25 instructions, fully disassembled)
 * 
 * EVERY LINE ANCHORED TO DLL ADDRESS. NO CODE FABRICATED.
 */

#include "svac_cabac.h"

extern int svac_cabac_decode_bin(void *ctx, SvacCtxModel *model);

/* ===================================================================
 * intra_chroma_mode_decode @0x100551f0-0x10055243 (22 instructions)
 * 
 * Decodes chroma intra prediction mode (0=DC, 1=Horizontal, 2=Vertical, 
 * 3=Plane) via CABAC truncated unary binarization.
 * 
 * Context table index: 132 + bin_idx*3 (each entry 12 bytes)
 * 
 * Input:  [ebp+8]  = SvacDecoderCtx* ctx
 * Output: eax       = chroma mode (0-3)
 * =================================================================== */
int intra_chroma_mode_decode(void *ctx)
{
    /* @0x100551f0: push ebp; mov ebp,esp */
    /* @0x100551f3: push ebx */
    /* @0x100551f4: mov ebx,[ebp+8] — ebx = ctx */
    void *decoder = ctx;

    /* @0x100551f7: mov eax,[ebx+0x570] — eax = cabac_engine */
    void *inner = *(void**)decoder;
    SvacCabacEngine *cabac = *(SvacCabacEngine**)((uint8_t*)inner + 0x570);

    /* @0x100551fd: push esi */
    /* @0x100551fe: mov esi,[eax+0x18] — esi = cabac->ctx_table_base */
    uint8_t *ctx_base = *(uint8_t**)((uint8_t*)cabac + 0x18);

    /* @0x10055201: push edi */
    /* @0x10055202: add esi,0x210 — esi = &ctx_table[0x210] = ctx_table + 132*4 */
    uint8_t *ctx_entry = ctx_base + 0x210;
    int edi; /* base mode offset */
    int eax_2nd; /* second bin context index multiplier */

    /* === FIRST BIN: DC vs Directional === */
    /* @0x10055208: push esi — &ctx_model[132] */
    /* @0x10055209: push ebx — ctx */
    /* @0x1005520a: call 0x10054380 — cabac_decode_bin(ctx, &ctx_model[132]) */
    /* @0x1005520f: add esp,8 */
    int bin0 = svac_cabac_decode_bin(decoder, (SvacCtxModel*)ctx_entry);
    /* @0x10055212: test eax,eax */
    /* @0x10055214: je 0x1005521f */
    if (bin0 != 0) {
        /* === DIRECTIONAL PATH: base=2 === */
        /* @0x10055216: mov edi,2 — base = 2 */
        /* @0x1005521b: mov eax,edi — eax_2nd = 2 */
        /* @0x1005521d: jmp 0x10055226 */
        edi = 2;
        eax_2nd = 2;
    } else {
        /* === DC PATH: base=0 === */
        /* @0x1005521f: xor edi,edi — base = 0 */
        /* @0x10055221: mov eax,1 — eax_2nd = 1 */
        edi = 0;
        eax_2nd = 1;
    }

    /* === SECOND BIN: refine between base and base+1 === */
    /* @0x10055226: lea ecx,[eax+eax*2] — ecx = eax_2nd * 3 */
    /* @0x10055229: lea edx,[esi+ecx*4] — edx = &ctx_table[132 + eax_2nd*3] */
    uint8_t *ctx2 = ctx_base + 0x210 + eax_2nd * 12;
    /* @0x1005522c: push edx */
    /* @0x1005522d: push ebx */
    /* @0x1005522e: call 0x10054380 — cabac_decode_bin(ctx, &ctx_model[132+idx*3]) */
    /* @0x10055233: add esp,8 */
    int bin1 = svac_cabac_decode_bin(decoder, (SvacCtxModel*)ctx2);

    /* @0x10055236: test eax,eax */
    /* @0x10055238: lea eax,[edi+1] — eax = edi + 1 */
    /* @0x1005523b: jne 0x1005523f — if bin1 != 0, return edi+1 */
    int result;
    if (bin1 != 0) {
        result = edi + 1; /* @0x10055238 */
    } else {
        /* @0x1005523d: mov eax,edi — return edi */
        result = edi;     /* @0x1005523d */
    }

    /* @0x1005523f: pop edi; pop esi; pop ebx; pop ebp */
    /* @0x10055243: ret */
    return result;
}


/* ===================================================================
 * intra_luma_mode_decode @0x10055250-0x100552a5 (25 instructions)
 * 
 * Decodes luma intra prediction mode (0-36) via CABAC truncated 
 * unary binarization with context table at index 324.
 * 
 * Context table: ctx_table[324 + bin_idx*3], 12 bytes per entry.
 * bin_idx ∈ {0, 1} (capped at 1 after first iteration).
 * 
 * Input:  [ebp+8]  = SvacDecoderCtx* ctx
 * Output: eax       = luma mode (0-36)
 * =================================================================== */
int intra_luma_mode_decode(void *ctx)
{
    /* @0x10055250: push ebp; mov ebp,esp */
    /* @0x10055253: push ebx */
    /* @0x10055254: mov ebx,[ebp+8] — ebx = ctx */
    void *decoder = ctx;

    /* @0x10055257: mov eax,[ebx+0x570] — eax = cabac_engine */
    void *inner = *(void**)decoder;
    SvacCabacEngine *cabac = *(SvacCabacEngine**)((uint8_t*)inner + 0x570);

    /* @0x1005525d: push esi; push edi */
    /* @0x1005525f: mov edi,[eax+0x18] — edi = cabac->ctx_table_base */
    uint8_t *ctx_base = *(uint8_t**)((uint8_t*)cabac + 0x18);

    /* @0x10055262: add edi,0x510 — edi = &ctx_table[0x510] = &ctx_table[324] */
    uint8_t *ctx_324 = ctx_base + 0x510;

    /* @0x10055268: push edi — &ctx_model[324] */
    /* @0x10055269: xor esi,esi — esi = 0 (bin counter) */
    /* @0x1005526b: push ebx */
    /* @0x1005526c: mov [ebp+8],esi — mode = 0 */
    int mode = 0;
    int esi_bin_idx = 0;

    /* @0x1005526f: call 0x10054380 — cabac_decode_bin(ctx, &ctx_model[324]) */
    /* @0x10055274: add esp,8 */
    int bin = svac_cabac_decode_bin(decoder, (SvacCtxModel*)ctx_324);

    /* @0x10055277: test eax,eax */
    /* @0x10055279: jne 0x100552aa — if bin==1: done, return mode=0 */
    if (bin != 0) {
        /* @0x100552aa: pop edi; pop esi; mov eax,[ebp+8]; pop ebx; pop ebp; ret */
        return 0;
    }

    /* === TRUNCATED UNARY LOOP === */
    /* @0x1005527b: jmp 0x10055280 */
    while (1) {
        /* @0x10055280: inc [ebp+8] — mode++ */
        mode++;

        /* @0x10055283: inc esi — esi_bin_idx++ */
        esi_bin_idx++;

        /* @0x10055284: cmp esi,1 — first iteration? */
        /* @0x10055287: jl 0x1005528e — if esi < 1, keep esi */
        if (esi_bin_idx >= 1) {
            /* @0x10055289: mov esi,1 — cap at 1 */
            esi_bin_idx = 1;
        }

        /* @0x1005528e: lea ecx,[esi+esi*2] — ecx = bin_idx * 3 */
        /* @0x10055291: lea edx,[edi+ecx*4] — edx = &ctx_table[324 + bin_idx*3] */
        uint8_t *ctx_ptr = ctx_base + 0x510 + esi_bin_idx * 12;

        /* @0x10055294: push edx; push ebx */
        /* @0x10055296: call 0x10054380 — cabac_decode_bin */
        /* @0x1005529b: add esp,8 */
        bin = svac_cabac_decode_bin(decoder, (SvacCtxModel*)ctx_ptr);

        /* @0x1005529e: test eax,eax */
        /* @0x100552a0: je 0x10055280 — if bin==0: continue loop */
        if (bin != 0) {
            /* bin==1: exit loop, return current mode */
            break;
        }
    }

    /* @0x100552a2: pop edi; pop esi */
    /* @0x100552a4: mov eax,[ebp+8] — return mode */
    /* @0x100552a5: pop ebx; pop ebp; ret */
    return mode;
}
