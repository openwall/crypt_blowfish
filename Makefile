#
# Written by Solar Designer and placed in the public domain.
# See crypt_blowfish.c for more information.
#

CC = gcc
AS = gcc
LD = gcc
RM = rm -f
CFLAGS = -c -Wall -O2 -fomit-frame-pointer -funroll-loops
ASFLAGS = -c
LDFLAGS = -s

BLOWFISH_OBJS = \
	crypt_blowfish.o x86.o

CRYPT_OBJS = \
	$(BLOWFISH_OBJS) crypt_gensalt.o wrapper.o

TEST_OBJS = \
	$(BLOWFISH_OBJS) crypt_gensalt.o crypt_test.o

EXTRA_MANS = \
	crypt_r.3 crypt_rn.3 crypt_ra.3 \
	crypt_gensalt.3 crypt_gensalt_rn.3 crypt_gensalt_ra.3

all: $(CRYPT_OBJS) man

check: crypt_test
	./crypt_test

crypt_test: $(TEST_OBJS)
	$(LD) $(LDFLAGS) $(TEST_OBJS) -o crypt_test

crypt_test.o: wrapper.c
	$(CC) $(CFLAGS) wrapper.c -DTEST -o crypt_test.o

man: $(EXTRA_MANS)

$(EXTRA_MANS):
	echo '.so man3/crypt.3' > $@

.c.o:
	$(CC) $(CFLAGS) $*.c

.S.o:
	$(AS) $(ASFLAGS) $*.S

clean:
	$(RM) crypt_test *.o $(EXTRA_MANS) core
