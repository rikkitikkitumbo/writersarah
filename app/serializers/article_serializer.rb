class ArticleSerializer < ActiveModel::Serializer
  attributes :id, :title, :article_link, :descript, :cat_id, :cat_title

end