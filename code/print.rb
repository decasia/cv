#!/usr/bin/env ruby

# invoke with ruby print.rb
# writes latex content to STDOUT (pipe to a file if you like)

require 'optparse'
require 'tilt'
require 'kramdown'
require_relative 'yaml_data'

data_path = File.expand_path('../data', File.dirname(__FILE__))
web_path = File.expand_path './templates/print.erb', File.dirname(__FILE__)

research_id = nil
parser = OptionParser.new do |opts|
  opts.banner = "Usage: ruby print.rb [options]"
  opts.on("-iINTEREST", "--interests=INTEREST", "Research interests to include") do |interest_id|
    research_id = interest_id
  end
end.parse!

# Load data
data = YAMLData.new(data_path)

# Dynamically attach filter function to data object (this is a way of sneaking
# a helper method into Tilt, which doesn't have render helpers per se).
def data.filter(md) # wow, you can do this in ruby!
  Kramdown::Document.new(md).to_latex.strip
end
data[:research_id] = research_id

# Render
template = Tilt.new web_path
results = template.render data, trim: true

# Write to STDOUT
puts results
