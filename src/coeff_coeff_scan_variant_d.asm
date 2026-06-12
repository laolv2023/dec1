; coeff_scan_variant_d @ 0x10055e90-0x100560a0
; 190 instructions

  0x10055e90: push     ebp
  0x10055e91: mov      ebp, esp
  0x10055e93: sub      esp, 0x34
  0x10055e96: mov      eax, dword ptr [0x106f85d0]
  0x10055e9b: xor      eax, ebp
  0x10055e9d: mov      dword ptr [ebp - 4], eax
  0x10055ea0: mov      ecx, dword ptr [esi + 0x570]
  0x10055ea6: mov      eax, dword ptr [ebp + 8]
  0x10055ea9: mov      ecx, dword ptr [ecx + 0x1c]
  0x10055eac: push     ebx
  0x10055ead: xor      edx, edx
  0x10055eaf: add      ecx, 0x14b8
  0x10055eb5: push     edi
  0x10055eb6: mov      dword ptr [ebp - 0x30], eax
  0x10055eb9: xor      eax, eax
  0x10055ebb: mov      edi, 1
  0x10055ec0: mov      dword ptr [ebp - 0x18], edx
  0x10055ec3: mov      dword ptr [ebp - 0x14], edi
  0x10055ec6: mov      dword ptr [ebp - 0x10], 2
  0x10055ecd: mov      dword ptr [ebp - 0xc], 4
  0x10055ed4: mov      dword ptr [ebp - 8], 0xbb8
  0x10055edb: mov      dword ptr [ebp - 0x34], ecx
  0x10055ede: mov      dword ptr [ebp - 0x28], eax
  0x10055ee1: mov      dword ptr [ebp - 0x24], edx
  0x10055ee4: mov      dword ptr [ebp - 0x20], eax
  0x10055ee7: jmp      0x10055efe
  0x10055ee9: lea      esp, [esp]
  0x10055ef0: mov      edx, dword ptr [ebp - 0x24]
  0x10055ef3: mov      eax, dword ptr [ebp - 0x28]
  0x10055ef6: mov      ecx, dword ptr [ebp - 0x34]
  0x10055ef9: mov      edi, 1
  0x10055efe: lea      ebx, [eax + eax*2]
  0x10055f01: shl      ebx, 6
  0x10055f04: add      ebx, ecx
  0x10055f06: test     eax, eax
  0x10055f08: jle      0x10055f35
  0x10055f0a: mov      eax, edx
  0x10055f0c: sar      eax, 5
  0x10055f0f: add      eax, 5
  0x10055f12: sar      edx, 1
  0x10055f14: shl      eax, 4
  0x10055f17: and      edx, 0xf
  0x10055f1a: add      eax, edx
  0x10055f1c: lea      edx, [eax + eax*2]
  0x10055f1f: lea      eax, [ecx + edx*4]
  0x10055f22: push     eax
  0x10055f23: push     ebx
  0x10055f24: push     esi
  0x10055f25: call     0x10054a40
  0x10055f2a: add      esp, 0xc
  0x10055f2d: test     eax, eax
  0x10055f2f: jne      0x10056082
  0x10055f35: lea      ecx, [ebx + 0xc]
  0x10055f38: push     ecx
  0x10055f39: push     esi
  0x10055f3a: call     0x10054380
  0x10055f3f: add      esp, 8
  0x10055f42: test     eax, eax
  0x10055f44: jne      0x10055fd3
  0x10055f4a: mov      dword ptr [ebp - 0x1c], edi
  0x10055f4d: lea      edi, [ebx + 0x18]
  0x10055f50: push     edi
  0x10055f51: push     esi
  0x10055f52: call     0x10054380
  0x10055f57: add      esp, 8
  0x10055f5a: test     eax, eax
  0x10055f5c: jne      0x10055f71
  0x10055f5e: mov      edi, edi
  0x10055f60: inc      dword ptr [ebp - 0x1c]
  0x10055f63: push     edi
  0x10055f64: push     esi
  0x10055f65: call     0x10054380
  0x10055f6a: add      esp, 8
  0x10055f6d: test     eax, eax
  0x10055f6f: je       0x10055f60
  0x10055f71: mov      edi, dword ptr [ebp - 0x1c]
  0x10055f74: inc      edi
  0x10055f75: push     esi
  0x10055f76: mov      dword ptr [ebp - 0x2c], edi
  0x10055f79: call     0x10054d20
  0x10055f7e: add      esp, 4
  0x10055f81: test     eax, eax
  0x10055f83: je       0x10055f87
  0x10055f85: neg      edi
  0x10055f87: lea      edx, [ebx + 0x48]
  0x10055f8a: push     edx
  0x10055f8b: push     esi
  0x10055f8c: mov      dword ptr [ebp - 0x1c], 0
  0x10055f93: call     0x10054380
  0x10055f98: add      esp, 8
  0x10055f9b: test     eax, eax
  0x10055f9d: jne      0x10056025
  0x10055fa3: add      ebx, 0x54
  0x10055fa6: push     ebx
  0x10055fa7: push     esi
  0x10055fa8: mov      dword ptr [ebp - 0x1c], 1
  0x10055faf: call     0x10054380
  0x10055fb4: add      esp, 8
  0x10055fb7: test     eax, eax
  0x10055fb9: jne      0x10056025
  0x10055fbb: jmp      0x10055fc0
  0x10055fbd: lea      ecx, [ecx]
  0x10055fc0: inc      dword ptr [ebp - 0x1c]
  0x10055fc3: push     ebx
  0x10055fc4: push     esi
  0x10055fc5: call     0x10054380
  0x10055fca: add      esp, 8
  0x10055fcd: test     eax, eax
  0x10055fcf: je       0x10055fc0
  0x10055fd1: jmp      0x10056025
  0x10055fd3: push     esi
  0x10055fd4: mov      dword ptr [ebp - 0x2c], edi
  0x10055fd7: call     0x10054d20
  0x10055fdc: neg      eax
  0x10055fde: sbb      edi, edi
  0x10055fe0: lea      eax, [ebx + 0x30]
  0x10055fe3: push     eax
  0x10055fe4: and      edi, 0xfffffffe
  0x10055fe7: push     esi
  0x10055fe8: inc      edi
  0x10055fe9: mov      dword ptr [ebp - 0x1c], 0
  0x10055ff0: call     0x10054380
  0x10055ff5: add      esp, 0xc
  0x10055ff8: test     eax, eax
  0x10055ffa: jne      0x10056025
  0x10055ffc: add      ebx, 0x3c
  0x10055fff: push     ebx
  0x10056000: push     esi
  0x10056001: mov      dword ptr [ebp - 0x1c], 1
  0x10056008: call     0x10054380
  0x1005600d: add      esp, 8
  0x10056010: test     eax, eax
  0x10056012: jne      0x10056025
  0x10056014: inc      dword ptr [ebp - 0x1c]
  0x10056017: push     ebx
  0x10056018: push     esi
  0x10056019: call     0x10054380
  0x1005601e: add      esp, 8
  0x10056021: test     eax, eax
  0x10056023: je       0x10056014
  0x10056025: mov      eax, dword ptr [ebp - 0x30]
  0x10056028: mov      ecx, dword ptr [ebp - 0x1c]
  0x1005602b: mov      edx, dword ptr [ebp - 0x28]
  0x1005602e: mov      word ptr [eax], cx
  0x10056031: mov      word ptr [eax + 2], di
  0x10056035: add      eax, 4
  0x10056038: mov      dword ptr [ebp - 0x30], eax
  0x1005603b: mov      eax, dword ptr [ebp - 0x2c]
  0x1005603e: cmp      eax, dword ptr [ebp + edx*4 - 0x18]
  0x10056042: jle      0x1005605c
  0x10056044: cmp      eax, 2
  0x10056047: jg       0x1005604e
  0x10056049: mov      dword ptr [ebp - 0x28], eax
  0x1005604c: jmp      0x1005605c
  0x1005604e: xor      edx, edx
  0x10056050: cmp      eax, 4
  0x10056053: setg     dl
  0x10056056: add      edx, 3
  0x10056059: mov      dword ptr [ebp - 0x28], edx
  0x1005605c: mov      eax, dword ptr [ebp - 0x24]
  0x1005605f: lea      eax, [eax + ecx + 1]
  0x10056063: mov      dword ptr [ebp - 0x24], eax
  0x10056066: cmp      eax, 0x3f
  0x10056069: jle      0x10056072
  0x1005606b: mov      dword ptr [ebp - 0x24], 0x3f
  0x10056072: mov      eax, dword ptr [ebp - 0x20]
  0x10056075: inc      eax
  0x10056076: mov      dword ptr [ebp - 0x20], eax
  0x10056079: cmp      eax, 0x41
  0x1005607c: jl       0x10055ef0
  0x10056082: mov      ecx, dword ptr [ebp - 4]
  0x10056085: mov      eax, dword ptr [ebp - 0x20]
  0x10056088: pop      edi
  0x10056089: xor      ecx, ebp
  0x1005608b: pop      ebx
  0x1005608c: call     0x10382b66
  0x10056091: mov      esp, ebp
  0x10056093: pop      ebp
  0x10056094: ret      
  0x10056095: int3     
  0x10056096: int3     
  0x10056097: int3     
  0x10056098: int3     
  0x10056099: int3     
  0x1005609a: int3     
  0x1005609b: int3     
  0x1005609c: int3     
  0x1005609d: int3     
  0x1005609e: int3     
  0x1005609f: int3     