class SingleLocationSerializer < ActiveModel::Serializer
  attributes :id, :location_name, :lat, :lng, :review_count, :score_avg, :reviews

  def review_count
    object.reviews.length
  end

  def score_avg
    object.reviews.average(:score).to_f.round(2)
  end

  def reviews
    ActiveModel::SerializableResource.new(object.reviews, each_serializer: ReviewSerializer, user_id: @instance_options[:user_id])
  end
end