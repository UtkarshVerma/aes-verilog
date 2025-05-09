#include <verilated.h>

#include <cassert>
#include <cstdint>
#include <iostream>

#include "Vmix_column.h"

template <typename T, size_t N>
constexpr size_t size(T (&)[N]) {
    return N;
}

#define TEST_VECTOR(vector, expected) \
    test_vector(*dut, vector, expected, size(vector), __FILE__, __LINE__)

static void test_vector(Vmix_column& dut, const uint8_t* const vector,
                        const uint8_t* const expected, size_t size,
                        const char* file, int line) {
    for (unsigned int i = 0; i < size; ++i) {
        dut.column_in[i] = vector[i];
    }
    dut.eval();
    for (unsigned int i = 0; i < size; ++i) {
        if (dut.column_out[i] != expected[i]) {
            std::cerr << file << ":" << line << ": error: Mismatch at index "
                      << i << ": expected 0x" << std::hex << (int)expected[i]
                      << ", got 0x" << (int)dut.column_out[i] << std::dec
                      << std::endl;
            std::abort();
        }
    }
}

// https://en.wikipedia.org/wiki/Rijndael_MixColumns#Test_vectors_for_MixColumn()
int main(const int argc, char** argv) {
    Verilated::commandArgs(argc, argv);
    auto dut = new Vmix_column;

    const uint8_t vector1[] = {0x63, 0x47, 0xa2, 0xf0};
    const uint8_t expected1[] = {0x5d, 0xe0, 0x70, 0xbb};
    TEST_VECTOR(vector1, expected1);

    const uint8_t vector2[] = {0xf2, 0x0a, 0x22, 0x5c};
    const uint8_t expected2[] = {0x9f, 0xdc, 0x58, 0x9d};
    TEST_VECTOR(vector2, expected2);

    const uint8_t vector3[] = {0x01, 0x01, 0x01, 0x01};
    const uint8_t expected3[] = {0x01, 0x01, 0x01, 0x01};
    TEST_VECTOR(vector3, expected3);

    const uint8_t vector4[] = {0xc6, 0xc6, 0xc6, 0xc6};
    const uint8_t expected4[] = {0xc6, 0xc6, 0xc6, 0xc6};
    TEST_VECTOR(vector4, expected4);

    const uint8_t vector5[] = {0xd4, 0xd4, 0xd4, 0xd5};
    const uint8_t expected5[] = {0xd5, 0xd5, 0xd7, 0xd6};
    TEST_VECTOR(vector5, expected5);

    const uint8_t vector6[] = {0x2d, 0x26, 0x31, 0x4c};
    const uint8_t expected6[] = {0x4d, 0x7e, 0xbd, 0xf8};
    TEST_VECTOR(vector6, expected6);

    std::cout << "All tests passed!" << std::endl;

    delete dut;
    return 0;
}
