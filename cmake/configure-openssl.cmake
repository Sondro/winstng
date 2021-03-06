set( _OLDPATH $ENV{PATH} )
set( _NEWPATH ${WINST_DIR}\\bin ${_OLDPATH} )
set( ENV{PATH} "${_NEWPATH}" )

#separate_arguments( OPENSSL_CONFIGURE_COMMAND )
separate_arguments( OPENSSL_CONFIGURE_COMMAND_WS UNIX_COMMAND "${OPENSSL_CONFIGURE_COMMAND}" )

message( STATUS "* OpenSSL - Configuring..." )
message( STATUS "OPENSSL_CONFIGURE_COMMAND = ${OPENSSL_CONFIGURE_COMMAND}" )
message( STATUS "OPENSSL_CONFIGURE_COMMAND = ${OPENSSL_CONFIGURE_COMMAND_WS}" )
execute_process( 
                COMMAND ${OPENSSL_CONFIGURE_COMMAND_WS}
                WORKING_DIRECTORY ${OPENSSL_SOURCE_DIR}
                OUTPUT_FILE ${OPENSSL_SOURCE_DIR}-stamp/openssl-configure2-out.txt
                ERROR_FILE ${OPENSSL_SOURCE_DIR}-stamp/openssl-configure2-err.txt
#OUTPUT_QUIET
#                ERROR_QUIET
                RESULT_VARIABLE RES
                )
                
message( STATUS "* OpenSSL - result: ${RES}" )
