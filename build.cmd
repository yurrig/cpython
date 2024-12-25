setlocal
call %~dp0..\vc_setup.cmd
pushd %~dp0PCBuild
title Building Python Debug
call build.bat -d
title Building Python Release
call build.bat
title Done building Python
cd %~dp0..
PdbIndexer %DEPS_SOURCE_URL%/cpython
NuGet.exe pack python.nuspec -OutputDirectory %PACKAGES%\nuget_packages
popd
endlocal
