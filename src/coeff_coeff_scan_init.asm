; coeff_scan_init @ 0x10055830-0x10055a60
; 197 instructions

  0x10055830: push     ebp
  0x10055831: mov      ebp, esp
  0x10055833: sub      esp, 0x3c
  0x10055836: mov      eax, dword ptr [0x106f85d0]
  0x1005583b: xor      eax, ebp
  0x1005583d: mov      dword ptr [ebp - 4], eax
  0x10055840: mov      eax, dword ptr [esi + 0x570]
  0x10055846: mov      ecx, dword ptr [eax + 0x1c]
  0x10055849: mov      eax, dword ptr [esi + 0x255c8f0]
  0x1005584f: imul     eax, eax, 0x74
  0x10055852: mov      eax, dword ptr [eax + esi + 0x24008e8]
  0x10055859: push     ebx
  0x1005585a: mov      ebx, dword ptr [ebp + 8]
  0x1005585d: dec      eax
  0x1005585e: add      ecx, 0xeb8
  0x10055864: push     edi
  0x10055865: xor      edi, edi
  0x10055867: neg      eax
  0x10055869: sbb      eax, eax
  0x1005586b: and      eax, 0x30
  0x1005586e: add      eax, 0xf
  0x10055871: sub      ebx, edx
  0x10055873: mov      dword ptr [ebp - 0x18], edi
  0x10055876: mov      dword ptr [ebp - 0x14], 1
  0x1005587d: mov      dword ptr [ebp - 0x10], 2
  0x10055884: mov      dword ptr [ebp - 0xc], 4
  0x1005588b: mov      dword ptr [ebp - 8], 0xbb8
  0x10055892: mov      dword ptr [ebp - 0x3c], ecx
  0x10055895: mov      dword ptr [ebp - 0x28], edi
  0x10055898: mov      dword ptr [ebp - 0x20], edi
  0x1005589b: mov      dword ptr [ebp - 0x38], eax
  0x1005589e: mov      dword ptr [ebp - 0x24], edi
  0x100558a1: mov      dword ptr [ebp - 0x30], edx
  0x100558a4: mov      dword ptr [ebp - 0x34], ebx
  0x100558a7: jmp      0x100558b6
  0x100558a9: lea      esp, [esp]
  0x100558b0: mov      edi, dword ptr [ebp - 0x28]
  0x100558b3: mov      ecx, dword ptr [ebp - 0x3c]
  0x100558b6: lea      ebx, [edi + edi*2]
  0x100558b9: shl      ebx, 6
  0x100558bc: add      ebx, ecx
  0x100558be: test     edi, edi
  0x100558c0: jle      0x100558f0
  0x100558c2: mov      edx, dword ptr [ebp - 0x20]
  0x100558c5: mov      eax, edx
  0x100558c7: sar      eax, 5
  0x100558ca: add      eax, 5
  0x100558cd: sar      edx, 1
  0x100558cf: shl      eax, 4
  0x100558d2: and      edx, 0xf
  0x100558d5: add      eax, edx
  0x100558d7: lea      edx, [eax + eax*2]
  0x100558da: lea      eax, [ecx + edx*4]
  0x100558dd: push     eax
  0x100558de: push     ebx
  0x100558df: push     esi
  0x100558e0: call     0x10054a40
  0x100558e5: add      esp, 0xc
  0x100558e8: test     eax, eax
  0x100558ea: jne      0x10055a45
  0x100558f0: lea      ecx, [ebx + 0xc]
  0x100558f3: push     ecx
  0x100558f4: push     esi
  0x100558f5: call     0x10054380
  0x100558fa: add      esp, 8
  0x100558fd: test     eax, eax
  0x100558ff: jne      0x10055993
  0x10055905: lea      edi, [ebx + 0x18]
  0x10055908: push     edi
  0x10055909: push     esi
  0x1005590a: mov      dword ptr [ebp - 0x1c], 1
  0x10055911: call     0x10054380
  0x10055916: add      esp, 8
  0x10055919: test     eax, eax
  0x1005591b: jne      0x10055931
  0x1005591d: lea      ecx, [ecx]
  0x10055920: inc      dword ptr [ebp - 0x1c]
  0x10055923: push     edi
  0x10055924: push     esi
  0x10055925: call     0x10054380
  0x1005592a: add      esp, 8
  0x1005592d: test     eax, eax
  0x1005592f: je       0x10055920
  0x10055931: mov      edi, dword ptr [ebp - 0x1c]
  0x10055934: inc      edi
  0x10055935: push     esi
  0x10055936: mov      dword ptr [ebp - 0x2c], edi
  0x10055939: call     0x10054d20
  0x1005593e: add      esp, 4
  0x10055941: test     eax, eax
  0x10055943: je       0x10055947
  0x10055945: neg      edi
  0x10055947: lea      edx, [ebx + 0x48]
  0x1005594a: push     edx
  0x1005594b: push     esi
  0x1005594c: mov      dword ptr [ebp - 0x1c], 0
  0x10055953: call     0x10054380
  0x10055958: add      esp, 8
  0x1005595b: test     eax, eax
  0x1005595d: jne      0x100559e9
  0x10055963: add      ebx, 0x54
  0x10055966: push     ebx
  0x10055967: push     esi
  0x10055968: mov      dword ptr [ebp - 0x1c], 1
  0x1005596f: call     0x10054380
  0x10055974: add      esp, 8
  0x10055977: test     eax, eax
  0x10055979: jne      0x100559e9
  0x1005597b: jmp      0x10055980
  0x1005597d: lea      ecx, [ecx]
  0x10055980: inc      dword ptr [ebp - 0x1c]
  0x10055983: push     ebx
  0x10055984: push     esi
  0x10055985: call     0x10054380
  0x1005598a: add      esp, 8
  0x1005598d: test     eax, eax
  0x1005598f: je       0x10055980
  0x10055991: jmp      0x100559e9
  0x10055993: push     esi
  0x10055994: mov      dword ptr [ebp - 0x2c], 1
  0x1005599b: call     0x10054d20
  0x100559a0: neg      eax
  0x100559a2: sbb      edi, edi
  0x100559a4: lea      eax, [ebx + 0x30]
  0x100559a7: push     eax
  0x100559a8: and      edi, 0xfffffffe
  0x100559ab: push     esi
  0x100559ac: inc      edi
  0x100559ad: mov      dword ptr [ebp - 0x1c], 0
  0x100559b4: call     0x10054380
  0x100559b9: add      esp, 0xc
  0x100559bc: test     eax, eax
  0x100559be: jne      0x100559e9
  0x100559c0: add      ebx, 0x3c
  0x100559c3: push     ebx
  0x100559c4: push     esi
  0x100559c5: mov      dword ptr [ebp - 0x1c], 1
  0x100559cc: call     0x10054380
  0x100559d1: add      esp, 8
  0x100559d4: test     eax, eax
  0x100559d6: jne      0x100559e9
  0x100559d8: inc      dword ptr [ebp - 0x1c]
  0x100559db: push     ebx
  0x100559dc: push     esi
  0x100559dd: call     0x10054380
  0x100559e2: add      esp, 8
  0x100559e5: test     eax, eax
  0x100559e7: je       0x100559d8
  0x100559e9: mov      edx, dword ptr [ebp - 0x34]
  0x100559ec: mov      ecx, dword ptr [ebp - 0x30]
  0x100559ef: mov      eax, dword ptr [ebp - 0x2c]
  0x100559f2: mov      dword ptr [edx + ecx], edi
  0x100559f5: mov      edx, dword ptr [ebp - 0x28]
  0x100559f8: mov      edi, dword ptr [ebp - 0x1c]
  0x100559fb: mov      dword ptr [ecx], edi
  0x100559fd: cmp      eax, dword ptr [ebp + edx*4 - 0x18]
  0x10055a01: jle      0x10055a1b
  0x10055a03: cmp      eax, 2
  0x10055a06: jg       0x10055a0d
  0x10055a08: mov      dword ptr [ebp - 0x28], eax
  0x10055a0b: jmp      0x10055a1b
  0x10055a0d: xor      edx, edx
  0x10055a0f: cmp      eax, 4
  0x10055a12: setg     dl
  0x10055a15: add      edx, 3
  0x10055a18: mov      dword ptr [ebp - 0x28], edx
  0x10055a1b: mov      eax, dword ptr [ebp - 0x20]
  0x10055a1e: mov      edx, dword ptr [ebp - 0x38]
  0x10055a21: lea      eax, [eax + edi + 1]
  0x10055a25: mov      dword ptr [ebp - 0x20], eax
  0x10055a28: cmp      eax, edx
  0x10055a2a: jle      0x10055a2f
  0x10055a2c: mov      dword ptr [ebp - 0x20], edx
  0x10055a2f: mov      eax, dword ptr [ebp - 0x24]
  0x10055a32: inc      eax
  0x10055a33: add      ecx, 4
  0x10055a36: mov      dword ptr [ebp - 0x24], eax
  0x10055a39: mov      dword ptr [ebp - 0x30], ecx
  0x10055a3c: cmp      eax, 0x41
  0x10055a3f: jl       0x100558b0
  0x10055a45: mov      ecx, dword ptr [ebp - 4]
  0x10055a48: mov      eax, dword ptr [ebp - 0x24]
  0x10055a4b: pop      edi
  0x10055a4c: xor      ecx, ebp
  0x10055a4e: pop      ebx
  0x10055a4f: call     0x10382b66
  0x10055a54: mov      esp, ebp
  0x10055a56: pop      ebp
  0x10055a57: ret      
  0x10055a58: int3     
  0x10055a59: int3     
  0x10055a5a: int3     
  0x10055a5b: int3     
  0x10055a5c: int3     
  0x10055a5d: int3     
  0x10055a5e: int3     
  0x10055a5f: int3     