class StaticController < ApplicationController
  def home
    render Views::Static::Home.new
  end
end
