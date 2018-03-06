# CLI Main file defining the CLI class
#

class DoctorFinder::CLI

  def call 
    puts "\nWelcome to Hooper's Doctor Finder."
    puts "\nWith HDF you can retrieve a list of doctors by zipcode and then get more details about a particular doctor on that list. It's easy!"
    show_list(get_zipcode)
    get_choice_from_list
    show_doctor_details
    farewell
  end

  def get_zipcode
    # Gets a valid zip code from the user
    zip = "" 
    while !iszipcode?(zip)
      puts "\nPlease enter a valid zipcode:"
      zip = gets.chomp[0..4]
    end
    zip
  end

  def iszipcode?(zipcode)
    # Provides a basic level of validation for user input of zipcode.
    if zipcode.length == 5 && zipcode.scan(/\D/).empty?
      true
    else
      false
    end
  end

  def show_list(zipcode)
    # Calls scraper and prints a list of doctors based on the zip code entered by the user.
    docs = DoctorFinder::Scraper.scrape_by_zipcode(zipcode)
    docs.each.with_index(1) do |doc, i|
      puts "#{i}. #{doc.name} - #{doc.speciality} - #{doc.city}, #{doc.state} #{doc.zip}"
    end
  end

  def get_choice_from_list
    # Gets a valid choice from the list of Doctors.

  end


  def show_doctor_details
    # Calls Sraper again to get selected doctor's details.

  end

  def farewell
    # Tells the user goodbye.
  end



  
end

