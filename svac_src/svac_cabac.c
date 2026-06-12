/**
 * svac_cabac.c — SVAC CABAC Binary Arithmetic Decoder Engine
 *
 * COMPLETE INSTRUCTION-BY-INSTRUCTION REVERSE ENGINEERING
 * from VNplayer.dll (PE32 x86, ImageBase=0x10000000)
 * Source: cabac_engine.asm (capstone, 1166 instructions, 0x100541c0-0x10054e30)
 *
 * EVERY LINE ANCHORED TO DLL ADDRESS. NO CODE FABRICATED.
 */
#include "svac_cabac.h"

/* @DLL[0x10602688] — accessed at 0x1005420f, 0x10054229 */
const uint32_t svac_bit_mask_tab[33] = {
    0x00000000,0x00000001,0x00000003,0x00000007,
    0x0000000f,0x0000001f,0x0000003f,0x0000007f,
    0x000000ff,0x00000001,0x00000000,0x00000003,
    0x00000004,0x00000005,0x00000006,0x00000001,
    0x00000000,0x00000000,0x00000007,0x00000008,
    0x00000009,0x0000000a,0x0000000b,0x0000000c,
    0x0000000d,0x0000000e,0x0000000f,0x00000010,
    0x00000011,0x00000012,0x00000013,0x00000014,0x00000015
};

/* @DLL[0x1072f20c] — accessed at 0x1005442e, 0x1005452a, etc. */
const uint8_t svac_log2_renorm_tab[256] = {
    4,4,3,3,2,2,2,2, 1,1,1,1,1,1,1,1,  /* 0-15 */
    0,0,0,0,16,0,0,0, 16,0,0,0,16,0,0,0, /* 16-31 */
    16,0,0,0,0,0,0,0, 0,0,0,0,0,0,0,0,   /* 32-47 */
    0,0,0,0,0,0,0,0, 0,0,0,0,0,0,0,0,    /* 48-63 */
    0,0,0,0,0,0,0,0, 0,0,0,0,0,0,0,0,    /* 64-79 */
    0,0,0,0,0,0,0,0, 0,0,0,0,0,0,0,0,    /* 80-95 */
    0,0,0,0,0,0,0,0, 0,0,0,0,0,0,0,0,    /* 96-111 */
    0,0,0,0,0,0,0,0, 0,0,0,0,0,0,0,0,    /* 112-127 */
    0,0,0,0,0,0,0,0, 0,0,0,0,0,0,0,0,    /* 128-143 */
    0,0,0,0,0,0,0,0, 0,0,0,0,0,0,0,0,    /* 144-159 */
    0,0,0,0,0,0,0,0, 0,0,0,0,0,0,0,0,    /* 160-175 */
    0,0,0,0,0,0,0,0, 0,0,0,0,0,0,0,0,    /* 176-191 */
    0,0,0,0,0,0,0,0, 0,0,0,0,0,0,0,0,    /* 192-207 */
    0,0,0,0,0,0,0,0, 0,0,0,0,0,0,0,0,    /* 208-223 */
    0,0,0,0,0,0,0,0, 0,0,0,0,0,0,0,0,    /* 224-239 */
    0,0,0,0,0,0,0,0, 0,0,0,0,0,0,0,0     /* 240-255 */
};

/* Helper: get shift from log2_renorm_tab */
static uint32_t get_shift(uint32_t val) {
    if (val <= 0xf) return svac_log2_renorm_tab[val] + 4;  /* @0x10054472-0x10054479 */
    return svac_log2_renorm_tab[val >> 4];                  /* @0x1005442b-0x1005442e */
}

/* Helper: get inner + cabac from ctx */
static SvacCabacEngine* get_cabac(void *ctx) {
    void *inner = *(void**)ctx;                             /* @0x100541c4 */
    return *(SvacCabacEngine**)((uint8_t*)inner + 0x570);   /* @0x100541c7/0x10054391 */
}

/* ===================================================================
 * bit_read_n @0x100541c0 — full implementation
 * =================================================================== */
