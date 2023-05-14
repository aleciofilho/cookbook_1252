class Router
  def initialize(controller)
    @controller = controller
    @running = true
  end

  def run
    puts '-------------------------'
    puts 'Welcome to the Cookbook!'
    puts '-------------------------'

    while @running
      display_tasks
      action = gets.chomp.to_i
      print `clear`
      route_action(action)
    end
  end

  private

  def route_action(action)
    case action
      when 1 then @controller.list
      when 2 then @controller.add
      when 3 then @controller.import
      when 4 then @controller.mark
      when 5 then @controller.remove
      when 0 then stop
    else
      puts "Please press 1, 2, 3 or 0"
    end
  end

  def stop
    @running = false
  end

  def display_tasks
    puts ""
    puts "What do you want to do next?"
    puts '1. List all recipes'
    puts '2. Create a new recipe'
    puts '3. Import recipe from internet'
    puts '4. Mark/unmark recipe as done'
    puts '5. Remove a recipe from the cookbook'
    puts '0. Exit cookbook'
  end
end
