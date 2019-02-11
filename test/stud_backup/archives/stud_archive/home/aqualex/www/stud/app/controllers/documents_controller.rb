class DocumentsController < ApplicationController
  before_action :login_required

  def index
    @documents = Document.all

  end

  def show
    @document = Document.find(params[:id])
  end

  def new
    @document = Document.new
  end

  def create
    @document = Document.new(document_params)
    @document.save!
    redirect_to documents_path
  end

  def edit
    @document = Document.find(params[:id])
  end

  def update
    @document = Document.find(params[:id])
    @document.update_attributes(document_params)
    redirect_to document_path(@document)
  end

  def destroy
    @document = Document.find(params[:id])
    @document.destroy!
    redirect_to documents_path
  end

  private

  def document_params
    params.require(:document).permit( :name, :doc_type, :body, :asset)
  end


end