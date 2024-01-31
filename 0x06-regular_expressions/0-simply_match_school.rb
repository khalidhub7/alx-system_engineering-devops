#!/usr/bin/env ruby

# Ruby script that accept 1 arg and pass it to a regular expression

puts ARGV[0].scan(/School/).join
