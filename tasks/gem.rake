require 'rake/gempackagetask'

task :clean => :clobber_package

spec = Gem::Specification.new do |s|
  s.name                  = WhatDoesThisErrorMeanMerb::NAME
  s.version               = WhatDoesThisErrorMeanMerb::VERSION::STRING
  s.summary               = "Integrates merb development mode with whatdoesthiserrormean.com"
  s.description           = "This plugin overrides the error message page that appears in merg development mode when an exception is raised to provide a link to search whatdoesthiserrormean.com for that error."
  s.authors               = ["Francois Beausoleil", "Daniel Haran", "James Golick"]
  s.email                 = 'james@giraffesoft.ca'
  s.homepage              = 'http://jamesgolick.com/wdtem'
  s.rubyforge_project     = 'what_does_this_error_mean-merb'
  s.has_rdoc              = true

  s.required_ruby_version = '>= 1.8.5'

  s.files                 = %w(README LICENSE) +
                            Dir.glob("{lib,templates}/**/*")
  
  s.require_path          = "lib"
end

Rake::GemPackageTask.new(spec) do |p|
  p.gem_spec = spec
end

task :tag_warn do
  puts "*" * 40
  puts "Don't forget to tag the release:"
  puts
  puts "  git tag -a v#{WhatDoesThisErrorMeanMerb::VERSION::STRING}"
  puts
  puts "or run rake tag"
  puts "*" * 40
end

task :tag do
  sh "git tag -a v#{WhatDoesThisErrorMeanMerb::VERSION::STRING}"
end
task :gem => :tag_warn

namespace :gem do  
  namespace :upload do

    desc 'Upload gems (ruby & win32) to rubyforge.org'
    task :rubyforge => :gem do
      sh 'rubyforge login'
      sh "rubyforge add_release giraffesoft what_does_this_error_mean-merb #{WhatDoesThisErrorMeanMerb::VERSION::STRING} pkg/#{spec.full_name}.gem"
      sh "rubyforge add_file    giraffesoft what_does_this_error_mean-merb #{WhatDoesThisErrorMeanMerb::VERSION::STRING} pkg/#{spec.full_name}.gem"
    end
    
  end
end

task :install => [:clobber, :package] do
  sh "sudo gem install pkg/#{spec.full_name}.gem"
end

task :uninstall => :clean do
  sh "sudo gem uninstall -v #{WhatDoesThisErrorMeanMerb::VERSION::STRING} -x #{WhatDoesThisErrorMeanMerb::NAME}"
end
