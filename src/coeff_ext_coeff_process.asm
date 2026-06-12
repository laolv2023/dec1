; ext_coeff_process @ 0x1006aa00-0x1006ad00
; 210 instructions

  0x1006aa00: push     ebp
  0x1006aa01: mov      ebp, esp
  0x1006aa03: push     esi
  0x1006aa04: mov      esi, dword ptr [ebp + 0x14]
  0x1006aa07: mov      eax, 0x92492493
  0x1006aa0c: imul     esi
  0x1006aa0e: add      edx, esi
  0x1006aa10: sar      edx, 2
  0x1006aa13: mov      ecx, edx
  0x1006aa15: shr      ecx, 0x1f
  0x1006aa18: add      ecx, edx
  0x1006aa1a: mov      edx, dword ptr [ebp + 0xc]
  0x1006aa1d: lea      eax, [ecx*8]
  0x1006aa24: sub      eax, ecx
  0x1006aa26: sub      esi, eax
  0x1006aa28: lea      eax, [edx + esi*4]
  0x1006aa2b: mov      edx, dword ptr [ebp + 8]
  0x1006aa2e: lea      eax, [edx + eax*4]
  0x1006aa31: mov      eax, dword ptr [eax*4 + 0x1072f220]
  0x1006aa38: shl      eax, cl
  0x1006aa3a: pop      esi
  0x1006aa3b: imul     eax, dword ptr [ebp + 0x10]
  0x1006aa3f: pop      ebp
  0x1006aa40: ret      
  0x1006aa41: int3     
  0x1006aa42: int3     
  0x1006aa43: int3     
  0x1006aa44: int3     
  0x1006aa45: int3     
  0x1006aa46: int3     
  0x1006aa47: int3     
  0x1006aa48: int3     
  0x1006aa49: int3     
  0x1006aa4a: int3     
  0x1006aa4b: int3     
  0x1006aa4c: int3     
  0x1006aa4d: int3     
  0x1006aa4e: int3     
  0x1006aa4f: int3     
  0x1006aa50: push     ebx
  0x1006aa51: mov      ebx, esp
  0x1006aa53: sub      esp, 8
  0x1006aa56: and      esp, 0xfffffff0
  0x1006aa59: add      esp, 4
  0x1006aa5c: push     ebp
  0x1006aa5d: mov      ebp, dword ptr [ebx + 4]
  0x1006aa60: mov      dword ptr [esp + 4], ebp
  0x1006aa64: mov      ebp, esp
  0x1006aa66: sub      esp, 0x158
  0x1006aa6c: mov      eax, dword ptr [0x106f85d0]
  0x1006aa71: xor      eax, ebp
  0x1006aa73: mov      dword ptr [ebp - 4], eax
  0x1006aa76: mov      eax, dword ptr [ebx + 0xc]
  0x1006aa79: push     esi
  0x1006aa7a: lea      esi, [ebp - 0x150]
  0x1006aa80: mov      ecx, esi
  0x1006aa82: push     edi
  0x1006aa83: mov      edi, dword ptr [ebx + 8]
  0x1006aa86: mov      dword ptr [ebp - 0x154], eax
  0x1006aa8c: test     cl, 0xf
  0x1006aa8f: je       0x1006aa97
  0x1006aa91: and      esi, 0xfffffff0
  0x1006aa94: add      esi, 0x10
  0x1006aa97: push     edi
  0x1006aa98: call     0x10080280
  0x1006aa9d: mov      edx, dword ptr [edi]
  0x1006aa9f: mov      eax, dword ptr [edi + 0x20]
  0x1006aaa2: mov      ecx, dword ptr [edi + 0x40]
  0x1006aaa5: mov      dword ptr [esi], edx
  0x1006aaa7: mov      edx, dword ptr [edi + 0x60]
  0x1006aaaa: mov      dword ptr [esi + 4], eax
  0x1006aaad: mov      eax, dword ptr [edi + 0x80]
  0x1006aab3: mov      dword ptr [esi + 8], ecx
  0x1006aab6: mov      ecx, dword ptr [edi + 0xa0]
  0x1006aabc: mov      dword ptr [esi + 0xc], edx
  0x1006aabf: mov      edx, dword ptr [edi + 0xc0]
  0x1006aac5: mov      dword ptr [esi + 0x10], eax
  0x1006aac8: mov      eax, dword ptr [edi + 0xe0]
  0x1006aace: mov      dword ptr [esi + 0x14], ecx
  0x1006aad1: mov      ecx, dword ptr [edi + 4]
  0x1006aad4: mov      dword ptr [esi + 0x18], edx
  0x1006aad7: mov      edx, dword ptr [edi + 0x24]
  0x1006aada: mov      dword ptr [esi + 0x1c], eax
  0x1006aadd: mov      eax, dword ptr [edi + 0x44]
  0x1006aae0: mov      dword ptr [esi + 0x20], ecx
  0x1006aae3: mov      ecx, dword ptr [edi + 0x64]
  0x1006aae6: mov      dword ptr [esi + 0x24], edx
  0x1006aae9: mov      edx, dword ptr [edi + 0x84]
  0x1006aaef: mov      dword ptr [esi + 0x28], eax
  0x1006aaf2: mov      eax, dword ptr [edi + 0xa4]
  0x1006aaf8: mov      dword ptr [esi + 0x2c], ecx
  0x1006aafb: mov      ecx, dword ptr [edi + 0xc4]
  0x1006ab01: mov      dword ptr [esi + 0x30], edx
  0x1006ab04: mov      edx, dword ptr [edi + 0xe4]
  0x1006ab0a: mov      dword ptr [esi + 0x34], eax
  0x1006ab0d: mov      eax, dword ptr [edi + 8]
  0x1006ab10: mov      dword ptr [esi + 0x38], ecx
  0x1006ab13: mov      ecx, dword ptr [edi + 0x28]
  0x1006ab16: mov      dword ptr [esi + 0x3c], edx
  0x1006ab19: mov      edx, dword ptr [edi + 0x48]
  0x1006ab1c: mov      dword ptr [esi + 0x40], eax
  0x1006ab1f: mov      eax, dword ptr [edi + 0x68]
  0x1006ab22: mov      dword ptr [esi + 0x44], ecx
  0x1006ab25: mov      ecx, dword ptr [edi + 0x88]
  0x1006ab2b: mov      dword ptr [esi + 0x48], edx
  0x1006ab2e: mov      edx, dword ptr [edi + 0xa8]
  0x1006ab34: mov      dword ptr [esi + 0x4c], eax
  0x1006ab37: mov      eax, dword ptr [edi + 0xc8]
  0x1006ab3d: mov      dword ptr [esi + 0x50], ecx
  0x1006ab40: mov      ecx, dword ptr [edi + 0xe8]
  0x1006ab46: mov      dword ptr [esi + 0x54], edx
  0x1006ab49: mov      edx, dword ptr [edi + 0xc]
  0x1006ab4c: mov      dword ptr [esi + 0x58], eax
  0x1006ab4f: mov      eax, dword ptr [edi + 0x2c]
  0x1006ab52: mov      dword ptr [esi + 0x5c], ecx
  0x1006ab55: mov      ecx, dword ptr [edi + 0x4c]
  0x1006ab58: mov      dword ptr [esi + 0x60], edx
  0x1006ab5b: mov      edx, dword ptr [edi + 0x6c]
  0x1006ab5e: mov      dword ptr [esi + 0x64], eax
  0x1006ab61: mov      eax, dword ptr [edi + 0x8c]
  0x1006ab67: mov      dword ptr [esi + 0x68], ecx
  0x1006ab6a: mov      ecx, dword ptr [edi + 0xac]
  0x1006ab70: mov      dword ptr [esi + 0x6c], edx
  0x1006ab73: mov      edx, dword ptr [edi + 0xcc]
  0x1006ab79: mov      dword ptr [esi + 0x70], eax
  0x1006ab7c: mov      eax, dword ptr [edi + 0xec]
  0x1006ab82: mov      dword ptr [esi + 0x74], ecx
  0x1006ab85: mov      ecx, dword ptr [edi + 0x10]
  0x1006ab88: mov      dword ptr [esi + 0x78], edx
  0x1006ab8b: mov      edx, dword ptr [edi + 0x30]
  0x1006ab8e: mov      dword ptr [esi + 0x7c], eax
  0x1006ab91: mov      eax, dword ptr [edi + 0x50]
  0x1006ab94: mov      dword ptr [esi + 0x80], ecx
  0x1006ab9a: mov      ecx, dword ptr [edi + 0x70]
  0x1006ab9d: mov      dword ptr [esi + 0x84], edx
  0x1006aba3: mov      edx, dword ptr [edi + 0x90]
  0x1006aba9: mov      dword ptr [esi + 0x88], eax
  0x1006abaf: mov      eax, dword ptr [edi + 0xb0]
  0x1006abb5: mov      dword ptr [esi + 0x8c], ecx
  0x1006abbb: mov      ecx, dword ptr [edi + 0xd0]
  0x1006abc1: mov      dword ptr [esi + 0x90], edx
  0x1006abc7: mov      edx, dword ptr [edi + 0xf0]
  0x1006abcd: mov      dword ptr [esi + 0x94], eax
  0x1006abd3: mov      dword ptr [esi + 0x98], ecx
  0x1006abd9: mov      eax, dword ptr [edi + 0x14]
  0x1006abdc: mov      ecx, dword ptr [edi + 0x34]
  0x1006abdf: mov      dword ptr [esi + 0xa0], eax
  0x1006abe5: mov      eax, dword ptr [edi + 0x74]
  0x1006abe8: mov      dword ptr [esi + 0x9c], edx
  0x1006abee: mov      edx, dword ptr [edi + 0x54]
  0x1006abf1: mov      dword ptr [esi + 0xac], eax
  0x1006abf7: mov      eax, dword ptr [edi + 0xd4]
  0x1006abfd: mov      dword ptr [esi + 0xa4], ecx
  0x1006ac03: mov      ecx, dword ptr [edi + 0x94]
  0x1006ac09: mov      dword ptr [esi + 0xa8], edx
  0x1006ac0f: mov      edx, dword ptr [edi + 0xb4]
  0x1006ac15: mov      dword ptr [esi + 0xb8], eax
  0x1006ac1b: mov      eax, dword ptr [edi + 0x38]
  0x1006ac1e: mov      dword ptr [esi + 0xb0], ecx
  0x1006ac24: mov      ecx, dword ptr [edi + 0xf4]
  0x1006ac2a: mov      dword ptr [esi + 0xb4], edx
  0x1006ac30: mov      edx, dword ptr [edi + 0x18]
  0x1006ac33: mov      dword ptr [esi + 0xc4], eax
  0x1006ac39: mov      eax, dword ptr [edi + 0x98]
  0x1006ac3f: mov      dword ptr [esi + 0xbc], ecx
  0x1006ac45: mov      ecx, dword ptr [edi + 0x58]
  0x1006ac48: mov      dword ptr [esi + 0xc0], edx
  0x1006ac4e: mov      edx, dword ptr [edi + 0x78]
  0x1006ac51: mov      dword ptr [esi + 0xd0], eax
  0x1006ac57: mov      eax, dword ptr [edi + 0xf8]
  0x1006ac5d: mov      dword ptr [esi + 0xc8], ecx
  0x1006ac63: mov      ecx, dword ptr [edi + 0xb8]
  0x1006ac69: mov      dword ptr [esi + 0xcc], edx
  0x1006ac6f: mov      edx, dword ptr [edi + 0xd8]
  0x1006ac75: mov      dword ptr [esi + 0xdc], eax
  0x1006ac7b: mov      eax, dword ptr [edi + 0x5c]
  0x1006ac7e: mov      dword ptr [esi + 0xd4], ecx
  0x1006ac84: mov      ecx, dword ptr [edi + 0x1c]
  0x1006ac87: mov      dword ptr [esi + 0xd8], edx
  0x1006ac8d: mov      edx, dword ptr [edi + 0x3c]
  0x1006ac90: mov      dword ptr [esi + 0xe8], eax
  0x1006ac96: mov      eax, dword ptr [edi + 0xbc]
  0x1006ac9c: mov      dword ptr [esi + 0xe0], ecx
  0x1006aca2: mov      ecx, dword ptr [edi + 0x7c]
  0x1006aca5: mov      dword ptr [esi + 0xe4], edx
  0x1006acab: mov      edx, dword ptr [edi + 0x9c]
  0x1006acb1: mov      dword ptr [esi + 0xf4], eax
  0x1006acb7: mov      eax, dword ptr [ebp - 0x154]
  0x1006acbd: mov      dword ptr [esi + 0xec], ecx
  0x1006acc3: mov      ecx, dword ptr [edi + 0xdc]
  0x1006acc9: mov      dword ptr [esi + 0xf0], edx
  0x1006accf: mov      edx, dword ptr [edi + 0xfc]
  0x1006acd5: push     eax
  0x1006acd6: push     esi
  0x1006acd7: mov      dword ptr [esi + 0xf8], ecx
  0x1006acdd: mov      dword ptr [esi + 0xfc], edx
  0x1006ace3: call     0x10080490
  0x1006ace8: mov      ecx, dword ptr [ebp - 4]
  0x1006aceb: add      esp, 0xc
  0x1006acee: pop      edi
  0x1006acef: xor      ecx, ebp
  0x1006acf1: pop      esi
  0x1006acf2: call     0x10382b66
  0x1006acf7: mov      esp, ebp
  0x1006acf9: pop      ebp
  0x1006acfa: mov      esp, ebx
  0x1006acfc: pop      ebx
  0x1006acfd: ret      
  0x1006acfe: int3     
  0x1006acff: int3     