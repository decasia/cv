#!/usr/bin/env ruby

# invoke with ruby web.rb
# writes HTML content to STDOUT (pipe to a file if you like)

require 'tilt'
require_relative 'cv_data'

web_path = File.expand_path './templates/web.haml', File.dirname(__FILE__)

# Load data
data = CVData.new
data.load

# Render
template = Tilt.new web_path
results = template.render data

# Write to STDOUT
puts results
