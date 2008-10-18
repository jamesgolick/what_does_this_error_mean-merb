require 'merb-core'

Merb::Dispatcher::DefaultException._template_root = File.dirname(__FILE__) / ".." / "templates"

module WhatDoesThisErrorMeanMerb
  NAME = 'what_does_this_error_mean-merb'

  module VERSION
    MAJOR  = 0
    MINOR  = 0
    TINY   = 1

    STRING = [MAJOR, MINOR, TINY].join('.')
  end
end

