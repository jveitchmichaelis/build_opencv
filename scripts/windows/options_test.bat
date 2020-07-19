@echo off
cd ..\..\
:: get with_python_release option from options file (11th line)
set "additional_build_options_text="
for /F "skip=10 delims=" %%i in (options.txt) do if not defined additional_build_options_text set "additional_build_options_text=%%i"
set "additional_build_options=%additional_build_options_text:*^==%"
echo additional_build_options:%additional_build_options%

cd scripts\windows