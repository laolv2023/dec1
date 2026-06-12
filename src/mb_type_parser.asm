; mb_type_parser @ 0x10054ec0
; 485 instr

  0x10054ec0: push     ebp
  0x10054ec1: mov      ebp, esp
  0x10054ec3: sub      esp, 0xc4
  0x10054ec9: mov      eax, dword ptr [0x106f85d0]
  0x10054ece: xor      eax, ebp
  0x10054ed0: mov      dword ptr [ebp - 4], eax
  0x10054ed3: push     ebx
  0x10054ed4: push     esi
  0x10054ed5: push     edi
  0x10054ed6: mov      edi, dword ptr [ebp + 8]
  0x10054ed9: mov      esi, dword ptr [edi + 0x56c]
  0x10054edf: movzx    esi, byte ptr [esi + 0x10]
  0x10054ee3: mov      eax, dword ptr [edi + 0x255c8f0]
  0x10054ee9: mov      ecx, dword ptr [edi + 0x570]
  0x10054eef: mov      edx, eax
  0x10054ef1: sub      eax, esi
  0x10054ef3: imul     edx, edx, 0x74
  0x10054ef6: imul     eax, eax, 0x74
  0x10054ef9: lea      eax, [eax + edi + 0x24008e8]
  0x10054f00: mov      dword ptr [ebp - 0xb4], eax
  0x10054f06: mov      eax, dword ptr [ecx + 0x18]
  0x10054f09: mov      dword ptr [ebp - 0xb8], eax
  0x10054f0f: mov      eax, 1
  0x10054f14: xor      ebx, ebx
  0x10054f16: mov      dword ptr [ebp - 0xbc], ecx
  0x10054f1c: lea      esi, [eax + 1]
  0x10054f1f: cmp      dword ptr [ecx + 4], eax
  0x10054f22: jne      0x100550ad
  0x10054f28: mov      dword ptr [ebp - 0xb0], ebx
  0x10054f2e: mov      dword ptr [ebp - 0xac], eax
  0x10054f34: mov      dword ptr [ebp - 0xa8], eax
  0x10054f3a: mov      dword ptr [ebp - 0xa4], eax
  0x10054f40: mov      dword ptr [ebp - 0xa0], esi
  0x10054f46: mov      dword ptr [ebp - 0x9c], esi
  0x10054f4c: mov      dword ptr [ebp - 0x98], esi
  0x10054f52: mov      dword ptr [ebp - 0x94], esi
  0x10054f58: mov      dword ptr [ebp - 0x90], esi
  0x10054f5e: mov      dword ptr [ebp - 0x8c], esi
  0x10054f64: mov      dword ptr [ebp - 0x88], esi
  0x10054f6a: mov      dword ptr [ebp - 0x84], esi
  0x10054f70: mov      dword ptr [ebp - 0x80], esi
  0x10054f73: mov      dword ptr [ebp - 0x7c], esi
  0x10054f76: mov      dword ptr [ebp - 0x78], esi
  0x10054f79: mov      dword ptr [ebp - 0x74], esi
  0x10054f7c: mov      dword ptr [ebp - 0x70], esi
  0x10054f7f: mov      dword ptr [ebp - 0x6c], esi
  0x10054f82: mov      dword ptr [ebp - 0x68], esi
  0x10054f85: mov      dword ptr [ebp - 0x64], esi
  0x10054f88: mov      dword ptr [ebp - 0x60], esi
  0x10054f8b: mov      dword ptr [ebp - 0x5c], esi
  0x10054f8e: mov      dword ptr [ebp - 0x58], ebx
  0x10054f91: mov      dword ptr [ebp - 0x54], ebx
  0x10054f94: mov      dword ptr [ebp - 0x50], ebx
  0x10054f97: cmp      byte ptr [edx + edi + 0x24008f0], bl
  0x10054f9e: je       0x10054fb6
  0x10054fa0: mov      ecx, dword ptr [ebp - 0xb4]
  0x10054fa6: mov      ecx, dword ptr [ecx]
  0x10054fa8: cmp      ecx, 7
  0x10054fab: je       0x10054fb6
  0x10054fad: cmp      ecx, 0x1e
  0x10054fb0: je       0x10054fb6
  0x10054fb2: mov      ecx, eax
  0x10054fb4: jmp      0x10054fb8
  0x10054fb6: xor      ecx, ecx
  0x10054fb8: cmp      byte ptr [edx + edi + 0x24008f2], bl
  0x10054fbf: je       0x10054fd2
  0x10054fc1: mov      edx, dword ptr [edx + edi + 0x2400874]
  0x10054fc8: cmp      edx, 7
  0x10054fcb: je       0x10054fd2
  0x10054fcd: cmp      edx, 0x1e
  0x10054fd0: jne      0x10054fd4
  0x10054fd2: xor      eax, eax
  0x10054fd4: lea      eax, [eax + ecx + 0x16]
  0x10054fd8: lea      edx, [eax + eax*2]
  0x10054fdb: mov      eax, dword ptr [ebp - 0xb8]
  0x10054fe1: lea      ecx, [eax + edx*4]
  0x10054fe4: push     ecx
  0x10054fe5: push     edi
  0x10054fe6: call     0x10054380
  0x10054feb: add      esp, 8
  0x10054fee: test     eax, eax
  0x10054ff0: je       0x10055055
  0x10054ff2: mov      edx, dword ptr [ebp - 0xb8]
  0x10054ff8: add      edx, 0x138
  0x10054ffe: push     edx
  0x10054fff: push     edi
  0x10055000: mov      dword ptr [ebp - 0xb4], 1
  0x1005500a: mov      esi, 4
  0x1005500f: call     0x10054380
  0x10055014: add      esp, 8
  0x10055017: test     eax, eax
  0x10055019: jne      0x1005504f
  0x1005501b: jmp      0x10055020
  0x1005501d: lea      ecx, [ecx]
  0x10055020: inc      dword ptr [ebp - 0xb4]
  0x10055026: inc      esi
  0x10055027: cmp      esi, 0xa
  0x1005502a: jl       0x10055031
  0x1005502c: mov      esi, 0xa
  0x10055031: mov      ecx, dword ptr [ebp - 0xb8]
  0x10055037: lea      eax, [esi + esi*2]
  0x1005503a: lea      edx, [ecx + eax*4 + 0x108]
  0x10055041: push     edx
  0x10055042: push     edi
  0x10055043: call     0x10054380
  0x10055048: add      esp, 8
  0x1005504b: test     eax, eax
  0x1005504d: je       0x10055020
  0x1005504f: mov      eax, dword ptr [ebp - 0xb4]
  0x10055055: mov      ecx, dword ptr [ebp + eax*4 - 0xb0]
  0x1005505c: mov      dword ptr [edi + 0x255c8f4], ecx
  0x10055062: cmp      eax, 0x17
  0x10055065: jne      0x1005507d
  0x10055067: pop      edi
  0x10055068: pop      esi
  0x10055069: mov      eax, 1
  0x1005506e: pop      ebx
  0x1005506f: mov      ecx, dword ptr [ebp - 4]
  0x10055072: xor      ecx, ebp
  0x10055074: call     0x10382b66
  0x10055079: mov      esp, ebp
  0x1005507b: pop      ebp
  0x1005507c: ret      
  0x1005507d: cmp      eax, 0x18
  0x10055080: jl       0x10055095
  0x10055082: pop      edi
  0x10055083: pop      esi
  0x10055084: xor      eax, eax
  0x10055086: pop      ebx
  0x10055087: mov      ecx, dword ptr [ebp - 4]
  0x1005508a: xor      ecx, ebp
  0x1005508c: call     0x10382b66
  0x10055091: mov      esp, ebp
  0x10055093: pop      ebp
  0x10055094: ret      
  0x10055095: mov      eax, dword ptr [eax*4 + 0x106026d0]
  0x1005509c: pop      edi
  0x1005509d: pop      esi
  0x1005509e: pop      ebx
  0x1005509f: mov      ecx, dword ptr [ebp - 4]
  0x100550a2: xor      ecx, ebp
  0x100550a4: call     0x10382b66
  0x100550a9: mov      esp, ebp
  0x100550ab: pop      ebp
  0x100550ac: ret      
  0x100550ad: mov      dword ptr [ebp - 0x14], eax
  0x100550b0: mov      dword ptr [ebp - 0xc4], eax
  0x100550b6: mov      dword ptr [ebp - 0x3c], eax
  0x100550b9: mov      dword ptr [ebp - 0x34], eax
  0x100550bc: mov      eax, dword ptr [ebp - 0xb8]
  0x100550c2: add      eax, 0x84
  0x100550c7: mov      ecx, 4
  0x100550cc: mov      edx, 3
  0x100550d1: push     eax
  0x100550d2: push     edi
  0x100550d3: mov      dword ptr [ebp - 0x1c], 5
  0x100550da: mov      dword ptr [ebp - 0x18], ebx
  0x100550dd: mov      dword ptr [ebp - 0x10], esi
  0x100550e0: mov      dword ptr [ebp - 0xc], edx
  0x100550e3: mov      dword ptr [ebp - 8], ecx
  0x100550e6: mov      dword ptr [ebp - 0xc0], ebx
  0x100550ec: mov      dword ptr [ebp - 0x4c], edx
  0x100550ef: mov      dword ptr [ebp - 0x48], ecx
  0x100550f2: mov      dword ptr [ebp - 0x44], 5
  0x100550f9: mov      dword ptr [ebp - 0x40], 6
  0x10055100: mov      dword ptr [ebp - 0x38], ebx
  0x10055103: mov      dword ptr [ebp - 0x30], esi
  0x10055106: mov      dword ptr [ebp - 0x2c], esi
  0x10055109: mov      dword ptr [ebp - 0x28], ecx
  0x1005510c: mov      dword ptr [ebp - 0x24], ebx
  0x1005510f: mov      dword ptr [ebp - 0x20], ebx
  0x10055112: mov      dword ptr [ebp - 0xb8], eax
  0x10055118: mov      dword ptr [ebp - 0xb4], ebx
  0x1005511e: call     0x10054380
  0x10055123: add      esp, 8
  0x10055126: test     eax, eax
  0x10055128: jne      0x1005515b
  0x1005512a: lea      ebx, [ebx]
  0x10055130: inc      dword ptr [ebp - 0xb4]
  0x10055136: inc      ebx
  0x10055137: cmp      ebx, 4
  0x1005513a: jl       0x10055141
  0x1005513c: mov      ebx, 4
  0x10055141: mov      eax, dword ptr [ebp - 0xb8]
  0x10055147: lea      edx, [ebx + ebx*2]
  0x1005514a: lea      ecx, [eax + edx*4]
  0x1005514d: push     ecx
  0x1005514e: push     edi
  0x1005514f: call     0x10054380
  0x10055154: add      esp, 8
  0x10055157: test     eax, eax
  0x10055159: je       0x10055130
  0x1005515b: mov      edx, dword ptr [ebp - 0xbc]
  0x10055161: mov      eax, dword ptr [ebp - 0xb4]
  0x10055167: cmp      dword ptr [edx + 4], esi
  0x1005516a: jne      0x10055194
  0x1005516c: mov      eax, dword ptr [ebp + eax*4 - 0x1c]
  0x10055170: cmp      eax, 1
  0x10055173: ja       0x1005518d
  0x10055175: mov      eax, dword ptr [ebp + eax*4 - 0xc4]
  0x1005517c: pop      edi
  0x1005517d: pop      esi
  0x1005517e: pop      ebx
  0x1005517f: mov      ecx, dword ptr [ebp - 4]
  0x10055182: xor      ecx, ebp
  0x10055184: call     0x10382b66
  0x10055189: mov      esp, ebp
  0x1005518b: pop      ebp
  0x1005518c: ret      
  0x1005518d: push     0x106251ac
  0x10055192: jmp      0x100551c6
  0x10055194: cmp      eax, 5
  0x10055197: ja       0x100551c1
  0x10055199: mov      ecx, dword ptr [ebp + eax*4 - 0x1c]
  0x1005519d: cmp      ecx, 6
  0x100551a0: jge      0x1005518d
  0x100551a2: mov      eax, dword ptr [ebp + ecx*4 - 0x4c]
  0x100551a6: mov      ecx, dword ptr [ebp + ecx*4 - 0x34]
  0x100551aa: mov      dword ptr [edi + 0x255c8f4], ecx
  0x100551b0: pop      edi
  0x100551b1: pop      esi
  0x100551b2: pop      ebx
  0x100551b3: mov      ecx, dword ptr [ebp - 4]
  0x100551b6: xor      ecx, ebp
  0x100551b8: call     0x10382b66
  0x100551bd: mov      esp, ebp
  0x100551bf: pop      ebp
  0x100551c0: ret      
  0x100551c1: push     0x10625188
  0x100551c6: call     0x100ce9a0
  0x100551cb: mov      ecx, dword ptr [ebp - 4]
  0x100551ce: add      esp, 4
  0x100551d1: pop      edi
  0x100551d2: pop      esi
  0x100551d3: xor      ecx, ebp
  0x100551d5: or       eax, 0xffffffff
  0x100551d8: pop      ebx
  0x100551d9: call     0x10382b66
  0x100551de: mov      esp, ebp
  0x100551e0: pop      ebp
  0x100551e1: ret      
  0x100551e2: int3     
  0x100551e3: int3     
  0x100551e4: int3     
  0x100551e5: int3     
  0x100551e6: int3     
  0x100551e7: int3     
  0x100551e8: int3     
  0x100551e9: int3     
  0x100551ea: int3     
  0x100551eb: int3     
  0x100551ec: int3     
  0x100551ed: int3     
  0x100551ee: int3     
  0x100551ef: int3     
  0x100551f0: push     ebp
  0x100551f1: mov      ebp, esp
  0x100551f3: push     ebx
  0x100551f4: mov      ebx, dword ptr [ebp + 8]
  0x100551f7: mov      eax, dword ptr [ebx + 0x570]
  0x100551fd: push     esi
  0x100551fe: mov      esi, dword ptr [eax + 0x18]
  0x10055201: push     edi
  0x10055202: add      esi, 0x210
  0x10055208: push     esi
  0x10055209: push     ebx
  0x1005520a: call     0x10054380
  0x1005520f: add      esp, 8
  0x10055212: test     eax, eax
  0x10055214: je       0x1005521f
  0x10055216: mov      edi, 2
  0x1005521b: mov      eax, edi
  0x1005521d: jmp      0x10055226
  0x1005521f: xor      edi, edi
  0x10055221: mov      eax, 1
  0x10055226: lea      ecx, [eax + eax*2]
  0x10055229: lea      edx, [esi + ecx*4]
  0x1005522c: push     edx
  0x1005522d: push     ebx
  0x1005522e: call     0x10054380
  0x10055233: add      esp, 8
  0x10055236: test     eax, eax
  0x10055238: lea      eax, [edi + 1]
  0x1005523b: jne      0x1005523f
  0x1005523d: mov      eax, edi
  0x1005523f: pop      edi
  0x10055240: pop      esi
  0x10055241: pop      ebx
  0x10055242: pop      ebp
  0x10055243: ret      
  0x10055244: int3     
  0x10055245: int3     
  0x10055246: int3     
  0x10055247: int3     
  0x10055248: int3     
  0x10055249: int3     
  0x1005524a: int3     
  0x1005524b: int3     
  0x1005524c: int3     
  0x1005524d: int3     
  0x1005524e: int3     
  0x1005524f: int3     
  0x10055250: push     ebp
  0x10055251: mov      ebp, esp
  0x10055253: push     ebx
  0x10055254: mov      ebx, dword ptr [ebp + 8]
  0x10055257: mov      eax, dword ptr [ebx + 0x570]
  0x1005525d: push     esi
  0x1005525e: push     edi
  0x1005525f: mov      edi, dword ptr [eax + 0x18]
  0x10055262: add      edi, 0x510
  0x10055268: push     edi
  0x10055269: xor      esi, esi
  0x1005526b: push     ebx
  0x1005526c: mov      dword ptr [ebp + 8], esi
  0x1005526f: call     0x10054380
  0x10055274: add      esp, 8
  0x10055277: test     eax, eax
  0x10055279: jne      0x100552aa
  0x1005527b: jmp      0x10055280
  0x1005527d: lea      ecx, [ecx]
  0x10055280: inc      dword ptr [ebp + 8]
  0x10055283: inc      esi
  0x10055284: cmp      esi, 1
  0x10055287: jl       0x1005528e
  0x10055289: mov      esi, 1
  0x1005528e: lea      ecx, [esi + esi*2]
  0x10055291: lea      edx, [edi + ecx*4]
  0x10055294: push     edx
  0x10055295: push     ebx
  0x10055296: call     0x10054380
  0x1005529b: add      esp, 8
  0x1005529e: test     eax, eax
  0x100552a0: je       0x10055280
  0x100552a2: mov      eax, dword ptr [ebp + 8]
  0x100552a5: pop      edi
  0x100552a6: pop      esi
  0x100552a7: pop      ebx
  0x100552a8: pop      ebp
  0x100552a9: ret      
  0x100552aa: pop      edi
  0x100552ab: mov      eax, esi
  0x100552ad: pop      esi
  0x100552ae: pop      ebx
  0x100552af: pop      ebp
  0x100552b0: ret      
  0x100552b1: int3     
  0x100552b2: int3     
  0x100552b3: int3     
  0x100552b4: int3     
  0x100552b5: int3     
  0x100552b6: int3     
  0x100552b7: int3     
  0x100552b8: int3     
  0x100552b9: int3     
  0x100552ba: int3     
  0x100552bb: int3     
  0x100552bc: int3     
  0x100552bd: int3     
  0x100552be: int3     
  0x100552bf: int3     
  0x100552c0: push     ebp
  0x100552c1: mov      ebp, esp
  0x100552c3: push     ebx
  0x100552c4: mov      ebx, dword ptr [ebp + 8]
  0x100552c7: mov      eax, dword ptr [ebx + 0x570]
  0x100552cd: push     esi
  0x100552ce: mov      esi, dword ptr [eax + 0x1c]
  0x100552d1: add      esi, 0x114
  0x100552d7: push     esi
  0x100552d8: push     ebx
  0x100552d9: call     0x10054380
  0x100552de: add      esp, 8
  0x100552e1: test     eax, eax
  0x100552e3: jne      0x10055331
  0x100552e5: push     edi
  0x100552e6: lea      ecx, [esi + 0xc]
  0x100552e9: push     ecx
  0x100552ea: push     ebx
  0x100552eb: lea      edi, [eax + 1]
  0x100552ee: call     0x10054380
  0x100552f3: add      esp, 8
  0x100552f6: test     eax, eax
  0x100552f8: jne      0x10055324
  0x100552fa: lea      edx, [esi + 0x18]
  0x100552fd: push     edx
  0x100552fe: push     ebx
  0x100552ff: lea      edi, [eax + 2]
  0x10055302: call     0x10054380
  0x10055307: add      esp, 8
  0x1005530a: test     eax, eax
  0x1005530c: jne      0x10055324
  0x1005530e: add      esi, 0x24
  0x10055311: push     esi
  0x10055312: push     ebx
  0x10055313: lea      edi, [eax + 3]
  0x10055316: call     0x10054380
  0x1005531b: add      esp, 8
  0x1005531e: test     eax, eax
  0x10055320: jne      0x10055324
  0x10055322: xor      edi, edi
  0x10055324: cmp      edi, dword ptr [ebp + 0xc]
  0x10055327: jl       0x1005532a
  0x10055329: inc      edi
  0x1005532a: mov      eax, edi
  0x1005532c: pop      edi
  0x1005532d: pop      esi
  0x1005532e: pop      ebx
  0x1005532f: pop      ebp
  0x10055330: ret      
  0x10055331: mov      eax, dword ptr [ebp + 0xc]
  0x10055334: pop      esi
  0x10055335: pop      ebx
  0x10055336: pop      ebp
  0x10055337: ret      
  0x10055338: int3     
  0x10055339: int3     
  0x1005533a: int3     
  0x1005533b: int3     
  0x1005533c: int3     
  0x1005533d: int3     
  0x1005533e: int3     
  0x1005533f: int3     
  0x10055340: push     ebp
  0x10055341: mov      ebp, esp
  0x10055343: push     ebx
  0x10055344: push     esi
  0x10055345: mov      esi, dword ptr [ebp + 8]
  0x10055348: mov      eax, dword ptr [esi + 0x255c8f0]
  0x1005534e: mov      ecx, dword ptr [esi + 0x570]
  0x10055354: mov      ebx, dword ptr [ecx + 0x1c]
  0x10055357: mov      edx, eax
  0x10055359: imul     edx, edx, 0x74
  0x1005535c: xor      ecx, ecx
  0x1005535e: push     edi
  0x1005535f: cmp      byte ptr [edx + esi + 0x24008f0], cl
  0x10055366: je       0x10055383
  0x10055368: mov      ecx, dword ptr [esi + 0x56c]
  0x1005536e: movzx    ecx, byte ptr [ecx + 0x10]
  0x10055372: sub      eax, ecx
  0x10055374: imul     eax, eax, 0x74
  0x10055377: xor      ecx, ecx
  0x10055379: cmp      byte ptr [eax + esi + 0x2400958], cl
  0x10055380: setne    cl
  0x10055383: cmp      byte ptr [edx + esi + 0x24008f2], 0
  0x1005538b: je       0x1005539b
  0x1005538d: xor      eax, eax
  0x1005538f: cmp      byte ptr [edx + esi + 0x24008e4], al
  0x10055396: setne    al
  0x10055399: add      ecx, eax
  0x1005539b: lea      ecx, [ecx + ecx*2 + 6]
  0x1005539f: lea      edx, [ebx + ecx*4]
  0x100553a2: push     edx
  0x100553a3: push     esi
  0x100553a4: call     0x10054380
  0x100553a9: mov      edi, eax
  0x100553ab: add      esp, 8
  0x100553ae: test     edi, edi
  0x100553b0: je       0x100553d6
  0x100553b2: add      ebx, 0x3c
  0x100553b5: push     ebx
  0x100553b6: push     esi
  0x100553b7: call     0x10054380
  0x100553bc: add      esp, 8
  0x100553bf: test     eax, eax
  0x100553c1: je       0x100553d6
  0x100553c3: push     ebx
  0x100553c4: push     esi
  0x100553c5: call     0x10054380
  0x100553ca: add      esp, 8
  0x100553cd: lea      eax, [edi + eax + 1]
  0x100553d1: pop      edi
  0x100553d2: pop      esi
  0x100553d3: pop      ebx
  0x100553d4: pop      ebp
  0x100553d5: ret      
  0x100553d6: mov      eax, edi
  0x100553d8: pop      edi
  0x100553d9: pop      esi
  0x100553da: pop      ebx
  0x100553db: pop      ebp
  0x100553dc: ret      
  0x100553dd: int3     
  0x100553de: int3     
  0x100553df: int3     