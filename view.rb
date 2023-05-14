class View
  def display(recipes)
    recipes.each_with_index do |recipe, index|
      x = recipe.done? ? '[X]' : '[ ]'
      puts "#{x} #{index + 1} - #{recipe.name}: #{recipe.description} (#{recipe.rating} / 5). Prep time: #{recipe.prep_time}"
    end
  end

  def ask_name
    puts "Whats is the name of the recipe?"
    gets.chomp
  end

  def ask_description
    puts "What is the recipe description?"
    gets.chomp
  end

  def ask_rating
    puts "What is the recipe rating?"
    gets.chomp.to_f
  end

  def ask_prep_time
    puts "What is the recipe prep time?"
    gets.chomp
  end

  def ask_index
    puts "Index?"
    gets.chomp.to_i - 1
  end

  def ask_keyword
    puts "What ingredient would you like a recipe for?"
    gets.chomp
  end

end