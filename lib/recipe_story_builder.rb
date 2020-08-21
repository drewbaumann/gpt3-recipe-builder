require_relative "recipe_builder_base"

class RecipeStoryBuilder < RecipeBuilderBase
  PROMPT_NAME = "recipe_story"

  def story
    @_story ||= openai.completion(
      prompt: recipe_prompt,
      max_tokens: 512,
      temperature: 0.8,
      stop: "Name:"
    ).dig("choices").first.dig("text")
  end
end
