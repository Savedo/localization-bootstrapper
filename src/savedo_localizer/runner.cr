module SavedoLocalizer
  class Runner
    @from_lang : String
    @to_lang : String
    @input_file : String
    @output_file : String

    def initialize(config)
      @from_lang = config.from_lang
      @to_lang = config.to_lang
      @input_file = config.input_file
      @output_file = config.output_file

      @translator = Translator.new(@from_lang, @to_lang)
    end

    def run
      format = get_format

      input_translations = format.parse(@input_file)
      output_translations = {} of String => String

      total = input_translations.size

      input_translations.each_with_index do |(key, source_text), index|
        # Sleep for a while to prevent GoogleTranslate blocking
        sleep 1

        translation = @translator.translate(source_text)
        output_translations[key] = translation
        print_progress(key, source_text, translation, index+1, total)
      end

      format.write(@output_file, output_translations)

      puts "Translations are saved to #{@output_file.colorize.bold}"
    end

    private def print_progress(key, source_text, translation, current, total)
      puts "#{key.colorize.green}  #{current}/#{total}"
      puts "  #{@from_lang.colorize.blue}: #{source_text}"
      puts "  #{@to_lang.colorize.blue}: #{translation}"
      puts
    end

    private def parse_input_file
      JsonFormat.new.parse(@input_file)
    end

    # Currently only JSON format is support, in the future can be also YAML.
    private def get_format
      JsonFormat.new
    end
  end
end
