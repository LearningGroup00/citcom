class ComplainsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_complain, only: [:show, :edit, :update, :destroy]

  def index
    @categories = Category.all
    @complains = policy_scope(Complain)
    @total_complaints = @complains.count

    if params[:query].present?
      @complains = @complains.where("title ILIKE :query OR source ILIKE :query", query: "%#{params[:query]}%")
    end

    if params[:category_id].present?
      @complains = @complains.where(category_id: params[:category_id])
    end
  end

  def show
    authorize @complain
  end

  def new
    @complain = Complain.new
    authorize @complain
  end

  def create
    @complain = Complain.new(complain_params)
    @complain.user = current_user
    authorize @complain

    if @complain.save
      redirect_to @complain, notice: 'Complain was successfully created.'
    else
      render :new
    end
  end

  def edit
    authorize @complain
  end

  def update
    authorize @complain
    if @complain.update(complain_params)
      redirect_to @complain, notice: 'Complain was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    authorize @complain
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
