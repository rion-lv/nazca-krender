package com.levvels.nazca.render.infrastructure.extensions.function

/**
 * Returns first parameter if boolean value is true, else second parameter
 */
fun <T> Boolean.ifElse(t: T, f: T): T {
    return if(this) t
    else f
}

/**
 * Returns null if boolean value is false, or result of calling [action]
 */
inline fun <R> Boolean.ifFalseNullElse(action: () -> R): R? {
    return if(!this) null
    else action()
}

/**
 * Returns null if boolean value is true, or result of calling [action]
 */
inline fun <R> Boolean.ifTrueNullElse(action: () -> R): R? {
    return if(this) null
    else action()
}

/**
 * returns [n] if boolean value is null, [t] if boolean value is true, [f] if boolean value is false
 */
fun <T> Boolean?.whenTrueFalseNull(t: T, f: T, n: T): T {
    return when (this) {
        null -> n
        true -> t
        false -> f
    }
}
