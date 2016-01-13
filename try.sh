# this first part might not be needed
curl -O http://selenium-release.storage.googleapis.com/2.48/SafariDriver.safariextz

# OSX 10.11
#sudo sqlite3 /Library/Application\ Support/com.apple.TCC/TCC.db "REPLACE INTO access values ('kTCCServiceAccessibility', 'com.apple.Terminal', 0, 1, 1, NULL, NULL);"

#OSX 10.10
sudo sqlite3 /Library/Application\ Support/com.apple.TCC/TCC.db "REPLACE INTO access values ('kTCCServiceAccessibility', 'com.apple.Terminal', 0, 1, 1, NULL);"

open SafariDriver.safariextz
osascript -e '
tell application "System Events"
  tell process "Safari"
    delay 3
    click button "Trust" of sheet 1 of window 1
    delay 
    quit
  end tell
end tell

tell application "Safari"
  quit
end tell
'