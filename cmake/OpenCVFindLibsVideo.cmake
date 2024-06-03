# --- Extra HighGUI and VideoIO libs on Windows ---
if(WIN32 AND NOT ( ("${CMAKE_SYSTEM_NAME}" STREQUAL "WindowsPhone") OR ("${CMAKE_SYSTEM_NAME}" STREQUAL "WindowsStore") ))
  list(APPEND HIGHGUI_LIBRARIES comctl32 gdi32 ole32 setupapi ws2_32)
endif()

if(WITH_VA)
  include("${OpenCV_SOURCE_DIR}/cmake/OpenCVFindVA.cmake")
  if(VA_INCLUDE_DIR)
    ocv_include_directories(${VA_INCLUDE_DIR})
  endif()
endif(WITH_VA)
