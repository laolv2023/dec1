/**
 * svac_mb_parser.c — SVAC MB Type / CTU Quadtree Parser
 * REVERSE ENGINEERED from VNplayer.dll @0x10054ec0-0x100551f0
 * Disassembly: mb_type_parser.asm (485 instructions)
 * FIXED: P8(stack_table init) + P9(mb_type_tab extraction)
 */
#include "svac_mb_parser.h"

/* @DLL[0x106026d0] — extracted from DLL binary, 32 uint32_t values
 * Accessed at 0x10055095: mov eax,[eax*4+0x106026d0] */
const uint32_t svac_mb_type_tab[32] = {
    0x00000007, 0x00000008, 0x00000009, 0x0000000a,
    0x0000000b, 0x0000000c, 0x0000000d, 0x0000000e,
    0x0000000f, 0x00000010, 0x00000011, 0x00000012,
    0x00000013, 0x00000014, 0x00000015, 0x00000016,
    0x00000017, 0x00000018, 0x00000019, 0x0000001a,
    0x0000001b, 0x0000001c, 0x0000001d, 0x00000001,
    0x00000000, 0x00000001, 0x00000002, 0x00000002,
    0x00000004, 0x00000000, 0x00000000, 0x00000000
};

/* externals */
extern int svac_cabac_decode_bin(void *ctx, SvacCtxModel *model);
extern void log_error(const char *msg);  /* @0x100ce9a0 */

/**
 * mb_type_cabac_decode @0x10054ec0 — FULL IMPLEMENTATION
 *
 * Stack frame: sub esp,0xc4 (196B = 49 int32_t entries for split decision table)
 *
 * DLL register state at entry:
 *   eax = 1, ebx = 0, esi = 2 (set at 0x10054f0f-0x10054f1c)
 *   edi = SvacDecoderCtx* ([ebp+8])
 */
