; coeff_decode_main @ 0x100560a0-0x100565d0
; 411 instructions

  0x100560a0: push     ebp
  0x100560a1: mov      ebp, esp
  0x100560a3: sub      esp, 0x258
  0x100560a9: mov      eax, dword ptr [0x106f85d0]
  0x100560ae: xor      eax, ebp
  0x100560b0: mov      dword ptr [ebp - 4], eax
  0x100560b3: mov      eax, dword ptr [ebp + 0x14]
  0x100560b6: push     ebx
  0x100560b7: mov      ebx, dword ptr [ebp + 0x10]
  0x100560ba: push     esi
  0x100560bb: mov      esi, dword ptr [ebp + 0xc]
  0x100560be: push     edi
  0x100560bf: mov      edi, dword ptr [ebp + 8]
  0x100560c2: push     0x40
  0x100560c4: lea      ecx, [ebp - 0x44]
  0x100560c7: push     0
  0x100560c9: push     ecx
  0x100560ca: mov      dword ptr [ebp - 0x250], eax
  0x100560d0: call     0x10559710
  0x100560d5: mov      eax, edi
  0x100560d7: cdq      
  0x100560d8: sub      eax, edx
  0x100560da: mov      ecx, eax
  0x100560dc: mov      eax, esi
  0x100560de: cdq      
  0x100560df: sub      eax, edx
  0x100560e1: sar      ecx, 1
  0x100560e3: sar      eax, 1
  0x100560e5: and      edi, 0x80000001
  0x100560eb: lea      edx, [eax + ecx*2]
  0x100560ee: jns      0x100560f5
  0x100560f0: dec      edi
  0x100560f1: or       edi, 0xfffffffe
  0x100560f4: inc      edi
  0x100560f5: and      esi, 0x80000001
  0x100560fb: lea      eax, [edi + edx*8]
  0x100560fe: jns      0x10056105
  0x10056100: dec      esi
  0x10056101: or       esi, 0xfffffffe
  0x10056104: inc      esi
  0x10056105: lea      ecx, [esi + eax*2 + 0x4db9e4]
  0x1005610c: lea      edx, [ebx + ecx*8]
  0x1005610f: lea      eax, [ebp - 0x148]
  0x10056115: mov      dword ptr [ebp - 0x254], edx
  0x1005611b: push     eax
  0x1005611c: lea      edx, [ebp - 0x24c]
  0x10056122: mov      esi, ebx
  0x10056124: call     0x10055830
  0x10056129: mov      ecx, dword ptr [ebp - 0x250]
  0x1005612f: movsx    ebx, byte ptr [ecx + 0x55]
  0x10056133: mov      ecx, dword ptr [ebp + 0x1c]
  0x10056136: add      ecx, -8
  0x10056139: lea      edx, [ecx*8]
  0x10056140: sub      edx, ecx
  0x10056142: lea      esi, [eax - 1]
  0x10056145: add      esp, 0x10
  0x10056148: or       edi, 0xffffffff
  0x1005614b: add      ebx, edx
  0x1005614d: test     esi, esi
  0x1005614f: js       0x100561a4
  0x10056151: mov      eax, dword ptr [ebp + esi*4 - 0x24c]
  0x10056158: lea      edi, [edi + eax + 1]
  0x1005615c: cmp      edi, 0x10
  0x1005615f: jge      0x100561ca
  0x10056161: mov      edx, dword ptr [ebp + esi*4 - 0x148]
  0x10056168: mov      ecx, dword ptr [edi*8 + 0x10625794]
  0x1005616f: mov      eax, dword ptr [edi*8 + 0x10625790]
  0x10056176: push     ebx
  0x10056177: push     edx
  0x10056178: push     ecx
  0x10056179: push     eax
  0x1005617a: mov      dword ptr [ebp - 0x250], eax
  0x10056180: mov      dword ptr [ebp - 0x258], ecx
  0x10056186: call     0x1006aa00
  0x1005618b: mov      ecx, dword ptr [ebp - 0x250]
  0x10056191: mov      edx, dword ptr [ebp - 0x258]
  0x10056197: add      esp, 0x10
  0x1005619a: dec      esi
  0x1005619b: lea      ecx, [ecx + edx*4]
  0x1005619e: mov      dword ptr [ebp + ecx*4 - 0x44], eax
  0x100561a2: jns      0x10056151
  0x100561a4: mov      edx, dword ptr [ebp - 0x254]
  0x100561aa: push     edx
  0x100561ab: lea      eax, [ebp - 0x44]
  0x100561ae: push     eax
  0x100561af: call     0x1006b530
  0x100561b4: add      esp, 8
  0x100561b7: pop      edi
  0x100561b8: pop      esi
  0x100561b9: xor      eax, eax
  0x100561bb: pop      ebx
  0x100561bc: mov      ecx, dword ptr [ebp - 4]
  0x100561bf: xor      ecx, ebp
  0x100561c1: call     0x10382b66
  0x100561c6: mov      esp, ebp
  0x100561c8: pop      ebp
  0x100561c9: ret      
  0x100561ca: push     0x106251d8
  0x100561cf: call     0x100ce9a0
  0x100561d4: mov      ecx, dword ptr [ebp - 4]
  0x100561d7: add      esp, 4
  0x100561da: pop      edi
  0x100561db: pop      esi
  0x100561dc: xor      ecx, ebp
  0x100561de: or       eax, 0xffffffff
  0x100561e1: pop      ebx
  0x100561e2: call     0x10382b66
  0x100561e7: mov      esp, ebp
  0x100561e9: pop      ebp
  0x100561ea: ret      
  0x100561eb: int3     
  0x100561ec: int3     
  0x100561ed: int3     
  0x100561ee: int3     
  0x100561ef: int3     
  0x100561f0: push     ebx
  0x100561f1: mov      ebx, esp
  0x100561f3: sub      esp, 8
  0x100561f6: and      esp, 0xfffffff0
  0x100561f9: add      esp, 4
  0x100561fc: push     ebp
  0x100561fd: mov      ebp, dword ptr [ebx + 4]
  0x10056200: mov      dword ptr [esp + 4], ebp
  0x10056204: mov      ebp, esp
  0x10056206: sub      esp, 0x378
  0x1005620c: mov      eax, dword ptr [0x106f85d0]
  0x10056211: xor      eax, ebp
  0x10056213: mov      dword ptr [ebp - 4], eax
  0x10056216: mov      eax, dword ptr [ebx + 0x10]
  0x10056219: lea      ecx, [ebp - 0x150]
  0x1005621f: push     esi
  0x10056220: mov      esi, dword ptr [ebx + 0xc]
  0x10056223: mov      edx, ecx
  0x10056225: push     edi
  0x10056226: mov      edi, dword ptr [ebx + 8]
  0x10056229: mov      dword ptr [ebp - 0x368], eax
  0x1005622f: mov      dword ptr [ebp - 0x364], ecx
  0x10056235: test     dl, 0xf
  0x10056238: je       0x10056248
  0x1005623a: mov      eax, ecx
  0x1005623c: and      eax, 0xfffffff0
  0x1005623f: add      eax, 0x10
  0x10056242: mov      dword ptr [ebp - 0x364], eax
  0x10056248: mov      eax, dword ptr [ebp - 0x364]
  0x1005624e: push     0x100
  0x10056253: push     0
  0x10056255: push     eax
  0x10056256: call     0x10559710
  0x1005625b: mov      eax, edi
  0x1005625d: cdq      
  0x1005625e: sub      eax, edx
  0x10056260: sar      eax, 1
  0x10056262: add      eax, eax
  0x10056264: and      edi, 0x80000001
  0x1005626a: jns      0x10056271
  0x1005626c: dec      edi
  0x1005626d: or       edi, 0xfffffffe
  0x10056270: inc      edi
  0x10056271: lea      edi, [edi + eax*8 + 0x61]
  0x10056275: lea      eax, [esi + 0x26dc910]
  0x1005627b: shl      edi, 4
  0x1005627e: lea      ecx, [ebp - 0x258]
  0x10056284: add      edi, eax
  0x10056286: push     ecx
  0x10056287: lea      edx, [ebp - 0x360]
  0x1005628d: mov      dword ptr [ebp - 0x378], edi
  0x10056293: call     0x10055830
  0x10056298: mov      edx, dword ptr [ebp - 0x368]
  0x1005629e: movsx    ecx, byte ptr [edx + 0x55]
  0x100562a2: mov      dword ptr [ebp - 0x370], eax
  0x100562a8: mov      eax, dword ptr [ebx + 0x18]
  0x100562ab: add      eax, -8
  0x100562ae: lea      edx, [eax*8]
  0x100562b5: sub      edx, eax
  0x100562b7: mov      eax, dword ptr [ebp - 0x370]
  0x100562bd: add      ecx, edx
  0x100562bf: add      esp, 0x10
  0x100562c2: or       esi, 0xffffffff
  0x100562c5: dec      eax
  0x100562c6: mov      dword ptr [ebp - 0x374], ecx
  0x100562cc: mov      dword ptr [ebp - 0x36c], eax
  0x100562d2: jns      0x1005630c
  0x100562d4: cmp      dword ptr [ebp - 0x370], 0
  0x100562db: jle      0x100563b4
  0x100562e1: test     byte ptr [ebx + 0x1c], 0x10
  0x100562e5: push     edi
  0x100562e6: je       0x100563a5
  0x100562ec: mov      eax, dword ptr [ebp - 0x364]
  0x100562f2: push     eax
  0x100562f3: call     0x1006aa50
  0x100562f8: jmp      0x100563b1
  0x100562fd: lea      ecx, [ecx]
  0x10056300: mov      eax, dword ptr [ebp - 0x36c]
  0x10056306: mov      ecx, dword ptr [ebp - 0x374]
  0x1005630c: mov      edx, dword ptr [ebp + eax*4 - 0x360]
  0x10056313: lea      esi, [esi + edx + 1]
  0x10056317: cmp      esi, 0x40
  0x1005631a: jge      0x10056382
  0x1005631c: mov      eax, dword ptr [ebp + eax*4 - 0x258]
  0x10056323: mov      edx, dword ptr [esi*8 + 0x10625514]
  0x1005632a: mov      edi, dword ptr [esi*8 + 0x10625510]
  0x10056331: push     ecx
  0x10056332: push     eax
  0x10056333: push     edx
  0x10056334: push     edi
  0x10056335: mov      dword ptr [ebp - 0x368], edx
  0x1005633b: call     0x1006a9b0
  0x10056340: add      esp, 0x10
  0x10056343: test     byte ptr [ebx + 0x1c], 0x10
  0x10056347: je       0x1005635d
  0x10056349: mov      ecx, dword ptr [ebp - 0x368]
  0x1005634f: lea      edx, [ecx + edi*8]
  0x10056352: mov      ecx, dword ptr [ebp - 0x364]
  0x10056358: mov      dword ptr [ecx + edx*4], eax
  0x1005635b: jmp      0x1005636f
  0x1005635d: mov      edx, dword ptr [ebp - 0x368]
  0x10056363: lea      ecx, [edi + edx*8]
  0x10056366: mov      edx, dword ptr [ebp - 0x364]
  0x1005636c: mov      dword ptr [edx + ecx*4], eax
  0x1005636f: dec      dword ptr [ebp - 0x36c]
  0x10056375: jns      0x10056300
  0x10056377: mov      edi, dword ptr [ebp - 0x378]
  0x1005637d: jmp      0x100562d4
  0x10056382: push     0x106251f8
  0x10056387: call     0x100ce9a0
  0x1005638c: add      esp, 4
  0x1005638f: or       eax, 0xffffffff
  0x10056392: pop      edi
  0x10056393: pop      esi
  0x10056394: mov      ecx, dword ptr [ebp - 4]
  0x10056397: xor      ecx, ebp
  0x10056399: call     0x10382b66
  0x1005639e: mov      esp, ebp
  0x100563a0: pop      ebp
  0x100563a1: mov      esp, ebx
  0x100563a3: pop      ebx
  0x100563a4: ret      
  0x100563a5: mov      ecx, dword ptr [ebp - 0x364]
  0x100563ab: push     ecx
  0x100563ac: call     0x1006ad00
  0x100563b1: add      esp, 8
  0x100563b4: mov      ecx, dword ptr [ebp - 4]
  0x100563b7: pop      edi
  0x100563b8: xor      ecx, ebp
  0x100563ba: xor      eax, eax
  0x100563bc: pop      esi
  0x100563bd: call     0x10382b66
  0x100563c2: mov      esp, ebp
  0x100563c4: pop      ebp
  0x100563c5: mov      esp, ebx
  0x100563c7: pop      ebx
  0x100563c8: ret      
  0x100563c9: int3     
  0x100563ca: int3     
  0x100563cb: int3     
  0x100563cc: int3     
  0x100563cd: int3     
  0x100563ce: int3     
  0x100563cf: int3     
  0x100563d0: push     ebx
  0x100563d1: mov      ebx, esp
  0x100563d3: sub      esp, 8
  0x100563d6: and      esp, 0xfffffff0
  0x100563d9: add      esp, 4
  0x100563dc: push     ebp
  0x100563dd: mov      ebp, dword ptr [ebx + 4]
  0x100563e0: mov      dword ptr [esp + 4], ebp
  0x100563e4: mov      ebp, esp
  0x100563e6: sub      esp, 0x378
  0x100563ec: mov      eax, dword ptr [0x106f85d0]
  0x100563f1: xor      eax, ebp
  0x100563f3: mov      dword ptr [ebp - 4], eax
  0x100563f6: mov      eax, dword ptr [ebx + 0x10]
  0x100563f9: push     esi
  0x100563fa: mov      esi, dword ptr [ebx + 0xc]
  0x100563fd: push     edi
  0x100563fe: lea      edi, [ebp - 0x150]
  0x10056404: mov      ecx, edi
  0x10056406: mov      dword ptr [ebp - 0x370], eax
  0x1005640c: mov      dword ptr [ebp - 0x364], edi
  0x10056412: test     cl, 0xf
  0x10056415: je       0x10056427
  0x10056417: mov      eax, edi
  0x10056419: and      eax, 0xfffffff0
  0x1005641c: add      eax, 0x10
  0x1005641f: mov      dword ptr [ebp - 0x364], eax
  0x10056425: mov      edi, eax
  0x10056427: push     0x100
  0x1005642c: push     0
  0x1005642e: push     edi
  0x1005642f: call     0x10559710
  0x10056434: add      esp, 0xc
  0x10056437: cmp      dword ptr [ebx + 8], 0
  0x1005643b: je       0x1005644b
  0x1005643d: lea      edx, [esi + 0x26dd1a0]
  0x10056443: mov      dword ptr [ebp - 0x36c], edx
  0x10056449: jmp      0x10056457
  0x1005644b: lea      eax, [esi + 0x26dd120]
  0x10056451: mov      dword ptr [ebp - 0x36c], eax
  0x10056457: lea      ecx, [ebp - 0x360]
  0x1005645d: push     ecx
  0x1005645e: lea      edx, [ebp - 0x258]
  0x10056464: push     edx
  0x10056465: call     0x10055c80
  0x1005646a: lea      ecx, [eax - 1]
  0x1005646d: add      esp, 8
  0x10056470: or       edx, 0xffffffff
  0x10056473: mov      dword ptr [ebp - 0x374], eax
  0x10056479: mov      dword ptr [ebp - 0x368], ecx
  0x1005647f: test     ecx, ecx
  0x10056481: jns      0x100564bc
  0x10056483: test     eax, eax
  0x10056485: jle      0x10056579
  0x1005648b: test     byte ptr [ebx + 0x1c], 0x10
  0x1005648f: je       0x10056569
  0x10056495: mov      edx, dword ptr [ebp - 0x36c]
  0x1005649b: push     edx
  0x1005649c: push     edi
  0x1005649d: call     0x1006afc0
  0x100564a2: jmp      0x10056576
  0x100564a7: jmp      0x100564b0
  0x100564a9: lea      esp, [esp]
  0x100564b0: mov      edx, dword ptr [ebp - 0x378]
  0x100564b6: mov      ecx, dword ptr [ebp - 0x368]
  0x100564bc: mov      eax, dword ptr [ebp + ecx*4 - 0x360]
  0x100564c3: lea      eax, [edx + eax + 1]
  0x100564c7: mov      dword ptr [ebp - 0x378], eax
  0x100564cd: cmp      eax, 0x40
  0x100564d0: jge      0x10056546
  0x100564d2: mov      esi, dword ptr [eax*8 + 0x10625510]
  0x100564d9: mov      edi, dword ptr [eax*8 + 0x10625514]
  0x100564e0: mov      ecx, dword ptr [ebp - 0x370]
  0x100564e6: movzx    eax, byte ptr [ecx + 0x56]
  0x100564ea: mov      ecx, dword ptr [ebx + 0x18]
  0x100564ed: add      ecx, -8
  0x100564f0: lea      edx, [ecx*8]
  0x100564f7: sub      edx, ecx
  0x100564f9: add      eax, edx
  0x100564fb: push     eax
  0x100564fc: mov      eax, dword ptr [ebp - 0x368]
  0x10056502: mov      ecx, dword ptr [ebp + eax*4 - 0x258]
  0x10056509: push     ecx
  0x1005650a: push     edi
  0x1005650b: push     esi
  0x1005650c: call     0x1006a9b0
  0x10056511: mov      ecx, dword ptr [ebp - 0x364]
  0x10056517: add      esp, 0x10
  0x1005651a: test     byte ptr [ebx + 0x1c], 0x10
  0x1005651e: lea      edx, [edi + esi*8]
  0x10056521: jne      0x10056526
  0x10056523: lea      edx, [esi + edi*8]
  0x10056526: dec      dword ptr [ebp - 0x368]
  0x1005652c: mov      dword ptr [ecx + edx*4], eax
  0x1005652f: jns      0x100564b0
  0x10056535: mov      edi, dword ptr [ebp - 0x364]
  0x1005653b: mov      eax, dword ptr [ebp - 0x374]
  0x10056541: jmp      0x10056483
  0x10056546: push     0x10625218
  0x1005654b: call     0x100ce9a0
  0x10056550: add      esp, 4
  0x10056553: or       eax, 0xffffffff
  0x10056556: pop      edi
  0x10056557: pop      esi
  0x10056558: mov      ecx, dword ptr [ebp - 4]
  0x1005655b: xor      ecx, ebp
  0x1005655d: call     0x10382b66
  0x10056562: mov      esp, ebp
  0x10056564: pop      ebp
  0x10056565: mov      esp, ebx
  0x10056567: pop      ebx
  0x10056568: ret      
  0x10056569: mov      eax, dword ptr [ebp - 0x36c]
  0x1005656f: push     eax
  0x10056570: push     edi
  0x10056571: call     0x1006b270
  0x10056576: add      esp, 8
  0x10056579: mov      ecx, dword ptr [ebp - 4]
  0x1005657c: pop      edi
  0x1005657d: xor      ecx, ebp
  0x1005657f: xor      eax, eax
  0x10056581: pop      esi
  0x10056582: call     0x10382b66
  0x10056587: mov      esp, ebp
  0x10056589: pop      ebp
  0x1005658a: mov      esp, ebx
  0x1005658c: pop      ebx
  0x1005658d: ret      
  0x1005658e: int3     
  0x1005658f: int3     
  0x10056590: push     ebp
  0x10056591: mov      ebp, esp
  0x10056593: push     esi
  0x10056594: mov      esi, dword ptr [ebp + 0x10]
  0x10056597: mov      eax, dword ptr [esi + 0x255c8fc]
  0x1005659d: lea      eax, [esi + eax*4 + 0x768]
  0x100565a4: push     eax
  0x100565a5: call     0x10055a60
  0x100565aa: mov      ecx, dword ptr [esi + 0x255c8fc]
  0x100565b0: mov      edx, eax
  0x100565b2: lea      ecx, [esi + ecx*4 + 0x768]
  0x100565b9: shl      edx, 8
  0x100565bc: or       word ptr [ecx], dx
  0x100565bf: add      dword ptr [esi + 0x255c8fc], eax
  0x100565c5: add      esp, 4
  0x100565c8: xor      eax, eax
  0x100565ca: pop      esi
  0x100565cb: pop      ebp
  0x100565cc: ret      
  0x100565cd: int3     
  0x100565ce: int3     
  0x100565cf: int3     