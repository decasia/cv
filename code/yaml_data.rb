require 'yaml'
require 'ostruct'

# This class provides the general functionality of transforming any folder of
# valid YAML data files into a data object with an attribute per YAML file. It
# assumes that each filename (minus extension) is a valid ruby hash key and
# that each file contains a 1-dimensional array of either simple values
# (strings) or key-value dictionaries. If it finds the latter it will
# transform the k-v list items into OpenStructs as well (which makes it easier
# to work with list item attributes downstream).

class YAMLData < OpenStruct
  def initialize(data_dir)
    Dir.chdir data_dir

    yaml_data = Dir["*.yml"].map { |name|
      data = YAML.load_file name
      data = structify(data) if data.first.is_a? Hash

      key = name[0..-5] # strip off suffix to get array key
      [key.to_sym, data]  # 2-item arrays become hash key-value pairs
    }.to_h

    super(yaml_data)
  end

  protected

  # makes an array of object hashes into an array of OpenStructs
  def structify(hash_list)
    hash_list.map { |item| OpenStruct.new(item) }
  end
end
