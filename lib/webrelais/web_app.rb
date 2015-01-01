require 'sinatra'
require 'sinatra/flash'
require 'sinatra/partial'

module Webrelais
  class WebApp < Sinatra::Base
    register Sinatra::Flash
    register Sinatra::Partial

    set :show_exceptions, development?
    set :root, File.join(File.dirname(__FILE__), '..', '..')
    set :views, settings.root + '/views'

    set :partial_template_engine, :erb
    enable :partial_underscores

    configure :production, :development do
      enable :logging
    end

    get '/' do
      if request.xhr?
        board.to_json
      else
        erb :index
      end
    end

    post %r{/([0-7])} do |i|
      pin = board.pin(i.to_i)
      pin.value = params[:value].to_i

      flash(:status).now[:info] = "Relais #{i} is jetzt TODO"
      redirect to('/')
    end

    def board
      @board ||= Board.new(8)
    end
  end
end
