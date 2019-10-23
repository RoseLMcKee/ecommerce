class StorefrontsController < ApplicationController
  def all_item
  	@products = Product.all
  end

  def items_by_category
     @products = Product.where(category_id: params[:category_id])
     @category = Category.find(params[:category_id])
  end


  def items_by_brand

  end
end
