class DocumentsController < ApplicationController
  before_action :set_document, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!
  # GET /documents
  # GET /documents.json
  def index
    @documents = Document.all
    if current_user.id!=1
      @documents = @documents.select{ |d| d.user == current_user }
    end
  end

  # GET /documents/1
  # GET /documents/1.json
  def show
    only_show_own_documents
  end

  # GET /documents/new
  def new
    if current_user.task_limit <= current_user.documents.length
      flash[:error] = "In order to ensure fairness, I am reviewing the documents that you have uploaded. Once I have verified that they are in order, I will pay you via the email address that you have provided, and raise the limit of the number of documents you can upload."
      redirect_to dashboard_path
      return
    end
    @document = Document.new
    render :new2
  end

  # GET /documents/1/edit
  def edit
  end

  # POST /documents
  # POST /documents.json
  def create
    @document = Document.new(document_params)
    @document.date_opened = DateTime.strptime(params[:document][:date_opened], '%m/%d/%Y').to_date
    @document.user = current_user
    respond_to do |format|
      if @document.save
        format.html { redirect_to @document, notice: 'Document was successfully created.' }
        format.json { render action: 'show', status: :created, location: @document }
      else
        format.html { render action: 'new' }
        format.json { render json: @document.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /documents/1
  # PATCH/PUT /documents/1.json
  def update
    respond_to do |format|
      if @document.update(document_params)
        format.html { redirect_to @document, notice: 'Document was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @document.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /documents/1
  # DELETE /documents/1.json
  def destroy
    @document.destroy
    respond_to do |format|
      format.html { redirect_to documents_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_document
      @document = Document.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def document_params
      params.require(:document).permit(:case_number, :filepicker_url, :date_opened, :case_name)
    end

    def only_show_own_documents
      if @document.user!=current_user
        redirect_to dashboard_path, notice:"You can only see documents that you have uploaded"
      end
    end
end
