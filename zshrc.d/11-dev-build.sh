LIBRARY_PATH="$(brew --prefix)/lib"
export LIBRARY_PATH
export VCPKG_ROOT="$(brew --prefix)/Library/VCPkg"
launchctl setenv VCPKG_ROOT "$VCPKG_ROOT"
