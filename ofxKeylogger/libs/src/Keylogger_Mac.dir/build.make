# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 2.8

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canoncical targets will work.
.SUFFIXES:

# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list

# Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = "/Applications/CMake 2.8-3.app/Contents/bin/cmake"

# The command to remove a file.
RM = "/Applications/CMake 2.8-3.app/Contents/bin/cmake" -E remove -f

# The program to use to edit the cache.
CMAKE_EDIT_COMMAND = "/Applications/CMake 2.8-3.app/Contents/bin/ccmake"

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/diederickhuijbers/of/addons_diederick/ofxKeylogger/libs/mac

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/diederickhuijbers/of/addons_diederick/ofxKeylogger/libs/mac/bin

# Include any dependencies generated for this target.
include CMakeFiles/../../../src/Keylogger_Mac.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/../../../src/Keylogger_Mac.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/../../../src/Keylogger_Mac.dir/flags.make

CMakeFiles/../../../src/Keylogger_Mac.dir/src/Keylogger_Mac.mm.o: CMakeFiles/../../../src/Keylogger_Mac.dir/flags.make
CMakeFiles/../../../src/Keylogger_Mac.dir/src/Keylogger_Mac.mm.o: ../src/Keylogger_Mac.mm
	$(CMAKE_COMMAND) -E cmake_progress_report /Users/diederickhuijbers/of/addons_diederick/ofxKeylogger/libs/mac/bin/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object CMakeFiles/../../../src/Keylogger_Mac.dir/src/Keylogger_Mac.mm.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/../../../src/Keylogger_Mac.dir/src/Keylogger_Mac.mm.o -c /Users/diederickhuijbers/of/addons_diederick/ofxKeylogger/libs/mac/src/Keylogger_Mac.mm

CMakeFiles/../../../src/Keylogger_Mac.dir/src/Keylogger_Mac.mm.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/../../../src/Keylogger_Mac.dir/src/Keylogger_Mac.mm.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /Users/diederickhuijbers/of/addons_diederick/ofxKeylogger/libs/mac/src/Keylogger_Mac.mm > CMakeFiles/../../../src/Keylogger_Mac.dir/src/Keylogger_Mac.mm.i

CMakeFiles/../../../src/Keylogger_Mac.dir/src/Keylogger_Mac.mm.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/../../../src/Keylogger_Mac.dir/src/Keylogger_Mac.mm.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /Users/diederickhuijbers/of/addons_diederick/ofxKeylogger/libs/mac/src/Keylogger_Mac.mm -o CMakeFiles/../../../src/Keylogger_Mac.dir/src/Keylogger_Mac.mm.s

CMakeFiles/../../../src/Keylogger_Mac.dir/src/Keylogger_Mac.mm.o.requires:
.PHONY : CMakeFiles/../../../src/Keylogger_Mac.dir/src/Keylogger_Mac.mm.o.requires

CMakeFiles/../../../src/Keylogger_Mac.dir/src/Keylogger_Mac.mm.o.provides: CMakeFiles/../../../src/Keylogger_Mac.dir/src/Keylogger_Mac.mm.o.requires
	$(MAKE) -f CMakeFiles/../../../src/Keylogger_Mac.dir/build.make CMakeFiles/../../../src/Keylogger_Mac.dir/src/Keylogger_Mac.mm.o.provides.build
.PHONY : CMakeFiles/../../../src/Keylogger_Mac.dir/src/Keylogger_Mac.mm.o.provides

CMakeFiles/../../../src/Keylogger_Mac.dir/src/Keylogger_Mac.mm.o.provides.build: CMakeFiles/../../../src/Keylogger_Mac.dir/src/Keylogger_Mac.mm.o
.PHONY : CMakeFiles/../../../src/Keylogger_Mac.dir/src/Keylogger_Mac.mm.o.provides.build

# Object files for target ../../../src/Keylogger_Mac
__/__/__/src/Keylogger_Mac_OBJECTS = \
"CMakeFiles/../../../src/Keylogger_Mac.dir/src/Keylogger_Mac.mm.o"

# External object files for target ../../../src/Keylogger_Mac
__/__/__/src/Keylogger_Mac_EXTERNAL_OBJECTS =

lib../../../src/Keylogger_Mac.a: CMakeFiles/../../../src/Keylogger_Mac.dir/src/Keylogger_Mac.mm.o
lib../../../src/Keylogger_Mac.a: CMakeFiles/../../../src/Keylogger_Mac.dir/build.make
lib../../../src/Keylogger_Mac.a: CMakeFiles/../../../src/Keylogger_Mac.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX static library lib../../../src/Keylogger_Mac.a"
	$(CMAKE_COMMAND) -P CMakeFiles/../../../src/Keylogger_Mac.dir/cmake_clean_target.cmake
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/../../../src/Keylogger_Mac.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/../../../src/Keylogger_Mac.dir/build: lib../../../src/Keylogger_Mac.a
.PHONY : CMakeFiles/../../../src/Keylogger_Mac.dir/build

CMakeFiles/../../../src/Keylogger_Mac.dir/requires: CMakeFiles/../../../src/Keylogger_Mac.dir/src/Keylogger_Mac.mm.o.requires
.PHONY : CMakeFiles/../../../src/Keylogger_Mac.dir/requires

CMakeFiles/../../../src/Keylogger_Mac.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/../../../src/Keylogger_Mac.dir/cmake_clean.cmake
.PHONY : CMakeFiles/../../../src/Keylogger_Mac.dir/clean

CMakeFiles/../../../src/Keylogger_Mac.dir/depend:
	cd /Users/diederickhuijbers/of/addons_diederick/ofxKeylogger/libs/mac/bin && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/diederickhuijbers/of/addons_diederick/ofxKeylogger/libs/mac /Users/diederickhuijbers/of/addons_diederick/ofxKeylogger/libs/mac /Users/diederickhuijbers/of/addons_diederick/ofxKeylogger/libs/mac/bin /Users/diederickhuijbers/of/addons_diederick/ofxKeylogger/libs/mac/bin /Users/diederickhuijbers/of/addons_diederick/ofxKeylogger/libs/src/Keylogger_Mac.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/../../../src/Keylogger_Mac.dir/depend

