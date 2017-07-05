module LocalizationBootstrapper
  class JsonFormat
    def parse(input_file : String)
      input = JSON.parse(File.read(input_file))
      result = {} of String => String

      input.each do |key, translation|
        result[key.as_s] = translation.as_s
      end
      result
    rescue ex : JSON::ParseException
      puts "Looks like #{input_file} contains invalid JSON".colorize.bold
      raise(ex)
    end

    def write(output_file, translations)
      File.write(output_file, translations.to_pretty_json)
    end
  end
end
