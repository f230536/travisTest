# this first part might not be needed

curl -O http://selenium-release.storage.googleapis.com/2.48/SafariDriver.safariextz
# this first part might not be needed
curl -O http://selenium-release.storage.googleapis.com/2.48/SafariDriver.safariextz

# OSX 10.11
#sudo sqlite3 /Library/Application\ Support/com.apple.TCC/TCC.db "REPLACE INTO access values ('kTCCServiceAccessibility', 'com.apple.Terminal', 0, 1, 1, NULL, NULL);"

#OSX 10.10
#sudo sqlite3 /Library/Application\ Support/com.apple.TCC/TCC.db "REPLACE INTO access values ('kTCCServiceAccessibility', 'com.apple.Terminal', 0, 1, 1, NULL);"


#osascript -e 'tell application "Safari"
#  activate
#end tell'
open SafariDriver.safariextz

osascript -e '
tell application "System Events"
  tell process "Safari"
    set frontmost to true
      repeat until (exists window 1) and subrole of window 1 is "AXDialog" -- wait until the dialog is displayed.
        delay 1
      end repeat
    click button 1 of front window -- Trust
  end tell
end tell'