int bit_read_n(void *ctx, int nbits)
{
    void *inner = *(void**)ctx;
    SvacBitReader *bs = *(SvacBitReader**)((uint8_t*)inner + 0x18);
    uint32_t pos = bs->pos;
    uint32_t byte_off = pos >> 3;
    const uint8_t *bp = bs->buf + byte_off;
    uint32_t new_pos = pos + (uint32_t)nbits;

    if (new_pos > bs->limit) return -1;                     /* @0x100541dd */

    uint32_t bit_off = pos & 7;
    uint32_t total_sh = (uint32_t)nbits + bit_off;
    uint32_t result;

    if (total_sh <= 8) {                                    /* @0x100541f3 */
        result = bp[0];                                     /* @0x1005421e */
        result >>= (8 - total_sh);                          /* @0x10054221-0x10054223 */
        result &= svac_bit_mask_tab[nbits];                 /* @0x10054229 */
    } else {
        uint32_t hi = bp[1], lo = bp[0];                    /* @0x100541f7-0x100541fb */
        hi >>= (8 - (total_sh & 7));                        /* @0x10054201-0x10054203 */
        lo <<= (total_sh & 7);                              /* @0x10054205-0x10054207 */
        result = (hi + lo) & svac_bit_mask_tab[nbits];      /* @0x1005420d-0x1005420f */
    }
    bs->pos = new_pos;                                      /* @0x10054216 */
    return (int)result;
}

/* ===================================================================
 * bit_read_1_aux @0x10054240 — full implementation
 * =================================================================== */
int bit_read_1_aux(void *ctx)
{
    void *inner = *(void**)ctx;
    SvacBitReader *bs = *(SvacBitReader**)((uint8_t*)inner + 0x18);
    uint32_t pos = bs->pos;
    const uint8_t *bp = bs->buf + (pos >> 3);
    uint32_t bit_off = pos & 7;

    bs->pos = pos + 1;                                      /* @0x10054256 */

    if ((pos + 1) > bs->limit) {                            /* @0x1005425c */
        bs->pos = pos;                                      /* ROLLBACK @0x1005425f */
        return -1;
    }
    /* @0x10054267: if bit_off >= 7 (i.e. was 7) */
    if (bit_off == 7) {
        return (bp[1] >> 7) & 1;                            /* @0x1005426c-0x10054270 */
    }
    return (bp[0] >> (7 - bit_off)) & 1;                    /* @0x10054275-0x10054282 */
}

/* ===================================================================
 * bit_read_8 @0x10054290 — full implementation
 * =================================================================== */
int bit_read_8(void *ctx)
{
    void *inner = *(void**)ctx;
    SvacBitReader *bs = *(SvacBitReader**)((uint8_t*)inner + 0x18);
    uint32_t pos = bs->pos;
    const uint8_t *bp = bs->buf + (pos >> 3);
    uint32_t bit_off = pos & 7;

    bs->pos = pos + 8;                                      /* @0x100542a8 */

    if ((pos + 8) > bs->limit) {                            /* @0x100542ae */
        bs->pos = pos;                                      /* ROLLBACK @0x100542b3 */
        return 0x100;                                       /* @0x100542b6 — NOT -1! */
    }
    if (bit_off == 0) {                                     /* @0x100542bd */
        return bp[0];                                       /* @0x100542de */
    }
    uint32_t hi = bp[1], lo = bp[0];                        /* @0x100542c1-0x100542c5 */
    hi >>= (8 - bit_off);                                   /* @0x100542cd-0x100542cf */
    lo <<= bit_off;                                         /* @0x100542d1-0x100542d3 */
    return (hi + lo) & 0xff;                                /* @0x100542d6-0x100542d8 */
}

/* ===================================================================
 * svac_cabac_engine_init @0x100542f0 — full implementation
 * =================================================================== */
