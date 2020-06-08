#!/usr/bin/expect -f
spawn vncpasswd
expect  "*word:*"
send "demo2020\n"
expect  "*Verify:*"
send "demo2020\n"
expect eof
