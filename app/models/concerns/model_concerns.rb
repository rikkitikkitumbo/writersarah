module Sscopes
  include do
    #scope :title, -> {where(title: "yay")}
    scope :title, -> title {where(title: title) }
    scope :cat_title, ->  cat_title {where(:cat_title => cat_title)}
    #scope :created_ago, -> {where(:created_ago => created_ago)}
    scope :just_made, -> sec {where "created_at > ?", (sec.to_i).seconds.ago}
  end
end
