LIBRARY_PATH="$(brew --prefix)/lib"
export LIBRARY_PATH
export VCPKG_ROOT="$(brew --prefix)/Library/VCPkg"
launchctl setenv VCPKG_ROOT "$VCPKG_ROOT"
export CC="$(brew --prefix)/bin/clang"
export CXX="$(brew --prefix)/bin/clang++"
PATH="/private/var/tmp/.homebrew/opt/make/libexec/gnubin:$PATH"
export SDKROOT=/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk
export CPM_SOURCE_CACHE="$HOME/.cache/cpm"
export CMAKE_BUILD_PARALLEL_LEVEL=8
export JAVA_HOME="$(brew --prefix)/opt/openjdk@17/libexec/openjdk.jdk/Contents/Home"