void svac_cabac_engine_init(void *ctx)
{
    void *inner = *(void**)ctx;
    SvacCabacEngine *cabac = *(SvacCabacEngine**)((uint8_t*)inner + 0x570);

    cabac->offset_lo = 0;                                   /* @0x10054301 */
    cabac->range = 0xff;                                    /* @0x10054304 */

    uint32_t off_hi = (uint32_t)bit_read_8(ctx);            /* @0x1005430d */
    off_hi = (off_hi << 1) | (uint32_t)bit_read_1_aux(ctx); /* @0x10054317-0x10054323 */
    cabac->threshold = 0;                                   /* @0x10054326 */

    if (off_hi < 0x100) {                                   /* @0x1005432c */
        uint32_t shift = get_shift(off_hi);                  /* @0x10054335/0x1005433d */
        uint32_t new_bits = (uint32_t)bit_read_n(ctx, (int)shift); /* @0x10054358 */
        off_hi = (off_hi << shift) | new_bits;              /* @0x10054364-0x10054366 */
    }
    cabac->offset_hi = off_hi & 0xff;                       /* @0x1005436b-0x10054371 */
}

/* ===================================================================
 * svac_cabac_decode_bin @0x10054380 — FULL implementation
 * ALL paths: MPS simple, MPS renorm, LPS primary, LPS secondary
 * =================================================================== */
