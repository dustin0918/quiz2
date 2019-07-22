class IdeasController < ApplicationController
    before_action :set_idea, only: [:edit, :update, :show, :destroy]
    before_action :require_user, except: [:index, :show]
    before_action :require_same_user, only: [:edit, :update, :destroy]
    
    def index
      @ideas = Idea.paginate(page: params[:page], per_page: 5)
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
    
      def require_same_user
        if current_user != @idea.user 
          flash[:danger] = "You can only edit or delete your own ideas"
          redirect_to root_path
        end
      end
    
  end