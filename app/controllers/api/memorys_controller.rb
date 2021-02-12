class Api::MemorysController < ApplicationController
  def index
    @memorys = Memory.order('created_at DESC')
  end
end
