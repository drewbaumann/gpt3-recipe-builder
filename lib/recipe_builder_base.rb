require "dotenv/load"
require "yaml"
require_relative "openai"

class RecipeBuilderBase
  PROMPT_FILE = "prompts.yml"

  def initialize(name:)
    @name = name
  end

  private

  attr_accessor :name

  def openai
    @_openai ||= OpenAI.new(api_key: ENV["OPENAI_KEY"])
  end

  def recipe_prompt
    YAML.load_file(PROMPT_FILE).dig(self.class::PROMPT_NAME) + name + "\n"
  end
end
