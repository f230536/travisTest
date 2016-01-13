# this first part might not be needed
osascript -e 'tell application "Safari"
  activate
end tell'

osascript -e 'ignoring application responses
  tell application "Safari"
    open "'"SafariDriver.safariextz"'"
    end tell
end ignoring
tell application "System Events"
  tell process "Safari"
    set frontmost to true
      repeat until (exists window 1) and subrole of window 1 is "AXDialog" -- wait until the dialog is displayed.
        delay 1
      end repeat
    click button 1 of front window -- install
  end tell
end tell'