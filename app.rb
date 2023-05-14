require 'csv'
require_relative 'router'
require_relative 'cookbook'
require_relative 'controller'
require_relative 'view'
require_relative 'recipe'
require_relative 'scrape_all_recipes_service'

csv_file = 'recipes.csv'
cookbook = Cookbook.new(csv_file)
controller = Controller.new(cookbook)
router = Router.new(controller)

router.run