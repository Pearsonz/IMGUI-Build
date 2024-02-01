#!/usr/bin/env bash

# Absolute path to the script's directory
scriptDir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Default values
_CMakeBuildType=Release
_Platform=""
_StaticLibrary="no"  # Default to no for non-iOS platforms

while :; do
    if [ $# -le 0 ]; then
        break
    fi

    case $1 in
        --debug)
            _CMakeBuildType=Debug
            ;;
        --release)
            _CMakeBuildType=Release
            ;;
        --platform)
            shift
            if [ $# -gt 0 ]; then
                _Platform=$1
            else
                echo "Error: Missing value for --platform parameter."
                exit 1
            fi
            ;;
        --static)
            _StaticLibrary="yes"
            ;;
        *)
            echo "Error: Unrecognized option or parameter: $1"
            exit 1
    esac

    shift
done

if [ -z "$_Platform" ]; then
    echo "Error: Missing platform parameter. Use --platform <platform_name>."
    exit 1
fi

# Define platform-specific folders
case $_Platform in
    iOS)
        _PlatformFolder="iOS"
        _StaticLibrary="yes"  # Force static library for iOS
        ;;
    macOS)
        _PlatformFolder="macOS"
        ;;
    *)
        echo "Error: Unsupported platform: $_Platform"
        exit 1
        ;;
esac

# Create build directory
buildDir="$scriptDir/build/$_PlatformFolder/$_CMakeBuildType"
mkdir -p "$buildDir"
cd "$buildDir"

# Build the project
case $_Platform in
    iOS)
        cmake -G Xcode "$scriptDir" -DCMAKE_BUILD_TYPE=$_CMakeBuildType -DPLATFORM=$_Platform -DIMGUI_STATIC=$_StaticLibrary -DCMAKE_SYSTEM_NAME=iOS -DCMAKE_OSX_ARCHITECTURES=arm64 -DCMAKE_IOS_INSTALL_COMBINED=YES -DBUILD_SHARED_LIBS=NO || exit 1
        ;;
    *)
        cmake "$scriptDir" -DCMAKE_BUILD_TYPE=$_CMakeBuildType -DPLATFORM=$_Platform -DIMGUI_STATIC=$_StaticLibrary -DBUILD_SHARED_LIBS=NO || exit 1
        
        make
        ;;
esac

