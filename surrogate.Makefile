include make.env
.EXPORT_ALL_VARIABLES:
TARGET=${PWD}

subsystem:
	$(MAKE) -C ${MAKE_DIR}