syn keyword Type    ftc_t fti_t ptime_int ptime_uint ptime_long
syn keyword Type    const_iterator
syn keyword Special nullptr
syn keyword Special DEV_ASSERT_0
syn match Special "\v<[A-Z_]+>"
syn match Statement "\<qo_cast\s*<"me=e-1
syn match Statement "\<qo_cast\s*$"
syn match Statement "\<QO_CAST\s*<"me=e-1
syn match Statement "\<QO_CAST\s*$"
