set(TESTSUITE_SOURCES
    ${TESTSUITE_SOURCES}
    ${CMAKE_CURRENT_SOURCE_DIR}/testGlobals.cxx
    ${CMAKE_CURRENT_SOURCE_DIR}/NavDataCache.cxx
    ${CMAKE_CURRENT_SOURCE_DIR}/PrivateAccessorFDM.cxx
    ${CMAKE_CURRENT_SOURCE_DIR}/scene_graph.cxx
    ${CMAKE_CURRENT_SOURCE_DIR}/TestPilot.cxx
    PARENT_SCOPE
)


set(TESTSUITE_HEADERS
    ${TESTSUITE_HEADERS}
    ${CMAKE_CURRENT_SOURCE_DIR}/testGlobals.hxx
    ${CMAKE_CURRENT_SOURCE_DIR}/NavDataCache.hxx
    ${CMAKE_CURRENT_SOURCE_DIR}/PrivateAccessorFDM.hxx
    ${CMAKE_CURRENT_SOURCE_DIR}/scene_graph.hxx
    ${CMAKE_CURRENT_SOURCE_DIR}/TestPilot.hxx
    PARENT_SCOPE
)
