class Controller
  def initialize(cookbook)
    @cookbook = cookbook
    @view = View.new
  end

  def list
    display_recipes
  end

  def add
    name = @view.ask_name
    description = @view.ask_description
    rating = @view.ask_rating
    prep_time = @view.ask_prep_time
    recipe = Recipe.new(name, description, rating, prep_time)
    @cookbook.create(recipe)
    display_recipes
  end

  def remove
    display_recipes
    index = @view.ask_index
    @cookbook.destroy(index)
    display_recipes
  end

  def import
    # Ask a user for a keyword to search
    keyword = @view.ask_keyword
    # Make an HTTP request to the recipe’s website with our keyword
    # Parse the HTML document to extract the first 5 recipes suggested and store them in an Array
    scrape_recipes = ScrapeAllRecipesService.new(keyword).call
    # Display them in an indexed list
    @view.display(scrape_recipes)
    # Ask the user which recipe they want to import (ask for an index)
    index = @view.ask_index
    # Add it to the Cookbook 
    @cookbook.create(scrape_recipes[index])
    # Display
    display_recipes
  end

  def mark
    # Display
    display_recipes
    # Ask for index
    index = @view.ask_index
    # Find Recipe from index
    recipe = @cookbook.find(index)
    # Mark recipe as done
    @cookbook.mark_as_done(recipe)
    # Display
    display_recipes
  end

  private

  def display_recipes
    recipes = @cookbook.all
    @view.display(recipes)
  end
end