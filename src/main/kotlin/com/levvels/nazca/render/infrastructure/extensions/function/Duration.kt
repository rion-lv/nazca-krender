package com.kakaoenterprise.kwp.linkbine.manager.infrastructure.extensions.function

import java.time.Duration
import java.time.LocalTime
import java.time.format.DateTimeFormatter

fun Duration.toString(
    dayPostfix: String? = null,
    hourPostfix: String? = null,
    minutePostfix: String? = null,
    secondPostfix: String? = null
): String {
    return StringBuilder()
        .append(dayPostfix?.let { this.toDaysPart() }.takeUnless { it == 0L}?.let { "$it$dayPostfix " } ?: "")
        .append(hourPostfix?.let { this.toHoursPart() }.takeUnless { it == 0}?.let { "$it$hourPostfix " } ?: "")
        .append(minutePostfix?.let { this.toMinutesPart() }.takeUnless { it == 0}?.let { "$it$minutePostfix " } ?: "")
        .append(secondPostfix?.let { this.toSecondsPart() }.takeUnless { it == 0}?.let { "$it$secondPostfix " } ?: "")
        .toString()
        .trim()
}

fun Duration.format(pattern: String? = null): String {
    return pattern?.let { LocalTime.ofSecondOfDay(this.seconds).format(DateTimeFormatter.ofPattern(pattern)) }
        ?: LocalTime.ofSecondOfDay(this.seconds).format(DateTimeFormatter.ISO_TIME).replaceFirst("00:", "")
}