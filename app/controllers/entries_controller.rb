class EntriesController < ApplicationController
    def new
    end
    
    def create
        @entry = Entry.new(entry_params)
        
        @entry.save
        redirect_to @entry
    end
    
    def index
        @entries = Entry.all
    end
      
    def show
        @entry = Entry.find(params[:id])
    end
    
    def edit
        @entry = Entry.find(params[:id])
    end
    
    def update
        @entry = Entry.find(params[:id])
        
        if @entry.update(entry_params)
            redirect_to @entry
            else
            render 'edit'
        end
    end
    
    private
    def entry_params
        params.require(:entry).permit(:title, :date)
    end
end
