class ReviewsController < ApplicationController
    get '/reviews' do 
        if !logged_in?
            redirect "/login"
        else 
            @user = current_user
            @reviews = Review.all.select { |review| review.user_id == @user.id } 
            erb :'/reviews/index'
        end 
    end
    
    get '/reviews/:id' do 
        #make sure every controller action verifies if there's a user logged in 
        if !logged_in?
            redirect "/login"
        else 
            @review = Review.find_by_id(params[:id])
            erb :'reviews/show'
        end 
    end
end