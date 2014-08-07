module Query_scopes
  include do
    has_scope :title
    has_scope :just_made
    has_scope :cat_title
  end
end