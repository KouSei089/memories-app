class Api::MemorysController < ApplicationController
  def index
    @memorys = Memory.order('created_at DESC')
  end

  def create
    @memory = Memory.new(memory_params)
    if @memory.save
      render :show, formats: 'json', handlers: 'jbuilder', status: :created
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
    if @memory.update_attributes(memory_params)
      render 'index', formats: 'json', handlers: 'jbuilder'
    else
      render json: @memory.errors, status: :unprocessable_entity
    end
  end

  private
    def memory_params
      params.fetch(:memory, {}).permit(:title, :emotion, :description)
    end
end
