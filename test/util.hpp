#pragma once

#include <cstddef>

template <typename T, size_t N>
constexpr size_t size(T (&)[N]) {
    return N;
}
