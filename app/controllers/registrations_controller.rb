class RegistrationsController < ApplicationController
  before_action :set_registration, only: [:update, :destroy]
  
  respond_to :html
  
  def create
    puts registration_params
    @registration = Registration.new(registration_params)
    @registration.save
    redirect_to :back
  end

  def update
    @registration.update(registration_params)
    redirect_to :back
  end

  def destroy
    @registration.destroy
    redirect_to :back
  end

  private
    def set_registration
      @registration = Registration.find(params[:id])
    end

    def registration_params
      params.require(:registration).permit(:user_id, :event_id, :status)
    end  
  
end
