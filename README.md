# DoctorFinder

DoctorFinder is a Ruby Gem that searches for doctors in a given zipcode.  The CLI asks ths user for a zip code and then scrapes data from [https://www.zocdoc.com/](https://www.zocdoc.com/).

Once zocdoc is scraped, the user is presented with a list of doctors more or less in or near the requsted zipcode.  The user can then select a particular doctor to see more details about that doctor.

This CLI project was done as part of the requirements for the Web Developer Track at [The Flatiron School](http://flatironschool.com/).

Version 0.1.1 > Fixed issue with the executable files.  Can now execute from command line as intended.

## License

DoctorFinder is licensed under the [MIT License](https://mit-license.org).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'doctor_finder'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install doctor_finder

## Usage

This is a CLI. Once you run the command 'doctor_finder' from the command line, you will be asked to enter a valid zip code.  As long as the zipcode begins with give digits, it will perform a search and return a list of doctors.  You can then enter a number corresponding to the doctor you are interested in for more details about that doctor.  After that, the process repeats until you exit.

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/bthooper/doctor_finder.
