class IdeasController < ApplicationController
  before_action :set_idea, only: [:show, :update, :destroy]

  # GET /ideas
  def index
    @ideas = Idea.all
    if params[:Category_name] != nil
      cate = Category.find_by!(name: params[:Category_name])
      @ideas = Idea.where(Category_id: cate.id) 
    end
    result = []
    @ideas.each do |idea|
      format = {id: idea.id,  category: Category.find(idea.Category_id).name, body: idea.body,}
      result.push(format)
    end
    render json: result
  end

  # GET /ideas/1
  def show
    render json: @idea
  end

  # POST /ideas
  def create
    cate = Category.find_or_create_by!(name: params[:Category_name])
    if cate.nil? || params[:body] == ""
      render status: 422
    end

    @idea = Idea.create!(body: params[:body],Category_id: cate.id)
    render status: 201
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_idea
      @idea = Idea.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def idea_params
      params.require(:idea).permit(:Category_name, :body)
    end
end
