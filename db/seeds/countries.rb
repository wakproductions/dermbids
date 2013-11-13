File.open("db/seeds/countries.csv", "r") do |infile|
  while (line = infile.gets)
    country_name, iso_code = line.split(";")
    Country.create(country_name: country_name.split.map(&:capitalize).join(' '), iso_code: iso_code.strip)
  end
end