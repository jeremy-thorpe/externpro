# ZMQPP_FOUND - zmqpp was found
# ZMQPP_VER - zmqpp version
# ZMQPP_LIBRARIES - the zmqpp libraries
set(prj zmqpp)
# this file (-config) installed to share/cmake
get_filename_component(XP_ROOTDIR ${CMAKE_CURRENT_LIST_DIR}/../.. ABSOLUTE)
get_filename_component(XP_ROOTDIR ${XP_ROOTDIR} ABSOLUTE) # remove relative parts
string(TOUPPER ${prj} PRJ)
set(${PRJ}_VER "@VER@ [@PROJECT_NAME@]")
xpFindPkg(PKGS libzmq)
# targets file installed to lib/cmake
include(${XP_ROOTDIR}/lib/cmake/${prj}-targets.cmake)
set(${PRJ}_LIBRARIES xpro::zmqpp-static)
set(reqVars ${PRJ}_VER ${PRJ}_LIBRARIES)
include(FindPackageHandleStandardArgs)
set(FPHSA_NAME_MISMATCHED TRUE) # find_package_handle_standard_args NAME_MISMATCHED (prefix usexp-)
find_package_handle_standard_args(${prj} REQUIRED_VARS ${reqVars})
mark_as_advanced(${reqVars})
