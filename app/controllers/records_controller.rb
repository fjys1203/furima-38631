class RecordsController < ApplicationController

  def index
    @record = Record.new
  end

  def create
    @record = Record.new(record_params)
    if @record.save
      return redirect_to root_path
    else 
      render 'index'
    end
  end


  private

  def record_params
    params.require(:record).permit(:price)
  end

end
