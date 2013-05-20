# Load path and gems/bundler
# exec as 'irb -r ./console.rb'
#
$LOAD_PATH << File.expand_path(File.dirname(__FILE__))
require "rubygems"
require "bundler"
Bundler.require

require "debugger"

require 'logger'

# Local config
require "find"
%w{config/initializers lib models}.each do |load_path|
  #Find.find(load_path) { |f| require f unless f.match(/\/\..+$/) || File.directory?(f) }
  Find.find(load_path) { |f|
    unless f.match(/\/\..+$/) || File.directory?(f)
      require f if f.match(/\.rb$/)
    end
  }
end

# Load app
# require "bayeux_push"
