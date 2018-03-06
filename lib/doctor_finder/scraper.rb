# The Scraper class
#
#

class DoctorFinder::Scraper

  BASE_URL = "https://www.zocdoc.com/"

  def self.scrape_by_zipcode(zipcode)
    html = Nokogiri::HTML(open("#{BASE_URL}search?address=#{zipcode}&insurance_carrier=-1&day_filter=AnyDay&gender=-1&language=-1&offset=0&insurance_plan=-1&reason_visit=75&after_5pm=false&before_10am=false&sees_children=false&sort_type=Default&dr_specialty=153&"))
    slice = html.css('.js-prof-row-container')
    binding.pry
    slice.each do |doctor| # will go through the HTML and create new doctor instances
      doc = DoctorFinder::Doctor.new
      doc.name = doctor.css('.js-profile-link').text.strip.gsub("\n", ' ').squeeze(' ')
      doc.speciality = doctor.css('.ch-prof-row-speciality').text.strip
      doc.url = BASE_URL + doctor.css('.js-profile-link')[0]['href']
      address = doctor.css('.js-search-prof-row-address').text.strip
      doc.street = address.slice(/^\d+[ ][\w+[ ]]+/) # To format the text correctly, had to use some regex
      doc.city = address[/[ ][ ]+[\w+[.]*[ ]]*[,]/].strip.chop
      doc.state = address[/[A-Z][A-Z]/]
      doc.zip = address[/\d{5}/] 
    end
    DoctorFinder::Doctor.all
  end

  def self.scrape_for_details(doctor)



    doctor
  end


end

