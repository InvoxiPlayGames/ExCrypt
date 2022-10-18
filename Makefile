CXX = g++
PLATFORM := $(shell uname -o 2>/dev/null || uname -s)
ifeq ($(PLATFORM),Darwin)
EXT := dylib
else
EXT := so
endif
OUT_NAME = libexcrypt.$(EXT)
CFLAGS +=  -fPIC -O0 -g -Wall -fpermissive -std=c++17
LDFLAGS += -shared
SRC_DIR = src

CPP_SRC = $(wildcard $(SRC_DIR)/*.cpp)
C_SRC = $(wildcard $(SRC_DIR)/*.c)

$(OUT_NAME): $(CPP_SRC) $(C_SRC)
	$(CXX) $(CFLAGS) -o $@ $^ $(LDFLAGS)

clean:
	rm -rf $(OBJ_DIR)
	rm -rf $(OUT_NAME)
