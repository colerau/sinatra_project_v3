class ReviewsController < ActiveRecord::Base
    get '/reviews/:id' do 
        erb :'reviews/show'
    end
end