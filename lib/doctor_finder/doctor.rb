# The Doctor class
#

class DoctorFinder::Doctor

  attr_accessor :name, :url, :speciality, :street, :city, :state, :zip, :details

  @@all = []

  def initialize
    @@all << self
  end

  def self.all
    @@all
  end




end


