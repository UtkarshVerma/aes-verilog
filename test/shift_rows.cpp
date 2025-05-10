#include <verilated.h>

#include <cassert>
#include <iostream>

#include "Vshift_rows.h"

int main(const int argc, char **argv) {
    Verilated::commandArgs(argc, argv);
    auto dut = new Vshift_rows;

    // Input matrix (row-major).
    uint8_t input[4][4] = {{0x00, 0x01, 0x02, 0x03},
                           {0x10, 0x11, 0x12, 0x13},
                           {0x20, 0x21, 0x22, 0x23},
                           {0x30, 0x31, 0x32, 0x33}};

    // Expected output after ShiftRows.
    uint8_t expected[4][4] = {{0x00, 0x01, 0x02, 0x03},
                              {0x11, 0x12, 0x13, 0x10},
                              {0x22, 0x23, 0x20, 0x21},
                              {0x33, 0x30, 0x31, 0x32}};

    // Apply input.
    for (unsigned int i = 0; i < 4; ++i) {
        for (unsigned int j = 0; j < 4; ++j) {
            dut->state_in[i][j] = input[i][j];
        }
    }

    // Evaluate combinational logic
    dut->eval();

    // Check output.
    for (int i = 0; i < 4; ++i) {
        for (int j = 0; j < 4; ++j) {
            uint8_t actual = dut->state_out[i][j];
            uint8_t expect = expected[i][j];
            assert(actual == expect && "Mismatch in ShiftRows output");
        }
    }

    std::cout << "All tests passed!" << std::endl;

    delete dut;
    return 0;
}
