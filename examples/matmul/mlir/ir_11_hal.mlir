module @module {
  util.global private @__device_0 : !hal.device loc("ir_00_torch_input.mlir":1:1)
  util.initializer {
    %c18_i32 = arith.constant 18 : i32 loc(unknown)
    %false = arith.constant false loc(unknown)
    %c0 = arith.constant 0 : index loc("ir_00_torch_input.mlir":1:1)
    %c1 = arith.constant 1 : index loc("ir_00_torch_input.mlir":1:1)
    %0 = util.null : !hal.device loc(unknown)
    %device_count = hal.devices.count : index loc("ir_00_torch_input.mlir":1:1)
    cf.br ^bb1(%c0, %c0, %0 : index, index, !hal.device) loc("ir_00_torch_input.mlir":1:1)
  ^bb1(%1: index loc("ir_00_torch_input.mlir":1:1), %2: index loc("ir_00_torch_input.mlir":1:1), %3: !hal.device loc("ir_00_torch_input.mlir":1:1)):  // 2 preds: ^bb0, ^bb4
    %4 = util.cmp.eq %3, %0 : !hal.device loc("ir_00_torch_input.mlir":1:1)
    %5 = arith.cmpi slt, %1, %device_count : index loc("ir_00_torch_input.mlir":1:1)
    %6 = arith.andi %4, %5 : i1 loc("ir_00_torch_input.mlir":1:1)
    cf.cond_br %6, ^bb2, ^bb5 loc("ir_00_torch_input.mlir":1:1)
  ^bb2:  // pred: ^bb1
    %device_n = hal.devices.get %1 : !hal.device loc("ir_00_torch_input.mlir":1:1)
    %ok, %value = hal.device.query<%device_n : !hal.device> key("hal.device.id" :: "local*") : i1, i1 = false loc("ir_00_torch_input.mlir":1:1)
    cf.cond_br %value, ^bb3, ^bb4(%false : i1) loc("ir_00_torch_input.mlir":1:1)
  ^bb3:  // pred: ^bb2
    %ok_0, %value_1 = hal.device.query<%device_n : !hal.device> key("hal.executable.format" :: "embedded-elf-x86_64") : i1, i1 = false loc("ir_00_torch_input.mlir":1:1)
    cf.br ^bb4(%value_1 : i1) loc("ir_00_torch_input.mlir":1:1)
  ^bb4(%7: i1 loc("ir_00_torch_input.mlir":1:1)):  // 2 preds: ^bb2, ^bb3
    %8 = arith.cmpi eq, %2, %c0 : index loc("ir_00_torch_input.mlir":1:1)
    %9 = arith.select %7, %c1, %c0 : index loc("ir_00_torch_input.mlir":1:1)
    %10 = arith.addi %2, %9 : index loc("ir_00_torch_input.mlir":1:1)
    %11 = arith.andi %7, %8 : i1 loc("ir_00_torch_input.mlir":1:1)
    %12 = arith.select %11, %device_n, %0 : !hal.device loc("ir_00_torch_input.mlir":1:1)
    %13 = arith.addi %1, %c1 : index loc("ir_00_torch_input.mlir":1:1)
    cf.br ^bb1(%13, %10, %12 : index, index, !hal.device) loc("ir_00_torch_input.mlir":1:1)
  ^bb5:  // pred: ^bb1
    cf.cond_br %4, ^bb6, ^bb7 loc("ir_00_torch_input.mlir":1:1)
  ^bb6:  // pred: ^bb5
    util.status.check_ok %c18_i32, "HAL device `__device_0` not found or unavailable: #hal.device.target<\22local\22, [#hal.executable.target<\22llvm-cpu\22, \22embedded-elf-x86_64\22, {cpu = \22znver5\22, cpu_features = \22+64bit,+adx,+aes,-amx-avx512,-amx-bf16,-amx-complex,-amx-fp16,-amx-fp8,-amx-int8,-amx-movrs,-amx-tf32,-amx-tile,+avx,-avx10.1,-avx10.2,+avx2,-avx512bf16,-avx512bitalg,+avx512bw,+avx512cd,+avx512dq,+avx512f,-avx512fp16,-avx512ifma,-avx512vbmi,-avx512vbmi2,+avx512vl,-avx512vnni,-avx512vp2intersect,-avx512vpopcntdq,-avxifma,-avxneconvert,-avxvnni,-avxvnniint16,-avxvnniint8,+bmi,+bmi2,-ccmp,-cf,-cldemote,+clflushopt,+clwb,+clzero,+cmov,-cmpccxadd,+crc32,+cx16,+cx8,-egpr,-enqcmd,+f16c,+fma,-fma4,+fsgsbase,+fxsr,-gfni,-hreset,+invpcid,-kl,-lwp,+lzcnt,+mmx,+movbe,-movdir64b,-movdiri,-movrs,-mwaitx,-ndd,-nf,+pclmul,-pconfig,+pku,+popcnt,-ppx,-prefetchi,+prfchw,-ptwrite,-push2pop2,-raoint,-rdpid,-rdpru,+rdrnd,+rdseed,-rtm,+sahf,-serialize,-sgx,+sha,-sha512,-shstk,-sm3,-sm4,+sse,+sse2,+sse3,+sse4.1,+sse4.2,+sse4a,+ssse3,-tbm,-tsxldtrk,-uintr,-usermsr,-vaes,-vpclmulqdq,-waitpkg,-wbnoinvd,-widekl,-xop,+xsave,+xsavec,+xsaveopt,+xsaves,-zu\22, data_layout = \22e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128\22, iree.encoding.resolver = #iree_cpu.cpu_encoding_resolver<>, max_stack_allocation_size = 32768 : i64, native_vector_size = 64 : i64, target_triple = \22x86_64-unknown-unknown-eabi-elf\22}>]>" loc("ir_00_torch_input.mlir":1:1)
    cf.br ^bb7 loc("ir_00_torch_input.mlir":1:1)
  ^bb7:  // 2 preds: ^bb5, ^bb6
    util.global.store %3, @__device_0 : !hal.device loc("ir_00_torch_input.mlir":1:1)
    util.return loc("ir_00_torch_input.mlir":1:1)
  } loc("ir_00_torch_input.mlir":1:1)
  util.global private @__device_0_query_0_hal_executable_format_embedded_elf_x86_64 : i1 loc("ir_00_torch_input.mlir":3:10)
  util.initializer {
    %__device_0 = util.global.load @__device_0 : !hal.device loc("ir_00_torch_input.mlir":3:10)
    %ok, %value = hal.device.query<%__device_0 : !hal.device> key("hal.executable.format" :: "embedded-elf-x86_64") : i1, i1 = false loc("ir_00_torch_input.mlir":3:10)
    util.global.store %value, @__device_0_query_0_hal_executable_format_embedded_elf_x86_64 : i1 loc("ir_00_torch_input.mlir":3:10)
    util.return loc("ir_00_torch_input.mlir":3:10)
  } loc("ir_00_torch_input.mlir":3:10)
  util.global private @__device_0_executable_0_main$async_dispatch_0 : !hal.executable loc("ir_00_torch_input.mlir":3:10)
  util.initializer {
    %c-1_i64 = arith.constant -1 : i64 loc("ir_00_torch_input.mlir":1:1)
    %c-1 = arith.constant -1 : index loc("ir_00_torch_input.mlir":3:10)
    %c0 = arith.constant 0 : index loc(unknown)
    %c14_i32 = arith.constant 14 : i32 loc(unknown)
    %0 = util.null : !hal.executable loc(unknown)
    %__device_0_query_0_hal_executable_format_embedded_elf_x86_64 = util.global.load @__device_0_query_0_hal_executable_format_embedded_elf_x86_64 : i1 loc("ir_00_torch_input.mlir":3:10)
    %__device_0 = util.global.load @__device_0 : !hal.device loc("ir_00_torch_input.mlir":1:1)
    %1 = arith.select %__device_0_query_0_hal_executable_format_embedded_elf_x86_64, %c0, %c-1 : index loc("ir_00_torch_input.mlir":3:10)
    %2 = arith.cmpi eq, %1, %c0 : index loc("ir_00_torch_input.mlir":3:10)
    cf.cond_br %2, ^bb1, ^bb2 loc("ir_00_torch_input.mlir":3:10)
  ^bb1:  // pred: ^bb0
    %executable = hal.executable.create device(%__device_0 : !hal.device) affinity(%c-1_i64) target(@main$async_dispatch_0::@embedded_elf_x86_64) : !hal.executable loc("ir_00_torch_input.mlir":3:10)
    cf.br ^bb3(%executable : !hal.executable) loc("ir_00_torch_input.mlir":3:10)
  ^bb2:  // pred: ^bb0
    util.status.check_ok %c14_i32, "HAL device `__device_0` does not support any variant of executable `main$async_dispatch_0`; available formats: [embedded-elf-x86_64]" loc("ir_00_torch_input.mlir":3:10)
    cf.br ^bb3(%0 : !hal.executable) loc("ir_00_torch_input.mlir":3:10)
  ^bb3(%3: !hal.executable loc("ir_00_torch_input.mlir":3:10)):  // 2 preds: ^bb1, ^bb2
    util.global.store %3, @__device_0_executable_0_main$async_dispatch_0 : !hal.executable loc("ir_00_torch_input.mlir":3:10)
    util.return loc("ir_00_torch_input.mlir":1:1)
  } loc("ir_00_torch_input.mlir":1:1)
  hal.executable private @main$async_dispatch_0 {
    hal.executable.binary public @embedded_elf_x86_64 attributes {data = dense<"0x7F454C4602010100000000000000000003003E000100000000000000000000004000000000000000F80F00000000000000000000400038000700400015001300060000000400000040000000000000004000000000000000400000000000000088010000000000008801000000000000080000000000000001000000040000000000000000000000000000000000000000000000000000006404000000000000640400000000000000100000000000000100000005000000700400000000000070140000000000007014000000000000F106000000000000F10600000000000000100000000000000100000006000000700B000000000000702B000000000000702B000000000000A001000000000000900400000000000000100000000000000200000006000000500C000000000000502C000000000000502C000000000000C000000000000000C000000000000000080000000000000052E5746404000000700B000000000000702B000000000000702B000000000000A0010000000000009004000000000000010000000000000051E57464060000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000012000700501B000000000000110000000000000002000000020000000000000001000000000000000000000000697265655F68616C5F65786563757461626C655F6C6962726172795F7175657279000000000000782B00000000000008000000000000006003000000000000882B00000000000008000000000000007014000000000000902B0000000000000800000000000000C003000000000000A02B0000000000000800000000000000ED03000000000000B82B00000000000008000000000000000804000000000000C02B00000000000008000000000000000804000000000000D02B0000000000000800000000000000702B000000000000F02B0000000000000800000000000000882B000000000000F82B00000000000008000000000000008003000000000000102C0000000000000800000000000000902B000000000000282C0000000000000800000000000000982B000000000000302C0000000000000800000000000000B02B00000000000000000000000000006D61696E246173796E635F64697370617463685F300000000000000000000000000000000000000000000003010000000100000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000006D61696E246173796E635F64697370617463685F305F6D61746D756C5F31323878313238783132385F6633320069725F30305F746F7263685F696E7075742E6D6C697200000000001400000000000000017A5200017810011B0C070890010000280000001C00000048100000DB06000000410E108602430D064983078C068D058E048F0303CA060C070800001000000048000000FC160000110000000000000000000000000000000000000000000000554889E5415741564155415453488B4620448B02488B38488B7008488B40104489C14489C24589C14183E10141D1E8C1E20683E1FE41C1E10849C1E00D48C1E10383E240498DB431001E0000498DBC383C0E000041B0014531C9660F1F4400004D89CB4909CB49C1E1094889F34531F649C1E3094901F94E8D14184E8D9C1800020000666666662E0F1F8400000000004D89F74909D749C7C4F0FFFFFFC5F857C04989DDC5F057C9C5E857D2C5E057DBC5D857E4C5D057EDC5C857F6C5C057FF62C17C48286D8862C17C4828759062C17C48287D9862C17C482865A062C17C48285DA862C17C482855B062C17C48284DB862C17C482845C062517C48287DC862517C482875D062517C48286DD862517C482865E062517C48285DE862517C482855F062517C48284DF862517C482845004981C50020000062925550B884A104F2FFFF62925550B88CA104F4FFFF62925550B894A104F6FFFF62925550B89CA104F8FFFF62925550B8A4A104FAFFFF62925550B8ACA104FCFFFF62925550B874A18162925550B87CA10162924D50B884A108F2FFFF62924D50B88CA108F4FFFF62924D50B894A108F6FFFF62924D50B89CA108F8FFFF62924D50B8A4A108FAFFFF62924D50B8ACA108FCFFFF62924D50B874A18262924D50B87CA10262924550B884A10CF2FFFF62924550B88CA10CF4FFFF62924550B894A10CF6FFFF62924550B89CA10CF8FFFF62924550B8A4A10CFAFFFF62924550B8ACA10CFCFFFF62924550B874A18362924550B87CA10362925D50B884A110F2FFFF62925D50B88CA110F4FFFF62925D50B894A110F6FFFF62925D50B89CA110F8FFFF62925D50B8A4A110FAFFFF62925D50B8ACA110FCFFFF62925D50B874A18462925D50B87CA10462926550B884A114F2FFFF62926550B88CA114F4FFFF62926550B894A114F6FFFF62926550B89CA114F8FFFF62926550B8A4A114FAFFFF62926550B8ACA114FCFFFF62926550B874A18562926550B87CA10562926D50B884A118F2FFFF62926D50B88CA118F4FFFF62926D50B894A118F6FFFF62926D50B89CA118F8FFFF62926D50B8A4A118FAFFFF62926D50B8ACA118FCFFFF62926D50B874A18662926D50B87CA10662927550B884A11CF2FFFF62927550B88CA11CF4FFFF62927550B894A11CF6FFFF62927550B89CA11CF8FFFF62927550B8A4A11CFAFFFF62927550B8ACA11CFCFFFF62927550B874A18762927550B87CA10762927D50B884A120F2FFFF62927D50B88CA120F4FFFF62927D50B894A120F6FFFF62927D50B89CA120F8FFFF62927D50B8A4A120FAFFFF62927D50B8ACA120FCFFFF62927D50B874A18862927D50B87CA10862920558B884A124F2FFFF62920558B88CA124F4FFFF62920558B894A124F6FFFF62920558B89CA124F8FFFF62920558B8A4A124FAFFFF62920558B8ACA124FCFFFF62920558B874A18962920558B87CA10962920D58B884A128F2FFFF62920D58B88CA128F4FFFF62920D58B894A128F6FFFF62920D58B89CA128F8FFFF62920D58B8A4A128FAFFFF62920D58B8ACA128FCFFFF62920D58B874A18A62920D58B87CA10A62921558B884A12CF2FFFF62921558B88CA12CF4FFFF62921558B894A12CF6FFFF62921558B89CA12CF8FFFF62921558B8A4A12CFAFFFF62921558B8ACA12CFCFFFF62921558B874A18B62921558B87CA10B62921D58B884A130F2FFFF62921D58B88CA130F4FFFF62921D58B894A130F6FFFF62921D58B89CA130F8FFFF62921D58B8A4A130FAFFFF62921D58B8ACA130FCFFFF62921D58B874A18C62921D58B87CA10C62922558B884A134F2FFFF62922558B88CA134F4FFFF62922558B894A134F6FFFF62922558B89CA134F8FFFF62922558B8A4A134FAFFFF62922558B8ACA134FCFFFF62922558B874A18D62922558B87CA10D62922D58B884A138F2FFFF62922D58B88CA138F4FFFF62922D58B894A138F6FFFF62922D58B89CA138F8FFFF62922D58B8A4A138FAFFFF62922D58B8ACA138FCFFFF62922D58B874A18E62922D58B87CA10E62923558B884A13CF2FFFF62923558B88CA13CF4FFFF62923558B894A13CF6FFFF62923558B89CA13CF8FFFF62923558B8A4A13CFAFFFF62923558B8ACA13CFCFFFF62923558B874A18F62923558B87CA10F62923D58B884A140F2FFFF62923D58B88CA140F4FFFF62923D58B894A140F6FFFF62923D58B89CA140F8FFFF62923D58B8A4A140FAFFFF62923D58B8ACA140FCFFFF62923D58B874A19062923D58B87CA1104983C4104983FC700F825BFAFFFF62917C482904BA62917C48290CBB62917C482954BB0862917C48295CBB1062917C482964BB1862917C48296CBB2062917C482974BB2862917C48297CBB304883C3404983FE304D8D76100F82DBF9FFFF41B90800000041F6C00141B8000000000F8595F9FFFF31C05B415C415D415E415F5DC5F877C3CCCCCCCCCC31C083FF06488D0D74100000480F44C1C300000000000000000000000000000006000000000000000000000000000000000000000000000000000000000000000000000000000000030000001600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001E000000000000000800000000000000FBFFFF6F000000000100000000000000070000000000000038020000000000000800000000000000200100000000000009000000000000001800000000000000F9FFFF6F000000000C000000000000000600000000000000C8010000000000000B000000000000001800000000000000050000000000000010020000000000000A0000000000000023000000000000000400000000000000F80100000000000000000000000000000000000000000000011101250E1305030E1017B44219110112060000022E001101120640186E0E030E3A0B3B0B49133F190000032400030E3E0B0B0B000000470000000400000000000801310000002C0036000000000000007014000000000000DB060000027014000000000000DB060000015604000000040000000101430000000300000000050400696E74006D61696E246173796E635F64697370617463685F305F6D61746D756C5F31323878313238783132385F66333200495245450069725F30305F746F7263685F696E7075742E6D6C6972003F0000000200000000004B000000260000006D61696E246173796E635F64697370617463685F305F6D61746D756C5F31323878313238783132385F6633320000000000160000000200000000004B00000043000000696E7400000000006B00000004002E000000010101FB0E0D0001010101000000010000010069725F30305F746F7263685F696E7075742E6D6C6972000000000000090270140000000000000105130AC9050A4B05133B0539063C050A064B06023F0FBD08B7CB02300F1502F50B0F690B0820020E00010149524545000000000000000000000000000000000000000000000000002300000000020900502C00000000000000000000000000000100000012000700501B0000000000001100000000000000002E64796E73796D002E68617368002E64796E737472002E72656C612E64796E002E726F64617461002E65685F6672616D65002E74657874002E646174612E72656C2E726F002E64796E616D6963002E72656C726F5F70616464696E67002E64656275675F616262726576002E64656275675F696E666F002E64656275675F737472002E64656275675F7075626E616D6573002E64656275675F7075627479706573002E64656275675F6C696E65002E636F6D6D656E74002E73796D746162002E7368737472746162002E7374727461620000697265655F68616C5F65786563757461626C655F6C6962726172795F7175657279005F44594E414D494300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010000000B0000000200000000000000C801000000000000C801000000000000300000000000000003000000010000000800000000000000180000000000000009000000050000000200000000000000F801000000000000F80100000000000018000000000000000100000000000000040000000000000004000000000000000F000000030000000200000000000000100200000000000010020000000000002300000000000000000000000000000001000000000000000000000000000000170000000400000002000000000000003802000000000000380200000000000020010000000000000100000000000000080000000000000018000000000000002100000001000000020000000000000060030000000000006003000000000000A80000000000000000000000000000001000000000000000000000000000000029000000010000000200000000000000080400000000000008040000000000005C000000000000000000000000000000080000000000000000000000000000003300000001000000060000000000000070140000000000007004000000000000F10600000000000000000000000000001000000000000000000000000000000039000000010000000300000000000000702B000000000000700B000000000000E00000000000000000000000000000001000000000000000000000000000000046000000060000000300000000000000502C000000000000500C000000000000C0000000000000000300000000000000080000000000000010000000000000004F000000080000000300000000000000102D000000000000100D000000000000F0020000000000000000000000000000010000000000000000000000000000005E0000000100000000000000000000000000000000000000100D00000000000037000000000000000000000000000000010000000000000000000000000000006C0000000100000000000000000000000000000000000000470D0000000000004B00000000000000000000000000000001000000000000000000000000000000780000000100000030000000000000000000000000000000920D0000000000004D00000000000000000000000000000001000000000000000100000000000000830000000100000000000000000000000000000000000000DF0D0000000000004300000000000000000000000000000001000000000000000000000000000000930000000100000000000000000000000000000000000000220E0000000000001A00000000000000000000000000000001000000000000000000000000000000A300000001000000000000000000000000000000000000003C0E0000000000006F00000000000000000000000000000001000000000000000000000000000000AF0000000100000030000000000000000000000000000000AB0E0000000000000500000000000000000000000000000001000000000000000100000000000000B80000000200000000000000000000000000000000000000B00E0000000000004800000000000000140000000200000008000000000000001800000000000000C00000000300000000000000000000000000000000000000F80E000000000000D200000000000000000000000000000001000000000000000000000000000000CA0000000300000000000000000000000000000000000000CA0F0000000000002C00000000000000000000000000000001000000000000000000000000000000"> : vector<5432xi8>, format = "embedded-elf-x86_64", mime_type = "application/x-elf"} loc("ir_00_torch_input.mlir":3:10)
  } loc("ir_00_torch_input.mlir":3:10)
  util.func private @__main$async_memoize_apply() -> !hal.command_buffer attributes {inlining_policy = #util.inline.never} {
    %c-1_i64 = arith.constant -1 : i64 loc("ir_00_torch_input.mlir":3:10)
    %c16 = arith.constant 16 : index loc(unknown)
    %c3 = arith.constant 3 : index loc(unknown)
    %c0 = arith.constant 0 : index loc(unknown)
    %c1 = arith.constant 1 : index loc(unknown)
    %c2 = arith.constant 2 : index loc("ir_00_torch_input.mlir":3:10)
    %c65536 = arith.constant 65536 : index loc("ir_00_torch_input.mlir":2:19)
    %__device_0 = util.global.load immutable @__device_0 : !hal.device loc("ir_00_torch_input.mlir":3:10)
    %__device_0_executable_0_main$async_dispatch_0 = util.global.load immutable @__device_0_executable_0_main$async_dispatch_0 : !hal.executable loc("ir_00_torch_input.mlir":3:10)
    %cmd = hal.command_buffer.create device(%__device_0 : !hal.device) mode("None") categories("Transfer|Dispatch") affinity(%c-1_i64) bindings(%c3) : !hal.command_buffer loc("ir_00_torch_input.mlir":3:10)
    hal.command_buffer.dispatch<%cmd : !hal.command_buffer> target(%__device_0_executable_0_main$async_dispatch_0 : !hal.executable)[%c0] workgroups([%c16, %c1, %c1]) bindings([
      (%c0 : index)[%c0, %c65536], 
      (%c1 : index)[%c0, %c65536], 
      (%c2 : index)[%c0, %c65536]
    ]) flags("None") loc("ir_00_torch_input.mlir":3:10)
    hal.command_buffer.execution_barrier<%cmd : !hal.command_buffer> source("Dispatch|Transfer|CommandRetire") target("CommandIssue|Dispatch|Transfer") flags("None") loc("ir_00_torch_input.mlir":3:10)
    hal.command_buffer.finalize<%cmd : !hal.command_buffer> loc("ir_00_torch_input.mlir":3:10)
    util.return %cmd : !hal.command_buffer loc("ir_00_torch_input.mlir":3:10)
  } loc("ir_00_torch_input.mlir":3:10)
  util.global private @__main$async_memoize_result_0_device_0 : !hal.command_buffer loc("ir_00_torch_input.mlir":3:10)
  util.initializer {
    %0 = util.call @__main$async_memoize_apply() : () -> !hal.command_buffer loc("ir_00_torch_input.mlir":3:10)
    util.global.store %0, @__main$async_memoize_result_0_device_0 : !hal.command_buffer loc("ir_00_torch_input.mlir":3:10)
    util.return loc("ir_00_torch_input.mlir":3:10)
  } loc("ir_00_torch_input.mlir":3:10)
  util.func public @main$async(%arg0: !hal.buffer_view, %arg1: !hal.buffer_view, %arg2: !hal.fence, %arg3: !hal.fence) -> !hal.buffer_view attributes {inlining_policy = #util.inline.never, iree.abi.model = "coarse-fences", iree.abi.stub} {
    %c0_i64 = arith.constant 0 : i64 loc("ir_00_torch_input.mlir":3:10)
    %c-1_i64 = arith.constant -1 : i64 loc(unknown)
    %c0 = arith.constant 0 : index loc(unknown)
    %c65536 = arith.constant 65536 : index loc("ir_00_torch_input.mlir":2:19)
    %c128 = arith.constant 128 : index loc(unknown)
    %memory_type = hal.memory_type<"DeviceVisible|DeviceLocal"> : i32 loc("ir_00_torch_input.mlir":3:10)
    %buffer_usage = hal.buffer_usage<"TransferSource|TransferTarget|Transfer|DispatchStorageRead|DispatchStorageWrite|DispatchStorage"> : i32 loc("ir_00_torch_input.mlir":3:10)
    %__device_0 = util.global.load immutable @__device_0 : !hal.device loc("ir_00_torch_input.mlir":2:19)
    %__main$async_memoize_result_0_device_0 = util.global.load immutable @__main$async_memoize_result_0_device_0 : !hal.command_buffer loc("ir_00_torch_input.mlir":3:10)
    %element_type_f32 = hal.element_type<f32> : i32 loc("ir_00_torch_input.mlir":2:19)
    %dense_row_major = hal.encoding_type<dense_row_major> : i32 loc("ir_00_torch_input.mlir":2:19)
    hal.buffer_view.assert<%arg0 : !hal.buffer_view> message("tensor") shape([%c128, %c128]) type(%element_type_f32) encoding(%dense_row_major) loc("ir_00_torch_input.mlir":2:19)
    %buffer = hal.buffer_view.buffer<%arg0 : !hal.buffer_view> : !hal.buffer loc("ir_00_torch_input.mlir":2:19)
    %allocator = hal.device.allocator<%__device_0 : !hal.device> : !hal.allocator loc("ir_00_torch_input.mlir":2:19)
    hal.buffer.assert<%buffer : !hal.buffer> message("tensor") allocator(%allocator : !hal.allocator) minimum_length(%c65536) type(DeviceVisible) usage("TransferSource|TransferTarget|Transfer|DispatchStorageRead|DispatchStorageWrite|DispatchStorage") loc("ir_00_torch_input.mlir":2:19)
    hal.buffer_view.assert<%arg1 : !hal.buffer_view> message("tensor") shape([%c128, %c128]) type(%element_type_f32) encoding(%dense_row_major) loc("ir_00_torch_input.mlir":2:57)
    %buffer_0 = hal.buffer_view.buffer<%arg1 : !hal.buffer_view> : !hal.buffer loc("ir_00_torch_input.mlir":2:57)
    hal.buffer.assert<%buffer_0 : !hal.buffer> message("tensor") allocator(%allocator : !hal.allocator) minimum_length(%c65536) type(DeviceVisible) usage("TransferSource|TransferTarget|Transfer|DispatchStorageRead|DispatchStorageWrite|DispatchStorage") loc("ir_00_torch_input.mlir":2:57)
    %fence = hal.fence.create device(%__device_0 : !hal.device) flags("None") : !hal.fence loc("ir_00_torch_input.mlir":3:10)
    %transient_buffer = hal.device.queue.alloca<%__device_0 : !hal.device> affinity(%c-1_i64) wait(%arg2) signal(%fence) pool(%c0_i64) type(%memory_type) usage(%buffer_usage) flags("None") : !hal.buffer{%c65536} loc("ir_00_torch_input.mlir":3:10)
    hal.device.queue.execute.indirect<%__device_0 : !hal.device> affinity(%c-1_i64) wait(%fence) signal(%arg3) commands(%__main$async_memoize_result_0_device_0) bindings([
      (%buffer : !hal.buffer)[%c0, %c65536], 
      (%buffer_0 : !hal.buffer)[%c0, %c65536], 
      (%transient_buffer : !hal.buffer)[%c0, %c65536]
    ]) flags("None") loc("ir_00_torch_input.mlir":3:10)
    %view = hal.buffer_view.create buffer(%transient_buffer : !hal.buffer)[%c0, %c65536] shape([%c128, %c128]) type(%element_type_f32) encoding(%dense_row_major) : !hal.buffer_view loc("ir_00_torch_input.mlir":2:3)
    util.return %view : !hal.buffer_view loc("ir_00_torch_input.mlir":4:5)
  } loc("ir_00_torch_input.mlir":2:3)
  util.func public @main(%arg0: !hal.buffer_view, %arg1: !hal.buffer_view) -> !hal.buffer_view attributes {iree.abi.stub} {
    %0 = util.null : !hal.fence loc("ir_00_torch_input.mlir":2:3)
    %c-1_i32 = arith.constant -1 : i32 loc("ir_00_torch_input.mlir":2:3)
    %c0 = arith.constant 0 : index loc("ir_00_torch_input.mlir":2:3)
    %device_0 = hal.devices.get %c0 : !hal.device loc("ir_00_torch_input.mlir":2:3)
    %fence = hal.fence.create device(%device_0 : !hal.device) flags("None") : !hal.fence loc("ir_00_torch_input.mlir":2:3)
    %1 = util.call @main$async(%arg0, %arg1, %0, %fence) : (!hal.buffer_view, !hal.buffer_view, !hal.fence, !hal.fence) -> !hal.buffer_view loc("ir_00_torch_input.mlir":2:3)
    %status = hal.fence.await until([%fence]) timeout_millis(%c-1_i32) flags("None") : i32 loc("ir_00_torch_input.mlir":2:3)
    util.return %1 : !hal.buffer_view loc("ir_00_torch_input.mlir":2:3)
  } loc("ir_00_torch_input.mlir":2:3)
} loc("ir_00_torch_input.mlir":1:1)