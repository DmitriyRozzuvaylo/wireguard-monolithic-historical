CFLAGS = -fPIC -Wall -Wextra -O2 -g  # C flags
LDFLAGS = -shared   # linking flags
TARGET_LIB = libembeddable-wg.so  # target lib

SRCS = wireguard.c  # source files
OBJS = $(SRCS:.c=.o)

.PHONY: all
all: ${TARGET_LIB}

$(TARGET_LIB): $(OBJS)
	$(CC) ${LDFLAGS} -o $@ $^

$(SRCS:.c=.d):%.d:%.c
	$(CC) $(CFLAGS) -MM $< >$@

include $(SRCS:.c=.d)

test: test.c wireguard.c wireguard.h

.PHONY: clean
clean:
	-rm -f ${TARGET_LIB} ${OBJS} $(SRCS:.c=.d) test
