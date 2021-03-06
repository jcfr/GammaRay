# - Try to find Graphviz
# Once done this will define
#
#  GRAPHVIZ_FOUND - system has Graphviz
#  GRAPHVIZ_INCLUDE_DIR - the Graphviz include directory
#  GRAPHVIZ_LIBRARY - Link these to use Graphviz
#  GRAPHVIZ_DEFINITIONS - Compiler switches required for using Graphviz

# Copyright (c) 2009, Adrien Bustany, <madcat@mymadcat.com>
#
# Redistribution and use is allowed according to the terms of the GPLv3+ license.

IF (GRAPHVIZ_INCLUDE_DIR AND GRAPHVIZ_CDT_LIBRARY AND GRAPHVIZ_CGRAPH_LIBRARY AND GRAPHVIZ_GRAPH_LIBRARY AND GRAPHVIZ_PATHPLAN_LIBRARY)
    SET(GRAPHVIZ_FIND_QUIETLY TRUE)
ENDIF (GRAPHVIZ_INCLUDE_DIR AND GRAPHVIZ_CDT_LIBRARY AND GRAPHVIZ_CGRAPH_LIBRARY AND GRAPHVIZ_GRAPH_LIBRARY AND GRAPHVIZ_PATHPLAN_LIBRARY)

FIND_PATH( GRAPHVIZ_INCLUDE_DIR graphviz/graph.h)

if (WIN32)
	IF( CMAKE_BUILD_TYPE STREQUAL "Release")
		set(GRAPHVIZ_LIB_PATH_SUFFIX "release/lib")
	else()
		set(GRAPHVIZ_LIB_PATH_SUFFIX "debug/lib")
	endif()
else()
	set(GRAPHVIZ_LIB_PATH_SUFFIX)
endif()

FIND_LIBRARY( GRAPHVIZ_CDT_LIBRARY NAMES cdt PATH_SUFFIXES ${GRAPHVIZ_LIB_PATH_SUFFIX})
FIND_LIBRARY( GRAPHVIZ_GVC_LIBRARY NAMES gvc PATH_SUFFIXES ${GRAPHVIZ_LIB_PATH_SUFFIX})
FIND_LIBRARY( GRAPHVIZ_CGRAPH_LIBRARY NAMES cgraph PATH_SUFFIXES ${GRAPHVIZ_LIB_PATH_SUFFIX})
FIND_LIBRARY( GRAPHVIZ_GRAPH_LIBRARY NAMES graph PATH_SUFFIXES ${GRAPHVIZ_LIB_PATH_SUFFIX})
FIND_LIBRARY( GRAPHVIZ_PATHPLAN_LIBRARY NAMES pathplan PATH_SUFFIXES ${GRAPHVIZ_LIB_PATH_SUFFIX})

IF (GRAPHVIZ_INCLUDE_DIR AND GRAPHVIZ_CDT_LIBRARY AND GRAPHVIZ_GVC_LIBRARY AND GRAPHVIZ_CGRAPH_LIBRARY AND GRAPHVIZ_GRAPH_LIBRARY AND GRAPHVIZ_PATHPLAN_LIBRARY)
   SET(GRAPHVIZ_FOUND TRUE)
ELSE (GRAPHVIZ_INCLUDE_DIR AND GRAPHVIZ_CDT_LIBRARY AND GRAPHVIZ_GVC_LIBRARY AND GRAPHVIZ_CGRAPH_LIBRARY AND GRAPHVIZ_GRAPH_LIBRARY AND GRAPHVIZ_PATHPLAN_LIBRARY)
   SET(GRAPHVIZ_FOUND FALSE)
ENDIF (GRAPHVIZ_INCLUDE_DIR AND GRAPHVIZ_CDT_LIBRARY AND GRAPHVIZ_GVC_LIBRARY AND GRAPHVIZ_CGRAPH_LIBRARY AND GRAPHVIZ_GRAPH_LIBRARY AND GRAPHVIZ_PATHPLAN_LIBRARY)

IF (GRAPHVIZ_FOUND)
  IF (NOT GRAPHVIZ_FIND_QUIETLY)
    MESSAGE(STATUS "Found Graphviz: ${GRAPHVIZ_CDT_LIBRARY} ${GRAPHVIZ_GVC_LIBRARY} ${GRAPHVIZ_CGRAPH_LIBRARY} ${GRAPHVIZ_GRAPH_LIBRARY} ${GRAPHVIZ_PATHPLAN_LIBRARY}")
  ENDIF (NOT GRAPHVIZ_FIND_QUIETLY)
ELSE (GRAPHVIZ_FOUND)
  IF (GRAPHVIZ_FIND_REQUIRED)
    MESSAGE(FATAL_ERROR "Could NOT find Graphivz")
  ENDIF (GRAPHVIZ_FIND_REQUIRED)
ENDIF (GRAPHVIZ_FOUND)
