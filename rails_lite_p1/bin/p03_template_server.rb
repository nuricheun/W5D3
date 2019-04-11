require 'byebug'
require 'rack'
require_relative '../lib/controller_base'
require 'active_support/inflector'

class MyController < ControllerBase
  def go
    render :show
  end



  # def render_content(content, content_type = "text/html")
  #   @res.write(content)
  #   @res['Content-Type'] = content_type
  #   nil
  # end

  # def render(template_name)
  #   controller_name = self.class.name
  #   dir_path = File.dirname(__FILE__)
    
  #   template_path = File.join(File.expand_path("..", Dir.pwd), "rails_lite_p1/views/#{controller_name.underscore}/#{template_name}.html.erb")

  #   template_code = File.read(template_path)

  #   render_content(
  #     ERB.new(template_code).result(binding),
  #     "text/html"
  #   )
  # end

end

app = Proc.new do |env|
  req = Rack::Request.new(env)
  res = Rack::Response.new
  MyController.new(req, res).go
  res.finish
end

Rack::Server.start(
  app: app,
  Port: 3000
)
