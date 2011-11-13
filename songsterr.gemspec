require 'rake/gempackagetask'
require 'rake/rdoctask'

Gem::Specification.new do |s|
  s.name = 'songsterr'
  s.version = '0.1.1'
  s.summary = 'A Ruby wrapper for the Songsterr REST API'
  s.homepage = "http://github.com/endel/songsterr-api"

  s.author = ['Endel Dreyer']
  s.email = ['endel.dreyer@gmail.com']
  s.files = %w(LICENSE) + Dir.glob("{lib}/**/*")
  s.require_path = "lib"

  s.add_dependency "rest-client", ">= 1.6.7"
  s.add_dependency "json", ">= 1.6.1"

  s.description = <<description
  A Ruby wrapper for the Songsterr REST API
description
end

