class Api::V1::DoctorsController < ApplicationController
  before_action :authenticate_user!

  def index
    @doctors = Doctor.all
    render json: @doctors
  end

  def show
    @doctor = Doctor.find(params[:id])
    render json: { status: 'Success', message: 'Entry retrieved succesfully', data: @doctor }, status: :ok
  rescue ActiveRecord::RecordNotFound
    render json: { status: 'Not Found', message: 'Something went wrong' }, status: :not_found
  end

  def create
    @doctor = Doctor.new(doctor_params)

    if @doctor.save
      render json: { status: 'Success', message: 'Entry created successfully' }, status: :created
    else
      render json: { status: 'Failed', message: 'Failed to add entry' }, status: :unprocessable_entity
    end
  end

  private

  def doctor_params
    params.require(:doctor).permit(:name, :specialisation, :city)
  end
end
