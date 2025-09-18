ARCH := $(shell uname -m)
ifeq ($(ARCH),armv7l)
        CC ?= arm-linux-gnueabihf-gcc
else ifeq ($(ARCH),aarch64)
        CC ?= aarch64-linux-gnu-gcc
else
        CC ?= gcc
endif

CFLAGS ?= -O2 -w

EXEC = timeout
SOURCES = $(wildcard *.c)
OBJECTS = $(SOURCES:.c=.o)

$(EXEC): $(OBJECTS)
	$(CC) $(OBJECTS) -o $(EXEC)

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -f $(EXEC) $(OBJECTS)
