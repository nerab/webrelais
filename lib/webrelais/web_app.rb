require 'sinatra'
require 'sinatra/partial'

module Webrelais
  class WebApp < Sinatra::Base
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
      logger.info("Status is #{board.to_json}")
      if request.xhr?
        board.to_json
      else
        erb :index
      end
    end

    post %r{/([0-7])} do |i|
      pin = board.pin(i.to_i)
      old_value = params[:value].to_i
      new_value = 0 == old_value ? 1 : 0

      logger.info("Switching #{pin} from #{old_value} to #{new_value}")
      pin.value = new_value

      redirect to('/')
    end

    def board
      @board ||= Board.new(8)
    end
  end
end