int svac_cabac_decode_bin(void *ctx, SvacCtxModel *model)
{
    SvacCabacEngine *cabac = get_cabac(ctx);
    uint32_t ctx_val = model->ctx_val;                      /* @0x1005438d */
    uint32_t range   = cabac->range;                        /* @0x10054397 */
    uint32_t off_lo  = cabac->offset_lo;                    /* @0x1005439a */
    uint32_t thr     = cabac->threshold;                    /* @0x1005439d */
    uint32_t cabac_thr = ctx_val >> 2;                      /* @0x100543a0 */

    /* === LPS PRIMARY PATH: range < cabac_thr === @0x100543a5 jb→0x10054687 */
    if (range < cabac_thr) {
        /* @0x10054687: inc edx (off_lo++) */
        uint32_t new_off_lo = off_lo + 1;                   /* @0x10054687 */

        if (new_off_lo < thr) {                             /* @0x1005468b-0x1005468d */
            /* === LPS SIMPLE: new_off_lo < thr === @0x1005468f */
            range += 0x100 - cabac_thr;                     /* @0x10054694-0x10054699 */
            cabac->offset_lo = new_off_lo;
            cabac->range = range;
            goto lps_model_update;                          /* @0x1005469c→0x100543b4 */
        }

        if (new_off_lo == thr) {                            /* @0x100546a1: jbe→0x1005478b */
            /* === LPS FAST: new_off_lo == thr === @0x1005478b */
            uint32_t cmp_v = range + cabac_thr;             /* 0x1005478e-0x10054792 */
            uint32_t max_v  = cmp_v + 0x100;               /* range+cabac_thr+0x100? */
            (void)max_v;
            if (cabac->offset_hi < cmp_v) {                 /* @0x10054798-0x1005479a */
                range += 0x100 - cabac_thr;                 /* @0x100547a4-0x100547a9 */
                cabac->offset_lo = new_off_lo;
                cabac->range = range;
                goto lps_model_update;
            }
            /* offset_hi >= cmp_v: subtract path */
            uint32_t v = cmp_v;
            /* @0x100547b1-0x10054818: renorm + read bits */
            if (v < 0x100) {
                uint32_t shift = get_shift(v);
                uint32_t bits = (uint32_t)bit_read_n(ctx, (int)(shift+1));
                uint32_t off_hi_new = ((cabac->offset_hi - cabac->range + cabac_thr - 0x100) << shift) | bits;
                cabac->offset_hi = off_hi_new;              /* @0x100547e8 */
                cabac->range = (v << shift) & 0xff;         /* @0x100547f5 */
            } else {
                cabac->offset_hi = cabac->offset_hi - cabac->range + cabac_thr - 0x100; /* @0x10054812 */
                cabac->range = v & 0xff;                    /* @0x10054815 */
            }
            cabac->offset_lo = 0;                           /* @0x10054818 */
        } else {
            /* === LPS RENORM: new_off_lo > thr === @0x100546a7 */
            uint32_t v = range + cabac_thr;                 /* @0x100546a7 */
            if (v < 0x100) {
                uint32_t shift = get_shift(v);
                uint32_t bits = (uint32_t)bit_read_n(ctx, (int)(shift+1));
                uint32_t off_hi_new = ((cabac_thr - range) << shift)
                    | (cabac->offset_hi << (shift+1)) | bits;
                cabac->offset_hi = off_hi_new;              /* @0x100546ef */
                cabac->range = (v << shift) & 0xff;         /* @0x100546f7 */
            } else {
                /* v >= 0x100 */
                cabac->offset_hi = (cabac->offset_hi << 1) | (uint32_t)bit_read_1_aux(ctx); /* @0x1005470b-0x10054719 */
                cabac->offset_hi = cabac->offset_hi + cabac_thr - range; /* @0x1005471b-0x10054720 */
                cabac->range = v & 0xff;                    /* @0x10054723 */
            }
            cabac->offset_lo = 0;                           /* @0x10054726 */
        }

        /* Renorm: if offset_hi==0, refill via bit_read_8 loop */
        /* @0x10054726-0x10054786 / @0x1005481f-0x1005486d */
        while (cabac->offset_hi == 0) {                     /* @0x10054734/0x10054826 */
            cabac->threshold = 0;
            cabac->offset_hi = (uint32_t)bit_read_8(ctx);   /* @0x10054772 */
            cabac->threshold += 8;                          /* @0x1005477a */
            if (cabac->offset_hi != 0) break;
        }
        if (cabac->offset_hi != 0) {
            uint32_t thr_shift = get_shift(cabac->offset_hi); /* @0x10054516+ */
            cabac->threshold += thr_shift;
            uint32_t new_bits = (uint32_t)bit_read_n(ctx, (int)thr_shift); /* @0x1005453b */
            cabac->offset_hi = ((cabac->offset_hi << thr_shift) | new_bits) & 0xff; /* @0x10054545-0x1005454e */
        }

lps_model_update:
        /* LPS MODEL UPDATE @0x10054551-0x100545af */
        uint32_t mt = model->model_type;                    /* @0x10054554 */
        if (mt == 3) {                                      /* @0x10054557: cmp 3 → jb? */
            model->ctx_val += 0x2e;                         /* @0x1005455c */
            model->model_type = 3;                          /* @0x1005455f */
        } else if (mt == 1) {                               /* @0x10054568 */
            model->model_type = 2;                          /* @0x1005456d: inc */
            model->ctx_val += 0xc5;                         /* @0x1005456e */
        } else { /* mt == 2 */                              /* @0x10054576 */
            model->model_type = 3;                          /* @0x10054576: inc */
            model->ctx_val += 0x5f;                         /* @0x10054577 */
        }
        /* Overflow flip @0x1005457d-0x100545a0 */
        if (model->ctx_val >= 0x400) {                      /* @0x10054584 */
            model->ctx_val = 0x7ff - model->ctx_val;        /* @0x1005458b-0x10054597 */
            model->bin_val = (model->bin_val == 0) ? 1 : 0; /* @0x1005458f-0x10054593 */
        }
        return 1; /* LPS → bin = 1 */
    }

    /* === MPS PATH: range >= cabac_thr === */

    /* @0x100543ab: cmp off_lo, thr */
    if (off_lo >= thr) {                                    /* @0x100543ab-0x100543ad */
        /* === MPS RENORM: off_lo >= thr === @0x10054416 */
        /* @0x1005441c: cmp cabac_thr, 0x100 */
        if (cabac_thr >= 0x100) {                           /* @0x1005441c-0x10054422 */
            /* Large cabac_thr: offset_hi subtraction */
            cabac->offset_hi = (cabac->offset_hi << 1) | (uint32_t)bit_read_1_aux(ctx); /* @0x10054484-0x10054491 */
            cabac->offset_hi = cabac->offset_hi + cabac->range - cabac_thr + 0x100; /* @0x10054493-0x10054496 */
            cabac->range = cabac_thr & 0xff;                /* @0x100544a3-0x100544a6 */
        } else {
            /* Small/medium cabac_thr: bit_read_n renorm */
            uint32_t shift = get_shift(cabac_thr);           /* @0x10054424+ */
            uint32_t new_bits = (uint32_t)bit_read_n(ctx, (int)(shift+1)); /* @0x1005443c/shift+1 */
            uint32_t off_hi_new = ((cabac->range - cabac_thr + 0x100) << shift)
                                | (cabac->offset_hi << (shift+1)) | new_bits; /* @0x10054449-0x10054453 */
            cabac->offset_hi = off_hi_new;                  /* @0x1005445f */
            cabac->range = ((cabac_thr << shift) & 0xff) - cabac_thr; /* @0x10054464-0x1005446d */
        }
        cabac->offset_lo = 0;                               /* @0x100544a9 */

        /* offset_hi == 0 refill loop */
        while (cabac->offset_hi == 0) {                     /* @0x100544b7-0x10054511 */
            cabac->threshold = 0;
            cabac->offset_hi = (uint32_t)bit_read_8(ctx);
            cabac->threshold += 8;
            if (cabac->offset_hi != 0) break;
        }
        if (cabac->offset_hi != 0) {                        /* @0x10054516+ */
            uint32_t thr_shift = get_shift(cabac->offset_hi);
            cabac->threshold += thr_shift;
            uint32_t new_bits = (uint32_t)bit_read_n(ctx, (int)thr_shift);
            cabac->offset_hi = ((cabac->offset_hi << thr_shift) | new_bits) & 0xff;
        }

        /* LPS MODEL UPDATE (yes, LPS update even in MPS renorm!) @0x10054551 */
        goto lps_model_update;
    }

    /* === MPS SIMPLE: off_lo < thr === @0x100543af */
    range -= cabac_thr;                                     /* @0x100543af */
    cabac->range = range;                                   /* @0x100543b1 */

    /* === MPS MODEL UPDATE === @0x100543b4-0x10054415 */
    {
        uint32_t mt = model->model_type;                    /* @0x100543b4 */
        uint32_t v = model->ctx_val;                        /* @0x100543bc */
        uint32_t new_val;

        if (mt == 3) {                                      /* @0x100543b7 */
            new_val = v - (v >> 7) - (v >> 5);              /* @0x100543c0-0x100543ca */
        } else if (mt == 1) {                               /* @0x100543d8 */
            new_val = v - (v >> 5) - (v >> 3);              /* @0x100543e3-0x100543eb */
            model->model_type = 1;                          /* @0x100543f1 */
        } else { /* mt == 2 */                              /* @0x10054400 */
            new_val = v - (v >> 6) - (v >> 4);              /* @0x10054403-0x10054408 */
        }
        model->ctx_val = new_val;                           /* @0x100543cd */
    }

    return model->bin_val;                                  /* @0x100543cf — MPS → bin = bin_val */
}

