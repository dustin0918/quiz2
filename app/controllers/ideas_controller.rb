class IdeasController < ApplicationController
    before_action :set_idea,only: [:edit, :update, :show, :destroy]
    def index 
        @ideas = Idea.paginate(page:params[:page])
    end

    def new 
        @idea= Idea.new 
    end 

    def edit 
    end 
    
    def create 
        @idea = Idea.new(idea_params)
        if @idea.save
            flash[:success]= "Idea was successfully created"
            redirect_to idea_path(@idea)
        else
            render "new"
        end 
    end

    def update
        if @idea.update(idea_params)
            flash[:success]= "Idea was successfully updated"
            redirect_to idea_path(@idea)
        else 
            render 'edit'
        end
    end

    def show 

    end 

    def destroy
        @idea.destroy
        flash[:danger]= "Idea was successfully deleted"
        redirect_to ideas_path
    end

    private 
    def set_idea 
        @idea=Idea.find(params[:id])
    end

    def idea_params
        params.require(:idea).permit(:title,:description)
    end
end
