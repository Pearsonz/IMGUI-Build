cd ./AndroidBuildProject/
call gradlew.bat assembleRelease
copy .\app\build\outputs\aar\app-release.aar ..\..\dear-imgui-project\Packages\dear-imgui-unity\Plugins\android\DearImGuiUnityLibs.aar