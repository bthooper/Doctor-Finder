# CLI Main file defining the CLI class
#

class DoctorFinder::CLI

  def call 
    puts "\nWelcome to Hooper's Doctor Finder."
    puts "\nWith HDF you can retrieve a list of doctors by zipcode and then get more details about a particular doctor on that list. It's easy!"
    show_list(get_zipcode)
    get_choice_from_list
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
    DoctorFinder::Doctor.clear
    docs = DoctorFinder::Scraper.scrape_by_zipcode(zipcode)
    docs.each.with_index(1) do |doc, i|
      puts "#{i}. #{doc.name} - #{doc.speciality} - #{doc.city}, #{doc.state} #{doc.zip}"
    end
  end

  def get_choice_from_list
    # Gets a valid choice from the list of Doctors.

    choice = nil 

    while choice != "exit" && choice != "q"
      puts "\n[1..#{DoctorFinder::Doctor.all.length}] Select Doctor | [zip] Start over with new zipcode | [exit] To quit"
      choice = gets.chomp
      if choice.to_i > 0 && choice.to_i < DoctorFinder::Doctor.all.length+1
        doc = DoctorFinder::Scraper.scrape_for_details(DoctorFinder::Doctor.all[choice.to_i-1]) 
        puts "======================================\n"
        puts doc.name
        puts doc.street
        puts doc.city + ', ' + doc.state + ' ' + doc.zip
        puts "--------------------------------------\n"
        puts "Areas of Specialty:"
        puts doc.areas
        puts doc.details
      elsif choice == "zip"
        show_list(get_zipcode)
      end
    end 
  end

  def farewell
    # Tells the user goodbye.
    puts "\n\nThank you for using Hooper's Doctor Finder.  This was an educational experiment, and I learned a lot.  At first it seemed hard, but then it got easier.\n\nSee you next time.\n\n\n\n"
  end



  
end

