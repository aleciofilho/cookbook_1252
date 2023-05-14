class Cookbook
  def initialize(csv_file)
    @csv_file = csv_file
    @recipes = []
    load_csv if File.exist?(@csv_file)
  end

  def all
    @recipes
  end

  def find(index)
    @recipes[index]
  end

  def create(recipe)
    @recipes << recipe
    save_csv
  end

  def destroy(index)
    @recipes.delete_at(index)
    save_csv
  end

  def mark_as_done(recipe)
    recipe.done!
    save_csv
  end

  private

  def load_csv
    CSV.foreach(@csv_file) do |row|
      name = row[0]
      description = row[1]
      rating = row[2]
      prep_time = row[3]
      done = row[4] == 'true'
      recipe = Recipe.new(name, description, rating, prep_time)
      recipe.done! if done
      @recipes << recipe
    end
  end

  def save_csv
    CSV.open(@csv_file, 'wb') do |file|
      @recipes.each do |recipe|
        file << [recipe.name, recipe.description, recipe.rating, recipe.prep_time, recipe.done?]
      end
    end
  end
end