; inter_pred_ref @ 0x10044902
; 539 instr

  0x10044902: push     0x10602e14
  0x10044907: call     0x100ce9a0
  0x1004490c: add      esp, 4
  0x1004490f: mov      eax, dword ptr [ebp - 0x2c]
  0x10044912: mov      eax, dword ptr [eax + 4]
  0x10044915: test     eax, eax
  0x10044917: jne      0x10044cb7
  0x1004491d: mov      eax, dword ptr [edi + 0x24008e8]
  0x10044923: cmp      eax, 3
  0x10044926: jne      0x10044987
  0x10044928: mov      cl, byte ptr [edi + 0x24008f2]
  0x1004492e: test     cl, cl
  0x10044930: je       0x1004493b
  0x10044932: movsx    eax, word ptr [edi + 0x24008ac]
  0x10044939: jmp      0x1004493e
  0x1004493b: or       eax, 0xffffffff
  0x1004493e: push     0
  0x10044940: movzx    ecx, cl
  0x10044943: push     eax
  0x10044944: push     ecx
  0x10044945: push     esi
  0x10044946: call     0x10055480
  0x1004494b: mov      word ptr [edi + 0x240091c], ax
  0x10044952: mov      al, byte ptr [edi + 0x24008f2]
  0x10044958: add      esp, 0x10
  0x1004495b: test     al, al
  0x1004495d: je       0x10044968
  0x1004495f: movsx    ecx, word ptr [edi + 0x24008ae]
  0x10044966: jmp      0x1004496b
  0x10044968: or       ecx, 0xffffffff
  0x1004496b: push     1
  0x1004496d: movzx    edx, al
  0x10044970: push     ecx
  0x10044971: push     edx
  0x10044972: push     esi
  0x10044973: call     0x10055480
  0x10044978: add      esp, 0x10
  0x1004497b: mov      word ptr [edi + 0x240091e], ax
  0x10044982: jmp      0x10044bf6
  0x10044987: cmp      eax, 4
  0x1004498a: jne      0x10044a44
  0x10044990: cmp      byte ptr [edi + 0x24008f2], 0
  0x10044997: push     0
  0x10044999: je       0x100449f2
  0x1004499b: movsx    eax, word ptr [edi + 0x24008ac]
  0x100449a2: push     eax
  0x100449a3: push     1
  0x100449a5: push     esi
  0x100449a6: call     0x10055480
  0x100449ab: mov      word ptr [edi + 0x240091c], ax
  0x100449b2: movsx    ecx, word ptr [edi + 0x24008ae]
  0x100449b9: push     1
  0x100449bb: push     ecx
  0x100449bc: push     1
  0x100449be: push     esi
  0x100449bf: call     0x10055480
  0x100449c4: mov      word ptr [edi + 0x240091e], ax
  0x100449cb: movsx    edx, word ptr [edi + 0x24008b4]
  0x100449d2: push     0
  0x100449d4: push     edx
  0x100449d5: push     1
  0x100449d7: push     esi
  0x100449d8: call     0x10055480
  0x100449dd: mov      word ptr [edi + 0x2400920], ax
  0x100449e4: movsx    eax, word ptr [edi + 0x24008b6]
  0x100449eb: push     1
  0x100449ed: push     eax
  0x100449ee: push     1
  0x100449f0: jmp      0x10044a2f
  0x100449f2: push     0
  0x100449f4: push     0
  0x100449f6: push     esi
  0x100449f7: call     0x10055480
  0x100449fc: push     1
  0x100449fe: push     0
  0x10044a00: push     0
  0x10044a02: push     esi
  0x10044a03: mov      word ptr [edi + 0x240091c], ax
  0x10044a0a: call     0x10055480
  0x10044a0f: push     0
  0x10044a11: push     0
  0x10044a13: push     0
  0x10044a15: push     esi
  0x10044a16: mov      word ptr [edi + 0x240091e], ax
  0x10044a1d: call     0x10055480
  0x10044a22: push     1
  0x10044a24: push     0
  0x10044a26: mov      word ptr [edi + 0x2400920], ax
  0x10044a2d: push     0
  0x10044a2f: push     esi
  0x10044a30: call     0x10055480
  0x10044a35: add      esp, 0x40
  0x10044a38: mov      word ptr [edi + 0x2400922], ax
  0x10044a3f: jmp      0x10044bf6
  0x10044a44: cmp      eax, 5
  0x10044a47: jne      0x10044ad9
  0x10044a4d: mov      cl, byte ptr [edi + 0x24008f2]
  0x10044a53: test     cl, cl
  0x10044a55: je       0x10044a60
  0x10044a57: movsx    eax, word ptr [edi + 0x24008ac]
  0x10044a5e: jmp      0x10044a62
  0x10044a60: xor      eax, eax
  0x10044a62: push     0
  0x10044a64: movzx    ecx, cl
  0x10044a67: push     eax
  0x10044a68: push     ecx
  0x10044a69: push     esi
  0x10044a6a: call     0x10055480
  0x10044a6f: mov      word ptr [edi + 0x240091c], ax
  0x10044a76: mov      al, byte ptr [edi + 0x24008f2]
  0x10044a7c: add      esp, 0x10
  0x10044a7f: test     al, al
  0x10044a81: je       0x10044a8c
  0x10044a83: movsx    ecx, word ptr [edi + 0x24008ae]
  0x10044a8a: jmp      0x10044a8e
  0x10044a8c: xor      ecx, ecx
  0x10044a8e: push     1
  0x10044a90: movzx    edx, al
  0x10044a93: push     ecx
  0x10044a94: push     edx
  0x10044a95: push     esi
  0x10044a96: call     0x10055480
  0x10044a9b: mov      word ptr [edi + 0x240091e], ax
  0x10044aa2: movsx    eax, word ptr [edi + 0x240091c]
  0x10044aa9: push     0
  0x10044aab: push     eax
  0x10044aac: push     1
  0x10044aae: push     esi
  0x10044aaf: call     0x10055480
  0x10044ab4: movsx    ecx, word ptr [edi + 0x240091e]
  0x10044abb: push     1
  0x10044abd: push     ecx
  0x10044abe: push     1
  0x10044ac0: push     esi
  0x10044ac1: mov      word ptr [edi + 0x2400920], ax
  0x10044ac8: call     0x10055480
  0x10044acd: mov      word ptr [edi + 0x2400922], ax
  0x10044ad4: jmp      0x10044bf3
  0x10044ad9: cmp      eax, 6
  0x10044adc: jne      0x10044bf6
  0x10044ae2: mov      cl, byte ptr [edi + 0x24008f2]
  0x10044ae8: test     cl, cl
  0x10044aea: je       0x10044af5
  0x10044aec: movsx    eax, word ptr [edi + 0x24008ac]
  0x10044af3: jmp      0x10044af7
  0x10044af5: xor      eax, eax
  0x10044af7: push     0
  0x10044af9: movzx    edx, cl
  0x10044afc: push     eax
  0x10044afd: push     edx
  0x10044afe: push     esi
  0x10044aff: call     0x10055480
  0x10044b04: mov      word ptr [edi + 0x240091c], ax
  0x10044b0b: mov      al, byte ptr [edi + 0x24008f2]
  0x10044b11: add      esp, 0x10
  0x10044b14: test     al, al
  0x10044b16: je       0x10044b21
  0x10044b18: movsx    ecx, word ptr [edi + 0x24008ae]
  0x10044b1f: jmp      0x10044b23
  0x10044b21: xor      ecx, ecx
  0x10044b23: push     1
  0x10044b25: movzx    eax, al
  0x10044b28: push     ecx
  0x10044b29: push     eax
  0x10044b2a: push     esi
  0x10044b2b: call     0x10055480
  0x10044b30: movsx    ecx, word ptr [edi + 0x240091c]
  0x10044b37: push     0
  0x10044b39: push     ecx
  0x10044b3a: push     1
  0x10044b3c: push     esi
  0x10044b3d: mov      word ptr [edi + 0x240091e], ax
  0x10044b44: call     0x10055480
  0x10044b49: movsx    edx, word ptr [edi + 0x240091e]
  0x10044b50: push     1
  0x10044b52: push     edx
  0x10044b53: push     1
  0x10044b55: push     esi
  0x10044b56: mov      word ptr [edi + 0x2400920], ax
  0x10044b5d: call     0x10055480
  0x10044b62: mov      word ptr [edi + 0x2400922], ax
  0x10044b69: mov      al, byte ptr [edi + 0x24008f2]
  0x10044b6f: add      esp, 0x30
  0x10044b72: test     al, al
  0x10044b74: je       0x10044b7f
  0x10044b76: movsx    ecx, word ptr [edi + 0x24008b4]
  0x10044b7d: jmp      0x10044b81
  0x10044b7f: xor      ecx, ecx
  0x10044b81: push     0
  0x10044b83: movzx    eax, al
  0x10044b86: push     ecx
  0x10044b87: push     eax
  0x10044b88: push     esi
  0x10044b89: call     0x10055480
  0x10044b8e: mov      word ptr [edi + 0x2400924], ax
  0x10044b95: mov      al, byte ptr [edi + 0x24008f2]
  0x10044b9b: add      esp, 0x10
  0x10044b9e: test     al, al
  0x10044ba0: je       0x10044bab
  0x10044ba2: movsx    ecx, word ptr [edi + 0x24008b6]
  0x10044ba9: jmp      0x10044bad
  0x10044bab: xor      ecx, ecx
  0x10044bad: push     1
  0x10044baf: push     ecx
  0x10044bb0: movzx    ecx, al
  0x10044bb3: push     ecx
  0x10044bb4: push     esi
  0x10044bb5: call     0x10055480
  0x10044bba: movsx    edx, word ptr [edi + 0x2400924]
  0x10044bc1: push     0
  0x10044bc3: push     edx
  0x10044bc4: push     1
  0x10044bc6: push     esi
  0x10044bc7: mov      word ptr [edi + 0x2400926], ax
  0x10044bce: call     0x10055480
  0x10044bd3: mov      word ptr [edi + 0x2400928], ax
  0x10044bda: movsx    eax, word ptr [edi + 0x2400926]
  0x10044be1: push     1
  0x10044be3: push     eax
  0x10044be4: push     1
  0x10044be6: push     esi
  0x10044be7: call     0x10055480
  0x10044bec: mov      word ptr [edi + 0x240092a], ax
  0x10044bf3: add      esp, 0x30
  0x10044bf6: push     esi
  0x10044bf7: call     0x10015a90
  0x10044bfc: add      esp, 4
  0x10044bff: mov      ebx, dword ptr [ebp - 0x30]
  0x10044c02: push     esi
  0x10044c03: call     0x100555b0
  0x10044c08: add      esp, 4
  0x10044c0b: cmp      dword ptr [edi + 0x24008e8], 1
  0x10044c12: mov      byte ptr [edi + 0x240093f], al
  0x10044c18: jne      0x10044c75
  0x10044c1a: test     al, 1
  0x10044c1c: je       0x10044c2d
  0x10044c1e: push     esi
  0x10044c1f: call     0x100555b0
  0x10044c24: add      esp, 4
  0x10044c27: mov      byte ptr [edi + 0x2400940], al
  0x10044c2d: test     byte ptr [edi + 0x240093f], 2
  0x10044c34: je       0x10044c45
  0x10044c36: push     esi
  0x10044c37: call     0x100555b0
  0x10044c3c: add      esp, 4
  0x10044c3f: mov      byte ptr [edi + 0x2400941], al
  0x10044c45: test     byte ptr [edi + 0x240093f], 4
  0x10044c4c: je       0x10044c5d
  0x10044c4e: push     esi
  0x10044c4f: call     0x100555b0
  0x10044c54: add      esp, 4
  0x10044c57: mov      byte ptr [edi + 0x2400942], al
  0x10044c5d: test     byte ptr [edi + 0x240093f], 8
  0x10044c64: je       0x10044c75
  0x10044c66: push     esi
  0x10044c67: call     0x100555b0
  0x10044c6c: add      esp, 4
  0x10044c6f: mov      byte ptr [edi + 0x2400943], al
  0x10044c75: mov      eax, dword ptr [ebp - 0x2c]
  0x10044c78: cmp      byte ptr [eax + 9], 0
  0x10044c7c: jne      0x10044d41
  0x10044c82: cmp      byte ptr [edi + 0x240093f], 0
  0x10044c89: je       0x10044d41
  0x10044c8f: push     esi
  0x10044c90: call     0x100557b0
  0x10044c95: mov      dword ptr [esi + 0x255c8f8], eax
  0x10044c9b: mov      cl, al
  0x10044c9d: mov      eax, dword ptr [ebp - 0x2c]
  0x10044ca0: add      esp, 4
  0x10044ca3: add      byte ptr [edi + 0x240093d], cl
  0x10044ca9: mov      dl, byte ptr [esi + 0x255c8f8]
  0x10044caf: mov      byte ptr [eax + 0x20], dl
  0x10044cb2: jmp      0x10044d4f
  0x10044cb7: cmp      eax, 1
  0x10044cba: jne      0x10044bff
  0x10044cc0: push     esi
  0x10044cc1: call     0x10053be0
  0x10044cc6: jmp      0x10044bfc
  0x10044ccb: xor      eax, eax
  0x10044ccd: mov      dword ptr [edi + 0x24008fc], eax
  0x10044cd3: mov      dword ptr [edi + 0x2400900], eax
  0x10044cd9: mov      dword ptr [edi + 0x2400904], eax
  0x10044cdf: mov      dword ptr [edi + 0x2400908], eax
  0x10044ce5: mov      dword ptr [edi + 0x240090c], eax
  0x10044ceb: mov      dword ptr [edi + 0x2400910], eax
  0x10044cf1: mov      dword ptr [edi + 0x2400914], eax
  0x10044cf7: mov      dword ptr [edi + 0x2400918], eax
  0x10044cfd: mov      dword ptr [edi + 0x240091c], eax
  0x10044d03: mov      dword ptr [edi + 0x2400920], eax
  0x10044d09: mov      dword ptr [edi + 0x2400924], eax
  0x10044d0f: mov      dword ptr [edi + 0x2400928], eax
  0x10044d15: mov      dword ptr [edi + 0x240092c], eax
  0x10044d1b: mov      dword ptr [edi + 0x2400930], eax
  0x10044d21: mov      dword ptr [edi + 0x2400934], eax
  0x10044d27: mov      dword ptr [edi + 0x2400938], eax
  0x10044d2d: or       eax, 0xffffffff
  0x10044d30: mov      dword ptr [edi + 0x24008f4], eax
  0x10044d36: mov      dword ptr [edi + 0x24008f8], eax
  0x10044d3c: jmp      0x10044c02
  0x10044d41: mov      dword ptr [esi + 0x255c8f8], 0
  0x10044d4b: mov      byte ptr [eax + 0x20], 0
  0x10044d4f: mov      al, byte ptr [edi + 0x240093d]
  0x10044d55: cmp      al, 0x38
  0x10044d57: jge      0x10044d5d
  0x10044d59: test     al, al
  0x10044d5b: jns      0x10044d71
  0x10044d5d: movsx    eax, al
  0x10044d60: add      eax, 0x38
  0x10044d63: cdq      
  0x10044d64: mov      ecx, 0x38
  0x10044d69: idiv     ecx
  0x10044d6b: mov      byte ptr [edi + 0x240093d], dl
  0x10044d71: movsx    edx, byte ptr [edi + 0x240093d]
  0x10044d78: mov      al, byte ptr [edx + 0x10602aa4]
  0x10044d7e: mov      byte ptr [edi + 0x240093e], al
  0x10044d84: cmp      dword ptr [esi + 0x580], 1
  0x10044d8b: jne      0x10044eb1
  0x10044d91: mov      ecx, dword ptr [esi + 0x255c8e8]
  0x10044d97: mov      dword ptr [esi + 0x26dc910], ecx
  0x10044d9d: mov      edx, dword ptr [esi + 0x255c8ec]
  0x10044da3: mov      dword ptr [esi + 0x26dc914], edx
  0x10044da9: mov      eax, dword ptr [esi + 0x255c8f0]
  0x10044daf: push     esi
  0x10044db0: mov      dword ptr [esi + 0x26dc918], eax
  0x10044db6: call     0x10040330
  0x10044dbb: add      esp, 4
  0x10044dbe: test     eax, eax
  0x10044dc0: jns      0x10044de3
  0x10044dc2: push     0x10602dfc
  0x10044dc7: call     0x100ce9a0
  0x10044dcc: add      esp, 4
  0x10044dcf: pop      edi
  0x10044dd0: pop      esi
  0x10044dd1: or       eax, 0xffffffff
  0x10044dd4: pop      ebx
  0x10044dd5: mov      ecx, dword ptr [ebp - 4]
  0x10044dd8: xor      ecx, ebp
  0x10044dda: call     0x10382b66
  0x10044ddf: mov      esp, ebp
  0x10044de1: pop      ebp
  0x10044de2: ret      
  0x10044de3: push     0
  0x10044de5: push     esi
  0x10044de6: call     0x10020df0
  0x10044deb: add      esp, 8
  0x10044dee: test     eax, eax
  0x10044df0: jns      0x10044e13
  0x10044df2: push     0x10602da4
  0x10044df7: call     0x100ce9a0
  0x10044dfc: add      esp, 4
  0x10044dff: pop      edi
  0x10044e00: pop      esi
  0x10044e01: or       eax, 0xffffffff
  0x10044e04: pop      ebx
  0x10044e05: mov      ecx, dword ptr [ebp - 4]
  0x10044e08: xor      ecx, ebp
  0x10044e0a: call     0x10382b66
  0x10044e0f: mov      esp, ebp
  0x10044e11: pop      ebp
  0x10044e12: ret      
  0x10044e13: push     0
  0x10044e15: push     esi
  0x10044e16: call     0x10008030
  0x10044e1b: mov      ecx, dword ptr [ebp - 0x2c]
  0x10044e1e: add      esp, 8
  0x10044e21: cmp      byte ptr [ecx + 0x10], 0
  0x10044e25: jne      0x10044f0c
  0x10044e2b: mov      edx, dword ptr [esi + 0x255c8f0]
  0x10044e31: mov      edi, dword ptr [ebx + 0x14]
  0x10044e34: push     edx
  0x10044e35: lea      eax, [ebp - 0x28]
  0x10044e38: push     eax
  0x10044e39: push     esi
  0x10044e3a: call     0x10045fd0
  0x10044e3f: mov      ecx, dword ptr [esi + 0x255c8ec]
  0x10044e45: imul     ecx, edi
  0x10044e48: mov      edi, dword ptr [esi + 0x255c8e8]
  0x10044e4e: mov      eax, ecx
  0x10044e50: cdq      
  0x10044e51: sub      eax, edx
  0x10044e53: sar      eax, 1
  0x10044e55: add      esp, 0xc
  0x10044e58: lea      edx, [ebp - 0x28]
  0x10044e5b: add      ecx, edi
  0x10044e5d: add      eax, edi
  0x10044e5f: cmp      byte ptr [ebx + 0x18], 0xa
  0x10044e63: push     edx
  0x10044e64: mov      edx, dword ptr [ebx + 0xa0]
  0x10044e6a: jne      0x10044e8d
  0x10044e6c: shl      eax, 4
  0x10044e6f: add      edx, eax
  0x10044e71: push     edx
  0x10044e72: mov      edx, dword ptr [ebx + 0x9c]
  0x10044e78: shl      ecx, 5
  0x10044e7b: add      ecx, dword ptr [ebx + 0x98]
  0x10044e81: add      edx, eax
  0x10044e83: push     edx
  0x10044e84: push     ecx
  0x10044e85: push     esi
  0x10044e86: call     0x1004cca0
  0x10044e8b: jmp      0x10044f09
  0x10044e8d: add      eax, eax
  0x10044e8f: add      eax, eax
  0x10044e91: add      eax, eax
  0x10044e93: add      edx, eax
  0x10044e95: push     edx
  0x10044e96: mov      edx, dword ptr [ebx + 0x9c]
  0x10044e9c: shl      ecx, 4
  0x10044e9f: add      ecx, dword ptr [ebx + 0x98]
  0x10044ea5: add      edx, eax
  0x10044ea7: push     edx
  0x10044ea8: push     ecx
  0x10044ea9: push     esi
  0x10044eaa: call     0x1004bd60
  0x10044eaf: jmp      0x10044f09
  0x10044eb1: call     0x10040730
  0x10044eb6: test     eax, eax
  0x10044eb8: jns      0x10044edb
  0x10044eba: push     0x10602dec
  0x10044ebf: call     0x100ce9a0
  0x10044ec4: add      esp, 4
  0x10044ec7: pop      edi
  0x10044ec8: pop      esi
  0x10044ec9: or       eax, 0xffffffff
  0x10044ecc: pop      ebx
  0x10044ecd: mov      ecx, dword ptr [ebp - 4]
  0x10044ed0: xor      ecx, ebp
  0x10044ed2: call     0x10382b66
  0x10044ed7: mov      esp, ebp
  0x10044ed9: pop      ebp
  0x10044eda: ret      
  0x10044edb: mov      edi, dword ptr [edi + 0x24008e8]
  0x10044ee1: test     edi, edi
  0x10044ee3: je       0x10044ef1
  0x10044ee5: cmp      edi, 1
  0x10044ee8: je       0x10044ef1
  0x10044eea: mov      eax, 1
  0x10044eef: jmp      0x10044ef3
  0x10044ef1: xor      eax, eax
  0x10044ef3: mov      ecx, dword ptr [esi + 0x255c8ec]
  0x10044ef9: push     eax
  0x10044efa: mov      eax, dword ptr [esi + 0x255c8e8]
  0x10044f00: push     eax
  0x10044f01: push     ecx
  0x10044f02: push     ebx
  0x10044f03: push     esi
  0x10044f04: call     0x100010c0
  0x10044f09: add      esp, 0x14
  0x10044f0c: mov      eax, dword ptr [ebp - 0x2c]
  0x10044f0f: inc      word ptr [eax + 0xc]
  0x10044f13: push     esi
  0x10044f14: call     0x10054ea0
  0x10044f19: add      esp, 4
  0x10044f1c: test     eax, eax
  0x10044f1e: jne      0x10044f3c
  0x10044f20: mov      eax, dword ptr [ebp - 0x38]
  0x10044f23: mov      edx, dword ptr [eax + 0xc]
  0x10044f26: cmp      edx, dword ptr [eax + 8]
  0x10044f29: jg       0x10044f3c
  0x10044f2b: push     esi
  0x10044f2c: call     0x1001f7a0
  0x10044f31: add      esp, 4
  0x10044f34: test     eax, eax
  0x10044f36: jns      0x10044466
  0x10044f3c: mov      ecx, dword ptr [ebp - 4]
  0x10044f3f: pop      edi
  0x10044f40: pop      esi
  0x10044f41: xor      ecx, ebp
  0x10044f43: mov      eax, 0x64
  0x10044f48: pop      ebx
  0x10044f49: call     0x10382b66
  0x10044f4e: mov      esp, ebp
  0x10044f50: pop      ebp
  0x10044f51: ret      
  0x10044f52: int3     
  0x10044f53: int3     
  0x10044f54: int3     
  0x10044f55: int3     
  0x10044f56: int3     
  0x10044f57: int3     
  0x10044f58: int3     
  0x10044f59: int3     
  0x10044f5a: int3     
  0x10044f5b: int3     
  0x10044f5c: int3     
  0x10044f5d: int3     
  0x10044f5e: int3     
  0x10044f5f: int3     
  0x10044f60: push     ebp
  0x10044f61: mov      ebp, esp
  0x10044f63: sub      esp, 8
  0x10044f66: mov      eax, dword ptr [esi + 0x570]
  0x10044f6c: cmp      byte ptr [eax + 1], 0
  0x10044f70: push     ebx
  0x10044f71: mov      ebx, dword ptr [esi + 0x56c]
  0x10044f77: push     edi
  0x10044f78: mov      dword ptr [ebp - 4], eax
  0x10044f7b: je       0x10044f94
  0x10044f7d: mov      eax, dword ptr [esi + 0x568]
  0x10044f83: cmp      byte ptr [eax], 0