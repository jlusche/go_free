namespace :import do
  task :events => :environment do
    csv_text = File.read('/Users/patrickfarabaugh/Desktop/museums_free_day.csv')
    csv = CSV.parse(csv_text, :headers => true)

    csv.each do |row|
      hash =  row.to_hash

      location = Location.find_by_name(hash['name'])

      event_venue = location.name

      start_year = hash['start_time'][0..3].to_i
      start_month = hash['start_time'][5..6].to_i
      start_day = hash['start_time'][9..10].to_i
      start_hour = hash['start_time'][12..14].to_i
      start_min = hash['start_time'][16..18].to_i

      start_time = DateTime.new(start_year,start_month,start_day,start_hour,start_min)


      #start_time = DateTime.new(hash['start_time']) #parse string & turn into integer

      end_year = hash['end_time'][0..3].to_i
      end_month = hash['end_time'][5..6].to_i
      end_day = hash['end_time'][9..10].to_i
      end_hour = hash['end_time'][12..14].to_i
      end_min = hash['end_time'][16..18].to_i


      end_time = DateTime.new(end_year,end_month,end_day,end_hour,end_min)

      #end_time = DateTime.new(hash['end_time'])


      Event.create(location_id: location.id, start_time: start_time, end_time: end_time, name: "Free Museum Day", venue: event_venue)
    end
  end

  task :recurring => :environment do
    csv_text = File.read('/Users/patrickfarabaugh/Desktop/museums_reoccuring_days.csv')
    csv = CSV.parse(csv_text, :headers => true)

    csv.each do |row|
      hash =  row.to_hash

      location = Location.find_by_name(hash['museum_name'])


      schedule = IceCube::Schedule.new(Time.now)

Friday
      schedule.rrule Rule.weekly.day(:monday, :tuesday, :wednesday, :thursday, :friday, :saturday, :sunday)
      schedule.first 10

Mon-Fri
      schedule.rrule Rule.weekly.day(:monday, :tuesday, :wednesday, :thursday, :friday)
      schedule.first 10

Mon-Sun
      schedule.rrule Rule.weekly.day(:monday, :tuesday, :wednesday, :thursday, :friday, :saturday, :sunday)
      schedule.first 10

Mon-Sun minus Tuesday
      schedule.rrule Rule.weekly.day(:monday, :tuesday, :wednesday, :thursday, :friday, :saturday, :sunday)
      schedule.first 10

Mon-Wed, Sat-Sun
      schedule.rrule Rule.weekly.day(:monday, :tuesday, :wednesday, :saturday, :sunday)
      schedule.first 10

Sat
      schedule.rrule Rule.weekly.day(:saturday)
      schedule.first 10

Sat-Sun
      schedule.rrule Rule.weekly.day(:saturday, :sunday)
      schedule.first 10

Sun
      schedule.rrule Rule.weekly.day(:sunday)
      schedule.first 10

Thurs
      schedule.rrule Rule.weekly.day(:thursday)
      schedule.first 10

Thurs-Sun
      schedule.rrule Rule.weekly.day(:thursday, :friday, :saturday, :sunday)
      schedule.first 10

Thurs-Fri
      schedule.rrule Rule.weekly.day(:thursday, :friday)
      schedule.first 10

Thurs-Fri, Sun
      schedule.rrule Rule.weekly.day(:thursday, :friday, :sunday)
      schedule.first 10

Tues-Sat
      schedule.rrule Rule.weekly.day(:tuesday, :wednesday, :thursday, :friday, :saturday)
      schedule.first 10

Tues-Sun
      schedule.rrule Rule.weekly.day(:tuesday, :wednesday, :thursday, :friday, :saturday, :sunday)
      schedule.first 10

Wed-Sun
      schedule.rrule Rule.weekly.day(:wednesday, :thursday, :friday, :saturday, :sunday)
      schedule.first 10

Wed, Fri-Sun
      schedule.rrule Rule.weekly.day(:monday, :tuesday, :wednesday, :thursday, :friday, :saturday, :sunday)
      schedule.first 10






      event_venue = location.name

      start_year = hash['start_time'][0..3].to_i
      start_month = hash['start_time'][5..6].to_i
      start_day = hash['start_time'][9..10].to_i
      start_hour = hash['start_time'][12..14].to_i
      start_min = hash['start_time'][16..18].to_i

      start_time = DateTime.new(start_year,start_month,start_day,start_hour,start_min)


      #start_time = DateTime.new(hash['start_time']) #parse string & turn into integer

      end_year = hash['end_time'][0..3].to_i
      end_month = hash['end_time'][5..6].to_i
      end_day = hash['end_time'][9..10].to_i
      end_hour = hash['end_time'][12..14].to_i
      end_min = hash['end_time'][16..18].to_i


      end_time = DateTime.new(end_year,end_month,end_day,end_hour,end_min)

      #end_time = DateTime.new(hash['end_time'])


      Event.create(location_id: location.id, start_time: start_time, end_time: end_time, name: "Free Museum Day", venue: event_venue)
    end
  end




end 