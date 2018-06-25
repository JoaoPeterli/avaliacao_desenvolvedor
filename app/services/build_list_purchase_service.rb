class BuildListPurchaseService 
  KEYS = [ "comprador", "descricao", "preco", "quantidade", "endereco", "fornecedor"] 
  
  def initialize  directory_name 
    @shopping = File.readlines(Rails.public_path.join("#{directory_name}"))
  end                                                                    
  
  def call
    format_shopping_list
  end 
  
  private 
  
  def format_shopping_list
    shopping_list = @shopping 
    shopping_list = shopping_list.map { |line| line.strip.split("\t") } 

    remove_column shopping_list
    build_shopping_list shopping_list  
  end

  def remove_column shopping_list 
    shopping_list.delete_at(0)  
  end 
  
  def build_shopping_list shopping_list 
     shopping_list  = shopping_list.map { |item| Hash[KEYS.zip(item)]}
  end 
end
