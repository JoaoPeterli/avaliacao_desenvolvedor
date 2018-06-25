class Purchase < ApplicationRecord
  def self.total
     self.sum(:preco)
  end
end
