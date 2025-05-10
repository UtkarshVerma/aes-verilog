#include <verilated.h>

#include <cassert>
#include <cstdint>
#include <iomanip>
#include <iostream>

#include "Vkey_schedule.h"
#include "util.hpp"

struct test_pair {
    uint32_t input[4];
    uint32_t expected[4];
};

// https://www.samiam.org/key-schedule.html
static const struct test_pair tests[] = {
    // round 0 → 1
    {{0x00000000, 0x00000000, 0x00000000, 0x00000000},
     {0x62636363, 0x62636363, 0x62636363, 0x62636363}},

    // round 1 → 2
    {{0x62636363, 0x62636363, 0x62636363, 0x62636363},
     {0x9b9898c9, 0xf9fbfbaa, 0x9b9898c9, 0xf9fbfbaa}},

    // round 2 → 3
    {{0x9b9898c9, 0xf9fbfbaa, 0x9b9898c9, 0xf9fbfbaa},
     {0x90973450, 0x696ccffa, 0xf2f45733, 0x0b0fac99}},

    // round 3 → 4
    {{0x90973450, 0x696ccffa, 0xf2f45733, 0x0b0fac99},
     {0xee06da7b, 0x876a1581, 0x759e42b2, 0x7e91ee2b}},

    // round 4 → 5
    {{0xee06da7b, 0x876a1581, 0x759e42b2, 0x7e91ee2b},
     {0x7f2e2b88, 0xf8443e09, 0x8dda7cbb, 0xf34b9290}},

    // round 5 → 6
    {{0x7f2e2b88, 0xf8443e09, 0x8dda7cbb, 0xf34b9290},
     {0xec614b85, 0x1425758c, 0x99ff0937, 0x6ab49ba7}},

    // round 6 → 7
    {{0xec614b85, 0x1425758c, 0x99ff0937, 0x6ab49ba7},
     {0x21751787, 0x3550620b, 0xacaf6b3c, 0xc61bf09b}},

    // round 7 → 8
    {{0x21751787, 0x3550620b, 0xacaf6b3c, 0xc61bf09b},
     {0x0ef90333, 0x3ba96138, 0x97060a04, 0x511dfa9f}},

    // round 8 → 9
    {{0x0ef90333, 0x3ba96138, 0x97060a04, 0x511dfa9f},
     {0xb1d4d8e2, 0x8a7db9da, 0x1d7bb3de, 0x4c664941}},

    // round 9 → 10
    {{0xb1d4d8e2, 0x8a7db9da, 0x1d7bb3de, 0x4c664941},
     {0xb4ef5bcb, 0x3e92e211, 0x23e951cf, 0x6f8f188e}}};

int main(const int argc, char **argv) {
    Verilated::commandArgs(argc, argv);
    auto dut = new Vkey_schedule;

    for (int i = 0; i < size(tests); ++i) {
        dut->rc = i;
        VlWide<4> key_input = {tests[i].input[0], tests[i].input[1],
                               tests[i].input[2], tests[i].input[3]};
        dut->key_current = key_input;

        dut->eval();

        bool failed = false;
        for (int j = 0; j < 4; ++j) {
            if (dut->key_next[j] != tests[i].expected[j]) {
                std::cerr << "Test " << i << " failed at word " << j << ":\n";
                std::cerr << "  Expected: 0x" << std::hex << std::setw(8)
                          << std::setfill('0') << tests[i].expected[j] << "\n";
                std::cerr << "  Got     : 0x" << std::hex << std::setw(8)
                          << std::setfill('0') << dut->key_next[j]
                          << std::endl;
                failed = true;
            }
        }

        if (failed) {
            delete dut;
            return 1;
        }
    }

    std::cout << "All tests passed!" << std::endl;

    delete dut;
    return 0;
}