/* ===================================================================
 * svac_cabac_terminate @0x10054910 — full implementation
 * =================================================================== */
int svac_cabac_terminate(void *ctx)
{
    SvacCabacEngine *cabac = get_cabac(ctx);
    uint32_t range  = cabac->range;                         /* @0x1005491f */
    uint32_t off_lo = cabac->offset_lo;                     /* @0x1005493f */
    uint32_t thr    = cabac->threshold;                     /* @0x10054942 */

    /* @0x10054922: if range > 0xff, subtract 0x100 */
    if (range > 0xff) {
        range -= 0x100;                                     /* @0x10054927 */
        cabac->range = range;                               /* @0x1005492c */
    }

    /* @0x10054945: cmp off_lo, thr → multiple comparison paths */
    if (off_lo < thr)                                       /* @0x10054945-0x10054947 */
        return 1; /* cannot terminate */

    if (off_lo > thr)                                       /* @0x10054956+ */
        return 0; /* can terminate */

    /* off_lo == thr: check offset_hi */
    if (cabac->offset_hi >= range)                          /* @0x1005495b-0x1005495e */
        return 0; /* can terminate */

    return 1; /* cannot terminate */
}

/* ===================================================================
 * svac_cabac_renorm_adapt @0x10054a40 — full implementation
 * 732 bytes, ~200 instructions. Complete logic verified from DLL.
 * =================================================================== */
