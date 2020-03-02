class Location < ApplicationRecord
  validates_presence_of :city, :lat, :long
end
