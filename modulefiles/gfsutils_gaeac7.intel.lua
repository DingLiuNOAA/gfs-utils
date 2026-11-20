help([[
  This module loads libraries required for building and running GFS UTILS 
  on the NOAA RDHPC machine Gaea C7 using Intel oneAPI-2025.3.1.
]])

whatis([===[Loads libraries needed for building the GFS utilities on Gaea C7 ]===])

prepend_path("MODULEPATH", "/ncrc/proj/epic/spack-stack/c7/spack-stack-2.1.1/envs/ue-oneapi-2025.3.1/modules/Core")

stack_oneapi_ver=os.getenv("stack_oneapi_ver") or "2025.3.1"
load(pathJoin("stack-intel-oneapi-compilers", stack_oneapi_ver))

stack_cray_mpich_ver=os.getenv("stack_cray_mpich_ver") or "9.2.0"
load(pathJoin("cray-mpich", stack_cray_mpich_ver))
load(pathJoin("stack-cray-mpich", stack_cray_mpich_ver))

load("gfsutils_common")
load("nccmp/1.9.0.1")

-- unload system wgrib2 and manually set wgrib2_ROOT to spack-stack-2.1.1 version
unload("wgrib2/3.8.0")
setenv("wgrib2_ROOT", "/autofs/ncrc-svm1_proj/epic/spack-stack/c7/spack-stack-2.1.1/envs/ue-oneapi-2025.3.1/install/intel-oneapi-compilers/2025.3.1/wgrib2-3.8.0-ybyhmun")

setenv("CC","icx")
setenv("CXX","icpx")
setenv("FC","ifx")
setenv("CMAKE_Platform","gaeac7.intel")
