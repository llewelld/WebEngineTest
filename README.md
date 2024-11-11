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

Install Qt6 including the Qt WebEngine extension.

Set the location to install to:

```
QT_INSTALL_DIR=${PWD}/Qt
```

Note that all of the instructions here assume this environment variable is set to the correct location, including in the build instructions.

Download the online installer. This can be done for Linux like so:

```
curl -o https://d13lb3tujbc8s0.cloudfront.net/onlineinstallers/qt-online-installer-linux-x64-4.8.1.run
```

Or for macOS like so:

```
curl -o https://d13lb3tujbc8s0.cloudfront.net/onlineinstallers/qt-online-installer-macOS-x64-4.8.1.dmg
```

Set the downloaded installer to be executable:

```
chmod 744 qt-online-installer-linux-*
```

Finally, run the installer. The following will run it in unsupervised mode (no GUI). It'll install Qt6, Qt Creator, the build tools and Qt WebEngine.

```
./qt-online-installer-linux-* --ao --al -c --auto-answer telemetry-question=No in -t ${QT_INSTALL_DIR} extensions.qtwebengine qt.qt6.680 qt.qt6.680.addons qt.tools.cmake qt.tools.maintenance qt.tools.ninja qt.tools.qtcreator qt.tools.qtcreator_gui qtcreator
```

This last step may take a while as it has to download the various components. Once it's done you can move to building the software.

## Build the software

The following steps assume you've installed Qt6 and the Qt WebEngine extension. See the prerequisites section for how you can do this.

Download the repository working tree.

```
git clone https://github.com/llewelld/WebEngineTest.git
```

```
pushd WebEngineTest
mkdir build-test
pushd build-test
```

Create make files for building:

```
Qt6_DIR=${QT_INSTALL_DIR}/6.8.0/gcc_64/lib/cmake/Qt6/ Qt6QmlTools_DIR=${QT_INSTALL_DIR}/6.8.0/gcc_64/lib/cmake/Qt6QmlTools/ cmake ..
```

Build the executable:

```
make
```

Finally, you can run the executable from the same build directory:

```
./appWebEngineTest
```

