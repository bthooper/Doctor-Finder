# The Doctor class
#

class DoctorFinder::Doctor

  attr_accessor :name, :speciality, :street, :city, :state, :zip, :details

  @@all = []

  def initialize
    doc = Doctor.new
    @@all << doc
  end

  def self.all
    @@all
  end




end


