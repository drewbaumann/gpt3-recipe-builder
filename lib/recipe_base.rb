require "dotenv/load"
require "yaml"
require_relative "openai"

class RecipeBase
  PROMPT_FILE = "prompts.yml"

  def initialize(name:)
    @name = name
  end

  private

  attr_reader :name

  def openai
    OpenAI.new(api_key: ENV["OPENAI_KEY"])
  end

  def prompt
    YAML.load_file(PROMPT_FILE).dig(self.class::PROMPT_KEY) + name + "\n"
  end
end
