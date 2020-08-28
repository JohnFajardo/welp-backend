class UserSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :name, :username, :email, :reviews, :profile_pic

  def reviews
    object.reviews.size
  end

  def profile_pic
    if object.profile_pic.attached?
      {
        url: rails_blob_url(object.profile_pic)
      }
    end
  end
end