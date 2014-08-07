class Cat < ActiveRecord::Base
  has_many :articles
  require 'concerns/model_concerns'

end
