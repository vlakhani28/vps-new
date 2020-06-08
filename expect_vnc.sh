#!/usr/bin/expect -f
spawn vncserver -depth 32 -pixelformat rgb888 -geometry 1440x900 :1
expect  "*word:*"
send "demo2020\n"
expect  "*Verify:*"
send "demo2020\n"
expect  "*view-only*"
send "n\n"
expect eof
