# Loads states into the database
#
# Format of the input file is:
# State Abbreviation,State Name,Country ID
#
# We only have one country right now, so USA is country ID 1

File.open("db/seeds/states.csv", "r") do |infile|
  while (line = infile.gets)
    abbr, state_name, country_id = line.split(",")
    State.create({abbr: abbr, state_name: state_name, country_id: country_id})
  end
end