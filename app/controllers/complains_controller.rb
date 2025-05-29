class ComplainsController < ApplicationController
  before_action :set_complain, only: [:show, :edit, :update, :destroy]

  def index
    @categories = Category.all
  
    @complains = Complain.all
  
    if params[:query].present?
      @complains = @complains.where("title ILIKE :query OR source ILIKE :query", query: "%#{params[:query]}%")
    end
  
    if params[:category_id].present?
      @complains = @complains.where(category_id: params[:category_id])
    end
  end
  
  

  def show
    
  end

  def new
    @complain = Complain.new
  end

  def create
    @complain = Complain.new(complain_params)
    if @complain.save
      redirect_to @complain, notice: 'Complain was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @complain.update(complain_params)
      redirect_to @complain, notice: 'Complain was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @complain.destroy
    redirect_to complains_url, notice: 'Complain was successfully destroyed.'
  end

  private

  def set_complain
    @complain = Complain.find(params[:id])
  end

  def complain_params
    params.require(:complain).permit(:title, :source, :details, :category_id, :location)
  end
end
