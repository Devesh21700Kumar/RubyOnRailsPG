module Api
    class ArticlesController < ApplicationController
        def index
            articles = Article.order('created_at DESC');
            render json: {status: 'SUCCESS', message:'Loaded articles', data:articles},status: :ok
        end
        
        #find by id
        def show
            article =  Article.find(params[:id])
            render json: {status: 'SUCCESS', message: 'Loaded article', data:article},status: :ok
        end    

        def create
            article = Article.new(article_params)

            if article.save
                render json: {status: 'SUCCESS', message: 'Artice saved', data:article},status: :ok
            else
                render json: {status: 'ERROR', message: 'Article not saved', data:article.errors},status: :unprocessable_entry
           end    
        end

        def destroy 
            article =  Article.find(params[:id])
            article.destroy
            render json: {status: 'SUCCESS', message: 'Artice deleted', data:article},status: :ok
        end    
        
        private

        #article params kida like interface/dto
        def article_params
            params.permit(:title, :body)
        end    
    end    
end