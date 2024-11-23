cmake_minimum_required(VERSION 3.16)

project(WebEngineTest VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.5 REQUIRED COMPONENTS Quick WebEngineQuick)

qt_standard_project_setup(REQUIRES 6.5)

qt_add_executable(appWebEngineTest
    main.cpp
    README.md
)

qt_policy(
    SET QTP0004 NEW
)

qt_add_qml_module(appWebEngineTest
    URI WebEngineTest
    VERSION 1.0
    QML_FILES
        Main.qml
        widgets/NavButton.qml
        widgets/InfoText.qml
        widgets/NavBar.qml
        widgets/InfoBar.qml
    RESOURCES
        "icons/back.png"
        "icons/forward.png"
        "icons/execute.png"
)

qt_add_resources(appWebEngineTest "js"
    PREFIX "/"
    FILES
        js/DomWalk.js
)
# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appWebEngineTest PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appWebEngineTest
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appWebEngineTest
    PRIVATE Qt6::Quick
    PRIVATE Qt6::WebEngineQuick
)

include(GNUInstallDirs)
install(TARGETS appWebEngineTest
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
