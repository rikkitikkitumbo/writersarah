class Api::V1::ArticlesController < ApiController
  PERMITTED = :title, :article_link, :descript, :cat_id, :cat_title

  def index
    artic = apply_scopes(Article).where(cat_id: params[:cat_id])
    cat_order_array = (Cat.find(params[:cat_id]).order_array).split(",").map { |s| s.to_i } #.split(",").map(&:to_i) for later ruby versions
    articles = artic.sort_by{|x| cat_order_array.index(x.id)}

    respond_with articles, root: false, each_serializer: ArticleSerializer
  end

  def new
    respond_with Article.new
  end

  def create
    article = Article.create(permitted_params)
    if article.save
      respond_with article
    end
  end

  private

  def find_resource
    @resource = Article.find(params[:id])
  end

end