@echo off
echo Start adb server (if not running)
adb start-server
echo Connect adb to usb
adb usb
timeout /t 3 /NOBREAK > nul
echo Push flows to storage
adb push bhcl.flo /sdcard/bhcl/bhcl.flo
adb push resetbhcl.flo /sdcard/bhcl/resetbhcl.flo
echo Install automate
adb install automate.apk
echo Install automate settings permission
adb install setperm.apk 
echo Install automate storage permission
adb install storeperm.apk
echo Import flow one ( DO NOT TOUCH SCREEN )
adb shell am start -n "com.llamalab.automate/.FlowImportActivity" -d "file:///sdcard/bhcl/bhcl.flo"
adb shell input mouse keyevent 22
adb shell input mouse keyevent 22
adb shell input mouse keyevent 22
adb shell input mouse keyevent 66
echo Import flow two ( DO NOT TOUCH SCREEN )
adb shell am start -n "com.llamalab.automate/.FlowImportActivity" -d "file:///sdcard/bhcl/resetbhcl.flo"
adb shell input mouse keyevent 22
adb shell input mouse keyevent 22
adb shell input mouse keyevent 22
adb shell input mouse keyevent 66
adb shell monkey -p com.llamalab.automate 1
adb shell input mouse keyevent 22
adb shell input mouse keyevent 22
adb shell input mouse keyevent 22
adb shell input mouse keyevent 66
echo.
echo Setup section ( may vary according to your device )
echo.
echo 1. Open the app named "Automate"
echo 2. Press "bhcl"
echo 3. Allow access screen content and observe your actions
echo 4. Allow ignore battery optimizations
echo 5. Allow modify or delete the contents of your SD card
echo 6. Allow read the contents of your SD card
echo 7. Press the recipt icon
echo 8. Uncheck logging
echo 9. Back out
echo 10. Press the hamburger menu and press settings
echo 11. Scroll down to privileges and press it
echo 12. check act as voice assisant with access to screen content and check it
echo 13. Back out
echo 14. Scroll down to run on system startup and check it
echo 15. Back out
echo 16. Press "resetbhcl"
echo 17. Allow access screen content and observe your actions
echo 18. Allow ignore battery optimizations
echo 19. Allow modify or delete the contents of your SD card
echo 20. Allow read the contents of your SD card
echo 21. Back out
echo 22. Press "bhcl"
echo 23. Press start and set it up
echo.
echo Press any key when you are done...
pause > nul
echo That is it :)
echo Enjoy bhcl.
pause 
exit

