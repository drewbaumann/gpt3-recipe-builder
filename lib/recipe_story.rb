require_relative "recipe_base"

class RecipeStory < RecipeBase
  PROMPT_KEY = "recipe_story"

  def generate
    @_generate ||= openai.completion(
      prompt: prompt,
      max_tokens: 512,
      temperature: 0.8,
      stop: "Name:"
    ).dig("choices").first.dig("text")
  end
end
