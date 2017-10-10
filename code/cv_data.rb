require 'yaml'
require 'ostruct'

DATA_PATH = File.expand_path('../data', File.dirname(__FILE__))

# This class is really misnamed -- it actually is completely
# general and will transform any folder of valid YAML data files
# into a data object with a sub-object per YAML file. It assumes that
# each file is a valid ruby hash key and that each file contains
# a 1-dimensional array of either simple values (strings) or
# key-value dictionaries. If it finds the latter it will transform
# the list items into OpenStructs as well, for ease of access
# in (e.g.) templating code.

class CVData < OpenStruct
  def load
    Dir.chdir DATA_PATH
    Dir["*.yml"].each do |name|
      data = YAML.load_file name
      data = structify(data) if data.first.is_a? Hash

      key = name[0..-5] # strip off suffix to get key
      self[key.to_sym] = data
    end
  end

  protected

  # makes an array of object hashes into an array of OpenStructs
  def structify(hash_list)
    hash_list.map do |item|
      OpenStruct.new(item)
    end
  end
end
