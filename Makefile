ifdef DEBUG
DEBUGFLAGS = -g
else
DEBUGFLAGS = 
endif

AS = as
ASFLAGS = $(DEBUGFLAGS)
XCRUN = xcrun
LD = ld
LDFLAGS = 

all: 	wcarm64

wcarm64: wcarm64.o
	$(LD) $(LDFLAGS) -o $@ $<

%.o: %.s
	$(AS) $(ASFLAGS) $< -o $@

clean:
	rm -f *.o wcarm64 
