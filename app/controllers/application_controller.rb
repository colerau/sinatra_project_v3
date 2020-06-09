# WHY ONLY ONE DOT?!
require "./config/environment"
require "./app/models/user"
require "./app/models/book"
require "./app/models/review"

class ApplicationController < Sinatra::Base

    set :views, proc { File.join(root, '../views/') }
    register Sinatra::Twitter::Bootstrap::Assets
    
    configure do 
        set :public_folder, 'public'
        set :views, 'app/views'
        enable :sessions
        # I am unclear if I need session secret or if I'm even coding it correctly 
        set :session_secret, "5hf93ndms0cbdh4"
    end

    get '/' do
      erb :"/application/home"
    end

    helpers do 
        def logged_in?
            #returns boolean value of session[:user_id]
            !!session[:user_id]
        end

        def current_user
            #finds by integer id in session[:user_id]
            User.find(session[:user_id])
            #returns user object 
        end

        def authorized?(review)
            current_user.id == review.user_id
        end
    end

end