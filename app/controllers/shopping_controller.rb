class ShoppingController < ApplicationController

  def index
    @shopping = Purchase.all 
    @total_preco = Purchase.total
  end
end
