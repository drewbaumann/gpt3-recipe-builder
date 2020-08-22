require_relative "recipe_base"

class Recipe < RecipeBase
  PROMPT_KEY = "recipe"

  def generate
    @_generate ||= openai.completion(
      prompt: prompt,
      max_tokens: 512,
      temperature: 0.4,
      stop: "Name:"
    ).dig("choices").first.dig("text")
  end
end
