# app/controllers/turkeys_controller.rb
class TurkeysController < ApplicationController
  require 'csv'  # Add this line to require the CSV library
  before_action :set_turkey, only: %i[show edit update destroy]

  def index
    @turkeys = Turkey.all
  end

  def show
  end

  def new
    @turkey = Turkey.new
  end

  def edit
  end

  def create
    @turkey = Turkey.new(turkey_params)

    if @turkey.save
      redirect_to @turkey, notice: 'Turkey was successfully created.'
    else
      render :new
    end
  end

  def update
    if @turkey.update(turkey_params)
      redirect_to @turkey, notice: 'Turkey was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @turkey.destroy
    redirect_to turkeys_url, notice: 'Turkey was successfully destroyed.'
  end

  def report
    @turkeys = Turkey.all
    respond_to do |format|
      format.html # report.html.erb
      format.csv { send_data generate_csv(@turkeys), filename: "turkeys-#{Date.today}.csv" }
    end
  end

  private

  def set_turkey
    @turkey = Turkey.find(params[:id])
  end

  def turkey_params
    params.require(:turkey).permit(:name, :age, :weight, :sex, :species, :status)
  end

  def generate_csv(turkeys)
    CSV.generate(headers: true) do |csv|
      csv << %w[ID Name Age Weight Sex Species Status]
      turkeys.each do |turkey|
        csv << [turkey.id, turkey.name, turkey.age, turkey.weight, turkey.sex, turkey.species, turkey.status]
      end
    end
  end
end
