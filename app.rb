require 'rubygems'
require 'bundler/setup'

require 'sinatra/base'
require 'sinatra/reloader'

class App < Sinatra::Base
  set :host, 'ga.bling.phillbaker.com'
  set :root, File.dirname(__FILE__)
  set :views, File.join('app', 'templates')
  set :start_time, Time.now

  configure do
    Tilt.register '.html.erb', Tilt[:erb]
  end

  configure :development do
    register Sinatra::Reloader
  end

  helpers do
    def html
      %q{<a href=""><img src="//ga.bling.phillbaker.com/images/shield_imagined_ga_COURSE.png" alt="" /></a>}
    end

    def markdown; end

    def rails_erb; end
  end

  not_found do
    File.read(File.join('public', '404.html'))
  end

  get '/' do
    erb :index, :locals => {
      :courses => [:bewd, :bft, :csf, :ds, :fewd, :pm, :uxd, :uxdi, :wdi]
    }
  end

  set :app_file, __FILE__
  run! if App.app_file == $0
end

