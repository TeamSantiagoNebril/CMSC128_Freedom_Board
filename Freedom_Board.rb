require 'sinatra'
require 'yaml/store'

#class Freedom_Board < Sinatra::Base
    get '/' do
        @title = 'UPVTC Freedom Board!'
        erb :index
    end

    post '/cast' do
        @title = 'Thanks for casting your vote!'
        @message  = params['message']
        @sender = params['sender']
        @store = YAML::Store.new 'votes.yml'
        @store.transaction do
            @store['votes'] ||= {}
            @store['votes'][@vote] ||= 0
            @store['votes'][@vote] += 1
        end
        erb :cast

    end
    get '/results' do
        @title = 'Results so far:'
        @store = YAML::Store.new 'votes.yml'
        @votes = @store.transaction { @store['votes'] }
        erb :results
    end
#end
