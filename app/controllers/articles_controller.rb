class ArticlesController < ApplicationController
    skip_before_action :verify_authenticity_token
    before_action :set_article,only: [:show, :edit, :update, :destroy]
    def show
        #debugger to move ahead cmd continue
      @article=Article.find(params[:id]) 

    end

    def index
      @articles=Article.all 
        
    end

    def new
        @article = Article.new
    end

    def edit
        

    
    end

    
     def create
     # render html: "hey" #plain: params[:article]
     @article=Article.new(article_params)

     #render plain: @article.inspect

        if 
            @article.save
            flash[:notice] = "Article Saved Successfully"
            redirect_to article_path(@article) # or use redirect_to @article
        else 
           # render "new"
            #flash.now[:error] = "Could not save client"
           
            render 'new' , status: :unprocessable_entity
    
        end
      end


      def update
       
        if
        @article.update(article_params)
        flash[:notice]="Article Updated."
            redirect_to @article
        else
            render :edit, status: :unprocessable_entity

        end

      end
      def destroy
        
        @article.destroy
        redirect_to articles_path
      end
        # if @article.present?
        # @article.destroy
        # params[:id]=nil
        # flash[:notice]="Article has been deleted"
        # redirect_to :action => :index #articles_path
        # else
        # redirect_to articles_path
        # end
      
      # OPTION 2 - products_controller.rb
# def destroy
#     if @article.present?
#     @article.destroy
#     respond_to do |format|
#       format.html { redirect_to articles_url, notice: "Article was successfully destroyed." }
#       format.json { head :no_content }
#       format.turbo_stream {}
#     end

#     end
private
      def set_article
        @article=Article.find(params[:id])
      end
      
      def article_params
        params.require(:article).permit(:title, :description)

      end

end