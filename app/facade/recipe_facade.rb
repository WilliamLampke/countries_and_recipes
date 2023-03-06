class RecipeFacade
    def self.get_recipes(country)
      data = RecipeService.get_recipes(country)
      data[:hits].map {|recipe| Recipe.new(recipe, country)}
    end
  end