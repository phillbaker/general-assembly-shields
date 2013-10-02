require 'rubygems'
require 'bundler/setup'

require 'sinatra/base'
require 'sinatra/reloader'

class App < Sinatra::Base
  DEFAULT_COURSE = :other
  COURSE_URLS = {
    :wdi => 'https://generalassemb.ly/education/web-development-immersive',
    :fewd => 'https://generalassemb.ly/education/front-end-web-development',
    :dm => 'https://generalassemb.ly/education/digital-marketing',
    :bewd => 'https://generalassemb.ly/education/back-end-web-development',
    :uxd => 'https://generalassemb.ly/education/user-experience-design',
    :ds => 'https://generalassemb.ly/education/data-science',
    :uxdi => 'https://generalassemb.ly/education/user-experience-design-immersive',
    :csf => 'https://generalassemb.ly/education/computer-science-fundamentals',
    :bft => 'https://generalassemb.ly/education/business-fundamentals-tactics',
    :pm => 'https://generalassemb.ly/education/product-management',
    :other => 'https://generalassemb.ly'
  }

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
    def img_url(course)
      "http://ga.bling.phillbaker.com/images/shield_imagined_ga_#{course}.png"
    end

    def html(course=nil)
      course ||= DEFAULT_COURSE
      %Q{<a href="#{COURSE_URLS[course]}"><img src="#{img_url(course)}" alt="#{course}" /></a>}
    end

    def markdown(course=nil)
      course ||= DEFAULT_COURSE
      "[![#{course}](#{img_url(course)})](#{COURSE_URLS[course]})"
    end

    def rails_erb(course)
      course ||= DEFAULT_COURSE
      "<%= link_to '#{COURSE_URLS[course]}' { %><%= image_tag '#{img_url(course)}', '#{course}' %><% } %>"
    end
  end

  not_found do
    File.read(File.join('public', '404.html'))
  end

  get '/' do
    erb :index, :locals => {
      :courses => [:bewd, :bft, :csf, :ds, :fewd, :pm, :uxd, :uxdi, :wdi, DEFAULT_COURSE],
    }
  end

  set :app_file, __FILE__
  run! if App.app_file == $0
end

