class Image
  attr_reader :id

  def initialize(city)
    @id = nil
    @city = city
  end

  def url
    UnsplashService.new(@city).url
  end
end