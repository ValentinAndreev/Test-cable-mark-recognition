# frozen_string_literal: true

Gem::Specification.new do |s|
  s.name = 'recognition'
  s.authors = ['Valentin Andreev']
  s.version = '0.0.1'
  s.date = '2019-04-25'
  s.summary = 'recognition'
  s.files = [
    'lib/recognition.rb'
  ]
  s.require_paths = ['lib']

  s.add_development_dependency 'rspec'
  s.add_development_dependency 'rubocop'
end
