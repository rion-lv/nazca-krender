package com.levvels.nazca.render.infrastructure.extensions.function

/**
 * Return null if collection is empty, or result of calling [action]
 */
inline fun <C, T, R> C.ifEmptyNullElse(action: (C) -> R): R? where C : Collection<T> {
    return if (isEmpty()) null
    else action(this)
}

/**
 * Return null if map is empty, or result of calling [action]
 */
inline fun <M, K, V, R> M.ifEmptyNullElse(action: (M) -> R): R? where M : Map<K, V> {
    return if (isEmpty()) null
    else action(this)
}