class LocationSerializer < ActiveModel::Serializer
  attributes :id, :location_name, :lat, :lng, :review_count

  def review_count
    object.reviews.size
  end
end