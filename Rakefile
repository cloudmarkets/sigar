require 'bundler' 
require 'rubygems'
require 'rubygems/package_task'
require 'rake'
require 'rake/testtask'
require 'rake/extensiontask'

task :default => :test

MAKE = (/mswin/ =~ RUBY_PLATFORM) ? 'nmake' : 'make'

def in_ext()
  ext = 'ext/cloudmarkets/sigar/'
  Dir.chdir(ext) if File.directory? ext
end

desc 'Include bundler helper tasks'  # maybe remove again
Bundler::GemHelper.install_tasks

desc 'Rake extension task'
Rake::ExtensionTask.new "cloudmarkets/sigar" do |ext|
  ext.lib_dir = "lib/cloudmarkets"
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

#desc 'Clean sigar extension'
#task :clean do
#  in_ext()
#  system(MAKE + ' clean') if File.exists? "Makefile"
#end
#
desc 'Dist Clean sigar extension'
task :distclean do
  in_ext()
  system(MAKE + ' distclean') if File.exists? "Makefile"
end

#desc 'Run sigar examples (test)'
#task :examples => [:build] do
#  in_ext()
#  Dir["examples/*.rb"].each do |file|
#    cmd = "ruby -I. #{file}"
#    print cmd + "\n"
#    system(cmd)
#  end
#end
