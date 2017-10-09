require 'yaml'
require 'ostruct'

class CVData
  def education
    @education ||= load_objects('../data/education.yml')
  end

  def fieldwork
    @fieldwork ||= load_objects('../data/fieldwork.yml')
  end

  def honors
    @honors ||= load_objects('../data/honors.yml')
  end

  def jobs
    @jobs ||= load_objects('../data/employment.yml')
  end

  def languages
    @languages ||= load_strings('../data/languages.yml')
  end

  def machine_languages
    @machine_languages ||= load_strings('../data/machine_languages.yml')
  end

  def organizing
    @organizing ||= load_objects('../data/scholarly-organization.yml')
  end

  def presentations
    @presentations ||= load_objects('../data/presentations.yml')
  end

  def publications
    @publications ||= load_objects('../data/publications.yml')
  end

  def reviews
    @reviews ||= load_strings('../data/reviews.yml')
  end

  protected

  def load_strings(path)
    YAML.load_file(path)
  end

  def load_objects(path)
    YAML.load_file(path).map do |item|
      OpenStruct.new(item)
    end
  end
end
