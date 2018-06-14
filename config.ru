require 'sinatra'
require 'sinatra/contrib'
require 'sinatra/reloader' if development?
require 'pg'
require_relative "controllers/guitars_controller.rb"

use GuitarsController
