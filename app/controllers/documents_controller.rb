class DocumentsController < ApplicationController
  def index
   @documents = Document.all
  end
       
  def new
    @document = Document.new
  end
         
  def create
    @document = Document.new(document_params)
         
    if @document.save
       directory_name = @document.attachment.current_path
       build_purchase directory_name 
       redirect_to documents_path, notice: "O upload do documento:  #{@document.name} foi feito."
    else
      render "new"
    end
  end
                                                             
  def destroy
    @document = Document.find(params[:id])
    @document.destroy
    redirect_to documents_path, notice:  "A exclusão do documento: #{@document.name} foi feita."
  end
                                                               
  private

   def document_params
      params.require(:document).permit(:name, :attachment)
   end

   def build_purchase directory_name 
     purchase = BuildListPurchaseService.new(directory_name).call
     Purchase.create purchase  
   end
end
                                                                         
