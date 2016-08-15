class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # Should display all recipes
  get '/' do
    erb :index
  end

  get '/recipes' do
    @recipes = Recipe.all
    erb :index
  end

  # Display form for creating a new recipe
  get '/recipes/new' do
    erb :new
  end

  # Create new recipe with info from /recipes/new page
  post '/recipes' do
    @recipe = Recipe.create(name: params[:name], ingredients: params[:ingredients], cook_time: params[:cook_time])
    @recipe.save
    redirect to 'recipes/:id'
  end

end
