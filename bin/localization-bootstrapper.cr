require "../src/localization_bootstrapper"
require "option_parser"

config = LocalizationBootstrapper::Config.new

OptionParser.parse! do |parser|
  parser.banner = "Usage: savedo-localizer OPTIONS"

  parser.on("-f FROM_LANG", "--from FROM_LANG", "From language (default 'en')") do |from_lang|
    config.from_lang = from_lang
  end

  parser.on("-t TO_LANG", "--to TO_LANG", "To language") do |to_lang|
    config.to_lang = to_lang
  end

  parser.on("-i INPUT_FILE", "--input INPUT_FILE", "Input file") do |input_file|
    config.input_file = input_file
  end

  parser.on("-o OUTPUT_FILE", "--output OUTPUT_FILE", "Output file") do |output_file|
    config.output_file = output_file
  end

  parser.on("-h", "--help", "Show help message") do
    puts parser
    exit 0
  end

  parser.on("-v", "--version", "Show version") do
    puts LocalizationBootstrapper::VERSION
    exit 0
  end
end

# Make sure all necessary information is present
abort("--from option must be specified") if config.from_lang.empty?
abort("--to option must be specified") if config.to_lang.empty?
abort("--input option must be specified") if config.input_file.empty?
abort("--output option must be specified") if config.output_file.empty?

LocalizationBootstrapper::Runner.new(config).run
