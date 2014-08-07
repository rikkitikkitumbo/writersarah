class Api::V1::AllarticlesController < ApiController
  PERMITTED = :title, :article_link, :descript, :cat_id, :cat_title
  REQUIRED = :title, :article_link, :descript, :cat_id, :cat_title


  has_scope :title

  def index
    respond_with apply_scopes(Article).all.last(1), root: false
  end


  def create
    respond_with Article.create(permitted_params), location: 'greg'
  end


  private


  def find_resource
    @resource = Article.find(params[:id])
  end

end

