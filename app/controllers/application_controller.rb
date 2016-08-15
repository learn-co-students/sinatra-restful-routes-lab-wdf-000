class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # Should display all recipes
  get '/' do
    erb :index
  end

  # Display form for creating a new recipe
  get '/recipes/new' do
    erb :new
  end

end
