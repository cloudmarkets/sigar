require 'rubygems'
require 'rubygems/package_task'
require 'rake/testtask'

task :default => :test

MAKE = (/mswin/ =~ RUBY_PLATFORM) ? 'nmake' : 'make'

def in_ext()
  ext = 'ext/cloudmarkets/sigar/bindings/ruby'
  Dir.chdir(ext) if File.directory? ext
end

desc 'Build sigar extension'
task :build do
  in_ext()
  unless File.exists? "Makefile"
    unless system("ruby extconf.rb")
      STDERR.puts "Failed to configure"
      break
    end
  end
  unless system(MAKE)
    STDERR.puts 'Failed to ' + MAKE
    break
  end
end

Rake::TestTask.new do |t|
  in_ext()
  t.pattern = 'test/*_test.rb'
  t.libs << "."
end

task :test => [:build] do
  in_ext()
end

desc 'Clean sigar extension'
task :clean do
  in_ext()
  system(MAKE + ' clean') if File.exists? "Makefile"
end

desc 'Dist Clean sigar extension'
task :distclean do
  in_ext()
  system(MAKE + ' distclean') if File.exists? "Makefile"
end

desc 'Run sigar examples (test)'
task :examples => [:build] do
  in_ext()
  Dir["examples/*.rb"].each do |file|
    cmd = "ruby -I. #{file}"
    print cmd + "\n"
    system(cmd)
  end
end
