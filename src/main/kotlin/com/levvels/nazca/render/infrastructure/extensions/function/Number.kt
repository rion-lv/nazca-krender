package com.kakaoenterprise.kwp.linkbine.manager.infrastructure.extensions.function

import java.math.RoundingMode
import java.text.DecimalFormat
import java.text.NumberFormat

/**
 * Returns comma-separated number string
 */
fun Number.format(): String {
    return NumberFormat.getNumberInstance().format(this)
}

/**
 * Return String rounded to [n] decimal places
 */
fun Number.precision(n: Int, tailingZero: Boolean = true, roundingMode: RoundingMode = RoundingMode.HALF_UP): String {
    val ch = if (tailingZero) "0" else "#"
    val df = DecimalFormat("0.${ch.repeat(n)}")
    df.roundingMode = roundingMode
    return df.format(this)
}
