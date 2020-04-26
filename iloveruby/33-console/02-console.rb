#!/usr/bin/env ruby
# https://www.devdungeon.com/content/get-password-console-ruby
# Another option that works is using $stdin.noecho().
# You have to do a little more string manipulation and output managment
# but it works the same way with slightly more code.

require 'io/console'

# Another option using $stdin.noecho()
$stdout.print "Enter password: "
password = $stdin.noecho(&:gets)
password.strip!
sleep 5
puts "\nYour password was #{password.length} characters long."
