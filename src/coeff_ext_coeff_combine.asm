; ext_coeff_combine @ 0x1006b530-0x1006b800
; 211 instructions

  0x1006b530: push     ebp
  0x1006b531: mov      ebp, esp
  0x1006b533: sub      esp, 0xc
  0x1006b536: mov      eax, dword ptr [ebp + 8]
  0x1006b539: push     ebx
  0x1006b53a: push     esi
  0x1006b53b: add      eax, 8
  0x1006b53e: mov      dword ptr [ebp - 4], 4
  0x1006b545: push     edi
  0x1006b546: mov      edi, dword ptr [eax]
  0x1006b548: mov      edx, dword ptr [eax - 8]
  0x1006b54b: mov      ebx, dword ptr [eax + 4]
  0x1006b54e: mov      esi, dword ptr [eax - 4]
  0x1006b551: lea      ecx, [edi + edx]
  0x1006b554: sub      edx, edi
  0x1006b556: add      ebx, ebx
  0x1006b558: add      ebx, ebx
  0x1006b55a: lea      edi, [esi + esi]
  0x1006b55d: sub      edi, ebx
  0x1006b55f: mov      ebx, dword ptr [eax + 4]
  0x1006b562: add      ecx, ecx
  0x1006b564: add      ecx, ecx
  0x1006b566: sub      edi, ebx
  0x1006b568: lea      esi, [esi + esi*4]
  0x1006b56b: lea      esi, [esi + ebx*2]
  0x1006b56e: add      edx, edx
  0x1006b570: lea      ebx, [esi + ecx]
  0x1006b573: add      edx, edx
  0x1006b575: mov      dword ptr [eax - 8], ebx
  0x1006b578: lea      ebx, [edi + edx]
  0x1006b57b: sub      edx, edi
  0x1006b57d: sub      ecx, esi
  0x1006b57f: mov      dword ptr [eax - 4], ebx
  0x1006b582: mov      dword ptr [eax], edx
  0x1006b584: mov      dword ptr [eax + 4], ecx
  0x1006b587: add      eax, 0x10
  0x1006b58a: dec      dword ptr [ebp - 4]
  0x1006b58d: jne      0x1006b546
  0x1006b58f: mov      eax, dword ptr [ebp + 0xc]
  0x1006b592: mov      esi, dword ptr [ebp + 8]
  0x1006b595: add      eax, 0x40
  0x1006b598: mov      dword ptr [ebp - 4], eax
  0x1006b59b: add      esi, 0x20
  0x1006b59e: mov      dword ptr [ebp - 8], 4
  0x1006b5a5: mov      edx, dword ptr [esi]
  0x1006b5a7: mov      ecx, dword ptr [esi - 0x20]
  0x1006b5aa: mov      ebx, dword ptr [esi + 0x10]
  0x1006b5ad: mov      edi, dword ptr [esi - 0x10]
  0x1006b5b0: lea      eax, [edx + ecx]
  0x1006b5b3: sub      ecx, edx
  0x1006b5b5: add      ebx, ebx
  0x1006b5b7: add      ebx, ebx
  0x1006b5b9: lea      edx, [edi + edi]
  0x1006b5bc: sub      edx, ebx
  0x1006b5be: mov      ebx, dword ptr [esi + 0x10]
  0x1006b5c1: add      eax, eax
  0x1006b5c3: add      eax, eax
  0x1006b5c5: sub      edx, ebx
  0x1006b5c7: lea      edi, [edi + edi*4]
  0x1006b5ca: lea      edi, [edi + ebx*2]
  0x1006b5cd: lea      ebx, [edi + eax + 0x200]
  0x1006b5d4: add      ecx, ecx
  0x1006b5d6: add      ecx, ecx
  0x1006b5d8: mov      dword ptr [ebp - 0xc], edi
  0x1006b5db: mov      edi, dword ptr [ebp - 4]
  0x1006b5de: sub      eax, dword ptr [ebp - 0xc]
  0x1006b5e1: sar      ebx, 0xa
  0x1006b5e4: mov      word ptr [edi - 0x40], bx
  0x1006b5e8: lea      ebx, [edx + ecx + 0x200]
  0x1006b5ef: sub      ecx, edx
  0x1006b5f1: add      ecx, 0x200
  0x1006b5f7: add      eax, 0x200
  0x1006b5fc: sar      ebx, 0xa
  0x1006b5ff: sar      ecx, 0xa
  0x1006b602: sar      eax, 0xa
  0x1006b605: mov      word ptr [edi - 0x20], bx
  0x1006b609: mov      word ptr [edi], cx
  0x1006b60c: mov      word ptr [edi + 0x20], ax
  0x1006b610: add      edi, 2
  0x1006b613: add      esi, 4
  0x1006b616: dec      dword ptr [ebp - 8]
  0x1006b619: mov      dword ptr [ebp - 4], edi
  0x1006b61c: jne      0x1006b5a5
  0x1006b61e: pop      edi
  0x1006b61f: pop      esi
  0x1006b620: pop      ebx
  0x1006b621: mov      esp, ebp
  0x1006b623: pop      ebp
  0x1006b624: ret      
  0x1006b625: int3     
  0x1006b626: int3     
  0x1006b627: int3     
  0x1006b628: int3     
  0x1006b629: int3     
  0x1006b62a: int3     
  0x1006b62b: int3     
  0x1006b62c: int3     
  0x1006b62d: int3     
  0x1006b62e: int3     
  0x1006b62f: int3     
  0x1006b630: push     ebp
  0x1006b631: mov      ebp, esp
  0x1006b633: sub      esp, 0x13c
  0x1006b639: mov      eax, dword ptr [0x106f85d0]
  0x1006b63e: xor      eax, ebp
  0x1006b640: mov      dword ptr [ebp - 4], eax
  0x1006b643: push     ebx
  0x1006b644: push     esi
  0x1006b645: mov      esi, dword ptr [ebp + 0xc]
  0x1006b648: mov      eax, 0x92492493
  0x1006b64d: imul     esi
  0x1006b64f: add      edx, esi
  0x1006b651: sar      edx, 2
  0x1006b654: mov      ecx, edx
  0x1006b656: shr      ecx, 0x1f
  0x1006b659: add      ecx, edx
  0x1006b65b: lea      eax, [ecx*8]
  0x1006b662: sub      eax, ecx
  0x1006b664: sub      esi, eax
  0x1006b666: lea      edx, [esi*4]
  0x1006b66d: push     edi
  0x1006b66e: mov      edi, dword ptr [ebp + 8]
  0x1006b671: xor      eax, eax
  0x1006b673: mov      dword ptr [ebp - 0x13c], edx
  0x1006b679: mov      dword ptr [ebp - 0x138], edi
  0x1006b67f: mov      dword ptr [ebp - 0x128], ecx
  0x1006b685: mov      dword ptr [ebp - 0x12c], eax
  0x1006b68b: lea      esi, [ebp - 0x100]
  0x1006b691: lea      edx, [edi + 4]
  0x1006b694: jmp      0x1006b6a6
  0x1006b696: jmp      0x1006b6a0
  0x1006b698: lea      esp, [esp]
  0x1006b69f: nop      
  0x1006b6a0: mov      ecx, dword ptr [ebp - 0x128]
  0x1006b6a6: movsx    edi, word ptr [edx - 4]
  0x1006b6aa: and      eax, 3
  0x1006b6ad: add      eax, dword ptr [ebp - 0x13c]
  0x1006b6b3: shl      eax, 4
  0x1006b6b6: mov      ebx, dword ptr [eax + 0x1072f3e0]
  0x1006b6bc: shl      ebx, cl
  0x1006b6be: imul     edi, ebx
  0x1006b6c1: mov      dword ptr [ebp - 0x124], ebx
  0x1006b6c7: mov      ebx, dword ptr [eax + 0x1072f3e4]
  0x1006b6cd: shl      ebx, cl
  0x1006b6cf: movsx    ecx, word ptr [edx - 2]
  0x1006b6d3: imul     ecx, ebx
  0x1006b6d6: mov      dword ptr [ebp - 0x118], ebx
  0x1006b6dc: mov      ebx, dword ptr [eax + 0x1072f3e8]
  0x1006b6e2: mov      eax, dword ptr [eax + 0x1072f3ec]
  0x1006b6e8: mov      dword ptr [ebp - 0x130], ecx
  0x1006b6ee: mov      ecx, dword ptr [ebp - 0x128]
  0x1006b6f4: shl      ebx, cl
  0x1006b6f6: movsx    ecx, word ptr [edx]
  0x1006b6f9: imul     ecx, ebx
  0x1006b6fc: mov      dword ptr [ebp - 0x120], ecx
  0x1006b702: mov      ecx, dword ptr [ebp - 0x128]
  0x1006b708: shl      eax, cl
  0x1006b70a: movsx    ecx, word ptr [edx + 2]
  0x1006b70e: imul     ecx, eax
  0x1006b711: mov      dword ptr [ebp - 0x114], eax
  0x1006b717: movsx    eax, word ptr [edx + 4]
  0x1006b71b: imul     eax, dword ptr [ebp - 0x124]
  0x1006b722: mov      dword ptr [ebp - 0x11c], eax
  0x1006b728: movsx    eax, word ptr [edx + 6]
  0x1006b72c: imul     eax, dword ptr [ebp - 0x118]
  0x1006b733: mov      dword ptr [ebp - 0x124], eax
  0x1006b739: movsx    eax, word ptr [edx + 8]
  0x1006b73d: imul     eax, ebx
  0x1006b740: mov      ebx, dword ptr [ebp - 0x11c]
  0x1006b746: add      ebx, edi
  0x1006b748: sub      edi, dword ptr [ebp - 0x11c]
  0x1006b74e: add      ebx, ebx
  0x1006b750: add      edi, edi
  0x1006b752: add      edi, edi
  0x1006b754: add      edi, edi
  0x1006b756: mov      dword ptr [ebp - 0x110], edi
  0x1006b75c: add      ebx, ebx
  0x1006b75e: add      ebx, ebx
  0x1006b760: mov      dword ptr [ebp - 0x108], ebx
  0x1006b766: mov      ebx, dword ptr [ebp - 0x120]
  0x1006b76c: mov      dword ptr [ebp - 0x118], eax
  0x1006b772: mov      edi, dword ptr [ebp - 0x118]
  0x1006b778: movsx    eax, word ptr [edx + 0xa]
  0x1006b77c: imul     eax, dword ptr [ebp - 0x114]
  0x1006b783: lea      edi, [edi + edi*4]
  0x1006b786: add      ebx, ebx
  0x1006b788: sub      edi, ebx
  0x1006b78a: mov      ebx, dword ptr [ebp - 0x118]
  0x1006b790: mov      dword ptr [ebp - 0x10c], edi
  0x1006b796: mov      edi, dword ptr [ebp - 0x120]
  0x1006b79c: lea      edi, [edi + edi*4]
  0x1006b79f: lea      edi, [edi + ebx*2]
  0x1006b7a2: mov      ebx, dword ptr [ebp - 0x108]
  0x1006b7a8: mov      dword ptr [ebp - 0x114], edi
  0x1006b7ae: lea      edi, [ebx + edi*2]
  0x1006b7b1: mov      dword ptr [ebp - 0x134], edi
  0x1006b7b7: mov      edi, dword ptr [ebp - 0x10c]
  0x1006b7bd: lea      ebx, [edi + edi]
  0x1006b7c0: mov      edi, dword ptr [ebp - 0x110]
  0x1006b7c6: sub      edi, ebx
  0x1006b7c8: mov      ebx, dword ptr [ebp - 0x10c]
  0x1006b7ce: mov      dword ptr [ebp - 0x118], edi
  0x1006b7d4: mov      edi, dword ptr [ebp - 0x110]
  0x1006b7da: lea      edi, [edi + ebx*2]
  0x1006b7dd: mov      dword ptr [ebp - 0x120], edi
  0x1006b7e3: mov      edi, dword ptr [ebp - 0x114]
  0x1006b7e9: lea      ebx, [edi + edi]
  0x1006b7ec: mov      edi, dword ptr [ebp - 0x108]
  0x1006b7f2: sub      edi, ebx
  0x1006b7f4: mov      dword ptr [ebp - 0x11c], edi
  0x1006b7fa: mov      edi, dword ptr [ebp - 0x124]