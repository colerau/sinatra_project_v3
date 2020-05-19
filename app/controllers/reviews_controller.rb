class ReviewsController < ApplicationController
    get '/reviews/:id' do 
        @review = Review.find_by_id(params[:id])
        erb :'reviews/show'
    end
end