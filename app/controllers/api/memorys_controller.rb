class Api::MemorysController < ApplicationController
  protect_from_forgery :except => [:create,:update]
  rescue_from Exception, with: :render_status_500
  rescue_from ActiveRecord::RecordNotFound, with: :render_status_404

  def index
    @memorys = Memory.order("created_at DESC")
  end

  def show
    @memory = Memory.find(params[:id])
    #render "show", formats: 'json', handlers: 'jbuilder'
  end

  def create
    @memory = Memory.new(memory_params)
    if @memory.save
      render :show, status: :created
    else
      render json: @memory.errors, status: :unprocessable_entity
    end
  end

  def update
    @memory = Memory.find(params[:id])
    if @memory.update_attributes(memory_params)
      render :show
    else
      render json: @memory.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @memory = Memory.find(params[:id])
    if @memory.destroy
      render :show
    else
      render json: @memory.errors, status: :unprocessable_entity
    end
  end

  private
    def memory_params
      params.fetch(:memory, {}).permit(:title, :emotion, :description)
    end

    def render_status_404(exception)
      render json: { errors: [exception] }, status: 404
    end
  
    def render_status_500(exception)
      render json: { errors: [exception] }, status: 500
    end
end
