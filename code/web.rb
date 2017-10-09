#!/usr/bin/env ruby

# invoke with ruby web.rb (from the script's directory)

require 'tilt'
require_relative 'cv_data'

OUTPUT_PATH = '../public/web-content.html'

# Load data
data = CVData.new

# Render
template = Tilt.new './templates/web.haml'
results = template.render data

# Write
File.write OUTPUT_PATH, results

puts "Successfully wrote #{OUTPUT_PATH}."
