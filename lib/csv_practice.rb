require 'csv'
require 'awesome_print'

REQUIRED_OLYMPIAN_FIELDS = %w[ID Name Height Team Year City Sport Event Medal]

def get_all_olympic_athletes(filename)
  array_of_hashes = CSV.read(filename, headers: true).map { |athlete| athlete.to_h }
  # [ {}, {}]
  #
  new_array = []
  array_of_hashes.each do |athlete|
    new_array << athlete.select { |key, value| REQUIRED_OLYMPIAN_FIELDS.include? (key) }
  end

  pp new_array[0..3]
  # REQUIRED_OLYMPIAN_FIELDS = %w[ID Name Height Team Year City Sport Event Medal]

  return new_array
end


#I did not get this to work...
# def total_medals_per_team(olympic_data)
#
#   country_medals = {}
#
#   olympic_data.each do |athlete|
#     medals = 0
#     if athlete[:'Medal'] != "NA"
#       medals += 1
#       country_medals[athlete[:'Team']] = medals
#     end
#   end
#   # expected_totals = {
#   #     'Norway' => 133,
#   #     'United States' => 944,
#   #     'Canada' => 321,
#   #     'Russia' => 470,
#   #     'China' => 423,
#   #     'Bahrain' => 3,
#   #     'Jamaica' => 69,
#   #     'United Arab Emirates' => 1
#   # }
#   return country_medals
# end
#
# def get_all_gold_medalists(olympic_data)
# end

#get_all_olympic_athletes('../data/athlete_events.csv')


#p total_medals_per_team(get_all_olympic_athletes('../data/athlete_events.csv'))