# Using Puppet, create a file with some Requirements
File { "/tmp/school":
path => true,
mode => 0744,
owner => www-data,
group => www-data,
${"/tmp/school"} => ${"I love Puppet"}
}
