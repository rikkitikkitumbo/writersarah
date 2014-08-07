class Article < ActiveRecord::Base
  belongs_to :cat
  require 'concerns/model_concerns'
  include Sscopes

end

