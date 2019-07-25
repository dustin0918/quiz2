class IdeasController < ApplicationController
    before_action :set_idea, only: [:edit, :update, :show, :destroy]
    before_action :authorize!, only: [:edit, :update, :destroy]
    before_action :authenticate_user!, except: [:index, :show]
    
    def index
      @ideas = Idea.paginate(page: params[:page])
    end
    
    def new
      @idea = Idea.new
    end
    
    def edit
    end
    
    def create
      @idea = Idea.new(idea_params)
      @idea.user = current_user
      if @idea.save
        flash[:success] = "idea was successfully created"
        redirect_to idea_path(@idea)
      else
        render 'new'
      end
    end
    
    def update
      if @idea.update(idea_params)
        flash[:success] = "idea was successfully updated"
        redirect_to idea_path(@idea)
      else
        render 'edit'
      end
    end
    
    def show
        @review=Review.new 
        @likes = @idea.likes.count
        @reviews=@idea.reviews.order(created_at: :desc)
    end
    
    def destroy
      @idea.destroy
      flash[:danger] = "idea was successfully deleted"
      redirect_to ideas_path
    end
    
    private
      def set_idea
        @idea = Idea.find params[:id] 
      end
    
      def idea_params
        params.require(:idea).permit(:title, :description)
      end
    
      def authorize!
        redirect_to root_path, alert: 'Not Authorized' unless can?(:crud, @idea)
      end
    
  end