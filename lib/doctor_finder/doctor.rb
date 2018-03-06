# The Doctor class
#

class DoctorFinder::Doctor

  attr_accessor :name, :url, :speciality, :street, :city, :state, :zip, :details, :areas

  @@all = []

  def initialize
    @@all << self
  end

  def self.all
    @@all
  end

  def self.clear
    @@all = []
  end





end


