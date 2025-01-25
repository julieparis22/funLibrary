class LectorsController < ApplicationController
    before_action :set_lector, only: %i[show edit update destroy]
  
    # GET /lectors
    def index
      @lectors = Lector.all
    end
  
    def show
        @books = @lector.books || [] # Si @lector.books est nil, on assigne une liste vide
      end
    # GET /lectors/new
    def new
      @lector = Lector.new
    end
  
    # POST /lectors
    def create
      @lector = Lector.new(lector_params)
  
      if @lector.save
        redirect_to @lector, notice: 'Le lecteur a ete ajoute.'
      else
        render :new
      end
    end
  
    # GET /lectors/1/edit
    def edit
    end
  
    # PATCH/PUT /lectors/1
    def update
      if @lector.update(lector_params)
        redirect_to @lector, notice: 'Mis a jouer.'
      else
        render :edit
      end
    end
  
    # DELETE /lectors/1
    def destroy
      @lector.destroy
      redirect_to lectors_url, notice: 'Le lecteur a quitté notre base de donnée'
    end
  
    private
  
    # Use callbacks to share common setup or constraints between actions.
    def set_lector
      @lector = Lector.find(params[:id])
    end
  
    # Only allow a list of trusted parameters through.
    def lector_params
      params.require(:lector).permit(:first_name, :last_name, :address, :email, :uuid)
    end
  end
  