DOCUMENTATION_SOURCE_DIR = $${PWD}

### Generate and install qhc file

QHCPFILES = $${DOCUMENTATION_SOURCE_DIR}/qtikz.qhcp
greaterThan(QT_MAJOR_VERSION, 5) {
updateqhc.name = qhelpgenerator ${QMAKE_FILE_IN}
} else {
updateqhc.name = qcollectiongenerator ${QMAKE_FILE_IN}
}
updateqhc.input = QHCPFILES
updateqhc.output = $${DOCUMENTATION_SOURCE_DIR}/${QMAKE_FILE_BASE}.qhc
updateqhc.commands = $${QCOLLECTIONGENERATORCOMMAND} ${QMAKE_FILE_IN} -o ${QMAKE_FILE_OUT}
updateqhc.CONFIG = no_link target_predeps
QMAKE_EXTRA_COMPILERS += updateqhc

documentation.path = $${DOCUMENTATION_INSTALL_DIR}
documentation.files += $${DOCUMENTATION_SOURCE_DIR}/qtikz.qch $${DOCUMENTATION_SOURCE_DIR}/qtikz.qhc
documentation.CONFIG += no_check_exist
INSTALLS += documentation
QMAKE_CLEAN += $${DOCUMENTATION_SOURCE_DIR}/qtikz.qch

### Create and install man page

unix:!macx {
	DOCUMENTATIONDIR = "$$replace(DOCUMENTATION_INSTALL_DIR, "/", "\\/")"
	MANFILETEMPLATES = $${DOCUMENTATION_SOURCE_DIR}/qtikz.1.template

	createman.name = create man page
	createman.input = MANFILETEMPLATES
	createman.output = ${QMAKE_FILE_BASE}
	createman.commands = sed -e \"s/assistant\\ -collectionFile/assistant\\ -collectionFile\\ $${DOCUMENTATIONDIR}\\/qtikz.qhc/\" ${QMAKE_FILE_IN} > ${QMAKE_FILE_OUT}
	createman.CONFIG = no_link target_predeps
	QMAKE_EXTRA_COMPILERS += createman

	man.path = $${MAN_INSTALL_DIR}/man1
	man.files += $${OUT_PWD}/qtikz.1
	man.CONFIG += no_check_exist
	INSTALLS += man
}
