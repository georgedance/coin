NAME = coin
ASM = src/${NAME}.asm
OBJ = build/${NAME}.o
ELF = bin/${NAME}.elf
BIN = bin/${NAME}
OP = -O0
ARCH = 64
FLAGS = ${OP} -m${ARCH} -no-pie -nostdlib

all: folders assemble link
	
folders:
	@mkdir -p bin build

assemble:
	as ${ASM} --${ARCH} -o ${OBJ}

link:
	gcc ${OBJ} ${FLAGS} -o ${ELF}

strip:
	strip -s ${ELF}

install: all strip
	@cp ${ELF} ${BIN}
	@cp ${BIN} /usr/local/bin

clean:
	@rm -vf ${OBJ} ${ELF} ${BIN}

