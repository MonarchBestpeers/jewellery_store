# app/services/country_service.rb

class CountryService
  def self.get_countries
    response = HTTP.get('https://restcountries.com/v2/all')
    JSON.parse(response.body.to_s)
  end
end
