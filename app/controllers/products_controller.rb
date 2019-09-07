class ProductsController < ApplicationController
before_action :authenticate_user!
  def index
    if params[:search].present?
      @products = current_user.products.where("brand like (?) AND model like (?) AND ram like (?) AND ext_storage like (?)", "%#{params[:brand]}%", "%#{params[:model]}%", "%#{params[:ram]}%", "%#{params[:ext_storage]}%").order('id DESC').paginate(page: params[:page], per_page: 25)
    else
    @products = current_user.products.order('id DESC').paginate(page: params[:page], per_page: 25 )
      end
  end

  def show
    @product = current_user.products.find_by_id(params[:id])
  end

  def download
    @products = current_user.products
    respond_to do |format|
      format.xlsx
    end
  end


end
