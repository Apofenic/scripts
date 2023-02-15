#!/bin/bash
# osascript \
#     -e 'tell application "iTerm" to activate' \
#     -e 'tell application "System Events"' \
#     -e 'tell process "iTerm" to keystroke "D" using {shift down,command down}' \
#     -e 'tell application "iTerm" to tell session -1 of current terminal to write text "pwd"' 
# -e 'end tell'
osascript <<EOF
    tell application "iTerm" to activate
    tell application "System Events"
    tell process "iTerm" to keystroke "D" using {shift down,command down}
    tell application "iTerm" to tell session -1 of current terminal to write text "pwd"
  end tell
end tell
EOF

