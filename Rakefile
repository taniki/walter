require 'rubygems'
require 'rake'
require 'echoe'

Echoe.new('walter', '0.0.3') do |p|
  p.description    = "A small webapp to explore and read a bunch of quotes stored as textfiles"
  p.url            = "https://github.com/taniki/walter"
  p.author         = "Duong Tam Kien"
  p.email          = "tk@deveha.com"
  p.ignore_pattern = ["tmp/*", "quotes/*", "views/*", "public/css/*", "._*" ]
  p.development_dependencies = [ "sinatra", "rdiscount", "yaml", "erb"]
end