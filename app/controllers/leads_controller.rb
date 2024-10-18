class LeadsController < ApplicationController
  def index
    @lead = Lead.new
  end

  def create
    @lead = Lead.new(lead_params)
    if @lead.save
      redirect_to leads_path, notice: 'Lead was successfully created.'
    else
      render :index
    end
  end

  private

  def lead_params
    params.require(:lead).permit(:name, :email, :device, :country)
  end
end
