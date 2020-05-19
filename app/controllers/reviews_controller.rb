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

    get '/reviews/:id/edit' do 
        if !logged_in?
            redirect "/login"
        else 
            @user = current_user
            @review = Review.find_by_id(params[:id])
            erb :'/reviews/edit'
        end 
    end

    patch '/reviews/:id' do 
        if !logged_in?
            redirect "/login"
        else 
            @user = current_user
            @review = Review.find_by_id(params[:id])
            @review.text = params[:new_review]
            @review.save
            redirect to "/reviews/#{@review.id}"
        end 
    end

    delete '/reviews/:id' do 
        if !logged_in?
            redirect "/login"
        else 
            @user = current_user
            @review = Review.find_by_id(params[:id])
            @review.delete
            redirect to '/users/user_home'
        end 
    end
end