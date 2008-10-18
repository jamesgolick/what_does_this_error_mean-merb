require 'rake'
require 'rake/rdoctask'
require File.dirname(__FILE__)+'/lib/what_does_this_error_mean-merb'
Dir.glob(File.dirname(__FILE__)+'/tasks/**/*.rake').each { |l| load l }

task :default => :test

task :test do
  Dir['test/**/*_test.rb'].each { |l| require l }
end
