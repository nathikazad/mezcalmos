@echo off

if "%~1"=="" goto howto
if "%~2"=="web" goto web
echo Running `flutter run` with APP_SP="%~1"
flutter run --dart-define=APP_SP="%~1"
echo Done.
goto :eof
:web
flutter run -d chrome --dart-define=APP_SP="%~1"
echo Done.
goto :eof
:howto
echo Usage: %0 ^<AppName^> ^<Platform^>
exit /B 1