int mb_type_cabac_decode(void *ctx)
{
    /* @0x10054ec3: sub esp,0xc4 — 196 bytes, 49 int32 entries */
    int stack_table[49]; /* [ebp-0xb0] through [ebp-0x50] covers 25 entries of 49 */

    /* @0x10054ed6: mov edi,[ebp+8] */
    void *decoder = ctx;

    /* @0x10054ed9: mov esi,[edi+0x56c]; movzx esi,byte ptr [esi+0x10] */
    void *slice_hdr = *(void**)((uint8_t*)decoder + 0x56c);
    int slice_field = *(uint8_t*)((uint8_t*)slice_hdr + 0x10); /* @0x10054edf */

    /* @0x10054ee3: mov eax,[edi+0x255c8f0] — profile index */
    int profile_idx = *(int*)((uint8_t*)decoder + 0x255c8f0);
    /* @0x10054ee9: mov ecx,[edi+0x570] — CABAC engine ptr */
    SvacCabacEngine *cabac = *(SvacCabacEngine**)((uint8_t*)decoder + 0x570);

    /* @0x10054eef-0x10054f00: compute struct access index */
    /* @0x10054ef1: sub eax,esi */
    /* @0x10054ef3: imul edx,edx,0x74 */
    /* @0x10054ef6: imul eax,eax,0x74 */
    /* @0x10054ef9: lea eax,[eax+edi+0x24008e8] — &frame_state */
    int diff_idx = (profile_idx - slice_field) * 0x74;         /* @0x10054ef6 */
    int *frame_state_ptr = (int*)((uint8_t*)decoder + 0x24008e8 + diff_idx); /* @0x10054ef9 */
    int struct_idx = profile_idx * 0x74;                       /* edx @0x10054ef3 */

    /* @0x10054f06: mov eax,[ecx+0x18] — CABAC context table base */
    uint8_t *ctx_base = *(uint8_t**)((uint8_t*)cabac + 0x18);

    /* @0x10054f0f: mov eax,1 — ax=1 */
    /* @0x10054f14: xor ebx,ebx — bx=0 */
    /* @0x10054f1c: lea esi,[eax+1] — si=2 */
    int ax = 1, bx = 0, si = 2;                               /* @0x10054f0f-0x10054f1c */

    /* @0x10054f1f: cmp [ecx+4],eax — check CABAC engine state */
    /* @0x10054f22: jne 0x100550ad — branch to alternate path */

    /* ================================================================
     * STACK TABLE INITIALIZATION @0x10054f28-0x10054f94
     * DLL instructions (25 mov operations to [ebp+offset]):
     * ================================================================ */
    /* @0x10054f28: mov [ebp-0xb0],ebx  — table[0]=0 */
    stack_table[0] = bx; /* = 0 */
    /* @0x10054f2e: mov [ebp-0xac],eax  — table[1]=1 */
    stack_table[1] = ax; /* = 1 */
    /* @0x10054f34: mov [ebp-0xa8],eax  — table[2]=1 */
    stack_table[2] = ax; /* = 1 */
    /* @0x10054f3a: mov [ebp-0xa4],eax  — table[3]=1 */
    stack_table[3] = ax; /* = 1 */
    /* @0x10054f40-0x10054f8b: mov [ebp-XX],esi — table[4..21]=2 (18 entries) */
    stack_table[4]  = si; /* = 2 @0x10054f40 [ebp-0xa0] */
    stack_table[5]  = si; /* = 2 @0x10054f46 [ebp-0x9c] */
    stack_table[6]  = si; /* = 2 @0x10054f4c [ebp-0x98] */
    stack_table[7]  = si; /* = 2 @0x10054f52 [ebp-0x94] */
    stack_table[8]  = si; /* = 2 @0x10054f58 [ebp-0x90] */
    stack_table[9]  = si; /* = 2 @0x10054f5e [ebp-0x8c] */
    stack_table[10] = si; /* = 2 @0x10054f64 [ebp-0x88] */
    stack_table[11] = si; /* = 2 @0x10054f6a [ebp-0x84] */
    stack_table[12] = si; /* = 2 @0x10054f70 [ebp-0x80] */
    stack_table[13] = si; /* = 2 @0x10054f73 [ebp-0x7c] */
    stack_table[14] = si; /* = 2 @0x10054f76 [ebp-0x78] */
    stack_table[15] = si; /* = 2 @0x10054f79 [ebp-0x74] */
    stack_table[16] = si; /* = 2 @0x10054f7c [ebp-0x70] */
    stack_table[17] = si; /* = 2 @0x10054f7f [ebp-0x6c] */
    stack_table[18] = si; /* = 2 @0x10054f82 [ebp-0x68] */
    stack_table[19] = si; /* = 2 @0x10054f85 [ebp-0x64] */
    stack_table[20] = si; /* = 2 @0x10054f88 [ebp-0x60] */
    stack_table[21] = si; /* = 2 @0x10054f8b [ebp-0x5c] */
    /* @0x10054f8e: mov [ebp-0x58],ebx  — table[22]=0 */
    stack_table[22] = bx; /* = 0 */
    /* @0x10054f91: mov [ebp-0x54],ebx  — table[23]=0 */
    stack_table[23] = bx; /* = 0 */
    /* @0x10054f94: mov [ebp-0x50],ebx  — table[24]=0 */
    stack_table[24] = bx; /* = 0 */

    /* ================================================================
     * NEIGHBOR FLAG CHECK @0x10054f97-0x10054fd4
     * ================================================================ */
    /* @0x10054f97: cmp byte ptr [edx+edi+0x24008f0],bl — check neighbor flag */
    int nbr_flag = *(uint8_t*)((uint8_t*)decoder + 0x24008f0 + struct_idx);
    int ecx_val;
    if (nbr_flag != 0) {                                     /* @0x10054f9e: je → skip */
        /* @0x10054fa0: mov ecx,[ebp-0xb4] — ecx=*frame_state_ptr */
        int nbr_val = *frame_state_ptr;                      /* @0x10054fa6 */
        /* @0x10054fa8: cmp ecx,7; je skip */
        /* @0x10054fad: cmp ecx,0x1e; je skip */
        ecx_val = (nbr_val == 7 || nbr_val == 0x1e) ? 0 : ax; /* @0x10054fa8-0x10054fb4 */
    } else {
        ecx_val = 0;                                         /* @0x10054fb6: xor ecx,ecx */
    }

    /* @0x10054fb8: cmp byte ptr [edx+edi+0x24008f2],bl — check slice type flag */
    int ax_val;
    if (*(uint8_t*)((uint8_t*)decoder + 0x24008f2 + struct_idx) != 0) { /* @0x10054fbf */
        /* @0x10054fc1: mov edx,[edx+edi+0x2400874] — neighbor ref */
        int nbr_val2 = *(int*)((uint8_t*)decoder + 0x2400874 + struct_idx);
        /* @0x10054fc8: cmp edx,7; je skip */
        /* @0x10054fcd: cmp edx,0x1e; jne keep */
        ax_val = (nbr_val2 == 7 || nbr_val2 == 0x1e) ? 0 : 1; /* @0x10054fc8-0x10054fd4 */
    } else {
        ax_val = 0;                                          /* @0x10054fd2: xor eax,eax */
    }

    /* ================================================================
     * CABAC CONTEXT COMPUTATION @0x10054fd4-0x10054fe1
     * ================================================================ */
    /* @0x10054fd4: lea eax,[eax+ecx+0x16] */
    int ctx_off = ax_val + ecx_val + 0x16;                   /* @0x10054fd4 */
    /* @0x10054fd8: lea edx,[eax+eax*2] — ctx_off * 3 */
    /* @0x10054fdb: mov eax,[ebp-0xb8] — ctx_base */
    /* @0x10054fe1: lea ecx,[eax+edx*4] — ctx_model = ctx_base + ctx_off*12 */
    uint8_t *ctx_model = ctx_base + ctx_off * 12;            /* @0x10054fd8-0x10054fe1 */

    /* ================================================================
     * FIRST CABAC DECODE @0x10054fe4-0x10054ff0
     * ================================================================ */
    /* @0x10054fe4: push ecx; push edi */
    /* @0x10054fe6: call 0x10054380 */
    int flag = svac_cabac_decode_bin(decoder, (SvacCtxModel*)ctx_model);

    int eax_result; /* final index for table lookup */

    if (flag == 0) {                                         /* @0x10054ff0: je → split loop */
        /* === SPLIT DECISION LOOP @0x10054ff2-0x1005504d === */
        int esi_var = 4;                                     /* @0x1005500a */
        int counter = 1;                                     /* @0x10055000: [ebp-0xb4]=1 */
        uint8_t *ctx2;

        /* @0x10054ff2: mov edx,[ebp-0xb8] */
        /* @0x10054ff8: add edx,0x138 — start context at ctx_base+0x138 */
        ctx2 = ctx_base + 0x138;                             /* @0x10054ff2-0x10054ff8 */

        /* @0x1005500f: call cabac_decode_bin */
        while (1) {
            if (svac_cabac_decode_bin(decoder, (SvacCtxModel*)ctx2) != 0)
                break;                                       /* @0x10055019: jne exit */
            /* @0x10055020: inc [ebp-0xb4] — counter++ */
            counter++;                                       /* @0x10055020 */
            /* @0x10055026: inc esi */
            esi_var++;                                       /* @0x10055026 */
            /* @0x10055027: cmp esi,0xa */
            if (esi_var > 10) esi_var = 10;                  /* @0x1005502c */
            /* @0x10055031-0x1005503a: ctx2 = ctx_base + esi*12 + 0x108 */
            ctx2 = ctx_base + esi_var * 12 + 0x108;          /* @0x10055031-0x10055041 */
            /* @0x10055043: call cabac_decode_bin (loop back via @0x1005504d: je) */
        }
        eax_result = counter;                                /* @0x1005504f: mov eax,[ebp-0xb4] */
    } else {
        /* flag == 1: single split @0x10054ff0 (not taken) */
        eax_result = ax; /* = 1 */                           /* from earlier eax=1 */
    }

    /* ================================================================
     * TABLE LOOKUP AND STORE @0x10055055-0x1005505c
     * ================================================================ */
    /* @0x10055055: mov eax,[ebp-0xb4] → eax = counter/result */
    /* @0x1005505c: mov ecx,[ebp+eax*4-0xb0] */
    /* @0x1005505c: mov [edi+0x255c8f4],ecx — store result */
    int table_result = stack_table[eax_result];              /* @0x10055055-0x1005505c */
    *(int*)((uint8_t*)decoder + 0x255c8f4) = table_result;  /* @0x1005505c */

    /* ================================================================
     * RETURN PATH DISPATCH @0x10055062-0x100550ac
     * ================================================================ */
    /* @0x10055062: cmp eax,0x17 */
    if (eax_result == 0x17) {                                /* @0x10055062-0x10055065 */
        return 1; /* special case */
    }
    /* @0x1005507d: cmp eax,0x18 */
    if (eax_result >= 0x18) {                                /* @0x10055080: jl → not invalid */
        return 0; /* invalid */
    }
    /* @0x10055095: mov eax,[eax*4+0x106026d0] — mb_type_tab lookup */
    return (int)svac_mb_type_tab[eax_result];                /* @0x10055095 */
}
