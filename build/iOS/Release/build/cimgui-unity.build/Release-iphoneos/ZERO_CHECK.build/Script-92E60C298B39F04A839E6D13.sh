#!/bin/sh
set -e
if test "$CONFIGURATION" = "Debug"; then :
  cd /Users/pearson/Documents/ImGUIProject/IMGUI-Build/build/iOS/Release/cimgui-unity
  make -f /Users/pearson/Documents/ImGUIProject/IMGUI-Build/build/iOS/Release/cimgui-unity/CMakeScripts/ReRunCMake.make
fi
if test "$CONFIGURATION" = "Release"; then :
  cd /Users/pearson/Documents/ImGUIProject/IMGUI-Build/build/iOS/Release/cimgui-unity
  make -f /Users/pearson/Documents/ImGUIProject/IMGUI-Build/build/iOS/Release/cimgui-unity/CMakeScripts/ReRunCMake.make
fi
if test "$CONFIGURATION" = "MinSizeRel"; then :
  cd /Users/pearson/Documents/ImGUIProject/IMGUI-Build/build/iOS/Release/cimgui-unity
  make -f /Users/pearson/Documents/ImGUIProject/IMGUI-Build/build/iOS/Release/cimgui-unity/CMakeScripts/ReRunCMake.make
fi
if test "$CONFIGURATION" = "RelWithDebInfo"; then :
  cd /Users/pearson/Documents/ImGUIProject/IMGUI-Build/build/iOS/Release/cimgui-unity
  make -f /Users/pearson/Documents/ImGUIProject/IMGUI-Build/build/iOS/Release/cimgui-unity/CMakeScripts/ReRunCMake.make
fi

