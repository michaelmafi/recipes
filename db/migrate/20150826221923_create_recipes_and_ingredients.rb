class CreateRecipesAndIngredients < ActiveRecord::Migration
  def change
    create_table(:ingredients_recipes) do |t|
      t.belongs_to(:recipe)
      t.belongs_to(:ingredient)
  end
 end
end
