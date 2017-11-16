class ContactsController < ApplicationController
  before_action :set_user
  before_action :set_contact, only: [:edit, :show, :update, :destroy]
  
  def index
  	@contacts = current_user.contacts
  end

  def new
  	@contact = current_user.contacts.new
  end

  def create 
    @contact = current_user.contacts.new(contact_params)
      if @contact.save
      	redirect_to user_contacts_path, notice: 'Contact created successfully'
      else
        flash.now[:alert] = 'Contact not created' 
        render 'new'
      end   	
  end	

  def edit
  end

  def show
  end

  def update
    if @contact.update(contact_params)
    	redirect_to user_contacts_path, notice: 'Contact updated successfully'
    else
      flash.now[:alert] = 'Contact not updated' 
      render 'edit'
    end   	
  end	

  def destroy
  	@contact.destroy
  	redirect_to user_contacts_path, notice: 'Contact deleted successfully'
  end
  
  private

  def set_user
    @user = User.find(params[:user_id])	
  end
  
  def set_contact
    @contact = current_user.contacts.find(params[:id])	
  end

  def contact_params
    params.require(:contact).permit(:user_id, :name)
  end	
end

