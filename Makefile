COMPILER = ghdl
WORKDIR = debug
FLAGS = --ieee=synopsys 

VHDL_SOURCES = $(wildcard rtl/*.vhd)
TBS = $(wildcard tb/tb_*.vhd)
UNIT_NAMES=$(basename $(notdir $(TBS)))

.PHONY: all
all: 	check analyze simulate clean
			$(info "Completed.")

.PHONY: check
check: $(info "Checking...")
	   mkdir -p $(WORKDIR)
	   $(COMPILER) -s $(FLAGS) --workdir=$(WORKDIR) $(VHDL_SOURCES) $(TBS)

.PHONY: analyze
analyze: $(info "Analyzing...")
		 $(COMPILER) -a $(FLAGS) --workdir=$(WORKDIR) $(VHDL_SOURCES) $(TBS)

.PHONY: simulate
simulate: $(info "Simulating...")
		  for t in $(UNIT_NAMES); do\
				$(COMPILER) --elab-run $(FLAGS) --workdir=$(WORKDIR) $$t;\
		  done;
		  
.PHONY: clean
clean: $(info "Cleaning...")
	   $(COMPILER) --remove --workdir=$(WORKDIR)
	   rm -rf $(WORKDIR)
	   $(info "Done...")
	   