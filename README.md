# WebEngineTest

Qt WebEngine app for "Anatomy of a Browser - Embedded Mobile Lizards " talk

## Build

These instructions are for building the example app on Linux using Qt Creator.

Ensure you have the [Qt SDK]() installed.

Clone a local copy of the repository:
```
git clone https://github.com/llewelld/WebEngineTest.git
```

Build:
1. Open Qt Creator.
2. Import the project:
    1. Select "File" > "Open File or Project..." from the main menu.
    2. Navigate to the repository directory.
    3. Select the "CMakeLists.txt" file.
    4. Select "Open".
3. Configure the project:
    1. Choose appropriate options (leave as the default if your'e unsure).
    2. Select "Configure Project".
4. Build and run the project by selecting "Build" > "Run" from the main menu.

## Prerequisites

For pre-requisites you will need Qt6 installed, including the Qt WebEngine extension.
Depending on your operating system and distribution you may be able to get these through your package manager.
In the following steps we'll explain how to install them in a way that shouldn't conflict with any existing installation and which is easy to reverse once you're done.
If you plan to continue using Qt for development you may prefer to create a permanent installation instead.

We've also chosen a fully command-line installation process, but you can use the GUI installer if you prefer.
If you do, make sure you install the QtWebEngine component as well as the Qt development files.

In order to download and install Qt you'll need a [Qt account](https://login.qt.io/login).
There's no charge for this, but honestly I don't like this any more than you do.
The installer will ask you to enter your credentials during the installation process if they've not already been cached.

Start by setting the location to install to.
```
QT_INSTALL_DIR=${PWD}/Qt
```

All of the following instructions assume this environment variable remains set, including for the build instructions.
You may need to set it again (to the same location) in case you open a new shell.

Now you need to download and run the online installer using the provided flags.
The process differs depending on what system you're using. Here we provide separate instructions for Linux and macOS.

In both cases installation can take quite some time (due to the large download sizes).

### Installing Qt dependencies on Linux

The real action happens when you execute `qt-online-installer-linux-*.run`.

```
curl -O https://d13lb3tujbc8s0.cloudfront.net/onlineinstallers/qt-online-installer-linux-x64-4.8.1.run
chmod 744 qt-online-installer-linux-*.run
./qt-online-installer-linux-*.run in \
    --ao --al -c --auto-answer telemetry-question=No -t ${QT_INSTALL_DIR} \
    extensions.qtwebengine qt.qt6.680 qt.qt6.680.addons qt.tools.cmake \
    qt.tools.maintenance qt.tools.ninja qt.tools.qtcreator \
    qt.tools.qtcreator_gui qtcreator
CMAKE_PATH=${QT_INSTALL_DIR}/Tools/CMake/bin/
```

### Installing Qt dependencies on macOS

The real action happens when you execute `qt-online-installer-macOS-*`.

```
curl -O https://d13lb3tujbc8s0.cloudfront.net/onlineinstallers/qt-online-installer-macOS-x64-4.8.1.dmg
hdiutil attach qt-online-installer-macOS-*.dmg
/Volumes/qt-online-installer-macOS-*/qt-online-installer-macOS-*.app/Contents/MacOS/qt-online-installer-macOS-* in \
    --ao --al -c --auto-answer telemetry-question=No -t ${QT_INSTALL_DIR} \
    extensions.qtwebengine qt.qt6.680 qt.qt6.680.addons qt.tools.cmake \
    qt.tools.maintenance qt.tools.ninja qt.tools.qtcreator \
    qt.tools.qtcreator_gui qtcreator
hdiutil detach /Volumes/qt-online-installer-macOS-*
CMAKE_PATH=${QT_INSTALL_DIR}/Tools/CMake/CMake.app/Contents/bin/
```

## Build the software

The following steps assume you've installed Qt6 and the Qt WebEngine extension. See the prerequisites section in case you've not already done this.

Download the repository working tree.

```
git clone https://github.com/llewelld/WebEngineTest.git
```

```
pushd WebEngineTest
mkdir build
pushd build
```

Create make files for building:

```
Qt6_DIR=${QT_INSTALL_DIR}/6.8.0/*/lib/cmake/Qt6/ Qt6QmlTools_DIR=${QT_INSTALL_DIR}/6.8.0/*/lib/cmake/Qt6QmlTools/ ${CMAKE_PATH}/cmake ..
```

Build the executable:

```
make
```

Finally, you can run the executable from the same build directory for Linux:

```
./appWebEngineTest
```

Or on macOS:
``
open ./appWebEngineTest.app
``

## Clean

If you want to clean up after your build, use the following steps.
These commands *delete files* so please handle them with care.

```
popd
rm -rf build-test
popd
rm -rf Qt6
rm qt-online-installer-*
```




