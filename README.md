# Recipe Box

A Ruby app that creates Category and Recipe classes.

## Code Example

Assuming that you have Ruby installed in the terminal:

```
test_category = Teacher.new("German")

test_recipe = Student.new("Pasta")

test_recipe.destroy => deletes recipe from the database
```

## Tests

Testing the Ruby methods and specs can be done through RSpec.

`gem install rspec`

`rspec`

## Sinatra App

Viewing the app can be done through Sinatra.

Run in the terminal:

`ruby app.rb` in the project folder

## Database

All inputted data is saved in the `recipe_box` database.

The `recipe_box` database is comprised of `categories`, `recipes`, and `periods` tables.

The `categories` table is comprised of `name`, `id`, and `timestamp` columns.

The `recipes` table is comprised of `name`, `id`, and `timestamp` columns.

## License

MIT License, copyright 2015. George Denkey - Iman Mafi
