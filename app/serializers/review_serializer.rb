class ReviewSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :userId, :userName, :body, :profile_pic, :score, :likes, :liked, :review_pic

  def userName
    object.user.username
  end

  def userId
    object.user.id
  end

  def likes
    object.likes.size
  end

  def liked
    object.likes.where(user_id: @instance_options[:user_id]).exists?
  end

  def profile_pic
    if object.user.profile_pic.attached?
      {
        userPicUrl: rails_blob_url(object.user.profile_pic)
      }
    end
  end

  def review_pic
    if object.review_pic.attached?
      {
        url: rails_blob_url(object.review_pic)
      }
    end
  end

end