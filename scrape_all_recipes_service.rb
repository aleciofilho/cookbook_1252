require 'nokogiri'
require 'open-uri'
require_relative 'recipe'

class ScrapeAllRecipesService
  def initialize(keyword)
    @keyword = keyword
  end

  def call
    url = URI.open("https://www.bbcgoodfood.com/search?q=#{@keyword}").read
    doc = Nokogiri::HTML.parse(url, nil, 'utf-8')

    recipes = []
    doc.search('.card').first(5).each do |card|
      name = card.search('.heading-4').text.strip
      desc = card.search('.line-clamper').text.strip
      rating = card.search('.sr-only').text.strip[-14..-9].to_f
      prep_time = card.search('.terms-icons-list__text').first.text.strip
      
      recipe = Recipe.new(name, desc, rating, prep_time)
      recipes << recipe
    end
    recipes
  end
end