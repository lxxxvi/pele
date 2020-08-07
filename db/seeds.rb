teams = %w[
  ITA SUI TUR WAL
  BEL DEN FIN RUS
  AUT NED UKR
  ENG CRO CZE
  POL ESP SWE
  FRA GER POR
]

puts "= Loading teams ="
all_teams = teams.each_with_object({}) do |trigram, result|
  puts "  * #{trigram}"
  result[trigram] = Team.find_or_create_by!(trigram: trigram)
end

venues = [
  ['Wembley Stadium', 'London', 'Europe/London'],
  ['Allianz Arena', 'Munich', 'Europe/Berlin'],
  ['Stadio Olimpico', 'Rome', 'Europe/Rome'],
  ['Olympic Stadium', 'Baku', 'Asia/Baku'],
  ['Krestovsky Stadium', 'Saint Petersburg', 'Europe/Moscow'],
  ['Puskás Aréna', 'Budapest', 'Europe/Budapest'],
  ['Arena Națională', 'Bucharest', 'Europe/Bucharest'],
  ['Johan Cruyff Arena', 'Amsterdam', 'Europe/Amsterdam'],
  ['San Mamés', 'Bilbao', 'Europe/Madrid'],
  ['Hampden Park', 'Glasgow', 'Europe/London'],
  ['Aviva Stadium', 'Dublin', 'Europe/Dublin'],
  ['Parken Stadium', 'Copenhagen', 'Europe/Copenhagen']
]

puts "\n= Loading venues ="
all_venues = venues.each_with_object({}) do |venue, result|
  name, city, country_time_zone_identifier = venue

  puts "  * #{name}, #{city} (#{country_time_zone_identifier})"
  result[city] = Venue.find_or_initialize_by(city: city).tap do |venue|
    venue.name = name
    venue.country_time_zone_identifier = country_time_zone_identifier
    venue.save!
  end
end

