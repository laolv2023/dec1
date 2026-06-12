; coeff_scan_variant_c @ 0x10055c80-0x10055e90
; 186 instructions

  0x10055c80: push     ebp
  0x10055c81: mov      ebp, esp
  0x10055c83: sub      esp, 0x38
  0x10055c86: mov      eax, dword ptr [0x106f85d0]
  0x10055c8b: xor      eax, ebp
  0x10055c8d: mov      dword ptr [ebp - 4], eax
  0x10055c90: mov      ecx, dword ptr [esi + 0x570]
  0x10055c96: mov      eax, dword ptr [ebp + 0xc]
  0x10055c99: mov      ecx, dword ptr [ecx + 0x1c]
  0x10055c9c: xor      edx, edx
  0x10055c9e: push     ebx
  0x10055c9f: mov      ebx, dword ptr [ebp + 8]
  0x10055ca2: add      ecx, 0x14b8
  0x10055ca8: sub      ebx, eax
  0x10055caa: push     edi
  0x10055cab: mov      dword ptr [ebp - 0x18], edx
  0x10055cae: mov      dword ptr [ebp - 0x14], 1
  0x10055cb5: mov      dword ptr [ebp - 0x10], 2
  0x10055cbc: mov      dword ptr [ebp - 0xc], 4
  0x10055cc3: mov      dword ptr [ebp - 8], 0xbb8
  0x10055cca: mov      dword ptr [ebp - 0x38], ecx
  0x10055ccd: mov      dword ptr [ebp - 0x24], edx
  0x10055cd0: mov      dword ptr [ebp - 0x20], edx
  0x10055cd3: mov      dword ptr [ebp - 0x28], edx
  0x10055cd6: mov      dword ptr [ebp - 0x30], eax
  0x10055cd9: mov      dword ptr [ebp - 0x34], ebx
  0x10055cdc: mov      edi, edx
  0x10055cde: jmp      0x10055ce9
  0x10055ce0: mov      edi, dword ptr [ebp - 0x20]
  0x10055ce3: mov      edx, dword ptr [ebp - 0x24]
  0x10055ce6: mov      ecx, dword ptr [ebp - 0x38]
  0x10055ce9: lea      ebx, [edx + edx*2]
  0x10055cec: shl      ebx, 6
  0x10055cef: add      ebx, ecx
  0x10055cf1: test     edx, edx
  0x10055cf3: jle      0x10055d20
  0x10055cf5: mov      eax, edi
  0x10055cf7: sar      eax, 5
  0x10055cfa: add      eax, 5
  0x10055cfd: shl      eax, 4
  0x10055d00: sar      edi, 1
  0x10055d02: and      edi, 0xf
  0x10055d05: add      eax, edi
  0x10055d07: lea      edx, [eax + eax*2]
  0x10055d0a: lea      eax, [ecx + edx*4]
  0x10055d0d: push     eax
  0x10055d0e: push     ebx
  0x10055d0f: push     esi
  0x10055d10: call     0x10054a40
  0x10055d15: add      esp, 0xc
  0x10055d18: test     eax, eax
  0x10055d1a: jne      0x10055e77
  0x10055d20: lea      ecx, [ebx + 0xc]
  0x10055d23: push     ecx
  0x10055d24: push     esi
  0x10055d25: call     0x10054380
  0x10055d2a: add      esp, 8
  0x10055d2d: test     eax, eax
  0x10055d2f: jne      0x10055dc3
  0x10055d35: lea      edi, [ebx + 0x18]
  0x10055d38: push     edi
  0x10055d39: push     esi
  0x10055d3a: mov      dword ptr [ebp - 0x1c], 1
  0x10055d41: call     0x10054380
  0x10055d46: add      esp, 8
  0x10055d49: test     eax, eax
  0x10055d4b: jne      0x10055d61
  0x10055d4d: lea      ecx, [ecx]
  0x10055d50: inc      dword ptr [ebp - 0x1c]
  0x10055d53: push     edi
  0x10055d54: push     esi
  0x10055d55: call     0x10054380
  0x10055d5a: add      esp, 8
  0x10055d5d: test     eax, eax
  0x10055d5f: je       0x10055d50
  0x10055d61: mov      edi, dword ptr [ebp - 0x1c]
  0x10055d64: inc      edi
  0x10055d65: push     esi
  0x10055d66: mov      dword ptr [ebp - 0x2c], edi
  0x10055d69: call     0x10054d20
  0x10055d6e: add      esp, 4
  0x10055d71: test     eax, eax
  0x10055d73: je       0x10055d77
  0x10055d75: neg      edi
  0x10055d77: lea      edx, [ebx + 0x48]
  0x10055d7a: push     edx
  0x10055d7b: push     esi
  0x10055d7c: mov      dword ptr [ebp - 0x1c], 0
  0x10055d83: call     0x10054380
  0x10055d88: add      esp, 8
  0x10055d8b: test     eax, eax
  0x10055d8d: jne      0x10055e19
  0x10055d93: add      ebx, 0x54
  0x10055d96: push     ebx
  0x10055d97: push     esi
  0x10055d98: mov      dword ptr [ebp - 0x1c], 1
  0x10055d9f: call     0x10054380
  0x10055da4: add      esp, 8
  0x10055da7: test     eax, eax
  0x10055da9: jne      0x10055e19
  0x10055dab: jmp      0x10055db0
  0x10055dad: lea      ecx, [ecx]
  0x10055db0: inc      dword ptr [ebp - 0x1c]
  0x10055db3: push     ebx
  0x10055db4: push     esi
  0x10055db5: call     0x10054380
  0x10055dba: add      esp, 8
  0x10055dbd: test     eax, eax
  0x10055dbf: je       0x10055db0
  0x10055dc1: jmp      0x10055e19
  0x10055dc3: push     esi
  0x10055dc4: mov      dword ptr [ebp - 0x2c], 1
  0x10055dcb: call     0x10054d20
  0x10055dd0: neg      eax
  0x10055dd2: sbb      edi, edi
  0x10055dd4: lea      eax, [ebx + 0x30]
  0x10055dd7: push     eax
  0x10055dd8: and      edi, 0xfffffffe
  0x10055ddb: push     esi
  0x10055ddc: inc      edi
  0x10055ddd: mov      dword ptr [ebp - 0x1c], 0
  0x10055de4: call     0x10054380
  0x10055de9: add      esp, 0xc
  0x10055dec: test     eax, eax
  0x10055dee: jne      0x10055e19
  0x10055df0: add      ebx, 0x3c
  0x10055df3: push     ebx
  0x10055df4: push     esi
  0x10055df5: mov      dword ptr [ebp - 0x1c], 1
  0x10055dfc: call     0x10054380
  0x10055e01: add      esp, 8
  0x10055e04: test     eax, eax
  0x10055e06: jne      0x10055e19
  0x10055e08: inc      dword ptr [ebp - 0x1c]
  0x10055e0b: push     ebx
  0x10055e0c: push     esi
  0x10055e0d: call     0x10054380
  0x10055e12: add      esp, 8
  0x10055e15: test     eax, eax
  0x10055e17: je       0x10055e08
  0x10055e19: mov      edx, dword ptr [ebp - 0x34]
  0x10055e1c: mov      ecx, dword ptr [ebp - 0x30]
  0x10055e1f: mov      eax, dword ptr [ebp - 0x2c]
  0x10055e22: mov      dword ptr [edx + ecx], edi
  0x10055e25: mov      edx, dword ptr [ebp - 0x24]
  0x10055e28: mov      edi, dword ptr [ebp - 0x1c]
  0x10055e2b: mov      dword ptr [ecx], edi
  0x10055e2d: cmp      eax, dword ptr [ebp + edx*4 - 0x18]
  0x10055e31: jle      0x10055e4b
  0x10055e33: cmp      eax, 2
  0x10055e36: jg       0x10055e3d
  0x10055e38: mov      dword ptr [ebp - 0x24], eax
  0x10055e3b: jmp      0x10055e4b
  0x10055e3d: xor      edx, edx
  0x10055e3f: cmp      eax, 4
  0x10055e42: setg     dl
  0x10055e45: add      edx, 3
  0x10055e48: mov      dword ptr [ebp - 0x24], edx
  0x10055e4b: mov      eax, dword ptr [ebp - 0x20]
  0x10055e4e: lea      eax, [eax + edi + 1]
  0x10055e52: mov      dword ptr [ebp - 0x20], eax
  0x10055e55: cmp      eax, 0x3f
  0x10055e58: jle      0x10055e61
  0x10055e5a: mov      dword ptr [ebp - 0x20], 0x3f
  0x10055e61: mov      eax, dword ptr [ebp - 0x28]
  0x10055e64: inc      eax
  0x10055e65: add      ecx, 4
  0x10055e68: mov      dword ptr [ebp - 0x28], eax
  0x10055e6b: mov      dword ptr [ebp - 0x30], ecx
  0x10055e6e: cmp      eax, 0x41
  0x10055e71: jl       0x10055ce0
  0x10055e77: mov      ecx, dword ptr [ebp - 4]
  0x10055e7a: mov      eax, dword ptr [ebp - 0x28]
  0x10055e7d: pop      edi
  0x10055e7e: xor      ecx, ebp
  0x10055e80: pop      ebx
  0x10055e81: call     0x10382b66
  0x10055e86: mov      esp, ebp
  0x10055e88: pop      ebp
  0x10055e89: ret      
  0x10055e8a: int3     
  0x10055e8b: int3     
  0x10055e8c: int3     
  0x10055e8d: int3     
  0x10055e8e: int3     
  0x10055e8f: int3     