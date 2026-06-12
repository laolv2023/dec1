; syntax_dispatch @ 0x100553e0
; 439 instr

  0x100553e0: push     ebp
  0x100553e1: mov      ebp, esp
  0x100553e3: push     ebx
  0x100553e4: push     esi
  0x100553e5: mov      esi, dword ptr [ebp + 8]
  0x100553e8: mov      eax, dword ptr [esi + 0x570]
  0x100553ee: mov      ebx, dword ptr [eax + 0x18]
  0x100553f1: xor      eax, eax
  0x100553f3: cmp      dword ptr [ebp + 0x10], eax
  0x100553f6: je       0x10055402
  0x100553f8: cmp      dword ptr [ebp + 0x18], eax
  0x100553fb: jle      0x10055402
  0x100553fd: mov      eax, 2
  0x10055402: cmp      dword ptr [ebp + 0xc], 0
  0x10055406: je       0x1005540f
  0x10055408: cmp      dword ptr [ebp + 0x14], 0
  0x1005540c: jle      0x1005540f
  0x1005540e: inc      eax
  0x1005540f: lea      ecx, [eax + eax*2 + 0x114]
  0x10055416: lea      edx, [ebx + ecx*4]
  0x10055419: push     edx
  0x1005541a: push     esi
  0x1005541b: call     0x10054380
  0x10055420: add      esp, 8
  0x10055423: test     eax, eax
  0x10055425: je       0x1005542d
  0x10055427: pop      esi
  0x10055428: xor      eax, eax
  0x1005542a: pop      ebx
  0x1005542b: pop      ebp
  0x1005542c: ret      
  0x1005542d: mov      eax, dword ptr [esi + 0x570]
  0x10055433: cmp      dword ptr [eax + 4], 0
  0x10055437: push     edi
  0x10055438: mov      edi, 1
  0x1005543d: jne      0x1005546f
  0x1005543f: lea      ecx, [ebx + 0x480]
  0x10055445: push     ecx
  0x10055446: push     esi
  0x10055447: call     0x10054380
  0x1005544c: add      esp, 8
  0x1005544f: test     eax, eax
  0x10055451: jne      0x1005546f
  0x10055453: add      ebx, 0x48c
  0x10055459: lea      esp, [esp]
  0x10055460: push     ebx
  0x10055461: push     esi
  0x10055462: inc      edi
  0x10055463: call     0x10054380
  0x10055468: add      esp, 8
  0x1005546b: test     eax, eax
  0x1005546d: je       0x10055460
  0x1005546f: mov      eax, edi
  0x10055471: pop      edi
  0x10055472: pop      esi
  0x10055473: pop      ebx
  0x10055474: pop      ebp
  0x10055475: ret      
  0x10055476: int3     
  0x10055477: int3     
  0x10055478: int3     
  0x10055479: int3     
  0x1005547a: int3     
  0x1005547b: int3     
  0x1005547c: int3     
  0x1005547d: int3     
  0x1005547e: int3     
  0x1005547f: int3     
  0x10055480: push     ebp
  0x10055481: mov      ebp, esp
  0x10055483: push     ecx
  0x10055484: cmp      dword ptr [ebp + 0xc], 0
  0x10055488: push     ebx
  0x10055489: mov      ebx, dword ptr [ebp + 8]
  0x1005548c: mov      eax, dword ptr [ebx + 0x570]
  0x10055492: mov      ecx, dword ptr [eax + 0x18]
  0x10055495: push     esi
  0x10055496: push     edi
  0x10055497: mov      dword ptr [ebp - 4], ecx
  0x1005549a: je       0x100554b8
  0x1005549c: mov      eax, dword ptr [ebp + 0x10]
  0x1005549f: lea      edx, [eax + 1]
  0x100554a2: cmp      edx, 2
  0x100554a5: jbe      0x100554b8
  0x100554a7: add      eax, 0xf
  0x100554aa: mov      edx, 0x1e
  0x100554af: cmp      edx, eax
  0x100554b1: sbb      eax, eax
  0x100554b3: neg      eax
  0x100554b5: inc      eax
  0x100554b6: jmp      0x100554ba
  0x100554b8: xor      eax, eax
  0x100554ba: mov      esi, dword ptr [ebp + 0x14]
  0x100554bd: lea      edi, [esi + esi*2]
  0x100554c0: add      edi, edi
  0x100554c2: lea      eax, [edi + eax + 0x3e]
  0x100554c6: lea      eax, [eax + eax*2]
  0x100554c9: lea      ecx, [ecx + eax*4]
  0x100554cc: push     ecx
  0x100554cd: push     ebx
  0x100554ce: call     0x10054380
  0x100554d3: add      esp, 8
  0x100554d6: test     eax, eax
  0x100554d8: jne      0x100554e1
  0x100554da: pop      edi
  0x100554db: pop      esi
  0x100554dc: pop      ebx
  0x100554dd: mov      esp, ebp
  0x100554df: pop      ebp
  0x100554e0: ret      
  0x100554e1: mov      eax, dword ptr [ebp - 4]
  0x100554e4: lea      edx, [esi + esi*8]
  0x100554e7: lea      ecx, [eax + edx*8 + 0x30c]
  0x100554ee: push     ecx
  0x100554ef: push     ebx
  0x100554f0: call     0x10054380
  0x100554f5: add      esp, 8
  0x100554f8: test     eax, eax
  0x100554fa: jne      0x10055536
  0x100554fc: mov      dword ptr [ebp + 8], 1
  0x10055503: mov      esi, 2
  0x10055508: mov      ecx, dword ptr [ebp - 4]
  0x1005550b: xor      edx, edx
  0x1005550d: cmp      esi, 3
  0x10055510: setge    dl
  0x10055513: lea      eax, [edx + edi + 0x42]
  0x10055517: lea      eax, [eax + eax*2]
  0x1005551a: lea      edx, [ecx + eax*4]
  0x1005551d: push     edx
  0x1005551e: push     ebx
  0x1005551f: call     0x10054380
  0x10055524: add      esp, 8
  0x10055527: test     eax, eax
  0x10055529: jne      0x1005558e
  0x1005552b: inc      dword ptr [ebp + 8]
  0x1005552e: inc      esi
  0x1005552f: cmp      esi, 9
  0x10055532: jl       0x10055508
  0x10055534: jmp      0x1005558e
  0x10055536: mov      esi, 9
  0x1005553b: mov      dword ptr [ebp + 8], esi
  0x1005553e: lea      edi, [esi - 6]
  0x10055541: push     ebx
  0x10055542: call     0x10054d20
  0x10055547: add      esp, 4
  0x1005554a: cmp      eax, 1
  0x1005554d: jne      0x10055558
  0x1005554f: mov      ecx, edi
  0x10055551: shl      eax, cl
  0x10055553: add      esi, eax
  0x10055555: inc      edi
  0x10055556: jmp      0x10055541
  0x10055558: test     eax, eax
  0x1005555a: jne      0x10055541
  0x1005555c: mov      dword ptr [ebp + 8], esi
  0x1005555f: mov      esi, 1
  0x10055564: mov      ecx, edi
  0x10055566: rol      esi, cl
  0x10055568: mov      dword ptr [ebp + 0xc], eax
  0x1005556b: test     edi, edi
  0x1005556d: je       0x10055588
  0x1005556f: nop      
  0x10055570: dec      edi
  0x10055571: push     ebx
  0x10055572: ror      esi, 1
  0x10055574: call     0x10054d20
  0x10055579: add      esp, 4
  0x1005557c: cmp      eax, 1
  0x1005557f: jne      0x10055584
  0x10055581: or       dword ptr [ebp + 0xc], esi
  0x10055584: test     edi, edi
  0x10055586: jne      0x10055570
  0x10055588: mov      ecx, dword ptr [ebp + 0xc]
  0x1005558b: add      dword ptr [ebp + 8], ecx
  0x1005558e: push     ebx
  0x1005558f: call     0x10054d20
  0x10055594: add      esp, 4
  0x10055597: test     eax, eax
  0x10055599: je       0x100555a3
  0x1005559b: mov      edx, dword ptr [ebp + 8]
  0x1005559e: neg      edx
  0x100555a0: mov      dword ptr [ebp + 8], edx
  0x100555a3: movsx    eax, word ptr [ebp + 8]
  0x100555a7: pop      edi
  0x100555a8: pop      esi
  0x100555a9: pop      ebx
  0x100555aa: mov      esp, ebp
  0x100555ac: pop      ebp
  0x100555ad: ret      
  0x100555ae: int3     
  0x100555af: int3     
  0x100555b0: push     ebp
  0x100555b1: mov      ebp, esp
  0x100555b3: sub      esp, 0x10
  0x100555b6: push     ebx
  0x100555b7: push     esi
  0x100555b8: mov      esi, dword ptr [ebp + 8]
  0x100555bb: mov      eax, dword ptr [esi + 0x570]
  0x100555c1: push     edi
  0x100555c2: mov      edi, dword ptr [eax + 0x1c]
  0x100555c5: mov      eax, dword ptr [esi + 0x255c8f0]
  0x100555cb: mov      ecx, eax
  0x100555cd: imul     ecx, ecx, 0x74
  0x100555d0: mov      dl, byte ptr [ecx + esi + 0x24008f0]
  0x100555d7: add      ecx, esi
  0x100555d9: mov      dword ptr [ebp - 0xc], ecx
  0x100555dc: cmp      dl, 1
  0x100555df: jne      0x100555fd
  0x100555e1: mov      ebx, dword ptr [esi + 0x56c]
  0x100555e7: movzx    ebx, byte ptr [ebx + 0x10]
  0x100555eb: sub      eax, ebx
  0x100555ed: imul     eax, eax, 0x74
  0x100555f0: movzx    eax, byte ptr [eax + esi + 0x240093f]
  0x100555f8: mov      dword ptr [ebp + 8], eax
  0x100555fb: jmp      0x10055604
  0x100555fd: mov      dword ptr [ebp + 8], 0
  0x10055604: mov      al, byte ptr [ecx + 0x24008f2]
  0x1005560a: cmp      al, 1
  0x1005560c: jne      0x1005561a
  0x1005560e: movzx    ecx, byte ptr [ecx + 0x24008cb]
  0x10055615: mov      dword ptr [ebp - 8], ecx
  0x10055618: jmp      0x10055621
  0x1005561a: mov      dword ptr [ebp - 8], 0
  0x10055621: cmp      dl, 1
  0x10055624: jne      0x10055638
  0x10055626: mov      edx, dword ptr [ebp + 8]
  0x10055629: sar      edx, 2
  0x1005562c: and      edx, 1
  0x1005562f: mov      ecx, 1
  0x10055634: sub      ecx, edx
  0x10055636: jmp      0x1005563a
  0x10055638: xor      ecx, ecx
  0x1005563a: cmp      al, 1
  0x1005563c: jne      0x1005564f
  0x1005563e: mov      edx, dword ptr [ebp - 8]
  0x10055641: sar      edx, 1
  0x10055643: and      edx, 1
  0x10055646: mov      eax, 1
  0x1005564b: sub      eax, edx
  0x1005564d: jmp      0x10055651
  0x1005564f: xor      eax, eax
  0x10055651: lea      eax, [eax + ecx*2 + 6]
  0x10055655: lea      eax, [eax + eax*2]
  0x10055658: lea      ecx, [edi + eax*4]
  0x1005565b: push     ecx
  0x1005565c: push     esi
  0x1005565d: call     0x10054380
  0x10055662: mov      edx, dword ptr [ebp - 0xc]
  0x10055665: add      esp, 8
  0x10055668: cmp      byte ptr [edx + 0x24008f0], 1
  0x1005566f: mov      ebx, eax
  0x10055671: jne      0x10055685
  0x10055673: mov      ecx, dword ptr [ebp + 8]
  0x10055676: sar      ecx, 3
  0x10055679: and      ecx, 1
  0x1005567c: mov      eax, 1
  0x10055681: sub      eax, ecx
  0x10055683: jmp      0x10055687
  0x10055685: xor      eax, eax
  0x10055687: add      eax, eax
  0x10055689: sub      eax, ebx
  0x1005568b: lea      edx, [eax + eax*2 + 0x15]
  0x1005568f: lea      eax, [edi + edx*4]
  0x10055692: push     eax
  0x10055693: push     esi
  0x10055694: call     0x10054380
  0x10055699: mov      ecx, dword ptr [ebp - 0xc]
  0x1005569c: add      eax, eax
  0x1005569e: mov      dword ptr [ebp - 0x10], eax
  0x100556a1: add      eax, ebx
  0x100556a3: mov      dword ptr [ebp - 4], eax
  0x100556a6: mov      eax, 1
  0x100556ab: add      esp, 8
  0x100556ae: sub      eax, ebx
  0x100556b0: cmp      byte ptr [ecx + 0x24008f2], 1
  0x100556b7: jne      0x100556cb
  0x100556b9: mov      edx, dword ptr [ebp - 8]
  0x100556bc: sar      edx, 3
  0x100556bf: and      edx, 1
  0x100556c2: mov      ecx, 1
  0x100556c7: sub      ecx, edx
  0x100556c9: jmp      0x100556cd
  0x100556cb: xor      ecx, ecx
  0x100556cd: lea      eax, [ecx + eax*2 + 6]
  0x100556d1: lea      eax, [eax + eax*2]
  0x100556d4: lea      ecx, [edi + eax*4]
  0x100556d7: push     ecx
  0x100556d8: push     esi
  0x100556d9: call     0x10054380
  0x100556de: mov      ebx, eax
  0x100556e0: mov      eax, 9
  0x100556e5: sub      eax, dword ptr [ebp - 0x10]
  0x100556e8: sub      eax, ebx
  0x100556ea: lea      edx, [eax + eax*2]
  0x100556ed: lea      eax, [edi + edx*4]
  0x100556f0: push     eax
  0x100556f1: push     esi
  0x100556f2: call     0x10054380
  0x100556f7: mov      edx, dword ptr [ebp - 4]
  0x100556fa: lea      ecx, [ebx + eax*2]
  0x100556fd: mov      ebx, dword ptr [ebp - 8]
  0x10055700: lea      eax, [edx + ecx*4]
  0x10055703: xor      ecx, ecx
  0x10055705: cmp      dword ptr [ebp + 8], 0xf
  0x10055709: mov      dword ptr [ebp - 4], eax
  0x1005570c: setg     cl
  0x1005570f: xor      edx, edx
  0x10055711: cmp      ebx, 0xf
  0x10055714: setg     dl
  0x10055717: lea      eax, [edx + ecx*2 + 0xa]
  0x1005571b: lea      eax, [eax + eax*2]
  0x1005571e: lea      ecx, [edi + eax*4]
  0x10055721: push     ecx
  0x10055722: push     esi
  0x10055723: call     0x10054380
  0x10055728: add      esp, 0x18
  0x1005572b: test     eax, eax
  0x1005572d: je       0x1005579b
  0x1005572f: mov      eax, dword ptr [ebp + 8]
  0x10055732: and      eax, 0xfffffff0
  0x10055735: xor      edx, edx
  0x10055737: cmp      eax, 0x20
  0x1005573a: sete     dl
  0x1005573d: xor      ecx, ecx
  0x1005573f: and      ebx, 0xfffffff0
  0x10055742: cmp      ebx, 0x20
  0x10055745: sete     cl
  0x10055748: mov      eax, edx
  0x1005574a: mov      dword ptr [ebp + 8], eax
  0x1005574d: mov      ebx, ecx
  0x1005574f: lea      eax, [ebx + eax*2 + 0xa]
  0x10055753: lea      edx, [eax + eax*2]
  0x10055756: lea      eax, [edi + edx*4]
  0x10055759: push     eax
  0x1005575a: push     esi
  0x1005575b: call     0x10054380
  0x10055760: add      esp, 8
  0x10055763: test     eax, eax
  0x10055765: je       0x10055774
  0x10055767: mov      eax, dword ptr [ebp - 4]
  0x1005576a: pop      edi
  0x1005576b: pop      esi
  0x1005576c: add      eax, 0x30
  0x1005576f: pop      ebx
  0x10055770: mov      esp, ebp
  0x10055772: pop      ebp
  0x10055773: ret      
  0x10055774: mov      ecx, dword ptr [ebp + 8]
  0x10055777: lea      eax, [ebx + ecx*2 + 0xe]
  0x1005577b: lea      edx, [eax + eax*2]
  0x1005577e: lea      eax, [edi + edx*4]
  0x10055781: push     eax
  0x10055782: push     esi
  0x10055783: call     0x10054380
  0x10055788: mov      ecx, dword ptr [ebp - 4]
  0x1005578b: add      esp, 8
  0x1005578e: pop      edi
  0x1005578f: add      eax, eax
  0x10055791: pop      esi
  0x10055792: lea      eax, [ecx + eax*8 + 0x10]
  0x10055796: pop      ebx
  0x10055797: mov      esp, ebp
  0x10055799: pop      ebp
  0x1005579a: ret      
  0x1005579b: mov      eax, dword ptr [ebp - 4]
  0x1005579e: pop      edi
  0x1005579f: pop      esi
  0x100557a0: pop      ebx
  0x100557a1: mov      esp, ebp
  0x100557a3: pop      ebp
  0x100557a4: ret      
  0x100557a5: int3     
  0x100557a6: int3     
  0x100557a7: int3     
  0x100557a8: int3     
  0x100557a9: int3     
  0x100557aa: int3     
  0x100557ab: int3     
  0x100557ac: int3     
  0x100557ad: int3     
  0x100557ae: int3     
  0x100557af: int3     
  0x100557b0: push     ebp
  0x100557b1: mov      ebp, esp
  0x100557b3: push     ebx
  0x100557b4: push     esi
  0x100557b5: push     edi
  0x100557b6: mov      edi, dword ptr [ebp + 8]
  0x100557b9: mov      eax, dword ptr [edi + 0x570]
  0x100557bf: mov      ebx, dword ptr [eax + 0x18]
  0x100557c2: xor      ecx, ecx
  0x100557c4: xor      esi, esi
  0x100557c6: cmp      byte ptr [eax + 0x20], cl
  0x100557c9: setne    cl
  0x100557cc: mov      eax, ecx
  0x100557ce: lea      edx, [eax + eax*2 + 0x138]
  0x100557d5: lea      eax, [ebx + edx*4]
  0x100557d8: push     eax
  0x100557d9: push     edi
  0x100557da: call     0x10054380
  0x100557df: add      esp, 8
  0x100557e2: test     eax, eax
  0x100557e4: je       0x10055814
  0x100557e6: lea      ecx, [ebx + 0x4f8]
  0x100557ec: push     ecx
  0x100557ed: push     edi
  0x100557ee: mov      esi, 1
  0x100557f3: call     0x10054380
  0x100557f8: add      esp, 8
  0x100557fb: test     eax, eax
  0x100557fd: je       0x10055814
  0x100557ff: add      ebx, 0x504
  0x10055805: push     ebx
  0x10055806: push     edi
  0x10055807: inc      esi
  0x10055808: call     0x10054380
  0x1005580d: add      esp, 8
  0x10055810: test     eax, eax
  0x10055812: jne      0x10055805
  0x10055814: lea      eax, [esi + 1]
  0x10055817: pop      edi
  0x10055818: mov      ecx, esi
  0x1005581a: sar      eax, 1
  0x1005581c: and      ecx, 1
  0x1005581f: pop      esi
  0x10055820: pop      ebx
  0x10055821: jne      0x10055825
  0x10055823: neg      eax
  0x10055825: pop      ebp
  0x10055826: ret      
  0x10055827: int3     
  0x10055828: int3     
  0x10055829: int3     
  0x1005582a: int3     
  0x1005582b: int3     
  0x1005582c: int3     
  0x1005582d: int3     
  0x1005582e: int3     
  0x1005582f: int3     