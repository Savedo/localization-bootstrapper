module SavedoLocalizer
  class Config
    property :from_lang, :to_lang, :input_file, :output_file

    def initialize
      @from_lang = "en"
      @to_lang = ""
      @input_file = ""
      @output_file = ""
    end
  end
end
