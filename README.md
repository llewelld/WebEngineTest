# WebEngineTest

Qt WebEngine app for "Anatomy of a Browser - Embedded Mobile Lizards " talk

## Clone the repository

Whether you want to build with Qt Creator or at the command line, you'll first need to clone the repository working tree.

```
git clone https://github.com/llewelld/WebEngineTest.git
```

## Build using Qt Creator

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

## Build at the command line

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
The process differs depending on what system you're using.

### Different instructions for Linux and macOS

From this point I tried really hard to write instructions that work for both Linux and macOS.
But not only do things get installed in different places, the structure of the Qt installation differs between the two.
Even the approach to running the final executable differs.

This saddens me greatly, but I've concluded that the simplest solution is to have different instructions for each platform.
Both platforms have equivalent steps, but the details are different enough that working around them using environment variables turned out to be Byzantine.

So please refer to the specific instructions for your platforms.

### Install Qt dependencies on Linux

The real action happens when you execute `qt-online-installer-linux-*.run`.
Installation at that point can take quite some time (30 minutes) due to the large download sizes.

```
curl -O https://d13lb3tujbc8s0.cloudfront.net/onlineinstallers/qt-online-installer-linux-x64-4.8.1.run
chmod 744 qt-online-installer-linux-*.run
./qt-online-installer-linux-*.run in \
    --ao --al -c --auto-answer telemetry-question=No -t ${QT_INSTALL_DIR} \
    extensions.qtwebengine qt.qt6.680 qt.qt6.680.addons qt.tools.cmake \
    qt.tools.maintenance qt.tools.ninja qt.tools.qtcreator \
    qt.tools.qtcreator_gui qtcreator
```

### Build on Linux

To build, move inside the `build` directory and execute `cmake`.
We have to point various environment variables at places in the Qt installation directory so that `cmake` can find them.
We also use the `cmake` that was installed with Qt, but you can use your default `cmake` if you already have it installed.

```
mkdir WebEngineTest/build
pushd WebEngineTest/build
Qt6_DIR=${QT_INSTALL_DIR}/6.8.0/gcc_64//lib/cmake/Qt6/ \
    Qt6QmlTools_DIR=${QT_INSTALL_DIR}/6.8.0/gcc_64/lib/cmake/Qt6QmlTools/ \
    ${QT_INSTALL_DIR}/Tools/CMake/bin/cmake ..
make
```

### Execute on Linux

Once the build completes successfully, you can run the resulting binary from inside the `build` directory.

```
./appWebEngineTest
```

### Install Qt dependencies on macOS

The real action happens when you execute `qt-online-installer-macOS-*`.
Installation at that point can take quite some time (35 minutes) due to the large download sizes.

```
curl -O https://d13lb3tujbc8s0.cloudfront.net/onlineinstallers/qt-online-installer-macOS-x64-4.8.1.dmg
hdiutil attach qt-online-installer-macOS-*.dmg
/Volumes/qt-online-installer-macOS-*/qt-online-installer-macOS-*.app/Contents/MacOS/qt-online-installer-macOS-* in \
    --ao --al -c --auto-answer telemetry-question=No -t ${QT_INSTALL_DIR} \
    extensions.qtwebengine qt.qt6.680 qt.qt6.680.addons qt.tools.cmake \
    qt.tools.maintenance qt.tools.ninja qt.tools.qtcreator \
    qt.tools.qtcreator_gui qtcreator
hdiutil detach /Volumes/qt-online-installer-macOS-*
```

### Build on macOS

To build, move inside the `build` directory and execute `cmake`.
We have to point various environment variables at places in the Qt installation directory so that `cmake` can find them.
We also use the `cmake` that was installed with Qt, but you can use your default `cmake` if you already have it installed.

```
mkdir WebEngineTest/build
pushd WebEngineTest/build
Qt6_DIR=${QT_INSTALL_DIR}/6.8.0/macos//lib/cmake/Qt6/ \
    Qt6QmlTools_DIR=${QT_INSTALL_DIR}/6.8.0/macos/lib/cmake/Qt6QmlTools/ \
    ${QT_INSTALL_DIR}/Tools/CMake/CMake.app/Contents/bin/cmake ..
make
```

### Execute on macOS

Once the build completes successfully, you can run the resulting binary from inside the `build` directory.

```
open ./appWebEngineTest.app
```

## Clean

Once you're done you can clean up the build artefacts (including the built binary) in the standard way by calling:
```
make clean
```

You can go further and remove the Qt installation directory too if you don't want it further.
This will *delete files* so execute these commands with care.
Conveniently, after running these commands and deleting the cloned repository, your machine should be left in the same state as before you started.
```
popd
rm -rf WebEngineTest/build/
rm -rf Qt
rm qt-online-installer-*
```

