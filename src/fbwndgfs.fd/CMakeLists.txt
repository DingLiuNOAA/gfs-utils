list(APPEND fortran_src
  fbwndgfs.F
)

set(exe_name fbwndgfs.x)
add_executable(${exe_name} ${fortran_src})

if(CMAKE_Fortran_COMPILER_ID MATCHES "^(Intel|IntelLLVM)$")
  target_compile_options(${exe_name} PRIVATE -r8 -i4 -convert big_endian -assume byterecl)
elseif(CMAKE_Fortran_COMPILER_ID MATCHES "^(GNU)$")
  target_compile_options(${exe_name} PRIVATE -fdefault-real-8 -fdefault-integer-4 -fconvert=big-endian)
endif()

target_link_libraries(${exe_name} PRIVATE bacio::bacio
                                          ip::ip_d
                                          w3emc::w3emc_d)

if(w3emc_VERSION VERSION_GREATER_EQUAL 2.10)
   target_compile_definitions(${exe_name} PRIVATE "W3EMC_V2_10")
endif()

install(TARGETS ${exe_name} RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR})
