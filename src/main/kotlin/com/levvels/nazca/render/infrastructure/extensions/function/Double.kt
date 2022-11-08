package com.kakaoenterprise.kwp.linkbine.manager.infrastructure.extensions.function

import java.math.BigDecimal
import java.math.RoundingMode

fun Double.formatDecimal(numberOfDecimals: Int = 2, roundingMode: RoundingMode = RoundingMode.HALF_UP): Double {
    return BigDecimal(this).setScale(numberOfDecimals, roundingMode).toDouble()
}
