BUILD_DIR ?= build
SRC_DIR   ?= src
TEST_DIR  ?= test
VERBOSE   ?= 0

VERILATOR ?= verilator
VERILATOR_FLAGS += --Mdir $(BUILD_DIR) -I$(SRC_DIR)

TEST_SRCS = $(wildcard $(TEST_DIR)/*.cpp)
TEST_BINS = $(patsubst $(TEST_DIR)/%.cpp,$(BUILD_DIR)/%,$(TEST_SRCS))

# Prettify output
PRINTF := @printf "%-8s %s\n"
ifeq ($(VERBOSE), 0)
	Q := @
endif

all: test

test: $(TEST_BINS)
	$(PRINTF) "TEST"
	$Qfor bin in $^; do printf "\t%-30s: " "$(TEST_DIR)/$$(basename $$bin)"; ./$$bin; done

$(BUILD_DIR)/%: $(SRC_DIR)/%.v $(TEST_DIR)/%.cpp
	$Qmkdir -p $(@D)
	$(PRINTF) "VERILATE" $@
	$Q$(VERILATOR) $(VERILATOR_FLAGS) --top-module $(@F) --cc $< \
		--exe $(word 2,$^) --build -o $(@F)

clean:
	$(PRINTF) "CLEAN" $(BUILD_DIR)
	$Q$(RM) -r $(BUILD_DIR)
