class RecommendationsController < ApplicationController
  before_action :set_recommendation, only: [:show, :edit, :update, :destroy]

  # GET /recommendations
  # GET /recommendations.json
  def index
    @recommendations = Recommendation.all
    album_set=random_set(20,Recommendation.where(recommended_type:"Album").count)
    @album_recommendations =   album_set.map do |a|
      Recommendation.where(recommended_type:"Album").offset(a).first
    end
    artist_set=random_set(5,Recommendation.where(recommended_type:"Artist").count)
    @artist_recommendations = artist_set.map do |a|
      Recommendation.where(recommended_type:"Artist").offset(a).first
    end
  end

  # GET /recommendations/1
  # GET /recommendations/1.json
  def show
  end

  # GET /recommendations/new
  def new
    @recommendation = Recommendation.new
  end

  # GET /recommendations/1/edit
  def edit
  end

  # POST /recommendations
  # POST /recommendations.json
  def create
    @recommendation = Recommendation.new(recommendation_params)

    respond_to do |format|
      if @recommendation.save
        format.html { redirect_to @recommendation, notice: 'Recommendation was successfully created.' }
        format.json { render :show, status: :created, location: @recommendation }
      else
        format.html { render :new }
        format.json { render json: @recommendation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /recommendations/1
  # PATCH/PUT /recommendations/1.json
  def update
    respond_to do |format|
      if @recommendation.update(recommendation_params)
        format.html { redirect_to @recommendation, notice: 'Recommendation was successfully updated.' }
        format.json { render :show, status: :ok, location: @recommendation }
      else
        format.html { render :edit }
        format.json { render json: @recommendation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recommendations/1
  # DELETE /recommendations/1.json
  def destroy
    @recommendation.destroy
    respond_to do |format|
      format.html { redirect_to recommendations_url, notice: 'Recommendation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recommendation
      @recommendation = Recommendation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def recommendation_params
      params[:recommendation]
    end
    
    def random_set(n,seed)
      if n > seed
        raise ArgumentError, "You dickhead, you can't have a set of #{n} unique integers with maximum range of #{seed}. This would loop forever. Ugh"
      end
      arr =[]
      while arr.count < n
        arr << rand(seed)
        arr.uniq!
      end
      return arr
    end
end
