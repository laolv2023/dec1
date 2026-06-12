; coeff_scan_variant_b @ 0x10055a60-0x10055c80
; 193 instructions

  0x10055a60: push     ebp
  0x10055a61: mov      ebp, esp
  0x10055a63: sub      esp, 0x38
  0x10055a66: mov      eax, dword ptr [0x106f85d0]
  0x10055a6b: xor      eax, ebp
  0x10055a6d: mov      dword ptr [ebp - 4], eax
  0x10055a70: mov      eax, dword ptr [ebp + 8]
  0x10055a73: mov      ecx, dword ptr [esi + 0x570]
  0x10055a79: mov      ecx, dword ptr [ecx + 0x1c]
  0x10055a7c: mov      dword ptr [ebp - 0x2c], eax
  0x10055a7f: mov      eax, dword ptr [esi + 0x255c8f0]
  0x10055a85: imul     eax, eax, 0x74
  0x10055a88: mov      eax, dword ptr [eax + esi + 0x24008e8]
  0x10055a8f: xor      edx, edx
  0x10055a91: dec      eax
  0x10055a92: push     ebx
  0x10055a93: add      ecx, 0xeb8
  0x10055a99: push     edi
  0x10055a9a: xor      edi, edi
  0x10055a9c: neg      eax
  0x10055a9e: sbb      eax, eax
  0x10055aa0: and      eax, 0x30
  0x10055aa3: add      eax, 0xf
  0x10055aa6: mov      dword ptr [ebp - 0x18], edx
  0x10055aa9: mov      dword ptr [ebp - 0x14], 1
  0x10055ab0: mov      dword ptr [ebp - 0x10], 2
  0x10055ab7: mov      dword ptr [ebp - 0xc], 4
  0x10055abe: mov      dword ptr [ebp - 8], 0xbb8
  0x10055ac5: mov      dword ptr [ebp - 0x38], ecx
  0x10055ac8: mov      dword ptr [ebp - 0x28], edx
  0x10055acb: mov      dword ptr [ebp - 0x20], edi
  0x10055ace: mov      dword ptr [ebp - 0x34], eax
  0x10055ad1: mov      dword ptr [ebp - 0x24], edx
  0x10055ad4: jmp      0x10055adf
  0x10055ad6: mov      edx, dword ptr [ebp - 0x28]
  0x10055ad9: mov      ecx, dword ptr [ebp - 0x38]
  0x10055adc: mov      edi, dword ptr [ebp - 0x20]
  0x10055adf: lea      ebx, [edx + edx*2]
  0x10055ae2: shl      ebx, 6
  0x10055ae5: add      ebx, ecx
  0x10055ae7: test     edx, edx
  0x10055ae9: jle      0x10055b16
  0x10055aeb: mov      eax, edi
  0x10055aed: sar      eax, 5
  0x10055af0: add      eax, 5
  0x10055af3: shl      eax, 4
  0x10055af6: sar      edi, 1
  0x10055af8: and      edi, 0xf
  0x10055afb: add      eax, edi
  0x10055afd: lea      edx, [eax + eax*2]
  0x10055b00: lea      eax, [ecx + edx*4]
  0x10055b03: push     eax
  0x10055b04: push     ebx
  0x10055b05: push     esi
  0x10055b06: call     0x10054a40
  0x10055b0b: add      esp, 0xc
  0x10055b0e: test     eax, eax
  0x10055b10: jne      0x10055c64
  0x10055b16: lea      ecx, [ebx + 0xc]
  0x10055b19: push     ecx
  0x10055b1a: push     esi
  0x10055b1b: call     0x10054380
  0x10055b20: add      esp, 8
  0x10055b23: test     eax, eax
  0x10055b25: jne      0x10055bb3
  0x10055b2b: lea      edi, [ebx + 0x18]
  0x10055b2e: push     edi
  0x10055b2f: push     esi
  0x10055b30: mov      dword ptr [ebp - 0x1c], 1
  0x10055b37: call     0x10054380
  0x10055b3c: add      esp, 8
  0x10055b3f: test     eax, eax
  0x10055b41: jne      0x10055b54
  0x10055b43: inc      dword ptr [ebp - 0x1c]
  0x10055b46: push     edi
  0x10055b47: push     esi
  0x10055b48: call     0x10054380
  0x10055b4d: add      esp, 8
  0x10055b50: test     eax, eax
  0x10055b52: je       0x10055b43
  0x10055b54: mov      edi, dword ptr [ebp - 0x1c]
  0x10055b57: inc      edi
  0x10055b58: push     esi
  0x10055b59: mov      dword ptr [ebp - 0x30], edi
  0x10055b5c: call     0x10054d20
  0x10055b61: add      esp, 4
  0x10055b64: test     eax, eax
  0x10055b66: je       0x10055b6a
  0x10055b68: neg      edi
  0x10055b6a: lea      edx, [ebx + 0x48]
  0x10055b6d: push     edx
  0x10055b6e: push     esi
  0x10055b6f: mov      dword ptr [ebp - 0x1c], 0
  0x10055b76: call     0x10054380
  0x10055b7b: add      esp, 8
  0x10055b7e: test     eax, eax
  0x10055b80: jne      0x10055c09
  0x10055b86: add      ebx, 0x54
  0x10055b89: push     ebx
  0x10055b8a: push     esi
  0x10055b8b: mov      dword ptr [ebp - 0x1c], 1
  0x10055b92: call     0x10054380
  0x10055b97: add      esp, 8
  0x10055b9a: test     eax, eax
  0x10055b9c: jne      0x10055c09
  0x10055b9e: mov      edi, edi
  0x10055ba0: inc      dword ptr [ebp - 0x1c]
  0x10055ba3: push     ebx
  0x10055ba4: push     esi
  0x10055ba5: call     0x10054380
  0x10055baa: add      esp, 8
  0x10055bad: test     eax, eax
  0x10055baf: je       0x10055ba0
  0x10055bb1: jmp      0x10055c09
  0x10055bb3: push     esi
  0x10055bb4: mov      dword ptr [ebp - 0x30], 1
  0x10055bbb: call     0x10054d20
  0x10055bc0: neg      eax
  0x10055bc2: sbb      edi, edi
  0x10055bc4: lea      eax, [ebx + 0x30]
  0x10055bc7: push     eax
  0x10055bc8: and      edi, 0xfffffffe
  0x10055bcb: push     esi
  0x10055bcc: inc      edi
  0x10055bcd: mov      dword ptr [ebp - 0x1c], 0
  0x10055bd4: call     0x10054380
  0x10055bd9: add      esp, 0xc
  0x10055bdc: test     eax, eax
  0x10055bde: jne      0x10055c09
  0x10055be0: add      ebx, 0x3c
  0x10055be3: push     ebx
  0x10055be4: push     esi
  0x10055be5: mov      dword ptr [ebp - 0x1c], 1
  0x10055bec: call     0x10054380
  0x10055bf1: add      esp, 8
  0x10055bf4: test     eax, eax
  0x10055bf6: jne      0x10055c09
  0x10055bf8: inc      dword ptr [ebp - 0x1c]
  0x10055bfb: push     ebx
  0x10055bfc: push     esi
  0x10055bfd: call     0x10054380
  0x10055c02: add      esp, 8
  0x10055c05: test     eax, eax
  0x10055c07: je       0x10055bf8
  0x10055c09: mov      eax, dword ptr [ebp - 0x2c]
  0x10055c0c: mov      ecx, dword ptr [ebp - 0x1c]
  0x10055c0f: mov      edx, dword ptr [ebp - 0x28]
  0x10055c12: mov      word ptr [eax], cx
  0x10055c15: mov      word ptr [eax + 2], di
  0x10055c19: add      eax, 4
  0x10055c1c: mov      dword ptr [ebp - 0x2c], eax
  0x10055c1f: mov      eax, dword ptr [ebp - 0x30]
  0x10055c22: cmp      eax, dword ptr [ebp + edx*4 - 0x18]
  0x10055c26: jle      0x10055c40
  0x10055c28: cmp      eax, 2
  0x10055c2b: jg       0x10055c32
  0x10055c2d: mov      dword ptr [ebp - 0x28], eax
  0x10055c30: jmp      0x10055c40
  0x10055c32: xor      edx, edx
  0x10055c34: cmp      eax, 4
  0x10055c37: setg     dl
  0x10055c3a: add      edx, 3
  0x10055c3d: mov      dword ptr [ebp - 0x28], edx
  0x10055c40: mov      eax, dword ptr [ebp - 0x20]
  0x10055c43: lea      eax, [eax + ecx + 1]
  0x10055c47: mov      ecx, dword ptr [ebp - 0x34]
  0x10055c4a: mov      dword ptr [ebp - 0x20], eax
  0x10055c4d: cmp      eax, ecx
  0x10055c4f: jle      0x10055c54
  0x10055c51: mov      dword ptr [ebp - 0x20], ecx
  0x10055c54: mov      eax, dword ptr [ebp - 0x24]
  0x10055c57: inc      eax
  0x10055c58: mov      dword ptr [ebp - 0x24], eax
  0x10055c5b: cmp      eax, 0x41
  0x10055c5e: jl       0x10055ad6
  0x10055c64: mov      ecx, dword ptr [ebp - 4]
  0x10055c67: mov      eax, dword ptr [ebp - 0x24]
  0x10055c6a: pop      edi
  0x10055c6b: xor      ecx, ebp
  0x10055c6d: pop      ebx
  0x10055c6e: call     0x10382b66
  0x10055c73: mov      esp, ebp
  0x10055c75: pop      ebp
  0x10055c76: ret      
  0x10055c77: int3     
  0x10055c78: int3     
  0x10055c79: int3     
  0x10055c7a: int3     
  0x10055c7b: int3     
  0x10055c7c: int3     
  0x10055c7d: int3     
  0x10055c7e: int3     
  0x10055c7f: int3     