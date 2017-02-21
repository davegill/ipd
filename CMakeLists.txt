cmake_minimum_required(VERSION 2.8.11)
project(IPD)

#------------------------------------------------------------------------------
# Enable Fortran
enable_language(Fortran)

#------------------------------------------------------------------------------
# Set package definitions
set(PACKAGE "IPD")
set(VERSION "0.1")
set(AUTHOR  "Timothy Brown")
string(TIMESTAMP YEAR "%Y")


#------------------------------------------------------------------------------
# Set a default build type if none was specified
if(NOT CMAKE_BUILD_TYPE AND NOT CMAKE_CONFIGURATION_TYPES)
    message(STATUS "Setting build type to 'Debug' as none was specified.")
    set(CMAKE_BUILD_TYPE Debug CACHE STRING "Choose the type of build." FORCE)

    # Set the possible values of build type for cmake-gui
    set_property(CACHE CMAKE_BUILD_TYPE PROPERTY STRINGS "Debug" "Release"
                 "MinSizeRel" "RelWithDebInfo")
endif()

#------------------------------------------------------------------------------
# Set the sources
set(SOURCES
    types.f90
    atm_drv.f90
    phy/bc.f90
    phy/gf.f90
    ipd/fcall.h
    ipd/fcall.c
    ipd/ipd.f90)

add_executable(atm_drv ${SOURCES})

#------------------------------------------------------------------------------
# Set the linkage option 
SET(LINK_EXPORT_DYNAMIC "-Wl,--export-dynamic")
SET(CMAKE_EXE_LINKER_FLAGS  "${CMAKE_EXE_LINKER_FLAGS} ${LINK_EXPORT_DYNAMIC}" )

