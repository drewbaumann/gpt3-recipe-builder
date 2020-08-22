require "titleize"
require "tty-prompt"
require_relative "lib/recipe"
require_relative "lib/recipe_story"

class RecipeGenerator
  def initialize(recipe_name:)
    @recipe_name = recipe_name.titleize
  end

  def self.run
    prompt = TTY::Prompt.new
    answer = prompt.ask("What do you want to make?", required: true)
    recipe = new(recipe_name: answer)
    recipe.display
  end

  def display
    puts "Recipe: #{recipe_name}"
    puts recipe_story
    puts recipe
  end

  private

  attr_reader :recipe_name

  def recipe
    Recipe.new(name: recipe_name).generate
  end

  def recipe_story
    RecipeStory.new(name: recipe_name).generate
  end
end

RecipeGenerator.run
