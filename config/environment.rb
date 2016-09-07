ENV['SINATRA_ENV'] ||= "development"
#this is just a hypotheical hash with the value of dev so you can use it over and over in the pther files through the eviroment. your enviroment folder is requied though all its
#application files 

require 'bundler/setup'
Bundler.require(:default, ENV['SINATRA_ENV'])

ActiveRecord::Base.establish_connection(
  :adapter => "sqlite3",
  :database => "db/#{ENV['SINATRA_ENV']}.sqlite"
)
require_all 'app'
