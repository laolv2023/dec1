; idct_reconstruct @ 0x100441e0
; 1110 instr

  0x100441e0: push     0x10602dbc
  0x100441e5: call     0x100ce9a0
  0x100441ea: add      esp, 4
  0x100441ed: jmp      0x1004434f
  0x100441f2: push     0
  0x100441f4: push     esi
  0x100441f5: call     0x10020df0
  0x100441fa: add      esp, 8
  0x100441fd: test     eax, eax
  0x100441ff: jns      0x10044213
  0x10044201: push     0x10602da4
  0x10044206: call     0x100ce9a0
  0x1004420b: add      esp, 4
  0x1004420e: jmp      0x1004434f
  0x10044213: push     0
  0x10044215: push     esi
  0x10044216: call     0x10008030
  0x1004421b: mov      ecx, dword ptr [ebp - 0x38]
  0x1004421e: add      esp, 8
  0x10044221: cmp      byte ptr [ecx + 0x10], 0
  0x10044225: jne      0x100442f9
  0x1004422b: mov      edx, dword ptr [esi + 0x255c8f0]
  0x10044231: mov      edi, dword ptr [ebx + 0x14]
  0x10044234: push     edx
  0x10044235: lea      eax, [ebp - 0x28]
  0x10044238: push     eax
  0x10044239: push     esi
  0x1004423a: call     0x10045fd0
  0x1004423f: mov      ecx, dword ptr [esi + 0x255c8ec]
  0x10044245: imul     ecx, edi
  0x10044248: mov      edi, dword ptr [esi + 0x255c8e8]
  0x1004424e: mov      eax, ecx
  0x10044250: cdq      
  0x10044251: sub      eax, edx
  0x10044253: sar      eax, 1
  0x10044255: add      esp, 0xc
  0x10044258: lea      edx, [ebp - 0x28]
  0x1004425b: add      ecx, edi
  0x1004425d: add      eax, edi
  0x1004425f: cmp      byte ptr [ebx + 0x18], 0xa
  0x10044263: push     edx
  0x10044264: mov      edx, dword ptr [ebx + 0xa0]
  0x1004426a: jne      0x1004428d
  0x1004426c: shl      eax, 4
  0x1004426f: add      edx, eax
  0x10044271: push     edx
  0x10044272: mov      edx, dword ptr [ebx + 0x9c]
  0x10044278: shl      ecx, 5
  0x1004427b: add      ecx, dword ptr [ebx + 0x98]
  0x10044281: add      edx, eax
  0x10044283: push     edx
  0x10044284: push     ecx
  0x10044285: push     esi
  0x10044286: call     0x1004cca0
  0x1004428b: jmp      0x100442f6
  0x1004428d: add      eax, eax
  0x1004428f: add      eax, eax
  0x10044291: add      eax, eax
  0x10044293: add      edx, eax
  0x10044295: push     edx
  0x10044296: mov      edx, dword ptr [ebx + 0x9c]
  0x1004429c: shl      ecx, 4
  0x1004429f: add      ecx, dword ptr [ebx + 0x98]
  0x100442a5: add      edx, eax
  0x100442a7: push     edx
  0x100442a8: push     ecx
  0x100442a9: push     esi
  0x100442aa: call     0x1004bd60
  0x100442af: jmp      0x100442f6
  0x100442b1: call     0x10031df0
  0x100442b6: test     eax, eax
  0x100442b8: jns      0x100442cc
  0x100442ba: push     0x10602d94
  0x100442bf: call     0x100ce9a0
  0x100442c4: add      esp, 4
  0x100442c7: jmp      0x1004434f
  0x100442cc: mov      edi, dword ptr [edi]
  0x100442ce: test     edi, edi
  0x100442d0: je       0x100442de
  0x100442d2: cmp      edi, 1
  0x100442d5: je       0x100442de
  0x100442d7: mov      eax, 1
  0x100442dc: jmp      0x100442e0
  0x100442de: xor      eax, eax
  0x100442e0: mov      ecx, dword ptr [esi + 0x255c8ec]
  0x100442e6: push     eax
  0x100442e7: mov      eax, dword ptr [esi + 0x255c8e8]
  0x100442ed: push     eax
  0x100442ee: push     ecx
  0x100442ef: push     ebx
  0x100442f0: push     esi
  0x100442f1: call     0x100010c0
  0x100442f6: add      esp, 0x14
  0x100442f9: mov      eax, dword ptr [ebp - 0x38]
  0x100442fc: inc      word ptr [eax + 0xc]
  0x10044300: mov      eax, dword ptr [ebp - 0x2c]
  0x10044303: mov      edx, dword ptr [eax + 0xc]
  0x10044306: cmp      edx, dword ptr [eax + 8]
  0x10044309: jge      0x10044318
  0x1004430b: push     esi
  0x1004430c: call     0x1001f7a0
  0x10044311: add      esp, 4
  0x10044314: test     eax, eax
  0x10044316: jns      0x1004432e
  0x10044318: pop      edi
  0x10044319: pop      esi
  0x1004431a: mov      eax, 0x64
  0x1004431f: pop      ebx
  0x10044320: mov      ecx, dword ptr [ebp - 4]
  0x10044323: xor      ecx, ebp
  0x10044325: call     0x10382b66
  0x1004432a: mov      esp, ebp
  0x1004432c: pop      ebp
  0x1004432d: ret      
  0x1004432e: pop      edi
  0x1004432f: pop      esi
  0x10044330: xor      eax, eax
  0x10044332: pop      ebx
  0x10044333: mov      ecx, dword ptr [ebp - 4]
  0x10044336: xor      ecx, ebp
  0x10044338: call     0x10382b66
  0x1004433d: mov      esp, ebp
  0x1004433f: pop      ebp
  0x10044340: ret      
  0x10044341: push     eax
  0x10044342: push     0x10602d80
  0x10044347: call     0x100ce9a0
  0x1004434c: add      esp, 8
  0x1004434f: push     0x10602d74
  0x10044354: call     0x100ce9a0
  0x10044359: mov      ecx, dword ptr [ebp - 4]
  0x1004435c: add      esp, 4
  0x1004435f: pop      edi
  0x10044360: pop      esi
  0x10044361: xor      ecx, ebp
  0x10044363: or       eax, 0xffffffff
  0x10044366: pop      ebx
  0x10044367: call     0x10382b66
  0x1004436c: mov      esp, ebp
  0x1004436e: pop      ebp
  0x1004436f: ret      
  0x10044370: push     ebp
  0x10044371: mov      ebp, esp
  0x10044373: sub      esp, 0x3c
  0x10044376: mov      eax, dword ptr [0x106f85d0]
  0x1004437b: xor      eax, ebp
  0x1004437d: mov      dword ptr [ebp - 4], eax
  0x10044380: push     ebx
  0x10044381: push     esi
  0x10044382: mov      esi, ecx
  0x10044384: mov      ecx, dword ptr [esi + 0x56c]
  0x1004438a: mov      eax, dword ptr [esi + 0x255c8f0]
  0x10044390: mov      edx, dword ptr [esi + 0x570]
  0x10044396: mov      dword ptr [ebp - 0x30], ecx
  0x10044399: movzx    ecx, byte ptr [ecx + 0x10]
  0x1004439d: push     edi
  0x1004439e: mov      edi, eax
  0x100443a0: sub      eax, ecx
  0x100443a2: imul     edi, edi, 0x74
  0x100443a5: mov      ecx, dword ptr [esi]
  0x100443a7: imul     eax, eax, 0x74
  0x100443aa: lea      eax, [eax + esi + 0x24008e8]
  0x100443b1: mov      dword ptr [ebp - 0x34], eax
  0x100443b4: mov      eax, dword ptr [ecx + 0x18]
  0x100443b7: mov      ecx, dword ptr [esi + 0x57c]
  0x100443bd: add      edi, esi
  0x100443bf: cmp      dword ptr [edx + 4], 2
  0x100443c3: mov      dword ptr [ebp - 0x2c], edx
  0x100443c6: mov      dword ptr [ebp - 0x38], eax
  0x100443c9: mov      dword ptr [ebp - 0x3c], ecx
  0x100443cc: je       0x10044479
  0x100443d2: push     esi
  0x100443d3: call     0x10054e40
  0x100443d8: add      esp, 4
  0x100443db: test     eax, eax
  0x100443dd: jle      0x10044479
  0x100443e3: mov      al, byte ptr [edi + 0x240093d]
  0x100443e9: cmp      al, 0x38
  0x100443eb: jge      0x100443f1
  0x100443ed: test     al, al
  0x100443ef: jns      0x10044405
  0x100443f1: movsx    eax, al
  0x100443f4: add      eax, 0x38
  0x100443f7: cdq      
  0x100443f8: mov      ecx, 0x38
  0x100443fd: idiv     ecx
  0x100443ff: mov      byte ptr [edi + 0x240093d], dl
  0x10044405: movsx    edx, byte ptr [edi + 0x240093d]
  0x1004440c: mov      al, byte ptr [edx + 0x10602aa4]
  0x10044412: push     esi
  0x10044413: mov      byte ptr [edi + 0x240093e], al
  0x10044419: mov      byte ptr [edi + 0x2400958], 0
  0x10044420: call     0x1001cd60
  0x10044425: add      esp, 4
  0x10044428: test     eax, eax
  0x1004442a: js       0x10044ec7
  0x10044430: mov      eax, dword ptr [ebp - 0x2c]
  0x10044433: mov      ecx, 1
  0x10044438: add      word ptr [eax + 0xc], cx
  0x1004443c: add      word ptr [eax + 0xe], cx
  0x10044440: push     esi
  0x10044441: mov      byte ptr [eax + 0x20], 0
  0x10044445: call     0x10054ea0
  0x1004444a: add      esp, 4
  0x1004444d: test     eax, eax
  0x1004444f: jne      0x10044f3c
  0x10044455: push     esi
  0x10044456: call     0x1001f7a0
  0x1004445b: add      esp, 4
  0x1004445e: test     eax, eax
  0x10044460: js       0x10044f3c
  0x10044466: pop      edi
  0x10044467: pop      esi
  0x10044468: xor      eax, eax
  0x1004446a: pop      ebx
  0x1004446b: mov      ecx, dword ptr [ebp - 4]
  0x1004446e: xor      ecx, ebp
  0x10044470: call     0x10382b66
  0x10044475: mov      esp, ebp
  0x10044477: pop      ebp
  0x10044478: ret      
  0x10044479: push     esi
  0x1004447a: call     0x10015ce0
  0x1004447f: push     esi
  0x10044480: call     0x10054ec0
  0x10044485: add      esp, 8
  0x10044488: mov      dword ptr [edi + 0x24008e8], eax
  0x1004448e: test     eax, eax
  0x10044490: js       0x10044ec7
  0x10044496: cmp      eax, 0x1d
  0x10044499: jne      0x100444c3
  0x1004449b: xor      ebx, ebx
  0x1004449d: lea      ecx, [ecx]
  0x100444a0: push     esi
  0x100444a1: call     0x100551f0
  0x100444a6: xor      ecx, ecx
  0x100444a8: add      esp, 4
  0x100444ab: test     al, al
  0x100444ad: setne    cl
  0x100444b0: mov      byte ptr [edi + ebx + 0x24008ec], al
  0x100444b7: inc      ebx
  0x100444b8: add      dword ptr [esi + 0x255c8f4], ecx
  0x100444be: cmp      ebx, 4
  0x100444c1: jl       0x100444a0
  0x100444c3: mov      edx, dword ptr [esi + 0x568]
  0x100444c9: cmp      byte ptr [edx], 0
  0x100444cc: je       0x1004453b
  0x100444ce: cmp      dword ptr [edi + 0x24008e8], 2
  0x100444d5: jge      0x1004453b
  0x100444d7: push     esi
  0x100444d8: call     0x10055250
  0x100444dd: add      esp, 4
  0x100444e0: mov      byte ptr [edi + 0x240093c], al
  0x100444e6: cmp      al, 1
  0x100444e8: ja       0x10044ec7
  0x100444ee: test     al, al
  0x100444f0: je       0x1004453b
  0x100444f2: mov      eax, dword ptr [esi + 0x568]
  0x100444f8: cmp      byte ptr [eax], 0
  0x100444fb: je       0x1004453b
  0x100444fd: mov      ebx, dword ptr [ebp - 0x30]
  0x10044500: cmp      byte ptr [ebx + 0x18], 0xa
  0x10044504: push     esi
  0x10044505: jne      0x10044521
  0x10044507: test     byte ptr [ebp - 0x3c], 0x10
  0x1004450b: je       0x10044517
  0x1004450d: call     0x100439c0
  0x10044512: add      esp, 4
  0x10044515: jmp      0x1004453e
  0x10044517: call     0x10043bd0
  0x1004451c: add      esp, 4
  0x1004451f: jmp      0x1004453e
  0x10044521: test     byte ptr [ebp - 0x3c], 0x10
  0x10044525: je       0x10044531
  0x10044527: call     0x100435f0
  0x1004452c: add      esp, 4
  0x1004452f: jmp      0x1004453e
  0x10044531: call     0x100437f0
  0x10044536: add      esp, 4
  0x10044539: jmp      0x1004453e
  0x1004453b: mov      ebx, dword ptr [ebp - 0x30]
  0x1004453e: cmp      dword ptr [edi + 0x24008e8], 0
  0x10044545: jne      0x10044554
  0x10044547: mov      ecx, dword ptr [ebp - 0x38]
  0x1004454a: push     ecx
  0x1004454b: push     esi
  0x1004454c: call     0x10015dc0
  0x10044551: add      esp, 8
  0x10044554: cmp      dword ptr [edi + 0x24008e8], 1
  0x1004455b: jne      0x1004456a
  0x1004455d: mov      edx, dword ptr [ebp - 0x38]
  0x10044560: push     edx
  0x10044561: push     esi
  0x10044562: call     0x10016020
  0x10044567: add      esp, 8
  0x1004456a: mov      eax, dword ptr [edi + 0x24008e8]
  0x10044570: test     eax, eax
  0x10044572: je       0x10044ccb
  0x10044578: cmp      eax, 1
  0x1004457b: je       0x10044ccb
  0x10044581: mov      byte ptr [edi + 0x2400958], 0
  0x10044588: cmp      byte ptr [ebx + 0x37], 1
  0x1004458c: jne      0x100445b6
  0x1004458e: xor      eax, eax
  0x10044590: cmp      dword ptr [esi + 0x255c8f4], eax
  0x10044596: jle      0x1004490f
  0x1004459c: lea      esp, [esp]
  0x100445a0: mov      byte ptr [edi + eax + 0x24008f4], 0
  0x100445a8: inc      eax
  0x100445a9: cmp      eax, dword ptr [esi + 0x255c8f4]
  0x100445af: jl       0x100445a0
  0x100445b1: jmp      0x1004490f
  0x100445b6: mov      ecx, dword ptr [ebp - 0x2c]
  0x100445b9: mov      ecx, dword ptr [ecx + 4]
  0x100445bc: test     ecx, ecx
  0x100445be: jne      0x100448f7
  0x100445c4: cmp      eax, 3
  0x100445c7: jne      0x10044632
  0x100445c9: cmp      byte ptr [edi + 0x24008f0], cl
  0x100445cf: je       0x100445da
  0x100445d1: mov      edx, dword ptr [ebp - 0x34]
  0x100445d4: movsx    edx, byte ptr [edx + 0xe]
  0x100445d8: jmp      0x100445dd
  0x100445da: or       edx, 0xffffffff
  0x100445dd: mov      cl, byte ptr [edi + 0x24008f2]
  0x100445e3: test     cl, cl
  0x100445e5: je       0x100445f0
  0x100445e7: movsx    eax, byte ptr [edi + 0x2400881]
  0x100445ee: jmp      0x100445f3
  0x100445f0: or       eax, 0xffffffff
  0x100445f3: push     edx
  0x100445f4: push     eax
  0x100445f5: movzx    eax, byte ptr [edi + 0x24008f0]
  0x100445fc: movzx    ecx, cl
  0x100445ff: push     eax
  0x10044600: push     ecx
  0x10044601: push     esi
  0x10044602: call     0x100553e0
  0x10044607: xor      ecx, ecx
  0x10044609: add      esp, 0x14
  0x1004460c: mov      byte ptr [edi + 0x24008f4], al
  0x10044612: cmp      dword ptr [ebx + 0x20], ecx
  0x10044615: movsx    edx, al
  0x10044618: sete     cl
  0x1004461b: lea      ecx, [ecx + ecx + 1]
  0x1004461f: cmp      edx, ecx
  0x10044621: jl       0x1004490f
  0x10044627: mov      byte ptr [edi + 0x24008f4], cl
  0x1004462d: jmp      0x1004490f
  0x10044632: cmp      eax, 4
  0x10044635: jne      0x100446f2
  0x1004463b: cmp      byte ptr [edi + 0x24008f0], 0
  0x10044642: je       0x1004464d
  0x10044644: mov      eax, dword ptr [ebp - 0x34]
  0x10044647: movsx    edx, byte ptr [eax + 0xe]
  0x1004464b: jmp      0x10044650
  0x1004464d: or       edx, 0xffffffff
  0x10044650: mov      cl, byte ptr [edi + 0x24008f2]
  0x10044656: test     cl, cl
  0x10044658: je       0x10044663
  0x1004465a: movsx    eax, byte ptr [edi + 0x2400881]
  0x10044661: jmp      0x10044666
  0x10044663: or       eax, 0xffffffff
  0x10044666: push     edx
  0x10044667: movzx    edx, byte ptr [edi + 0x24008f0]
  0x1004466e: push     eax
  0x1004466f: movzx    eax, cl
  0x10044672: push     edx
  0x10044673: push     eax
  0x10044674: push     esi
  0x10044675: call     0x100553e0
  0x1004467a: xor      ecx, ecx
  0x1004467c: add      esp, 0x14
  0x1004467f: mov      byte ptr [edi + 0x24008f4], al
  0x10044685: cmp      dword ptr [ebx + 0x20], ecx
  0x10044688: movsx    edx, al
  0x1004468b: sete     cl
  0x1004468e: lea      ecx, [ecx + ecx + 1]
  0x10044692: cmp      edx, ecx
  0x10044694: jl       0x1004469c
  0x10044696: mov      byte ptr [edi + 0x24008f4], cl
  0x1004469c: mov      cl, byte ptr [edi + 0x24008f2]
  0x100446a2: test     cl, cl
  0x100446a4: je       0x100446af
  0x100446a6: movsx    eax, byte ptr [edi + 0x2400883]
  0x100446ad: jmp      0x100446b2
  0x100446af: or       eax, 0xffffffff
  0x100446b2: movsx    edx, byte ptr [edi + 0x24008f4]
  0x100446b9: push     edx
  0x100446ba: push     eax
  0x100446bb: movzx    eax, cl
  0x100446be: push     1
  0x100446c0: push     eax
  0x100446c1: push     esi
  0x100446c2: call     0x100553e0
  0x100446c7: xor      ecx, ecx
  0x100446c9: add      esp, 0x14
  0x100446cc: mov      byte ptr [edi + 0x24008f5], al
  0x100446d2: cmp      dword ptr [ebx + 0x20], ecx
  0x100446d5: movsx    edx, al
  0x100446d8: sete     cl
  0x100446db: lea      ecx, [ecx + ecx + 1]
  0x100446df: cmp      edx, ecx
  0x100446e1: jl       0x1004490f
  0x100446e7: mov      byte ptr [edi + 0x24008f5], cl
  0x100446ed: jmp      0x1004490f
  0x100446f2: cmp      eax, 5
  0x100446f5: jne      0x100447b2
  0x100446fb: cmp      byte ptr [edi + 0x24008f0], 0
  0x10044702: je       0x1004470d
  0x10044704: mov      eax, dword ptr [ebp - 0x34]
  0x10044707: movsx    edx, byte ptr [eax + 0xe]
  0x1004470b: jmp      0x10044710
  0x1004470d: or       edx, 0xffffffff
  0x10044710: mov      cl, byte ptr [edi + 0x24008f2]
  0x10044716: test     cl, cl
  0x10044718: je       0x10044723
  0x1004471a: movsx    eax, byte ptr [edi + 0x2400881]
  0x10044721: jmp      0x10044726
  0x10044723: or       eax, 0xffffffff
  0x10044726: push     edx
  0x10044727: movzx    edx, byte ptr [edi + 0x24008f0]
  0x1004472e: push     eax
  0x1004472f: movzx    eax, cl
  0x10044732: push     edx
  0x10044733: push     eax
  0x10044734: push     esi
  0x10044735: call     0x100553e0
  0x1004473a: xor      ecx, ecx
  0x1004473c: add      esp, 0x14
  0x1004473f: mov      byte ptr [edi + 0x24008f4], al
  0x10044745: cmp      dword ptr [ebx + 0x20], ecx
  0x10044748: movsx    edx, al
  0x1004474b: sete     cl
  0x1004474e: lea      ecx, [ecx + ecx + 1]
  0x10044752: cmp      edx, ecx
  0x10044754: jl       0x1004475c
  0x10044756: mov      byte ptr [edi + 0x24008f4], cl
  0x1004475c: mov      cl, byte ptr [edi + 0x24008f0]
  0x10044762: test     cl, cl
  0x10044764: je       0x1004476f
  0x10044766: mov      eax, dword ptr [ebp - 0x34]
  0x10044769: movsx    eax, byte ptr [eax + 0xf]
  0x1004476d: jmp      0x10044772
  0x1004476f: or       eax, 0xffffffff
  0x10044772: movsx    edx, byte ptr [edi + 0x24008f4]
  0x10044779: push     eax
  0x1004477a: push     edx
  0x1004477b: movzx    eax, cl
  0x1004477e: push     eax
  0x1004477f: push     1
  0x10044781: push     esi
  0x10044782: call     0x100553e0
  0x10044787: xor      ecx, ecx
  0x10044789: add      esp, 0x14
  0x1004478c: mov      byte ptr [edi + 0x24008f5], al
  0x10044792: cmp      dword ptr [ebx + 0x20], ecx
  0x10044795: movsx    edx, al
  0x10044798: sete     cl
  0x1004479b: lea      ecx, [ecx + ecx + 1]
  0x1004479f: cmp      edx, ecx
  0x100447a1: jl       0x1004490f
  0x100447a7: mov      byte ptr [edi + 0x24008f5], cl
  0x100447ad: jmp      0x1004490f
  0x100447b2: cmp      eax, 6
  0x100447b5: jne      0x1004490f
  0x100447bb: mov      bl, byte ptr [edi + 0x24008f0]
  0x100447c1: test     bl, bl
  0x100447c3: je       0x100447ce
  0x100447c5: mov      eax, dword ptr [ebp - 0x34]
  0x100447c8: movsx    edx, byte ptr [eax + 0xe]
  0x100447cc: jmp      0x100447d1
  0x100447ce: or       edx, 0xffffffff
  0x100447d1: mov      cl, byte ptr [edi + 0x24008f2]
  0x100447d7: test     cl, cl
  0x100447d9: je       0x100447e4
  0x100447db: movsx    eax, byte ptr [edi + 0x2400881]
  0x100447e2: jmp      0x100447e7
  0x100447e4: or       eax, 0xffffffff
  0x100447e7: push     edx
  0x100447e8: push     eax
  0x100447e9: movzx    edx, bl
  0x100447ec: movzx    eax, cl
  0x100447ef: push     edx
  0x100447f0: push     eax
  0x100447f1: push     esi
  0x100447f2: call     0x100553e0
  0x100447f7: mov      edx, dword ptr [ebp - 0x30]
  0x100447fa: xor      ecx, ecx
  0x100447fc: add      esp, 0x14
  0x100447ff: mov      byte ptr [edi + 0x24008f4], al
  0x10044805: cmp      dword ptr [edx + 0x20], ecx
  0x10044808: movsx    eax, al
  0x1004480b: sete     cl
  0x1004480e: lea      ecx, [ecx + ecx + 1]
  0x10044812: cmp      eax, ecx
  0x10044814: jl       0x1004481c
  0x10044816: mov      byte ptr [edi + 0x24008f4], cl
  0x1004481c: mov      cl, byte ptr [edi + 0x24008f0]
  0x10044822: test     cl, cl