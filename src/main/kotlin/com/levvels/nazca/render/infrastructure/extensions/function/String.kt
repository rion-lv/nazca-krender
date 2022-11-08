package com.kakaoenterprise.kwp.linkbine.manager.infrastructure.extensions.function

/**
 * Returns abbreviated string.
 * Abbreviated part is replaced with [postfix]
 */
fun String.abbreviate(maxLength: Int, postfix: String = "..."): String {
    return if (length < maxLength) this
    else take(maxLength).plus(postfix)
}

/**
 * Returns null if string is empty, or result of calling [action]
 */
inline fun <R> String.ifEmptyNullElse(action: (String) -> R): R? {
    return if (this.isEmpty()) null else action(this)
}

/**
 * Return [this] + [postfix]
 */
fun String.append(postfix: String): String {
    return this + postfix
}

/**
 * Return [prefix] + [this]
 */
fun String.prepend(prefix: String): String {
    return prefix + this
}

/**
 * Returns original String + [postfix] if [predicate] is true,
 * or original String
 */
inline fun String.appendIf(postfix: String, predicate: () -> Boolean): String {
    return if(predicate()) this + postfix
    else this
}

/**
 * Returns [prefix] + original String if [predicate] is true,
 * or original String
 */
inline fun String.prependIf(prefix: String, predicate: () -> Boolean): String {
    return if(predicate()) prefix + this
    else this
}

fun String.removeAllWhiteSpace(): String {
    return this.replace("\\s".toRegex(), "")
}