matches = [
  ['1', 'TUR', 'ITA', :group_match_1, '2021-06-11T19:00:00+00:00', 'Rome'],
  ['2', 'WAL', 'SUI', :group_match_1, '2021-06-12T13:00:00+00:00', 'Baku'],
  ['3', 'DEN', 'FIN', :group_match_1, '2021-06-12T16:00:00+00:00', 'Copenhagen'],
  ['4', 'BEL', 'RUS', :group_match_1, '2021-06-12T19:00:00+00:00', 'Saint Petersburg'],
  ['6', 'AUT', 'N/A', :group_match_1, '2021-06-13T16:00:00+00:00', 'Bucharest'],
  ['5', 'NED', 'UKR', :group_match_1, '2021-06-13T19:00:00+00:00', 'Amsterdam'],
  ['7', 'ENG', 'CRO', :group_match_1, '2021-06-13T13:00:00+00:00', 'London'],
  ['8', 'N/A', 'CZE', :group_match_1, '2021-06-14T13:00:00+00:00', 'Glasgow'],
  ['9', 'ESP', 'SWE', :group_match_1, '2021-06-14T19:00:00+00:00', 'Bilbao'],
  ['10', 'POL', 'N/A', :group_match_1, '2021-06-14T16:00:00+00:00', 'Dublin'],
  ['11', 'N/A', 'POR', :group_match_1, '2021-06-15T16:00:00+00:00', 'Budapest'],
  ['12', 'FRA', 'GER', :group_match_1, '2021-06-15T19:00:00+00:00', 'Munich'],
  ['13', 'TUR', 'WAL', :group_match_2, '2021-06-16T16:00:00+00:00', 'Baku'],
  ['14', 'ITA', 'SUI', :group_match_2, '2021-06-16T19:00:00+00:00', 'Rome'],
  ['15', 'FIN', 'RUS', :group_match_2, '2021-06-16T13:00:00+00:00', 'Saint Petersburg'],
  ['16', 'DEN', 'BEL', :group_match_2, '2021-06-17T16:00:00+00:00', 'Copenhagen'],
  ['18', 'UKR', 'N/A', :group_match_2, '2021-06-17T13:00:00+00:00', 'Bucharest'],
  ['17', 'NED', 'AUT', :group_match_2, '2021-06-17T19:00:00+00:00', 'Amsterdam'],
  ['19', 'CRO', 'CZE', :group_match_2, '2021-06-18T16:00:00+00:00', 'Glasgow'],
  ['20', 'ENG', 'N/A', :group_match_2, '2021-06-18T19:00:00+00:00', 'London'],
  ['21', 'SWE', 'N/A', :group_match_2, '2021-06-18T13:00:00+00:00', 'Dublin'],
  ['22', 'ESP', 'POL', :group_match_2, '2021-06-19T19:00:00+00:00', 'Bilbao'],
  ['23', 'N/A', 'FRA', :group_match_2, '2021-06-19T13:00:00+00:00', 'Budapest'],
  ['24', 'POR', 'GER', :group_match_2, '2021-06-19T16:00:00+00:00', 'Munich'],
  ['25', 'SUI', 'TUR', :group_match_3, '2021-06-20T16:00:00+00:00', 'Baku'],
  ['26', 'ITA', 'WAL', :group_match_3, '2021-06-20T16:00:00+00:00', 'Rome'],
  ['27', 'RUS', 'DEN', :group_match_3, '2021-06-21T19:00:00+00:00', 'Copenhagen'],
  ['28', 'FIN', 'BEL', :group_match_3, '2021-06-21T19:00:00+00:00', 'Saint Petersburg'],
  ['29', 'N/A', 'NED', :group_match_3, '2021-06-21T16:00:00+00:00', 'Amsterdam'],
  ['30', 'UKR', 'AUT', :group_match_3, '2021-06-21T16:00:00+00:00', 'Bucharest'],
  ['31', 'CRO', 'N/A', :group_match_3, '2021-06-22T19:00:00+00:00', 'Glasgow'],
  ['32', 'CZE', 'ENG', :group_match_3, '2021-06-22T19:00:00+00:00', 'London'],
  ['33', 'N/A', 'ESP', :group_match_3, '2021-06-23T16:00:00+00:00', 'Bilbao'],
  ['34', 'SWE', 'POL', :group_match_3, '2021-06-23T16:00:00+00:00', 'Dublin'],
  ['35', 'POR', 'FRA', :group_match_3, '2021-06-23T19:00:00+00:00', 'Budapest'],
  ['36', 'GER', 'N/A', :group_match_3, '2021-06-23T19:00:00+00:00', 'Munich'],
  ['38', 'N/A', 'N/A', :round_of_16, '2021-06-26T16:00:00+00:00', 'Amsterdam'],
  ['37', 'N/A', 'N/A', :round_of_16, '2021-06-26T19:00:00+00:00', 'London'],
  ['40', 'N/A', 'N/A', :round_of_16, '2021-06-27T16:00:00+00:00', 'Budapest'],
  ['39', 'N/A', 'N/A', :round_of_16, '2021-06-27T19:00:00+00:00', 'Bilbao'],
  ['42', 'N/A', 'N/A', :round_of_16, '2021-06-28T16:00:00+00:00', 'Copenhagen'],
  ['41', 'N/A', 'N/A', :round_of_16, '2021-06-28T19:00:00+00:00', 'Bucharest'],
  ['44', 'N/A', 'N/A', :round_of_16, '2021-06-29T16:00:00+00:00', 'Dublin'],
  ['43', 'N/A', 'N/A', :round_of_16, '2021-06-29T19:00:00+00:00', 'Glasgow'],
  ['45', 'N/A', 'N/A', :quarter_finals, '2021-07-02T16:00:00+00:00', 'Saint Petersburg'],
  ['46', 'N/A', 'N/A', :quarter_finals, '2021-07-02T19:00:00+00:00', 'Munich'],
  ['47', 'N/A', 'N/A', :quarter_finals, '2021-07-03T16:00:00+00:00', 'Baku'],
  ['48', 'N/A', 'N/A', :quarter_finals, '2021-07-03T19:00:00+00:00', 'Rome'],
  ['49', 'N/A', 'N/A', :semi_finals, '2021-07-06T19:00:00+00:00', 'London'],
  ['50', 'N/A', 'N/A', :semi_finals, '2021-07-07T19:00:00+00:00', 'London'],
  ['51', 'N/A', 'N/A', :final, '2021-07-11T19:00:00+00:00', 'London']
]

puts "\n= Loading matches ="
matches.each do |uefa_match_id, home_team_trigram, guest_team_trigram, tournament_stage, kickoff_at, venue_city|
  puts "  * #{uefa_match_id.rjust(2, ' ')}: #{home_team_trigram} vs #{guest_team_trigram} (#{tournament_stage}, #{venue_city})"
  Match.find_or_initialize_by(uefa_match_id: uefa_match_id).tap do |match|
    match.home_team = all_teams[home_team_trigram]
    match.guest_team = all_teams[guest_team_trigram]
    match.tournament_stage = tournament_stage
    match.kickoff_at = kickoff_at
    match.venue = all_venues[venue_city]
    match.save!
  end
end
