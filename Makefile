CC=gcc
AR=ar
CFLAGS = -Wall \
						-Werror \
						-Wmissing-declarations \
						-Wmissing-prototypes \
						-Wnested-externs \
				 		-Wpointer-arith \
						-Wsign-compare \
						-Wchar-subscripts \
						-Wstrict-prototypes \
						-Wwrite-strings \
						-Wshadow \
						-Wformat-security \
						-Wtype-limits \
            -I. \
            -L.

all: ssdisplay.a
	$(CC) -o ssdisplay ssdisplay.c -lssdisplay -lbcm2835 $(CFLAGS)

74hct595_7_seg.o:
	$(CC) -c -o 74hc595_7_seg.o 74hc595_7_seg.c $(CFLAGS)

ssdisplay.a: 74hc595_7_seg.o
	$(AR) rcs libssdisplay.a 74hc595_7_seg.o

clean:
	rm -rf ./*.o ./*.a
