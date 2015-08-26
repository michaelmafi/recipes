class CreateRecipe < ActiveRecord::Migration
  def change
    create_table(:recipes) do |t|
    t.column(:name, :string)
    t.column(:instruction, :string)
    t.column(:rating, :int)
  end
 end
end
