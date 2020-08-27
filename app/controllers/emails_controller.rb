class EmailsController < ApplicationController
  def index
    @emails = Email.all
  end

  def create
    @newmail = Email.create(object: Faker::Food.dish, body: Faker::Food.description, read: false)
    flash[:notice] = "Email créé"
    respond_to do |format|
      format.html { redirect_to emails_path }
      format.js { }
    end
    
  end

  def show
    @emailselected = Email.find(params[:id])
    @emailselected.update(:read => true)

    respond_to do |format|
      format.html { redirect_to email_path(@email.id) }
      format.js { }
    end
  end

  def destroy
    @emailselected = Email.find(params[:id])
    respond_to do |format|
      format.html {redirect_to email_path}
      format.js { }
    end
    @emailselected.destroy
  end
end


