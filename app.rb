require('sinatra')
require('sinatra/activerecord')
require('sinatra/reloader')
also_reload('lib/*.rb')
require('./lib/recipe')
require('./lib/ingredient')
require('./lib/category')
require('pg')
require('pry')

get('/') do
  erb(:index)
end

get('/recipes') do
  @recipes = Recipe.all()
  @rating_list = Recipe.order(rating: :asc)
  erb(:recipe_list)
end

post('/add_recipe') do
  @recipes = Recipe.all()
  name = params.fetch("name")
  @new_recipe = Recipe.new({:name => name, :rating => 0})
  if @new_recipe.save()
    @rating_list = Recipe.order(rating: :asc)
    erb(:recipe_list)
  else
    erb(:errors)
  end
end

get('/recipe/:id') do
  @recipe = Recipe.find(params.fetch("id"))
  erb(:recipe_detail)
end

patch('/add_ingredient/:id') do
  @name = params.fetch("name")
  @recipe_id = params.fetch("id")
  @recipe = Recipe.find(@recipe_id)
  @new_ing = Ingredient.new({:name => @name, :recipe_ids => @recipe_id})
  if @new_ing.save()
  else
    update_ingredient = Ingredient.find_name(@name)
    @recipe.ingredients.push(update_ingredient)
  end
  erb(:recipe_detail)
end

patch('/recipe/:id') do
  instructions = params.fetch("instructions")
  @update_recipe = Recipe.find(params.fetch("id").to_i)
  @update_recipe.update({:instructions => instructions})
  @recipe = Recipe.find(params.fetch("id").to_i)
  erb(:recipe_detail)
end

get('/categories') do
  @categories = Category.all()
  erb(:category_list)
end

post('/add_category') do
  name = params.fetch("name")
  Category.create({:name => name})
  @categories = Category.all()
  erb(:category_list)
end

post('/recipe/add_category') do
  name = params.fetch("name")
  recipe_id = params.fetch("recipe_id")
  Category.create({:name => name, :recipe_ids => recipe_id})
  @recipe = Recipe.find(recipe_id)
  erb(:recipe_detail)
end

delete('/recipe/:id') do
  id = params.fetch("id")
  @recipe = Recipe.find(id)
  @recipe.destroy()
  @recipes = Recipe.all()
  @rating_list = Recipe.order(rating: :asc)
  erb(:recipe_list)
end

get('/category/:id') do
  @category = Category.find(params.fetch("id"))
  @recipes_uncat = Recipe.all()
  erb(:category_detail)
end

patch('/category/:id/add_recipe') do
  update_recipe = Recipe.find_name(params.fetch("category_add_recipe"))
  update_category = Category.find(params.fetch("id"))
  update_recipe.update({:category_ids => [update_category.id()]})
  @category = Category.find(params.fetch("id"))
  @recipes_uncat = Recipe.all()
  erb(:category_detail)
end

get('/ingredients') do
  @ingredients = Ingredient.all()
  erb(:ingredient_list)
end

get('/ingredient/:id') do
  @ingredient = Ingredient.find(params.fetch("id"))
  erb(:ingredient_detail)
end

delete('/category/:id') do
  id = params.fetch("id")
  @category = Category.find(id)
  @category.destroy()
  @categories = Category.all()
  erb(:category_list)
end

post('/recipe/add_rating') do
  rating = params.fetch("rating")
  recipe_id = params.fetch("recipe_id").to_i
  @updated_rating = Recipe.find(recipe_id)
  if @updated_rating.update({:rating => rating})
  @recipe = Recipe.find(recipe_id)
  erb(:recipe_detail)
  else
    erb(:errors_rating)
  end
end
