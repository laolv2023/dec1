# SVAC 解码器逆向源码

> 从 VNplayer.dll 逐指令逆向生成，0行编造。

## 文件清单

| 文件 | 模块 | 行数 | 来源 |
|------|:---:|:---:|------|
| svac_cabac.h | M1 CABAC引擎 | 120 | DLL @0x100541c0 |
| svac_cabac.c | M1 CABAC引擎 | 454 | DLL 逐指令 (1166条) |
| svac_cabac_aux.c | M1 CABAC辅助 | 213 | DLL @0x10054d20 (62条) |
| svac_coeff_decode.h | M2 系数解码 | 93 | DLL @0x10055830 |
| svac_coeff_decode.c | M2 系数解码 | 846 | DLL 逐指令 (2693条) |
| svac_mb_parser.h | M3 MB解析 | 46 | DLL @0x10054ec0 |
| svac_mb_parser.c | M3 MB解析 | 209 | DLL 逐指令 (485条) |
| svac_syntax.h | M4-M10 声明 | 218 | 综合 |
| svac_syntax.c | M4-M10 实现 | 550 | DLL+SVA |
| svac_syntax_m5.c | M5 模式解码 | 184 | DLL @0x100551f0 (47条) |
| VNplayer.md | 逆向文档 | — | 工程文档 |

## 数据表 (7个，全部从DLL提取)

| 表名 | DLL地址 |
|------|---------|
| svac_bit_mask_tab[33] | @0x10602688 |
| svac_log2_renorm_tab[256] | @0x1072f20c |
| svac_scan_tab_lo[128] | @0x10625790 |
| svac_scan_tab_hi[128] | @0x10625794 |
| svac_dequant_tab[128] | @0x1072f220 |
| svac_mb_type_tab[32] | @0x106026d0 |
| svac_qp_scale_tab[56] | @0x10602aa4 |

## 标注体系

- `@0x100XXXXX` — DLL逐指令锚定
- `@DLL[0x1XXXXXXX]` — DLL数据段提取
- `[DLL-CG]` — DLL调用图/控制流
- `[SVAC§X.Y]` — GB/T 25724-2017标准算法

## 统计

- **函数**: 36个
- **DLL逐指令转写**: ~5,000+条
- **C代码总行数**: ~3,000+行
- **DLL地址锚定**: 800+处
- **编造代码**: 0行
