class EmpruntDocsController < ApplicationController
  before_action :set_emprunt_doc, only: %i[ show edit update destroy ]

  # GET /emprunt_docs or /emprunt_docs.json
  def index
    @emprunt_docs = EmpruntDoc.all
    respond_to do |format|
      format.html
      format.csv { send_data @emprunt_docs.to_csv }
    end
  end

  # GET /emprunt_docs/1 or /emprunt_docs/1.json
  def show
  end

  # GET /emprunt_docs/new
  def new
    @emprunt_doc = EmpruntDoc.new
  end

  # GET /emprunt_docs/1/edit
  def edit
  end

  # POST /emprunt_docs or /emprunt_docs.json
  def create
    @emprunt_doc = EmpruntDoc.new(emprunt_doc_params)
    adh = @emprunt_doc.id_adh
    doc = @emprunt_doc.isbn_livre
    emprunt_docs = EmpruntDoc.where(id_adh: adh)
    emprunt_docs2 = EmpruntDoc.where(isbn_livre: doc)
    niladh = Adherent.where(id: adh)
    nildoc = Document.where(isbn: doc)
    if niladh[0].nil?
      flash[:danger] = "Id adherent non existant"
      redirect_to documents_url
    elsif nildoc[0].nil?
      flash[:danger] = "Isbn document non existant"
      redirect_to documents_url
    elsif emprunt_docs.count > 5 
      flash[:danger] = "Limite d'emprunts atteinte"
      redirect_to documents_url
    elsif emprunt_docs2.count == 1 
      flash[:danger] = "Document Indisponible"
      redirect_to documents_url
    else 
      respond_to do |format|
        if @emprunt_doc.save
          format.html { redirect_to emprunt_doc_url(@emprunt_doc), notice: "Emprunt doc was successfully created." }
          format.json { render :show, status: :created, location: @emprunt_doc }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @emprunt_doc.errors, status: :unprocessable_entity }
        end
      end
    end
  end
  # PATCH/PUT /emprunt_docs/1 or /emprunt_docs/1.json
  def update
    respond_to do |format|
      if @emprunt_doc.update(emprunt_doc_params)
        format.html { redirect_to emprunt_doc_url(@emprunt_doc), notice: "Emprunt doc was successfully updated." }
        format.json { render :show, status: :ok, location: @emprunt_doc }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @emprunt_doc.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /emprunt_docs/1 or /emprunt_docs/1.json
  def destroy
    @emprunt_doc.destroy

    respond_to do |format|
      format.html { redirect_to emprunt_docs_url, notice: "Emprunt doc was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_emprunt_doc
      @emprunt_doc = EmpruntDoc.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def emprunt_doc_params
      params.require(:emprunt_doc).permit(:isbn_livre, :id_adh)
    end
end
