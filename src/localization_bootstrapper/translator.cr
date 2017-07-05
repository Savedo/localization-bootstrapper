module LocalizationBootstrapper
  class Translator
    def initialize(@from_lang : String, @to_lang : String)
      @google_translate = GoogleTranslate::Client.new
    end

    def translate(text : String) : String
      translation = @google_translate.translate(@from_lang, @to_lang, text)
      translation.text
    end
  end
end
