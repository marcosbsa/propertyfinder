class PublicController < ApplicationController
  def main

    if account_signed_in?
      path = current_account.admin? ? accounts_path : dashboard_path
      redirect_to path, flash: { success: "Successfully signed in. Welcome to Property Finder!" } and return 
      end
      
    @properties = Property.latest
    @posts = Post.latest
    
    if params[:search]
      @properties = Property.search(params[:search]).order("name").paginate(page: params[:page], per_page: 6).order('id DESC')
    else
      @properties = Property.all.paginate(page: params[:page], per_page: 6).order('id DESC') 
    end

    
      @posts = Post.all.paginate(page: params[:page], per_page: 4).order('id DESC') 
    

  end


end
 

