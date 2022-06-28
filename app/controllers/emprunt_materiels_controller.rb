class EmpruntMaterielsController < ApplicationController
  before_action :set_emprunt_materiel, only: %i[ show edit update destroy ]

  # GET /emprunt_materiels or /emprunt_materiels.json
  def index
    @emprunt_materiels = EmpruntMateriel.all
    respond_to do |format|
      format.html
      format.csv { send_data @emprunt_materiels.to_csv }
    end
  end

  # GET /emprunt_materiels/1 or /emprunt_materiels/1.json
  def show
  end

  # GET /emprunt_materiels/new
  def new
    @emprunt_materiel = EmpruntMateriel.new
  end

  # GET /emprunt_materiels/1/edit
  def edit
  end

  # POST /emprunt_materiels or /emprunt_materiels.json
  def create
    @emprunt_materiel = EmpruntMateriel.new(emprunt_materiel_params)
    adh = @emprunt_materiel.id_adh
    mat = @emprunt_materiel.id_mat
    emprunt_mat= EmpruntMateriel.where(id_adh: adh)
    emprunt_mat2 = EmpruntMateriel.where(id_mat: mat)
    niladh = Adherent.where(id: adh)
    nilmat = Materiel.where(id: mat)
    if niladh[0].nil?
      flash[:danger] = "Id adherent non existant"
      redirect_to materiels_url
    elsif nilmat[0].nil?
      flash[:danger] = "Id materiel non existant"
      redirect_to materiels_url
    elsif emprunt_mat.count == 1 
      flash[:danger] = "Limite d'emprunts atteinte"
      redirect_to materiels_url
    elsif emprunt_mat2.count == 1 
      flash[:danger] = "Document Indisponible"
      redirect_to materiels_url
    else 
    respond_to do |format|
      if @emprunt_materiel.save
        format.html { redirect_to emprunt_materiel_url(@emprunt_materiel), notice: "Emprunt materiel was successfully created." }
        format.json { render :show, status: :created, location: @emprunt_materiel }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @emprunt_materiel.errors, status: :unprocessable_entity }
      end
    end
  end
  end

  # PATCH/PUT /emprunt_materiels/1 or /emprunt_materiels/1.json
  def update
    respond_to do |format|
      if @emprunt_materiel.update(emprunt_materiel_params)
        format.html { redirect_to emprunt_materiel_url(@emprunt_materiel), notice: "Emprunt materiel was successfully updated." }
        format.json { render :show, status: :ok, location: @emprunt_materiel }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @emprunt_materiel.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /emprunt_materiels/1 or /emprunt_materiels/1.json
  def destroy
    @emprunt_materiel.destroy

    respond_to do |format|
      format.html { redirect_to emprunt_materiels_url, notice: "Emprunt materiel was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_emprunt_materiel
      @emprunt_materiel = EmpruntMateriel.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def emprunt_materiel_params
      params.require(:emprunt_materiel).permit(:id_mat, :id_adh)
    end
end
