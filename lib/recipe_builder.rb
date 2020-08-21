require_relative "recipe_builder_base"

class RecipeBuilder < RecipeBuilderBase
  PROMPT_NAME = "recipe"

  def recipe
    @_recipe ||= openai.completion(
      prompt: recipe_prompt,
      max_tokens: 512,
      temperature: 0.4,
      stop: "Name:"
    ).dig("choices").first.dig("text")
  end
end
