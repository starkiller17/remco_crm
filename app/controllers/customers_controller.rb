class CustomersController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_customer, only: [:show, :edit, :update]
  before_action :require_user

  def index
    @customers = Customer.all
  end

  def new
    @customer = Customer.new
    @classifications = Classification.where(status: "ACTIVO").order(:classification)
    @selected_classification = @classifications.first.try(:id)

    @categories = Category.where(status: "ACTIVO").order(:category)
    @selected_category = @categories.first.try(:id)
    puts "*" * 100
    puts @selected_category
    puts @selected_classification
    puts "*" * 100
  end

  def create
    begin
      params[:customer][:customer].upcase!
      @customer = Customer.new(customer_params)
      if @customer.save
        flash[:notice] = "¡Cliente creado exitosamente!"
        redirect_to new_customer_path
      else
        render 'new'
      end
    rescue => e
      puts "Excepción #{e}"
    end
  end

  def update
    if @customer.update(customer_params)
      flash[:notice] = "¡El cliente se ha actualizado!"
    else
      render 'edit'
    end
  end

  def edit

  end

  private
  def customer_params
    params.require(:customer).permit(:category_id, :classification_id, :level, :customer_type, :web_address, :created_by, :updated_by)
  end

  def set_customer
    @customer = Customer.find(params[:id])
  end
  
end
