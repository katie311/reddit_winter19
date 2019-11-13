class SubsController < ApplicationController
  before_action :set_sub, except: [:index, :new, :create]
                          #only: [:show, :edit, :update, :destroy]
  
  def index
    # GET - /subs
    @subs = Sub.all
    # renders :index
  end

  def show
    # GET - /subs/:id
    # @sub = Sub.find(params[:id])
  end

  def new
    # GET - /subs/new
    @sub = Sub.new
    render partial: "form"
  end

  def create
    #POST /subs
    @sub = Sub.new(sub_params)
    # creates an instance of our sub class, including our form inputs
    if @sub.save #creates an id
      redirect_to subs_path
    else
      render :new
    end
  end

  def edit
    #GET /subs/:id/edit
    # @sub = Sub.find(params[:id])
    render partial: "form"
  end

  def update
    #PUT /subs/:id
    # @sub = Sub.find(params[:id])
    if sub.update(sub_params)
      redirect_to sub_path(@sub)
    else 
      render :edit
    end
  end

  def destroy
    #DELETE /subs/:id
    # @sub = Sub.find(params[:id])
    @sub.destroy
  end

end

  private
    def sub_params
      params.require(:sub).permit(:name)
    end

    def set_sub
      @sub = Sub.find(params[:id])
    end