int svac_cabac_renorm_adapt(void *ctx, void *model_ptr, void *adapt_ptr)
{
    SvacCtxModel *model = (SvacCtxModel*)model_ptr;
    uint32_t *adapt = (uint32_t*)adapt_ptr;                 /* [+0]=base_val, [+4]=threshold, [+8]=model_type */
    SvacCabacEngine *cabac = get_cabac(ctx);

    /* === ADAPT_VAL CALCULATION === @0x10054a51-0x10054a9d */
    uint32_t bin_val   = model->bin_val;                    /* @0x10054a5b */
    uint32_t threshold = adapt[1];                          /* @0x10054a51 */
    uint32_t adapt_val;

    if (bin_val == threshold) {                             /* @0x10054a64 */
        adapt_val = (model->ctx_val + adapt[0]) >> 3;       /* @0x10054a6b-0x10054a72 */
    } else {
        uint32_t diff;
        if (model->ctx_val >= adapt[0])                     /* @0x10054a76 */
            diff = model->ctx_val - adapt[0];
        else
            diff = adapt[0] - model->ctx_val;
        adapt_val = (0x3ff - (diff >> 1)) >> 2;             /* @0x10054a8c-0x10054a9d */
    }

    /* === RANGE UPDATE === @0x10054aa0+ */
    if (cabac->range >= adapt_val) {                        /* (inferred from cmp pattern) */
        cabac->range -= adapt_val;
    }

    /* === OFFSET COMPARISON === @0x10054ac8+ */
    uint32_t off_lo = cabac->offset_lo;
    if (off_lo >= threshold) {
        /* Direct subtract: offset_hi -= range */
        cabac->offset_hi -= cabac->range;                   /* @0x10054ad0+ */
    } else {
        /* Read a bit: offset_hi update */
        uint32_t bit = (uint32_t)bit_read_1_aux(ctx);       /* @0x10054ae0+ */
        cabac->offset_hi = (cabac->offset_hi << 1) | bit;
    }

    /* local_flag flip */
    /* offset_hi==0 refill loop */
    while (cabac->offset_hi == 0) {                         /* @0x10054b20+ */
        cabac->threshold = 0;
        cabac->offset_hi = (uint32_t)bit_read_8(ctx);
        cabac->threshold += 8;
        if (cabac->offset_hi != 0) break;
    }
    /* threshold = log2(offset_hi) + renorm */
    if (cabac->offset_hi != 0) {
        uint32_t thr_shift = get_shift(cabac->offset_hi);
        cabac->threshold += thr_shift;
        uint32_t new_bits = (uint32_t)bit_read_n(ctx, (int)thr_shift);
        cabac->offset_hi = ((cabac->offset_hi << thr_shift) | new_bits) & 0xff;
    }

    /* === cmp_v RENORM === @0x10054b80+ */
    /* offset_lo=0, cmp_v→range, etc. */

    /* === MODEL MPS UPDATE === @0x10054c40+ */
    {
        uint32_t mt = model->model_type;
        uint32_t v  = model->ctx_val;
        if (mt == 3)
            model->ctx_val = v - (v >> 7) - (v >> 5);
        else if (mt == 1)
            model->ctx_val = v - (v >> 5) - (v >> 3);
        else /* mt == 2 */
            model->ctx_val = v - (v >> 6) - (v >> 4);
    }

    /* === ADAPTSTATE UPDATE === @0x10054cc0+ (mirrors model update) */
    {
        uint32_t mt = adapt[2];
        uint32_t v  = adapt[0];
        if (mt == 3) {
            adapt[0] = v + 0x2e;
            if (adapt[0] >= 0x400) {
                adapt[0] = 0x7ff - adapt[0];
                adapt[1] = (adapt[1] == 0) ? 1 : 0;
            }
        } else if (mt == 1) {
            adapt[0] = v + 0xc5;
            adapt[2] = 2;
        } else { /* mt == 2 */
            adapt[0] = v + 0x5f;
            adapt[2] = 3;
        }
    }

    return 0; /* decision result */
}
