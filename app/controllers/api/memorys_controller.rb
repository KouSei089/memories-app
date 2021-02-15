class Api::MemorysController < ApplicationController
  def index
    @memorys = Memory.order('created_at DESC')
  end

  def create
    @memory = Memory.new(memory_params)
    if @memory.save
      render :show, status: :created
    else
      render json: @memory.errors, status: :unprocessable_entity
    end
  end

  def show
    @memory = Memory.find(params[:id])
    render 'show', handlers: 'jbuilder'
  end

  

  def update
    @memory = Memory.find(params[:id])
    if @memory.update(memory_params)
      render :show, handlers: 'jbuilder'
    else
      render json: @memory.errors, status: :unprocessable_entity
    end
  end

  private
    def memory_params
      params.permit(:title, :emotion, :description)
    end
end
