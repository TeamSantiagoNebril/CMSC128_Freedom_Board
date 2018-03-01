require 'sinatra'
require 'yaml/store'

#class Freedom_Board < Sinatra::Base
    get '/' do
        @title = 'UPVTC Freedom Board!'
        erb :index
    end

    post '/cast' do
        @title = 'Your message has been posted'
        @message_  = params['message']
        @sender = params['sender']
        @sender = @sender + " at " + Time.new.strftime("%d/%m/%Y %l:%M:%S %p")
        @store = YAML::Store.new 'messages.yml'
        @store.transaction do
            @store[@sender] = @message_
        end
        erb :index
    end
    post '/search' do
      @search = params['search']
      if(@search == nil)
        @search = ""
      end
      erb :index
    end

#end
