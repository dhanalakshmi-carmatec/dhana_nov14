class ContactPhoneNumbersController < ApplicationController
  before_action :set_contact
  before_action :find_phone_number, only: [:edit, :show, :update, :destroy]

  def index
  	@contact_phone_numbers =  @contact.contact_phone_numbers
  end

  def new
  	@contact_phone_number = @contact.contact_phone_numbers.new
  end

  def create
    @contact_phone_number = @contact.contact_phone_numbers.new(phone_number_params)
      if @contact_phone_number.save
      	redirect_to contact_contact_phone_numbers_path, notice: 'Contact phone number created successfully'
      else
      	flash.now[:alert] = 'Contact phone number not created'
        render 'new'
      end  	
  end	
  
  def edit
  end

  def update
    if @contact_phone_number.update(phone_number_params)
      redirect_to contact_contact_phone_numbers_path, notice: 'Contact phone number updated successfully'
    else
      flash.now[:alert] = 'Contact phone number not updated'
      render 'edit'
    end 
  end	

  def destroy
    @contact_phone_number.destroy
      redirect_to contact_contact_phone_numbers_path, notice: 'Contact phone number deleted successfully'
  end	
  
  def show
  end
  
  private

  def set_contact
    @contact = Contact.find(params[:contact_id])	
  end

  def find_phone_number
    @contact_phone_number = @contact.contact_phone_numbers.find(params[:id])	
  end

  def phone_number_params
    params.require(:contact_phone_number).permit(:contact_id, :phone_type, :phone_number)
  end	

end

