class ContactAddressesController < ApplicationController
  before_action :set_contact
  before_action :set_contact_address, only: [:edit, :show, :update, :destroy]

  def index
  	@contact_addresses =  @contact.contact_addresses
  end

  def new
  	@contact_address = @contact.contact_addresses.new

  end

  def create
    @contact_address = @contact.contact_addresses.new(contact_address_params)
      if @contact_address.save
      	redirect_to contact_contact_addresses_path, notice: 'Contact address created successfully'
      else
      	flash.now[:alert] = 'Contact address not created'
        render 'new'
      end  	
  end	
  
  def edit
  end

  def update
    if @contact_address.update(contact_address_params)
      	redirect_to contact_contact_addresses_path, notice: 'Contact address updated successfully'
    else
      	flash.now[:alert] = 'Contact address not updated'
        render 'edit'
    end 
  end	

  def destroy
    @contact_address.destroy
      redirect_to contact_contact_addresses_path, notice: 'Contact address deleted successfully'
  end	
  
  def show
  end
  
  private

  def set_contact
    @contact = Contact.find(params[:contact_id])	
  end

  def set_contact_address
    @contact_address = @contact.contact_addresses.find(params[:id])	
  end

  def contact_address_params
    params.require(:contact_address).permit(:contact_id, :address_type, :address)
  end	

end

