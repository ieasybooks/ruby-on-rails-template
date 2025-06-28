class Views::Static::Home < Views::Base
  def view_template
    h1 { "Static::Home" }
    p { "Find me in app/views/static/home.rb" }
  end
end
