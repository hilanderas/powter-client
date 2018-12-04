statefile = $(CURDIR)/.state.conf
include $(statefile)
ss = INIT PREPARED CONFIGURED RUNNING

.PHONY: $(isstate) $(setstate)
isstate: $(addprefix is_, $(ss))
setstate: $(addprefix set_, $(ss))
is_%:
	./is.sh $(STATE) $* 
set_%:
	sed -i '/STATE =/c\STATE = $*' $(statefile)

get_state:
	echo "Current state is $(STATE)"

is_INIT_PREPARED:
	make -f sm.mk is_INIT || make -f sm.mk is_PREPARED

is_PREPARED_CONFGENED:
	make -f sm.mk is_PREPARED || make -f sm.mk is_CONFGENED 
is_RUNNING_CONFQUEUED:
	make -f sm.mk is_RUNNING || make -f sm.mk is_CONFQUEUED 

