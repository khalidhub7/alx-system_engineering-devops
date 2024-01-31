#!/usr/bin/env ruby

#Ruby script accepts 1 arg and pass it to a regular expression matching method

puts ARGV[0].scan(/hbt{2,5}/).join
