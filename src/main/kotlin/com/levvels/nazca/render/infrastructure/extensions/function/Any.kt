package com.kakaoenterprise.kwp.linkbine.manager.infrastructure.extensions.function

/**
 * Returns false if T is null, or predicated boolean value
 */
inline fun <T> T?.ifNullFalseElse(predicate: (T) -> Boolean): Boolean {
    return if (this == null) false
    else predicate(this)
}

/**
 * Returns true if T is null, or false
 */
fun <T> T?.isNull(): Boolean {
    return this == null
}

/**
 * Returns true if T is not null, or false
 */
fun <T> T?.isNotNull(): Boolean {
    return !isNull()
}

/**
 * Returns default value if T is null, or this
 */
fun <T> T?.ifNull(value: T): T {
    return this ?: value
}

/**
 * Returns default value if T is null, or this
 */
fun <T> T?.ifNull(block: () -> T): T {
    return if (this.isNull()) block()
    else this!!
}

fun <T> T.doIf(condition: () -> Boolean, action: (T) -> T): T {
    return if (condition()) action(this)
    else this
}


fun <T> T.doIf(condition: Boolean, action: (T) -> T): T {
    return if (condition) action(this)
    else this
}

/**
 * Returns List<T>
 */
fun <T> T?.asList(): List<T> {
    return this?.let { listOf(it) }.orEmpty()
}

/**
 * Returns [default] if T is null, or T.toString()
 */
fun <T> T?.toString(default: String): String {
    return if (this.isNull()) default
    else this.toString()
}

/**
 * Returns List<T>
 */
infix fun <T> T?.concat(list: List<T>): List<T> {
    return this.asList() + list
}

/**
 * Returns List<T>
 */
infix fun <T> T?.concat(value: T): List<T> {
    return this.asList() + value
}

/**
 * Returns List<T>
 */
infix fun <T> List<T>.concat(list: List<T>): List<T> {
    return this + list
}

/**
 * Returns List<T>
 */
infix fun <T> List<T>.concat(value: T): List<T> {
    return this + value
}
