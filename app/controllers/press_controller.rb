class PressController < ApplicationController
  layout "layouts/public_head"

  def index
    @user_authenticated = user_signed_in?
    @user_email = current_user ? current_user.email : 'nope'
    artic = apply_scopes(Article).where(cat_id: 1)
    cat_order_array = (Cat.find(1).order_array).split(",").map { |s| s.to_i } #.split(",").map(&:to_i) for later ruby versions
    @articles = artic.sort_by{|x| cat_order_array.index(x.id)}




  end

end