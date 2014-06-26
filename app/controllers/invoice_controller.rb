class InvoiceController < ApplicationController

  def index
  	@user = current_user

  	if @user.nil?
  	  redirect_to new_user_session_path
  	end

  end

  def show

  	@user = current_user

    pdf = InvoicePdf.new(@user, view_context)
    send_data pdf.render, filename:
    "invoice_#{@user.email}.pdf", type: "application/pdf", disposition: 'inline'

  end

end
