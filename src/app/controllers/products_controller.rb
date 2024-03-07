class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit]



  def index
    @products = Product.all.order(:name) # 名前順にすべての商品を取得
    @products = @products.order(price: :asc) if params[:sort] == 'asc'
    @products = @products.order(price: :desc) if params[:sort] == 'desc'
  end
  

  def show

  end
  

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to @product, notice: '商品が正常に作成されました。'
    else
      render :new
    end
  end
  

  def edit
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_product
    @product = Product.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def product_params
    params.require(:product).permit(:name, :manufacturer, :price)
  end
end
