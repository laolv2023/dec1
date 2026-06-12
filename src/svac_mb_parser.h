/**
 * svac_mb_parser.h — SVAC MB Type / CTU Quadtree Parser
 * REVERSE ENGINEERED from VNplayer.dll @0x10054ec0-0x100551f0 (485 instr)
 */
#ifndef SVAC_MB_PARSER_H
#define SVAC_MB_PARSER_H
#include <stdint.h>
#include "svac_cabac.h"

#ifdef __cplusplus
extern "C" {
#endif

/** mb_type decode table @DLL[0x106026d0] — accessed at 0x10055095: mov eax,[eax*4+0x106026d0] */
extern const uint32_t svac_mb_type_tab[];

/** mb_type_cabac_decode @0x10054ec0
 *  Decodes MB type / CU quadtree split flags via CABAC.
 *  [ebp+8] = SvacDecoderCtx*
 *  Returns:
 *    eax=1: special case (eax==0x17)
 *    eax=0: invalid (eax>=0x18)
 *    eax=table[eax]: lookup from mb_type_tab
 *  Writes to [edi+0x255c8f4] the parsed value.
 *
 *  Key decoder state offsets used:
 *    [edi+0x56c] → [result+0x10]: slice header field
 *    [edi+0x255c8f0]: profile/config index
 *    [edi+0x24008e8+idx*0x74]: frame state (3=I,4=P,5=B)
 *    [edi+0x24008f0]: neighbor flag
 *    [edi+0x24008f2]: slice type flag
 *    [edi+0x2400874+idx*0x74]: neighbor ref info
 */
int mb_type_cabac_decode(void *ctx);

/** CTU quadtree split decision
 *  Decoded via CABAC from context at [ctx_base+0x84] and [ctx_base+0x108].
 *  Stack table initialized with split threshold values.
 *  Returns split depth decision (0-4).
 */
int ctu_split_decode(void *ctx);

#ifdef __cplusplus
}
#endif
#endif
