; CABAC Engine @ 0x100541c0 - 0x10054e30
; 1166 instructions

  0x100541c0: push     ebp
  0x100541c1: mov      ebp, esp
  0x100541c3: push     ecx
  0x100541c4: mov      ecx, dword ptr [eax]
  0x100541c6: push     edi
  0x100541c7: mov      edi, dword ptr [ecx + 0x18]
  0x100541ca: mov      eax, dword ptr [edi + 0xc]
  0x100541cd: mov      edx, eax
  0x100541cf: sar      edx, 3
  0x100541d2: add      edx, dword ptr [edi]
  0x100541d4: lea      ecx, [eax + esi]
  0x100541d7: mov      dword ptr [ebp - 4], ecx
  0x100541da: cmp      ecx, dword ptr [edi + 8]
  0x100541dd: jle      0x100541e7
  0x100541df: or       eax, 0xffffffff
  0x100541e2: pop      edi
  0x100541e3: mov      esp, ebp
  0x100541e5: pop      ebp
  0x100541e6: ret      
  0x100541e7: and      eax, 7
  0x100541ea: push     ebx
  0x100541eb: lea      ebx, [esi + eax]
  0x100541ee: mov      ecx, 8
  0x100541f3: cmp      ebx, ecx
  0x100541f5: jle      0x1005421e
  0x100541f7: movzx    eax, byte ptr [edx + 1]
  0x100541fb: movzx    edx, byte ptr [edx]
  0x100541fe: and      ebx, 7
  0x10054201: sub      cl, bl
  0x10054203: shr      eax, cl
  0x10054205: mov      ecx, ebx
  0x10054207: shl      edx, cl
  0x10054209: mov      ecx, dword ptr [ebp - 4]
  0x1005420c: pop      ebx
  0x1005420d: add      eax, edx
  0x1005420f: and      eax, dword ptr [esi*4 + 0x10602688]
  0x10054216: mov      dword ptr [edi + 0xc], ecx
  0x10054219: pop      edi
  0x1005421a: mov      esp, ebp
  0x1005421c: pop      ebp
  0x1005421d: ret      
  0x1005421e: movzx    eax, byte ptr [edx]
  0x10054221: sub      cl, bl
  0x10054223: shr      eax, cl
  0x10054225: mov      ecx, dword ptr [ebp - 4]
  0x10054228: pop      ebx
  0x10054229: and      eax, dword ptr [esi*4 + 0x10602688]
  0x10054230: mov      dword ptr [edi + 0xc], ecx
  0x10054233: pop      edi
  0x10054234: mov      esp, ebp
  0x10054236: pop      ebp
  0x10054237: ret      
  0x10054238: int3     
  0x10054239: int3     
  0x1005423a: int3     
  0x1005423b: int3     
  0x1005423c: int3     
  0x1005423d: int3     
  0x1005423e: int3     
  0x1005423f: int3     
  0x10054240: mov      ecx, dword ptr [eax]
  0x10054242: mov      eax, dword ptr [ecx + 0x18]
  0x10054245: mov      ecx, dword ptr [eax + 0xc]
  0x10054248: mov      edx, ecx
  0x1005424a: push     ebx
  0x1005424b: mov      ebx, ecx
  0x1005424d: sar      edx, 3
  0x10054250: add      edx, dword ptr [eax]
  0x10054252: inc      ecx
  0x10054253: and      ebx, 7
  0x10054256: mov      dword ptr [eax + 0xc], ecx
  0x10054259: cmp      ecx, dword ptr [eax + 8]
  0x1005425c: jle      0x10054267
  0x1005425e: dec      ecx
  0x1005425f: mov      dword ptr [eax + 0xc], ecx
  0x10054262: or       eax, 0xffffffff
  0x10054265: pop      ebx
  0x10054266: ret      
  0x10054267: cmp      ebx, 8
  0x1005426a: jl       0x10054275
  0x1005426c: movzx    eax, byte ptr [edx + 1]
  0x10054270: shr      eax, 7
  0x10054273: pop      ebx
  0x10054274: ret      
  0x10054275: movzx    eax, byte ptr [edx]
  0x10054278: mov      ecx, 7
  0x1005427d: sub      cl, bl
  0x1005427f: shr      eax, cl
  0x10054281: pop      ebx
  0x10054282: and      eax, 1
  0x10054285: ret      
  0x10054286: int3     
  0x10054287: int3     
  0x10054288: int3     
  0x10054289: int3     
  0x1005428a: int3     
  0x1005428b: int3     
  0x1005428c: int3     
  0x1005428d: int3     
  0x1005428e: int3     
  0x1005428f: int3     
  0x10054290: mov      ecx, dword ptr [eax]
  0x10054292: mov      eax, dword ptr [ecx + 0x18]
  0x10054295: mov      ecx, dword ptr [eax + 0xc]
  0x10054298: mov      edx, ecx
  0x1005429a: push     ebx
  0x1005429b: mov      ebx, ecx
  0x1005429d: sar      edx, 3
  0x100542a0: add      edx, dword ptr [eax]
  0x100542a2: add      ecx, 8
  0x100542a5: and      ebx, 7
  0x100542a8: mov      dword ptr [eax + 0xc], ecx
  0x100542ab: cmp      ecx, dword ptr [eax + 8]
  0x100542ae: jle      0x100542bd
  0x100542b0: add      ecx, -8
  0x100542b3: mov      dword ptr [eax + 0xc], ecx
  0x100542b6: mov      eax, 0x100
  0x100542bb: pop      ebx
  0x100542bc: ret      
  0x100542bd: test     ebx, ebx
  0x100542bf: jle      0x100542de
  0x100542c1: movzx    eax, byte ptr [edx + 1]
  0x100542c5: movzx    edx, byte ptr [edx]
  0x100542c8: mov      ecx, 8
  0x100542cd: sub      cl, bl
  0x100542cf: shr      eax, cl
  0x100542d1: mov      ecx, ebx
  0x100542d3: shl      edx, cl
  0x100542d5: pop      ebx
  0x100542d6: add      eax, edx
  0x100542d8: and      eax, 0xff
  0x100542dd: ret      
  0x100542de: movzx    eax, byte ptr [edx]
  0x100542e1: pop      ebx
  0x100542e2: ret      
  0x100542e3: int3     
  0x100542e4: int3     
  0x100542e5: int3     
  0x100542e6: int3     
  0x100542e7: int3     
  0x100542e8: int3     
  0x100542e9: int3     
  0x100542ea: int3     
  0x100542eb: int3     
  0x100542ec: int3     
  0x100542ed: int3     
  0x100542ee: int3     
  0x100542ef: int3     
  0x100542f0: push     ebp
  0x100542f1: mov      ebp, esp
  0x100542f3: push     ebx
  0x100542f4: mov      ebx, dword ptr [ebp + 8]
  0x100542f7: push     esi
  0x100542f8: push     edi
  0x100542f9: mov      edi, dword ptr [ebx + 0x570]
  0x100542ff: xor      esi, esi
  0x10054301: mov      dword ptr [edi + 0x28], esi
  0x10054304: mov      eax, ebx
  0x10054306: mov      dword ptr [edi + 0x24], 0xff
  0x1005430d: call     0x10054290
  0x10054312: mov      dword ptr [edi + 0x30], eax
  0x10054315: mov      eax, ebx
  0x10054317: call     0x10054240
  0x1005431c: mov      ecx, dword ptr [edi + 0x30]
  0x1005431f: add      ecx, ecx
  0x10054321: or       eax, ecx
  0x10054323: mov      dword ptr [edi + 0x30], eax
  0x10054326: mov      dword ptr [edi + 0x2c], esi
  0x10054329: mov      eax, dword ptr [edi + 0x30]
  0x1005432c: cmp      eax, 0x100
  0x10054331: jae      0x1005436b
  0x10054333: cmp      eax, 0xf
  0x10054336: jbe      0x10054347
  0x10054338: shr      eax, 4
  0x1005433b: movzx    edx, byte ptr [eax + 0x1072f20c]
  0x10054342: mov      dword ptr [edi + 0x2c], edx
  0x10054345: jmp      0x10054354
  0x10054347: movzx    eax, byte ptr [eax + 0x1072f20c]
  0x1005434e: add      eax, 4
  0x10054351: mov      dword ptr [edi + 0x2c], eax
  0x10054354: mov      esi, dword ptr [edi + 0x2c]
  0x10054357: mov      eax, ebx
  0x10054359: call     0x100541c0
  0x1005435e: mov      edx, dword ptr [edi + 0x30]
  0x10054361: mov      ecx, dword ptr [edi + 0x2c]
  0x10054364: shl      edx, cl
  0x10054366: or       eax, edx
  0x10054368: mov      dword ptr [edi + 0x30], eax
  0x1005436b: and      dword ptr [edi + 0x30], 0xff
  0x10054372: pop      edi
  0x10054373: pop      esi
  0x10054374: pop      ebx
  0x10054375: pop      ebp
  0x10054376: ret      
  0x10054377: int3     
  0x10054378: int3     
  0x10054379: int3     
  0x1005437a: int3     
  0x1005437b: int3     
  0x1005437c: int3     
  0x1005437d: int3     
  0x1005437e: int3     
  0x1005437f: int3     
  0x10054380: push     ebp
  0x10054381: mov      ebp, esp
  0x10054383: mov      ecx, dword ptr [ebp + 8]
  0x10054386: mov      eax, dword ptr [ebp + 0xc]
  0x10054389: sub      esp, 8
  0x1005438c: push     ebx
  0x1005438d: mov      ebx, dword ptr [eax]
  0x1005438f: push     esi
  0x10054390: push     edi
  0x10054391: mov      edi, dword ptr [ecx + 0x570]
  0x10054397: mov      ecx, dword ptr [edi + 0x24]
  0x1005439a: mov      edx, dword ptr [edi + 0x28]
  0x1005439d: mov      esi, dword ptr [edi + 0x2c]
  0x100543a0: shr      ebx, 2
  0x100543a3: cmp      ecx, ebx
  0x100543a5: jb       0x10054687
  0x100543ab: cmp      edx, esi
  0x100543ad: jae      0x10054416
  0x100543af: sub      ecx, ebx
  0x100543b1: mov      dword ptr [edi + 0x24], ecx
  0x100543b4: mov      ecx, dword ptr [eax + 8]
  0x100543b7: cmp      ecx, 3
  0x100543ba: jne      0x100543d8
  0x100543bc: mov      ecx, dword ptr [eax]
  0x100543be: mov      edx, ecx
  0x100543c0: shr      edx, 7
  0x100543c3: mov      esi, ecx
  0x100543c5: sub      esi, edx
  0x100543c7: shr      ecx, 5
  0x100543ca: sub      esi, ecx
  0x100543cc: pop      edi
  0x100543cd: mov      dword ptr [eax], esi
  0x100543cf: mov      eax, dword ptr [eax + 4]
  0x100543d2: pop      esi
  0x100543d3: pop      ebx
  0x100543d4: mov      esp, ebp
  0x100543d6: pop      ebp
  0x100543d7: ret      
  0x100543d8: cmp      ecx, 1
  0x100543db: mov      ecx, dword ptr [eax]
  0x100543dd: mov      esi, ecx
  0x100543df: mov      edx, ecx
  0x100543e1: ja       0x10054400
  0x100543e3: shr      edx, 5
  0x100543e6: sub      esi, edx
  0x100543e8: shr      ecx, 3
  0x100543eb: sub      esi, ecx
  0x100543ed: pop      edi
  0x100543ee: mov      dword ptr [eax], esi
  0x100543f0: pop      esi
  0x100543f1: mov      dword ptr [eax + 8], 1
  0x100543f8: mov      eax, dword ptr [eax + 4]
  0x100543fb: pop      ebx
  0x100543fc: mov      esp, ebp
  0x100543fe: pop      ebp
  0x100543ff: ret      
  0x10054400: shr      edx, 6
  0x10054403: sub      esi, edx
  0x10054405: shr      ecx, 4
  0x10054408: sub      esi, ecx
  0x1005440a: pop      edi
  0x1005440b: mov      dword ptr [eax], esi
  0x1005440d: mov      eax, dword ptr [eax + 4]
  0x10054410: pop      esi
  0x10054411: pop      ebx
  0x10054412: mov      esp, ebp
  0x10054414: pop      ebp
  0x10054415: ret      
  0x10054416: jbe      0x100545b0
  0x1005441c: cmp      ebx, 0x100
  0x10054422: jae      0x10054484
  0x10054424: cmp      ebx, 0xf
  0x10054427: jbe      0x10054472
  0x10054429: mov      eax, ebx
  0x1005442b: shr      eax, 4
  0x1005442e: movzx    esi, byte ptr [eax + 0x1072f20c]
  0x10054435: mov      dword ptr [ebp - 4], esi
  0x10054438: inc      esi
  0x10054439: mov      eax, dword ptr [ebp + 8]
  0x1005443c: call     0x100541c0
  0x10054441: mov      ecx, dword ptr [ebp - 4]
  0x10054444: mov      edx, ebx
  0x10054446: sub      edx, dword ptr [edi + 0x24]
  0x10054449: add      edx, 0x100
  0x1005444f: shl      edx, cl
  0x10054451: mov      ecx, esi
  0x10054453: add      eax, edx
  0x10054455: mov      edx, dword ptr [edi + 0x30]
  0x10054458: shl      edx, cl
  0x1005445a: mov      ecx, dword ptr [ebp - 4]
  0x1005445d: add      eax, edx
  0x1005445f: mov      dword ptr [edi + 0x30], eax
  0x10054462: mov      eax, ebx
  0x10054464: shl      eax, cl
  0x10054466: and      eax, 0xff
  0x1005446b: sub      eax, ebx
  0x1005446d: add      dword ptr [edi + 0x24], eax
  0x10054470: jmp      0x100544a9
  0x10054472: movzx    eax, byte ptr [ebx + 0x1072f20c]
  0x10054479: add      eax, 4
  0x1005447c: mov      dword ptr [ebp - 4], eax
  0x1005447f: lea      esi, [eax + 1]
  0x10054482: jmp      0x10054439
  0x10054484: mov      eax, dword ptr [ebp + 8]
  0x10054487: call     0x10054240
  0x1005448c: mov      ecx, dword ptr [edi + 0x30]
  0x1005448f: add      ecx, ecx
  0x10054491: or       eax, ecx
  0x10054493: sub      eax, dword ptr [edi + 0x24]
  0x10054496: lea      edx, [eax + ebx + 0x100]
  0x1005449d: and      ebx, 0xffffff00
  0x100544a3: mov      dword ptr [edi + 0x30], edx
  0x100544a6: sub      dword ptr [edi + 0x24], ebx
  0x100544a9: mov      dword ptr [edi + 0x28], 0
  0x100544b0: mov      eax, dword ptr [edi + 0x30]
  0x100544b3: xor      ecx, ecx
  0x100544b5: cmp      eax, ecx
  0x100544b7: je       0x100544f5
  0x100544b9: cmp      eax, 0x100
  0x100544be: jae      0x100544e9
  0x100544c0: cmp      eax, 0xf
  0x100544c3: jbe      0x100544d7
  0x100544c5: shr      eax, 4
  0x100544c8: movzx    esi, byte ptr [eax + 0x1072f20c]
  0x100544cf: mov      eax, dword ptr [ebp + 8]
  0x100544d2: mov      dword ptr [edi + 0x2c], esi
  0x100544d5: jmp      0x1005453b
  0x100544d7: movzx    esi, byte ptr [eax + 0x1072f20c]
  0x100544de: mov      eax, dword ptr [ebp + 8]
  0x100544e1: add      esi, 4
  0x100544e4: mov      dword ptr [edi + 0x2c], esi
  0x100544e7: jmp      0x1005453b
  0x100544e9: mov      dword ptr [edi + 0x2c], ecx
  0x100544ec: and      dword ptr [edi + 0x30], 0xff
  0x100544f3: jmp      0x10054551
  0x100544f5: mov      ebx, dword ptr [ebp + 8]
  0x100544f8: mov      dword ptr [edi + 0x2c], ecx
  0x100544fb: mov      esi, 8
  0x10054500: mov      eax, ebx
  0x10054502: call     0x10054290
  0x10054507: mov      dword ptr [edi + 0x30], eax
  0x1005450a: add      dword ptr [edi + 0x2c], esi
  0x1005450d: cmp      dword ptr [edi + 0x30], 0
  0x10054511: mov      ecx, dword ptr [edi + 0x2c]
  0x10054514: je       0x10054500
  0x10054516: mov      eax, dword ptr [edi + 0x30]
  0x10054519: cmp      eax, 0xf
  0x1005451c: jbe      0x1005452a
  0x1005451e: shr      eax, 4
  0x10054521: movzx    esi, byte ptr [eax + 0x1072f20c]
  0x10054528: jmp      0x10054534
  0x1005452a: movzx    esi, byte ptr [eax + 0x1072f20c]
  0x10054531: add      esi, 4
  0x10054534: add      ecx, esi
  0x10054536: mov      eax, ebx
  0x10054538: mov      dword ptr [edi + 0x2c], ecx
  0x1005453b: call     0x100541c0
  0x10054540: mov      edx, dword ptr [edi + 0x30]
  0x10054543: mov      ecx, esi
  0x10054545: shl      edx, cl
  0x10054547: or       eax, edx
  0x10054549: and      eax, 0xff
  0x1005454e: mov      dword ptr [edi + 0x30], eax
  0x10054551: mov      ecx, dword ptr [ebp + 0xc]
  0x10054554: mov      eax, dword ptr [ecx + 8]
  0x10054557: cmp      eax, 3
  0x1005455a: jb       0x10054568
  0x1005455c: add      dword ptr [ecx], 0x2e
  0x1005455f: mov      dword ptr [ecx + 8], 3
  0x10054566: jmp      0x1005457d
  0x10054568: cmp      eax, 1
  0x1005456b: ja       0x10054576
  0x1005456d: inc      eax
  0x1005456e: add      dword ptr [ecx], 0xc5
  0x10054574: jmp      0x1005457a
  0x10054576: inc      eax
  0x10054577: add      dword ptr [ecx], 0x5f
  0x1005457a: mov      dword ptr [ecx + 8], eax
  0x1005457d: mov      eax, dword ptr [ecx]
  0x1005457f: cmp      eax, 0x400
  0x10054584: jb       0x100545a1
  0x10054586: mov      edx, 0x7ff
  0x1005458b: sub      edx, eax
  0x1005458d: xor      eax, eax
  0x1005458f: cmp      dword ptr [ecx + 4], eax
  0x10054592: pop      edi
  0x10054593: sete     al
  0x10054596: pop      esi
  0x10054597: mov      dword ptr [ecx], edx
  0x10054599: pop      ebx
  0x1005459a: mov      dword ptr [ecx + 4], eax
  0x1005459d: mov      esp, ebp
  0x1005459f: pop      ebp
  0x100545a0: ret      
  0x100545a1: xor      eax, eax
  0x100545a3: cmp      dword ptr [ecx + 4], eax
  0x100545a6: pop      edi
  0x100545a7: pop      esi
  0x100545a8: sete     al
  0x100545ab: pop      ebx
  0x100545ac: mov      esp, ebp
  0x100545ae: pop      ebp
  0x100545af: ret      
  0x100545b0: sub      ecx, ebx
  0x100545b2: mov      dword ptr [edi + 0x24], ecx
  0x100545b5: mov      edx, dword ptr [edi + 0x30]
  0x100545b8: cmp      edx, ecx
  0x100545ba: jae      0x100545cd
  0x100545bc: mov      ecx, dword ptr [eax + 8]
  0x100545bf: cmp      ecx, 3
  0x100545c2: je       0x100543bc
  0x100545c8: jmp      0x100543d8
  0x100545cd: sub      edx, ecx
  0x100545cf: mov      dword ptr [edi + 0x30], edx
  0x100545d2: cmp      ebx, 0x100
  0x100545d8: jae      0x10054637
  0x100545da: cmp      ebx, 0xf
  0x100545dd: jbe      0x1005460c
  0x100545df: mov      eax, ebx
  0x100545e1: shr      eax, 4
  0x100545e4: movzx    esi, byte ptr [eax + 0x1072f20c]
  0x100545eb: mov      eax, dword ptr [ebp + 8]
  0x100545ee: call     0x100541c0
  0x100545f3: mov      edx, dword ptr [edi + 0x30]
  0x100545f6: mov      ecx, esi
  0x100545f8: shl      edx, cl
  0x100545fa: shl      ebx, cl
  0x100545fc: or       eax, edx
  0x100545fe: and      ebx, 0xff
  0x10054604: mov      dword ptr [edi + 0x30], eax
  0x10054607: mov      dword ptr [edi + 0x24], ebx
  0x1005460a: jmp      0x1005463d
  0x1005460c: movzx    esi, byte ptr [ebx + 0x1072f20c]
  0x10054613: mov      eax, dword ptr [ebp + 8]
  0x10054616: add      esi, 4
  0x10054619: call     0x100541c0
  0x1005461e: mov      edx, dword ptr [edi + 0x30]
  0x10054621: mov      ecx, esi
  0x10054623: shl      edx, cl
  0x10054625: shl      ebx, cl
  0x10054627: or       eax, edx
  0x10054629: and      ebx, 0xff
  0x1005462f: mov      dword ptr [edi + 0x30], eax
  0x10054632: mov      dword ptr [edi + 0x24], ebx
  0x10054635: jmp      0x1005463d
  0x10054637: movzx    eax, bl
  0x1005463a: mov      dword ptr [edi + 0x24], eax
  0x1005463d: mov      dword ptr [edi + 0x28], 0
  0x10054644: mov      eax, dword ptr [edi + 0x30]
  0x10054647: xor      ebx, ebx
  0x10054649: cmp      eax, ebx
  0x1005464b: jne      0x10054828
  0x10054651: mov      dword ptr [edi + 0x2c], ebx
  0x10054654: lea      esi, [ebx + 8]
  0x10054657: mov      eax, dword ptr [ebp + 8]
  0x1005465a: call     0x10054290
  0x1005465f: mov      dword ptr [edi + 0x30], eax
  0x10054662: add      dword ptr [edi + 0x2c], esi
  0x10054665: mov      ecx, dword ptr [edi + 0x2c]
  0x10054668: cmp      dword ptr [edi + 0x30], ebx
  0x1005466b: je       0x10054657
  0x1005466d: jmp      0x1005487c
  0x10054672: cmp      eax, 1
  0x10054675: ja       0x100548d3
  0x1005467b: inc      eax
  0x1005467c: add      dword ptr [ecx], 0xc5
  0x10054682: jmp      0x100548d7
  0x10054687: inc      edx
  0x10054688: mov      dword ptr [ebp - 8], edx
  0x1005468b: cmp      edx, esi
  0x1005468d: jae      0x100546a1
  0x1005468f: mov      ecx, 0x100
  0x10054694: sub      ecx, ebx
  0x10054696: mov      dword ptr [edi + 0x28], edx
  0x10054699: add      dword ptr [edi + 0x24], ecx
  0x1005469c: jmp      0x100543b4
  0x100546a1: jbe      0x1005478b
  0x100546a7: lea      eax, [ecx + ebx]
  0x100546aa: mov      dword ptr [ebp - 8], eax
  0x100546ad: cmp      eax, 0x100
  0x100546b2: jae      0x10054708
  0x100546b4: cmp      eax, 0xf
  0x100546b7: jbe      0x100546fc
  0x100546b9: shr      eax, 4
  0x100546bc: movzx    eax, byte ptr [eax + 0x1072f20c]
  0x100546c3: mov      dword ptr [ebp - 4], eax
  0x100546c6: lea      esi, [eax + 1]
  0x100546c9: mov      eax, dword ptr [ebp + 8]
  0x100546cc: call     0x100541c0
  0x100546d1: sub      ebx, dword ptr [edi + 0x24]
  0x100546d4: mov      edx, eax
  0x100546d6: mov      eax, dword ptr [ebp - 4]
  0x100546d9: mov      ecx, eax
  0x100546db: shl      ebx, cl
  0x100546dd: mov      ecx, esi
  0x100546df: add      edx, ebx
  0x100546e1: mov      ebx, dword ptr [edi + 0x30]
  0x100546e4: shl      ebx, cl
  0x100546e6: mov      ecx, eax
  0x100546e8: mov      eax, dword ptr [ebp - 8]
  0x100546eb: shl      eax, cl
  0x100546ed: add      edx, ebx
  0x100546ef: mov      dword ptr [edi + 0x30], edx
  0x100546f2: and      eax, 0xff
  0x100546f7: mov      dword ptr [edi + 0x24], eax
  0x100546fa: jmp      0x10054726
  0x100546fc: movzx    eax, byte ptr [eax + 0x1072f20c]
  0x10054703: add      eax, 4
  0x10054706: jmp      0x100546c3
  0x10054708: mov      eax, dword ptr [ebp + 8]
  0x1005470b: call     0x10054240
  0x10054710: mov      ecx, dword ptr [edi + 0x30]
  0x10054713: movzx    edx, byte ptr [ebp - 8]
  0x10054717: add      ecx, ecx
  0x10054719: or       eax, ecx
  0x1005471b: sub      eax, dword ptr [edi + 0x24]
  0x1005471e: add      eax, ebx
  0x10054720: mov      dword ptr [edi + 0x30], eax
  0x10054723: mov      dword ptr [edi + 0x24], edx
  0x10054726: mov      dword ptr [edi + 0x28], 0
  0x1005472d: mov      eax, dword ptr [edi + 0x30]
  0x10054730: xor      ecx, ecx
  0x10054732: cmp      eax, ecx
  0x10054734: je       0x1005475f
  0x10054736: cmp      eax, 0x100
  0x1005473b: jae      0x100544e9
  0x10054741: cmp      eax, 0xf
  0x10054744: ja       0x100544c5
  0x1005474a: movzx    esi, byte ptr [eax + 0x1072f20c]
  0x10054751: mov      eax, dword ptr [ebp + 8]
  0x10054754: add      esi, 4
  0x10054757: mov      dword ptr [edi + 0x2c], esi
  0x1005475a: jmp      0x1005453b
  0x1005475f: mov      ebx, dword ptr [ebp + 8]
  0x10054762: mov      dword ptr [edi + 0x2c], ecx
  0x10054765: mov      esi, 8
  0x1005476a: lea      ebx, [ebx]
  0x10054770: mov      eax, ebx
  0x10054772: call     0x10054290
  0x10054777: mov      dword ptr [edi + 0x30], eax
  0x1005477a: add      dword ptr [edi + 0x2c], esi
  0x1005477d: cmp      dword ptr [edi + 0x30], 0
  0x10054781: mov      ecx, dword ptr [edi + 0x2c]
  0x10054784: je       0x10054770
  0x10054786: jmp      0x10054516
  0x1005478b: mov      edx, dword ptr [edi + 0x30]
  0x1005478e: mov      esi, ecx
  0x10054790: sub      esi, ebx
  0x10054792: add      esi, 0x100
  0x10054798: cmp      edx, esi
  0x1005479a: jae      0x100547b1
  0x1005479c: mov      ecx, dword ptr [ebp - 8]
  0x1005479f: mov      edx, 0x100
  0x100547a4: sub      edx, ebx
  0x100547a6: mov      dword ptr [edi + 0x28], ecx
  0x100547a9: add      dword ptr [edi + 0x24], edx
  0x100547ac: jmp      0x100543b4
  0x100547b1: lea      eax, [ecx + ebx]
  0x100547b4: mov      dword ptr [ebp - 8], eax
  0x100547b7: cmp      eax, 0x100
  0x100547bc: jae      0x10054806
  0x100547be: cmp      eax, 0xf
  0x100547c1: jbe      0x100547fa
  0x100547c3: shr      eax, 4
  0x100547c6: movzx    esi, byte ptr [eax + 0x1072f20c]
  0x100547cd: mov      eax, dword ptr [ebp + 8]
  0x100547d0: call     0x100541c0
  0x100547d5: mov      ecx, dword ptr [edi + 0x30]
  0x100547d8: sub      ecx, dword ptr [edi + 0x24]
  0x100547db: lea      edx, [ecx + ebx - 0x100]
  0x100547e2: mov      ecx, esi
  0x100547e4: shl      edx, cl
  0x100547e6: or       eax, edx
  0x100547e8: mov      dword ptr [edi + 0x30], eax
  0x100547eb: mov      eax, dword ptr [ebp - 8]
  0x100547ee: shl      eax, cl
  0x100547f0: and      eax, 0xff
  0x100547f5: mov      dword ptr [edi + 0x24], eax
  0x100547f8: jmp      0x10054818
  0x100547fa: movzx    esi, byte ptr [eax + 0x1072f20c]
  0x10054801: add      esi, 4
  0x10054804: jmp      0x100547cd
  0x10054806: sub      edx, ecx
  0x10054808: lea      ecx, [edx + ebx - 0x100]
  0x1005480f: movzx    edx, al
  0x10054812: mov      dword ptr [edi + 0x30], ecx
  0x10054815: mov      dword ptr [edi + 0x24], edx
  0x10054818: mov      dword ptr [edi + 0x28], 0
  0x1005481f: mov      eax, dword ptr [edi + 0x30]
  0x10054822: xor      ebx, ebx
  0x10054824: cmp      eax, ebx
  0x10054826: je       0x1005485e
  0x10054828: cmp      eax, 0x100
  0x1005482d: jae      0x10054852
  0x1005482f: cmp      eax, 0xf
  0x10054832: jbe      0x10054843
  0x10054834: shr      eax, 4
  0x10054837: movzx    esi, byte ptr [eax + 0x1072f20c]
  0x1005483e: mov      dword ptr [edi + 0x2c], esi
  0x10054841: jmp      0x1005489f
  0x10054843: movzx    esi, byte ptr [eax + 0x1072f20c]
  0x1005484a: add      esi, 4
  0x1005484d: mov      dword ptr [edi + 0x2c], esi
  0x10054850: jmp      0x1005489f
  0x10054852: mov      dword ptr [edi + 0x2c], ebx
  0x10054855: and      dword ptr [edi + 0x30], 0xff
  0x1005485c: jmp      0x100548b8
  0x1005485e: mov      dword ptr [edi + 0x2c], ebx
  0x10054861: mov      esi, 8
  0x10054866: mov      eax, dword ptr [ebp + 8]
  0x10054869: call     0x10054290
  0x1005486e: mov      dword ptr [edi + 0x30], eax
  0x10054871: add      dword ptr [edi + 0x2c], esi
  0x10054874: mov      ecx, dword ptr [edi + 0x2c]
  0x10054877: cmp      dword ptr [edi + 0x30], ebx
  0x1005487a: je       0x10054866
  0x1005487c: mov      eax, dword ptr [edi + 0x30]
  0x1005487f: cmp      eax, 0xf
  0x10054882: jbe      0x10054890
  0x10054884: shr      eax, 4
  0x10054887: movzx    esi, byte ptr [eax + 0x1072f20c]
  0x1005488e: jmp      0x1005489a
  0x10054890: movzx    esi, byte ptr [eax + 0x1072f20c]
  0x10054897: add      esi, 4
  0x1005489a: add      ecx, esi
  0x1005489c: mov      dword ptr [edi + 0x2c], ecx
  0x1005489f: mov      eax, dword ptr [ebp + 8]
  0x100548a2: call     0x100541c0
  0x100548a7: mov      edx, dword ptr [edi + 0x30]
  0x100548aa: mov      ecx, esi
  0x100548ac: shl      edx, cl
  0x100548ae: or       eax, edx
  0x100548b0: and      eax, 0xff
  0x100548b5: mov      dword ptr [edi + 0x30], eax
  0x100548b8: mov      ecx, dword ptr [ebp + 0xc]
  0x100548bb: mov      eax, dword ptr [ecx + 8]
  0x100548be: cmp      eax, 3
  0x100548c1: jb       0x10054672
  0x100548c7: add      dword ptr [ecx], 0x2e
  0x100548ca: mov      dword ptr [ecx + 8], 3
  0x100548d1: jmp      0x100548da
  0x100548d3: inc      eax
  0x100548d4: add      dword ptr [ecx], 0x5f
  0x100548d7: mov      dword ptr [ecx + 8], eax
  0x100548da: mov      eax, dword ptr [ecx]
  0x100548dc: cmp      eax, 0x400
  0x100548e1: jb       0x100548fe
  0x100548e3: mov      edx, 0x7ff
  0x100548e8: sub      edx, eax
  0x100548ea: xor      eax, eax
  0x100548ec: cmp      dword ptr [ecx + 4], ebx
  0x100548ef: pop      edi
  0x100548f0: sete     al
  0x100548f3: pop      esi
  0x100548f4: mov      dword ptr [ecx], edx
  0x100548f6: pop      ebx
  0x100548f7: mov      dword ptr [ecx + 4], eax
  0x100548fa: mov      esp, ebp
  0x100548fc: pop      ebp
  0x100548fd: ret      
  0x100548fe: xor      eax, eax
  0x10054900: cmp      dword ptr [ecx + 4], ebx
  0x10054903: pop      edi
  0x10054904: pop      esi
  0x10054905: sete     al
  0x10054908: pop      ebx
  0x10054909: mov      esp, ebp
  0x1005490b: pop      ebp
  0x1005490c: ret      
  0x1005490d: int3     
  0x1005490e: int3     
  0x1005490f: int3     
  0x10054910: push     ebp
  0x10054911: mov      ebp, esp
  0x10054913: mov      edx, dword ptr [ebp + 8]
  0x10054916: push     ebx
  0x10054917: push     esi
  0x10054918: push     edi
  0x10054919: mov      edi, dword ptr [edx + 0x570]
  0x1005491f: mov      eax, dword ptr [edi + 0x24]
  0x10054922: cmp      eax, 1
  0x10054925: jb       0x10054932
  0x10054927: dec      eax
  0x10054928: mov      ebx, 1
  0x1005492d: mov      dword ptr [edi + 0x24], eax
  0x10054930: jmp      0x1005493f
  0x10054932: inc      dword ptr [edi + 0x28]
  0x10054935: add      dword ptr [edi + 0x24], 0xff
  0x1005493c: lea      ebx, [eax + 1]
  0x1005493f: mov      eax, dword ptr [edi + 0x28]
  0x10054942: mov      ecx, dword ptr [edi + 0x2c]
  0x10054945: cmp      eax, ecx
  0x10054947: ja       0x10054966
  0x10054949: jne      0x10054953
  0x1005494b: mov      esi, dword ptr [edi + 0x30]
  0x1005494e: cmp      esi, dword ptr [edi + 0x24]
  0x10054951: jae      0x1005495a
  0x10054953: pop      edi
  0x10054954: pop      esi
  0x10054955: xor      eax, eax
  0x10054957: pop      ebx
  0x10054958: pop      ebp
  0x10054959: ret      
  0x1005495a: cmp      eax, ecx
  0x1005495c: jne      0x10054966
  0x1005495e: mov      eax, dword ptr [edi + 0x24]
  0x10054961: sub      dword ptr [edi + 0x30], eax
  0x10054964: jmp      0x1005497f
  0x10054966: mov      eax, edx
  0x10054968: call     0x10054240
  0x1005496d: mov      ecx, dword ptr [edi + 0x30]
  0x10054970: add      ecx, ecx
  0x10054972: or       eax, ecx
  0x10054974: sub      eax, dword ptr [edi + 0x24]
  0x10054977: add      eax, 0x100
  0x1005497c: mov      dword ptr [edi + 0x30], eax
  0x1005497f: cmp      ebx, 0x100
  0x10054985: jae      0x100549bc
  0x10054987: cmp      ebx, 0xf
  0x1005498a: jbe      0x1005499a
  0x1005498c: mov      edx, ebx
  0x1005498e: shr      edx, 4
  0x10054991: movzx    esi, byte ptr [edx + 0x1072f20c]
  0x10054998: jmp      0x100549a4
  0x1005499a: movzx    esi, byte ptr [ebx + 0x1072f20c]
  0x100549a1: add      esi, 4
  0x100549a4: mov      eax, dword ptr [ebp + 8]
  0x100549a7: mov      ecx, esi
  0x100549a9: shl      ebx, cl
  0x100549ab: call     0x100541c0
  0x100549b0: mov      edx, dword ptr [edi + 0x30]
  0x100549b3: mov      ecx, esi
  0x100549b5: shl      edx, cl
  0x100549b7: or       eax, edx
  0x100549b9: mov      dword ptr [edi + 0x30], eax
  0x100549bc: xor      esi, esi
  0x100549be: movzx    eax, bl
  0x100549c1: mov      dword ptr [edi + 0x28], esi
  0x100549c4: mov      dword ptr [edi + 0x24], eax
  0x100549c7: mov      dword ptr [edi + 0x2c], esi
  0x100549ca: cmp      dword ptr [edi + 0x30], esi
  0x100549cd: jne      0x100549e5
  0x100549cf: lea      ebx, [esi + 8]
  0x100549d2: mov      eax, dword ptr [ebp + 8]
  0x100549d5: call     0x10054290
  0x100549da: mov      dword ptr [edi + 0x30], eax
  0x100549dd: add      dword ptr [edi + 0x2c], ebx
  0x100549e0: cmp      dword ptr [edi + 0x30], esi
  0x100549e3: je       0x100549d2
  0x100549e5: mov      eax, dword ptr [edi + 0x30]
  0x100549e8: cmp      eax, 0x100
  0x100549ed: jae      0x10054a21
  0x100549ef: cmp      eax, 0xf
  0x100549f2: jbe      0x10054a00
  0x100549f4: shr      eax, 4
  0x100549f7: movzx    esi, byte ptr [eax + 0x1072f20c]
  0x100549fe: jmp      0x10054a0a
  0x10054a00: movzx    esi, byte ptr [eax + 0x1072f20c]
  0x10054a07: add      esi, 4
  0x10054a0a: mov      eax, dword ptr [ebp + 8]
  0x10054a0d: add      dword ptr [edi + 0x2c], esi
  0x10054a10: call     0x100541c0
  0x10054a15: mov      edx, dword ptr [edi + 0x30]
  0x10054a18: mov      ecx, esi
  0x10054a1a: shl      edx, cl
  0x10054a1c: or       eax, edx
  0x10054a1e: mov      dword ptr [edi + 0x30], eax
  0x10054a21: and      dword ptr [edi + 0x30], 0xff
  0x10054a28: pop      edi
  0x10054a29: pop      esi
  0x10054a2a: mov      eax, 1
  0x10054a2f: pop      ebx
  0x10054a30: pop      ebp
  0x10054a31: ret      
  0x10054a32: int3     
  0x10054a33: int3     
  0x10054a34: int3     
  0x10054a35: int3     
  0x10054a36: int3     
  0x10054a37: int3     
  0x10054a38: int3     
  0x10054a39: int3     
  0x10054a3a: int3     
  0x10054a3b: int3     
  0x10054a3c: int3     
  0x10054a3d: int3     
  0x10054a3e: int3     
  0x10054a3f: int3     
  0x10054a40: push     ebp
  0x10054a41: mov      ebp, esp
  0x10054a43: sub      esp, 0xc
  0x10054a46: mov      eax, dword ptr [ebp + 8]
  0x10054a49: push     ebx
  0x10054a4a: mov      ebx, dword ptr [ebp + 0xc]
  0x10054a4d: push     esi
  0x10054a4e: mov      esi, dword ptr [ebp + 0x10]
  0x10054a51: mov      ecx, dword ptr [esi + 4]
  0x10054a54: push     edi
  0x10054a55: mov      edi, dword ptr [eax + 0x570]
  0x10054a5b: mov      eax, dword ptr [ebx + 4]
  0x10054a5e: mov      dword ptr [ebp - 8], eax
  0x10054a61: mov      dword ptr [ebp - 0xc], ecx
  0x10054a64: cmp      eax, ecx
  0x10054a66: jne      0x10054a74
  0x10054a68: mov      dword ptr [ebp - 4], eax
  0x10054a6b: mov      eax, dword ptr [ebx]
  0x10054a6d: add      eax, dword ptr [esi]
  0x10054a6f: shr      eax, 3
  0x10054a72: jmp      0x10054aa0
  0x10054a74: mov      ecx, dword ptr [ebx]
  0x10054a76: mov      edx, dword ptr [esi]
  0x10054a78: cmp      ecx, edx
  0x10054a7a: jae      0x10054a8c
  0x10054a7c: sub      edx, ecx
  0x10054a7e: mov      dword ptr [ebp - 4], eax
  0x10054a81: shr      edx, 1
  0x10054a83: mov      eax, 0x3ff
  0x10054a88: sub      eax, edx
  0x10054a8a: jmp      0x10054a9d
  0x10054a8c: mov      eax, dword ptr [ebp - 0xc]
  0x10054a8f: sub      ecx, edx
  0x10054a91: mov      dword ptr [ebp - 4], eax
  0x10054a94: shr      ecx, 1
  0x10054a96: mov      eax, 0x3ff
  0x10054a9b: sub      eax, ecx
  0x10054a9d: shr      eax, 2
  0x10054aa0: mov      ecx, dword ptr [edi + 0x24]
  0x10054aa3: cmp      ecx, eax
  0x10054aa5: jb       0x10054ab3
  0x10054aa7: mov      edx, eax
  0x10054aa9: sub      ecx, eax
  0x10054aab: mov      dword ptr [ebp + 0xc], edx
  0x10054aae: mov      dword ptr [edi + 0x24], ecx
  0x10054ab1: jmp      0x10054ac8
  0x10054ab3: inc      dword ptr [edi + 0x28]
  0x10054ab6: add      ecx, eax
  0x10054ab8: mov      dword ptr [ebp + 0xc], ecx
  0x10054abb: mov      edx, dword ptr [ebp + 0xc]
  0x10054abe: mov      ecx, 0x100
  0x10054ac3: sub      ecx, eax
  0x10054ac5: add      dword ptr [edi + 0x24], ecx
  0x10054ac8: mov      eax, dword ptr [edi + 0x28]
  0x10054acb: mov      ecx, dword ptr [edi + 0x2c]
  0x10054ace: cmp      eax, ecx
  0x10054ad0: ja       0x10054ae4
  0x10054ad2: jne      0x10054bd8
  0x10054ad8: mov      eax, dword ptr [edi + 0x30]
  0x10054adb: cmp      eax, dword ptr [edi + 0x24]
  0x10054ade: jb       0x10054bd8
  0x10054ae4: mov      eax, dword ptr [edi + 0x28]
  0x10054ae7: xor      ecx, ecx
  0x10054ae9: cmp      dword ptr [ebp - 4], ecx
  0x10054aec: sete     cl
  0x10054aef: mov      dword ptr [ebp - 4], ecx
  0x10054af2: cmp      eax, dword ptr [edi + 0x2c]
  0x10054af5: jne      0x10054aff
  0x10054af7: mov      eax, dword ptr [edi + 0x24]
  0x10054afa: sub      dword ptr [edi + 0x30], eax
  0x10054afd: jmp      0x10054b1c
  0x10054aff: mov      eax, dword ptr [ebp + 8]
  0x10054b02: call     0x10054240
  0x10054b07: mov      ecx, dword ptr [edi + 0x30]
  0x10054b0a: mov      edx, dword ptr [ebp + 0xc]
  0x10054b0d: add      ecx, ecx
  0x10054b0f: or       eax, ecx
  0x10054b11: sub      eax, dword ptr [edi + 0x24]
  0x10054b14: add      eax, 0x100
  0x10054b19: mov      dword ptr [edi + 0x30], eax
  0x10054b1c: cmp      edx, 0x100
  0x10054b22: jae      0x10054b62
  0x10054b24: cmp      edx, 0xf
  0x10054b27: jbe      0x10054b37
  0x10054b29: mov      eax, edx
  0x10054b2b: shr      eax, 4
  0x10054b2e: movzx    esi, byte ptr [eax + 0x1072f20c]
  0x10054b35: jmp      0x10054b41
  0x10054b37: movzx    esi, byte ptr [edx + 0x1072f20c]
  0x10054b3e: add      esi, 4
  0x10054b41: mov      eax, dword ptr [ebp + 8]
  0x10054b44: mov      ecx, esi
  0x10054b46: shl      edx, cl
  0x10054b48: mov      dword ptr [ebp + 0xc], edx
  0x10054b4b: call     0x100541c0
  0x10054b50: mov      edx, dword ptr [edi + 0x30]
  0x10054b53: mov      ecx, esi
  0x10054b55: mov      esi, dword ptr [ebp + 0x10]
  0x10054b58: shl      edx, cl
  0x10054b5a: or       eax, edx
  0x10054b5c: mov      edx, dword ptr [ebp + 0xc]
  0x10054b5f: mov      dword ptr [edi + 0x30], eax
  0x10054b62: xor      eax, eax
  0x10054b64: movzx    ecx, dl
  0x10054b67: mov      dword ptr [edi + 0x28], eax
  0x10054b6a: mov      dword ptr [edi + 0x24], ecx
  0x10054b6d: mov      dword ptr [edi + 0x2c], eax
  0x10054b70: cmp      dword ptr [edi + 0x30], eax
  0x10054b73: jne      0x10054b92
  0x10054b75: mov      eax, dword ptr [ebp + 8]
  0x10054b78: call     0x10054290
  0x10054b7d: mov      edx, dword ptr [edi + 0x30]
  0x10054b80: shl      edx, 8
  0x10054b83: add      eax, edx
  0x10054b85: mov      dword ptr [edi + 0x30], eax
  0x10054b88: add      dword ptr [edi + 0x2c], 8
  0x10054b8c: cmp      dword ptr [edi + 0x30], 0
  0x10054b90: je       0x10054b75
  0x10054b92: mov      eax, dword ptr [edi + 0x30]
  0x10054b95: cmp      eax, 0x100
  0x10054b9a: jae      0x10054bd1
  0x10054b9c: cmp      eax, 0xf
  0x10054b9f: jbe      0x10054bad
  0x10054ba1: shr      eax, 4
  0x10054ba4: movzx    esi, byte ptr [eax + 0x1072f20c]
  0x10054bab: jmp      0x10054bb7
  0x10054bad: movzx    esi, byte ptr [eax + 0x1072f20c]
  0x10054bb4: add      esi, 4
  0x10054bb7: mov      eax, dword ptr [ebp + 8]
  0x10054bba: add      dword ptr [edi + 0x2c], esi
  0x10054bbd: call     0x100541c0
  0x10054bc2: mov      edx, dword ptr [edi + 0x30]
  0x10054bc5: mov      ecx, esi
  0x10054bc7: mov      esi, dword ptr [ebp + 0x10]
  0x10054bca: shl      edx, cl
  0x10054bcc: or       eax, edx
  0x10054bce: mov      dword ptr [edi + 0x30], eax
  0x10054bd1: and      dword ptr [edi + 0x30], 0xff
  0x10054bd8: mov      eax, dword ptr [ebp - 4]
  0x10054bdb: mov      ecx, dword ptr [ebx + 8]
  0x10054bde: cmp      eax, dword ptr [ebp - 8]
  0x10054be1: jne      0x10054c2a
  0x10054be3: cmp      ecx, 1
  0x10054be6: ja       0x10054c03
  0x10054be8: mov      ecx, dword ptr [ebx]
  0x10054bea: mov      edx, ecx
  0x10054bec: shr      edx, 5
  0x10054bef: mov      edi, ecx
  0x10054bf1: sub      edi, edx
  0x10054bf3: shr      ecx, 3
  0x10054bf6: sub      edi, ecx
  0x10054bf8: mov      dword ptr [ebx + 8], 1
  0x10054bff: mov      dword ptr [ebx], edi
  0x10054c01: jmp      0x10054c71
  0x10054c03: cmp      ecx, 2
  0x10054c06: mov      ecx, dword ptr [ebx]
  0x10054c08: mov      edx, ecx
  0x10054c0a: mov      edi, ecx
  0x10054c0c: jne      0x10054c1c
  0x10054c0e: shr      edx, 6
  0x10054c11: sub      edi, edx
  0x10054c13: shr      ecx, 4
  0x10054c16: sub      edi, ecx
  0x10054c18: mov      dword ptr [ebx], edi
  0x10054c1a: jmp      0x10054c71
  0x10054c1c: shr      edx, 7
  0x10054c1f: sub      edi, edx
  0x10054c21: shr      ecx, 5
  0x10054c24: sub      edi, ecx
  0x10054c26: mov      dword ptr [ebx], edi
  0x10054c28: jmp      0x10054c71
  0x10054c2a: cmp      ecx, 2
  0x10054c2d: ja       0x10054c49
  0x10054c2f: cmp      ecx, 1
  0x10054c32: ja       0x10054c40
  0x10054c34: add      dword ptr [ebx], 0xc5
  0x10054c3a: inc      ecx
  0x10054c3b: mov      dword ptr [ebx + 8], ecx
  0x10054c3e: jmp      0x10054c53
  0x10054c40: add      dword ptr [ebx], 0x5f
  0x10054c43: inc      ecx
  0x10054c44: mov      dword ptr [ebx + 8], ecx
  0x10054c47: jmp      0x10054c53
  0x10054c49: add      dword ptr [ebx], 0x2e
  0x10054c4c: mov      dword ptr [ebx + 8], 3
  0x10054c53: mov      ecx, dword ptr [ebx]
  0x10054c55: cmp      ecx, 0x400
  0x10054c5b: jb       0x10054c71
  0x10054c5d: mov      edx, 0x7ff
  0x10054c62: sub      edx, ecx
  0x10054c64: xor      ecx, ecx
  0x10054c66: cmp      dword ptr [ebx + 4], ecx
  0x10054c69: mov      dword ptr [ebx], edx
  0x10054c6b: sete     cl
  0x10054c6e: mov      dword ptr [ebx + 4], ecx
  0x10054c71: mov      ecx, dword ptr [esi + 8]
  0x10054c74: cmp      eax, dword ptr [ebp - 0xc]
  0x10054c77: jne      0x10054ccf
  0x10054c79: cmp      ecx, 1
  0x10054c7c: ja       0x10054c9e
  0x10054c7e: mov      ecx, dword ptr [esi]
  0x10054c80: mov      edx, ecx
  0x10054c82: shr      edx, 5
  0x10054c85: mov      edi, ecx
  0x10054c87: sub      edi, edx
  0x10054c89: shr      ecx, 3
  0x10054c8c: sub      edi, ecx
  0x10054c8e: mov      dword ptr [esi], edi
  0x10054c90: pop      edi
  0x10054c91: mov      dword ptr [esi + 8], 1
  0x10054c98: pop      esi
  0x10054c99: pop      ebx
  0x10054c9a: mov      esp, ebp
  0x10054c9c: pop      ebp
  0x10054c9d: ret      
  0x10054c9e: cmp      ecx, 2
  0x10054ca1: mov      ecx, dword ptr [esi]
  0x10054ca3: mov      edx, ecx
  0x10054ca5: mov      edi, ecx
  0x10054ca7: jne      0x10054cbc
  0x10054ca9: shr      edx, 6
  0x10054cac: sub      edi, edx
  0x10054cae: shr      ecx, 4
  0x10054cb1: sub      edi, ecx
  0x10054cb3: mov      dword ptr [esi], edi
  0x10054cb5: pop      edi
  0x10054cb6: pop      esi
  0x10054cb7: pop      ebx
  0x10054cb8: mov      esp, ebp
  0x10054cba: pop      ebp
  0x10054cbb: ret      
  0x10054cbc: shr      edx, 7
  0x10054cbf: sub      edi, edx
  0x10054cc1: shr      ecx, 5
  0x10054cc4: sub      edi, ecx
  0x10054cc6: mov      dword ptr [esi], edi
  0x10054cc8: pop      edi
  0x10054cc9: pop      esi
  0x10054cca: pop      ebx
  0x10054ccb: mov      esp, ebp
  0x10054ccd: pop      ebp
  0x10054cce: ret      
  0x10054ccf: cmp      ecx, 2
  0x10054cd2: ja       0x10054cee
  0x10054cd4: cmp      ecx, 1
  0x10054cd7: ja       0x10054ce5
  0x10054cd9: add      dword ptr [esi], 0xc5
  0x10054cdf: inc      ecx
  0x10054ce0: mov      dword ptr [esi + 8], ecx
  0x10054ce3: jmp      0x10054cf8
  0x10054ce5: add      dword ptr [esi], 0x5f
  0x10054ce8: inc      ecx
  0x10054ce9: mov      dword ptr [esi + 8], ecx
  0x10054cec: jmp      0x10054cf8
  0x10054cee: add      dword ptr [esi], 0x2e
  0x10054cf1: mov      dword ptr [esi + 8], 3
  0x10054cf8: mov      ecx, dword ptr [esi]
  0x10054cfa: cmp      ecx, 0x400
  0x10054d00: jb       0x10054d16
  0x10054d02: mov      edx, 0x7ff
  0x10054d07: sub      edx, ecx
  0x10054d09: xor      ecx, ecx
  0x10054d0b: cmp      dword ptr [esi + 4], ecx
  0x10054d0e: mov      dword ptr [esi], edx
  0x10054d10: sete     cl
  0x10054d13: mov      dword ptr [esi + 4], ecx
  0x10054d16: pop      edi
  0x10054d17: pop      esi
  0x10054d18: pop      ebx
  0x10054d19: mov      esp, ebp
  0x10054d1b: pop      ebp
  0x10054d1c: ret      
  0x10054d1d: int3     
  0x10054d1e: int3     
  0x10054d1f: int3     
  0x10054d20: push     ebp
  0x10054d21: mov      ebp, esp
  0x10054d23: push     ebx
  0x10054d24: mov      ebx, dword ptr [ebp + 8]
  0x10054d27: push     esi
  0x10054d28: push     edi
  0x10054d29: mov      edi, dword ptr [ebx + 0x570]
  0x10054d2f: cmp      dword ptr [edi + 0x24], 0xff
  0x10054d36: jb       0x10054d3f
  0x10054d38: xor      esi, esi
  0x10054d3a: mov      dword ptr [edi + 0x24], esi
  0x10054d3d: jmp      0x10054d4c
  0x10054d3f: mov      eax, 1
  0x10054d44: add      dword ptr [edi + 0x28], eax
  0x10054d47: add      dword ptr [edi + 0x24], eax
  0x10054d4a: xor      esi, esi
  0x10054d4c: mov      eax, dword ptr [edi + 0x28]
  0x10054d4f: mov      ecx, dword ptr [edi + 0x2c]
  0x10054d52: cmp      eax, ecx
  0x10054d54: ja       0x10054d73
  0x10054d56: jne      0x10054d60
  0x10054d58: mov      edx, dword ptr [edi + 0x30]
  0x10054d5b: cmp      edx, dword ptr [edi + 0x24]
  0x10054d5e: jae      0x10054d67
  0x10054d60: pop      edi
  0x10054d61: pop      esi
  0x10054d62: xor      eax, eax
  0x10054d64: pop      ebx
  0x10054d65: pop      ebp
  0x10054d66: ret      
  0x10054d67: cmp      eax, ecx
  0x10054d69: jne      0x10054d73
  0x10054d6b: mov      eax, dword ptr [edi + 0x24]
  0x10054d6e: sub      dword ptr [edi + 0x30], eax
  0x10054d71: jmp      0x10054d8c
  0x10054d73: mov      eax, ebx
  0x10054d75: call     0x10054240
  0x10054d7a: mov      ecx, dword ptr [edi + 0x30]
  0x10054d7d: add      ecx, ecx
  0x10054d7f: or       eax, ecx
  0x10054d81: sub      eax, dword ptr [edi + 0x24]
  0x10054d84: add      eax, 0x100
  0x10054d89: mov      dword ptr [edi + 0x30], eax
  0x10054d8c: mov      eax, dword ptr [edi + 0x24]
  0x10054d8f: cmp      eax, 1
  0x10054d92: ja       0x10054dae
  0x10054d94: mov      eax, ebx
  0x10054d96: call     0x10054240
  0x10054d9b: mov      edx, dword ptr [edi + 0x30]
  0x10054d9e: add      edx, edx
  0x10054da0: or       eax, edx
  0x10054da2: mov      dword ptr [edi + 0x30], eax
  0x10054da5: mov      dword ptr [edi + 0x24], 0xfe
  0x10054dac: jmp      0x10054db4
  0x10054dae: add      eax, -2
  0x10054db1: mov      dword ptr [edi + 0x24], eax
  0x10054db4: mov      dword ptr [edi + 0x28], esi
  0x10054db7: mov      dword ptr [edi + 0x2c], esi
  0x10054dba: cmp      dword ptr [edi + 0x30], esi
  0x10054dbd: jne      0x10054ddf
  0x10054dbf: mov      esi, 8
  0x10054dc4: mov      eax, ebx
  0x10054dc6: call     0x10054290
  0x10054dcb: mov      ecx, dword ptr [edi + 0x30]
  0x10054dce: shl      ecx, 8
  0x10054dd1: add      eax, ecx
  0x10054dd3: mov      dword ptr [edi + 0x30], eax
  0x10054dd6: add      dword ptr [edi + 0x2c], esi
  0x10054dd9: cmp      dword ptr [edi + 0x30], 0
  0x10054ddd: je       0x10054dc4
  0x10054ddf: mov      eax, dword ptr [edi + 0x30]
  0x10054de2: cmp      eax, 0x100
  0x10054de7: jae      0x10054e1a
  0x10054de9: cmp      eax, 0xf
  0x10054dec: jbe      0x10054dfa
  0x10054dee: shr      eax, 4
  0x10054df1: movzx    esi, byte ptr [eax + 0x1072f20c]
  0x10054df8: jmp      0x10054e04
  0x10054dfa: movzx    esi, byte ptr [eax + 0x1072f20c]
  0x10054e01: add      esi, 4
  0x10054e04: add      dword ptr [edi + 0x2c], esi
  0x10054e07: mov      eax, ebx
  0x10054e09: call     0x100541c0
  0x10054e0e: mov      edx, dword ptr [edi + 0x30]
  0x10054e11: mov      ecx, esi
  0x10054e13: shl      edx, cl
  0x10054e15: or       eax, edx
  0x10054e17: mov      dword ptr [edi + 0x30], eax
  0x10054e1a: and      dword ptr [edi + 0x30], 0xff
  0x10054e21: pop      edi
  0x10054e22: pop      esi
  0x10054e23: mov      eax, 1
  0x10054e28: pop      ebx
  0x10054e29: pop      ebp
  0x10054e2a: ret      
  0x10054e2b: int3     
  0x10054e2c: int3     
  0x10054e2d: int3     
  0x10054e2e: int3     
  0x10054e2f: int3     