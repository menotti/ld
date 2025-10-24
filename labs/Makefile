###################################################################
# Project Configuration: 
# 
# Specify the name of the design (project) and the Quartus II
# Settings File (.qsf)
###################################################################

# QUARTUS_PATH = /opt/altera/13.0sp1/quartus/bin/
# LE-4
# QUARTUS_PATH = /opt/intelFPGA/23.1std/quartus/bin/ 
# vlab
QUARTUS_PATH = /var/local/intelFPGA_lite/23.1std/quartus/bin/

PROJECT = project
TOP_LEVEL_ENTITY = top
ASSIGNMENT_FILES = $(PROJECT).qpf $(PROJECT).qsf

###################################################################
# Part, Family, Boardfile
###################################################################
# Part, Family, Boardfile 
# BOARD = DE0_CV
# BOARD = DE1
# BOARD = DE2_115
# BOARD = DE2i_150
# BOARD = DE10_lite
BOARD = DE10_standard

ifeq ($(BOARD),DE0_CV)
	FAMILY = "Cyclone V"
	PART = 5CEBA4F23C7
	BOARDFILE = ../DE0_CV.qsf
endif
ifeq ($(BOARD),DE10_standard)
	FAMILY = "Cyclone V"
	PART = 5CSXFC6D6F31C6
	BOARDFILE = ../DE10_standard.qsf
	JTAG_DEVICE_INDEX = @2
endif
ifeq ($(BOARD),DE1)
	FAMILY = "Cyclone II"
	PART = EP2C20F484C7
	BOARDFILE = ../DE1.qsf
endif
ifeq ($(BOARD),DE2_115)
	FAMILY = "Cyclone IV E"
	PART = EP4CE115F29C7
	BOARDFILE = ../DE2_115.qsf
endif
ifeq ($(BOARD),DE2i_150)
	FAMILY = "Cyclone IV GX"
	PART = EP4CGX150DF31C7
	BOARDFILE = ../DE2i_150.qsf
endif
ifeq ($(BOARD),DE10_lite)
	FAMILY = "MAX 10"
	PART = 10M50DAF484C7G
	BOARDFILE = ../DE10_lite.qsf
endif
###################################################################

###################################################################
# Setup your sources here
SRCS = $(wildcard ./*.sv) \
  $(wildcard ./*.v)

###################################################################
# Main Targets
# all: build everything
# clean: remove output files and database
# program: program your device with the compiled design
###################################################################

all: smart.log $(PROJECT).asm.rpt $(PROJECT).sta.rpt 

clean:
	rm -rf *.sld *.txt *.rpt *.chg smart.log *.htm *.eqn *.pin *.sof *.pof db incremental_db *.summary *.smsg *.jdi $(ASSIGNMENT_FILES)

map: smart.log $(PROJECT).map.rpt
fit: smart.log $(PROJECT).fit.rpt
asm: smart.log $(PROJECT).asm.rpt
sta: smart.log $(PROJECT).sta.rpt
smart: smart.log

###################################################################
# Executable Configuration
#
# QUARTUS_PATH: If empty then system path is searched.
#               If set then requires trailling slash.
#               Commented out so it may be set from environment.
###################################################################


QUARTUS_MAP  = $(QUARTUS_PATH)quartus_map
QUARTUS_FIT  = $(QUARTUS_PATH)quartus_fit
QUARTUS_ASM  = $(QUARTUS_PATH)quartus_asm
QUARTUS_STA  = $(QUARTUS_PATH)quartus_sta
QUARTUS_SH   = $(QUARTUS_PATH)quartus_sh
QUARTUS_PGM  = $(QUARTUS_PATH)quartus_pgm

ifeq ($(shell uname -m),x86_64)
	QUARTUS_ARGS = --64bit
endif

MAP_ARGS = $(QUARTUS_ARGS) --read_settings_files=on $(addprefix --source=,$(SRCS))
FIT_ARGS = $(QUARTUS_ARGS) --part=$(PART) --read_settings_files=on
ASM_ARGS = $(QUARTUS_ARGS)
STA_ARGS = $(QUARTUS_ARGS)
SH_ARGS  = $(QUARTUS_ARGS)
PGM_ARGS = $(QUARTUS_ARGS) --no_banner --mode=jtag

###################################################################
# Target implementations
###################################################################

STAMP = echo done >

$(PROJECT).map.rpt: map.chg $(SOURCE_FILES) 
	$(QUARTUS_MAP) $(MAP_ARGS) $(PROJECT)
	$(STAMP) fit.chg

$(PROJECT).fit.rpt: fit.chg $(PROJECT).map.rpt
	$(QUARTUS_FIT) $(FIT_ARGS) $(PROJECT)
	$(STAMP) asm.chg
	$(STAMP) sta.chg

$(PROJECT).asm.rpt: asm.chg $(PROJECT).fit.rpt
	$(QUARTUS_ASM) $(ASM_ARGS) $(PROJECT)

$(PROJECT).sta.rpt: sta.chg $(PROJECT).fit.rpt
	$(QUARTUS_STA) $(STA_ARGS) $(PROJECT) 

smart.log: $(ASSIGNMENT_FILES)
	$(QUARTUS_SH) $(SH_ARGS) --determine_smart_action $(PROJECT) > smart.log

###################################################################
# Project initialization
###################################################################

$(ASSIGNMENT_FILES):
	$(QUARTUS_SH) $(SH_ARGS) --prepare -f $(FAMILY) -t $(TOP_LEVEL_ENTITY) $(PROJECT)
	-cat $(BOARDFILE) >> $(PROJECT).qsf
map.chg:
	$(STAMP) map.chg
fit.chg:
	$(STAMP) fit.chg
sta.chg:
	$(STAMP) sta.chg
asm.chg:
	$(STAMP) asm.chg

###################################################################
# Programming the device
###################################################################

program: all $(PROJECT).sof
	$(QUARTUS_PGM) $(PGM_ARGS) -o "P;$(PROJECT).sof$(JTAG_DEVICE_INDEX)"

program-pof: $(PROJECT).pof
	$(QUARTUS_PGM) $(PGM_ARGS) -o "BVP;$(PROJECT).pof"