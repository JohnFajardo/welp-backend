class Location < ApplicationRecord
    has_many :reviews
    has_many :users, through: :reviews

    validates :lat, :lng, presence: true
    validates_uniqueness_of   :location_name
    acts_as_mappable    :default_units => :miles,
                        :default_formula => :sphere,
                        :distance_field_name => :distance,
                        :lat_column_name => :lat,
                        :lng_column_name => :lng
end
