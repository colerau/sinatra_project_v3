class BooksController < ApplicationController
    get '/books' do 
        if !logged_in?
            redirect "/login"
        else  
            @books = Book.all
            erb :'/books/index'
        end 
    end

    get '/books/new' do 
        if !logged_in?
            redirect "/login"
        else 
            @books = Book.all
            erb :'/books/new'
        end
    end
    
    post '/books' do 
        if !logged_in?
            redirect "/login"
        else 
            @user = current_user
            if (params[:user][:book_id] != nil)
                if !(params[:user][:review].empty?)
                    @book = Book.find_by_id(params[:user][:book_id][0].to_i)
                    @review = Review.create(user_id: @user.id, book_id: @book.id, text: params[:user][:review])
                    redirect "/reviews/#{@review.id}"
                end 
            end
        end 
    end

    get '/books/:id' do 
        if !logged_in?
            redirect "/login"
        else 
            @book = Book.find_by_id(params[:id])
            erb :'/books/show'
        end 
    end
end