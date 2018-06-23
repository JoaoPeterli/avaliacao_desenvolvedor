class CreatePurchases < ActiveRecord::Migration[5.2]
  def change
    create_table :purchases do |t|
      t.string :comprador  
      t.string :descricao 
      t.string :preco 
      t.string :quantidade 
      t.string :endereco 
      t.string :fornecedor   
      t.timestamps
    end
  end
end
