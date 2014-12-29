namespace :import do
  task :events => :environment do
    csv_text = File.read('/Users/patrickfarabaugh/Desktop/museums_free_day.csv')
    #'/Users/jennalusche/Desktop/museums_free_day.csv'
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


      end_year = hash['end_time'][0..3].to_i
      end_month = hash['end_time'][5..6].to_i
      end_day = hash['end_time'][9..10].to_i
      end_hour = hash['end_time'][12..14].to_i
      end_min = hash['end_time'][16..18].to_i

      end_time = DateTime.new(end_year,end_month,end_day,end_hour,end_min)


      Event.create(
        location_id: location.id,
        start_time: start_time,
        end_time: end_time,
        name: "Free Museum Day",
        venue: event_venue,
        category: "Museums"
        )
    end
  end

  task :recurring => :environment do
    csv_text = File.read('/Users/patrickfarabaugh/Desktop/museums_reoccuring_days.csv')
    #'/Users/jennalusche/Desktop/museums_reoccuring_days.csv'
    csv = CSV.parse(csv_text, :headers => true)

    csv.each do |row|
      hash =  row.to_hash

      location = Location.find_by_name(hash['museum_name'])

      event_venue = location.name

      special = (hash['special'])

      schedule = IceCube::Schedule.new(Time.now)

      week_days = (hash['day'])

case week_days

when "Friday"
      schedule.rrule IceCube::Rule.weekly.day(:friday)
      days = schedule.first(10)

      start_time_h_m = hash['start_time']
      end_time_h_m = hash['end_time']

      times_ymd = []

      days.each do |day|
        times_ymd << day.to_s[0..9]
      end

      start_times = []
      end_times = []

      times_ymd.each do |ymd|

        y = ymd[0..3].to_i
        m = ymd[5..6].to_i
        d = ymd[8..9].to_i

        s_h = start_time_h_m[0..1].to_i
        s_m = start_time_h_m[3..4].to_i

        e_h = end_time_h_m[0..1].to_i
        e_m = end_time_h_m[3..4].to_i

        start_times << DateTime.new(y, m, d, s_h, s_m)
        end_times << DateTime.new(y, m, d, e_h, e_m)
      end

      all_times = Hash[*start_times.zip(end_times).flatten]

      all_times.each do |start_time, end_time|

        Event.create(
        location_id: location.id,
        start_time: start_time,
        end_time: end_time,
        name: "Free Museum Day",
        venue: event_venue,
        special: special,
        category: "Museums"
        )

      end



when "Mon-Fri"
      schedule.rrule IceCube::Rule.weekly.day(:monday, :tuesday, :wednesday, :thursday, :friday)
      days = schedule.first 10

      start_time_h_m = hash['start_time']
      end_time_h_m = hash['end_time']

      times_ymd = []

      days.each do |day|
        times_ymd << day.to_s[0..9]
      end

      start_times = []
      end_times = []

      times_ymd.each do |ymd|

        y = ymd[0..3].to_i
        m = ymd[5..6].to_i
        d = ymd[8..9].to_i

        s_h = start_time_h_m[0..1].to_i
        s_m = start_time_h_m[3..4].to_i

        e_h = end_time_h_m[0..1].to_i
        e_m = end_time_h_m[3..4].to_i

        start_times << DateTime.new(y, m, d, s_h, s_m)
        end_times << DateTime.new(y, m, d, e_h, e_m)
      end

      all_times = Hash[*start_times.zip(end_times).flatten]

      all_times.each do |start_time, end_time|

        Event.create(
        location_id: location.id,
        start_time: start_time,
        end_time: end_time,
        name: "Free Museum Day",
        venue: event_venue,
        special: special,
        category: "Museums"
        )

      end

when "Mon-Sun"
      schedule.rrule IceCube::Rule.weekly.day(:monday, :tuesday, :wednesday, :thursday, :friday, :saturday, :sunday)
      days = schedule.first 10

      start_time_h_m = hash['start_time']
      end_time_h_m = hash['end_time']

      times_ymd = []

      days.each do |day|
        times_ymd << day.to_s[0..9]
      end

      start_times = []
      end_times = []

      times_ymd.each do |ymd|

        y = ymd[0..3].to_i
        m = ymd[5..6].to_i
        d = ymd[8..9].to_i

        s_h = start_time_h_m[0..1].to_i
        s_m = start_time_h_m[3..4].to_i

        e_h = end_time_h_m[0..1].to_i
        e_m = end_time_h_m[3..4].to_i

        start_times << DateTime.new(y, m, d, s_h, s_m)
        end_times << DateTime.new(y, m, d, e_h, e_m)
      end

      all_times = Hash[*start_times.zip(end_times).flatten]

      all_times.each do |start_time, end_time|

        Event.create(
        location_id: location.id,
        start_time: start_time,
        end_time: end_time,
        name: "Free Museum Day",
        venue: event_venue,
        special: special,
        category: "Museums"
        )

      end

when "Mon-Sun minus Tuesday"
      schedule.rrule IceCube::Rule.weekly.day(:monday, :wednesday, :thursday, :friday, :saturday, :sunday)
      days = schedule.first 10

      start_time_h_m = hash['start_time']
      end_time_h_m = hash['end_time']

      times_ymd = []

      days.each do |day|
        times_ymd << day.to_s[0..9]
      end

      start_times = []
      end_times = []

      times_ymd.each do |ymd|

        y = ymd[0..3].to_i
        m = ymd[5..6].to_i
        d = ymd[8..9].to_i

        s_h = start_time_h_m[0..1].to_i
        s_m = start_time_h_m[3..4].to_i

        e_h = end_time_h_m[0..1].to_i
        e_m = end_time_h_m[3..4].to_i

        start_times << DateTime.new(y, m, d, s_h, s_m)
        end_times << DateTime.new(y, m, d, e_h, e_m)
      end

      all_times = Hash[*start_times.zip(end_times).flatten]

      all_times.each do |start_time, end_time|

        Event.create(
        location_id: location.id,
        start_time: start_time,
        end_time: end_time,
        name: "Free Museum Day",
        venue: event_venue,
        special: special,
        category: "Museums"
        )

      end

when "Mon-Wed, Sat-Sun"
      schedule.rrule IceCube::Rule.weekly.day(:monday, :tuesday, :wednesday, :saturday, :sunday)
      days = schedule.first 10

      start_time_h_m = hash['start_time']
      end_time_h_m = hash['end_time']

      times_ymd = []

      days.each do |day|
        times_ymd << day.to_s[0..9]
      end

      start_times = []
      end_times = []

      times_ymd.each do |ymd|

        y = ymd[0..3].to_i
        m = ymd[5..6].to_i
        d = ymd[8..9].to_i

        s_h = start_time_h_m[0..1].to_i
        s_m = start_time_h_m[3..4].to_i

        e_h = end_time_h_m[0..1].to_i
        e_m = end_time_h_m[3..4].to_i

        start_times << DateTime.new(y, m, d, s_h, s_m)
        end_times << DateTime.new(y, m, d, e_h, e_m)
      end

      all_times = Hash[*start_times.zip(end_times).flatten]

      all_times.each do |start_time, end_time|

        Event.create(
        location_id: location.id,
        start_time: start_time,
        end_time: end_time,
        name: "Free Museum Day",
        venue: event_venue,
        special: special,
        category: "Museums"
        )

      end

when "Sat"
      schedule.rrule IceCube::Rule.weekly.day(:saturday)
      days = schedule.first 10

      start_time_h_m = hash['start_time']
      end_time_h_m = hash['end_time']

      times_ymd = []

      days.each do |day|
        times_ymd << day.to_s[0..9]
      end

      start_times = []
      end_times = []

      times_ymd.each do |ymd|

        y = ymd[0..3].to_i
        m = ymd[5..6].to_i
        d = ymd[8..9].to_i

        s_h = start_time_h_m[0..1].to_i
        s_m = start_time_h_m[3..4].to_i

        e_h = end_time_h_m[0..1].to_i
        e_m = end_time_h_m[3..4].to_i

        start_times << DateTime.new(y, m, d, s_h, s_m)
        end_times << DateTime.new(y, m, d, e_h, e_m)
      end

      all_times = Hash[*start_times.zip(end_times).flatten]

      all_times.each do |start_time, end_time|

        Event.create(
        location_id: location.id,
        start_time: start_time,
        end_time: end_time,
        name: "Free Museum Day",
        venue: event_venue,
        special: special,
        category: "Museums"
        )

      end

when "Sat-Sun"
      schedule.rrule IceCube::Rule.weekly.day(:saturday, :sunday)
      days = schedule.first 10

      start_time_h_m = hash['start_time']
      end_time_h_m = hash['end_time']

      times_ymd = []

      days.each do |day|
        times_ymd << day.to_s[0..9]
      end

      start_times = []
      end_times = []

      times_ymd.each do |ymd|

        y = ymd[0..3].to_i
        m = ymd[5..6].to_i
        d = ymd[8..9].to_i

        s_h = start_time_h_m[0..1].to_i
        s_m = start_time_h_m[3..4].to_i

        e_h = end_time_h_m[0..1].to_i
        e_m = end_time_h_m[3..4].to_i

        start_times << DateTime.new(y, m, d, s_h, s_m)
        end_times << DateTime.new(y, m, d, e_h, e_m)
      end

      all_times = Hash[*start_times.zip(end_times).flatten]

      all_times.each do |start_time, end_time|

        Event.create(
        location_id: location.id,
        start_time: start_time,
        end_time: end_time,
        name: "Free Museum Day",
        venue: event_venue,
        special: special,
        category: "Museums"
        )

      end

when "Sun"
      schedule.rrule IceCube::Rule.weekly.day(:sunday)
      days = schedule.first 10

      start_time_h_m = hash['start_time']
      end_time_h_m = hash['end_time']

      times_ymd = []

      days.each do |day|
        times_ymd << day.to_s[0..9]
      end

      start_times = []
      end_times = []

      times_ymd.each do |ymd|

        y = ymd[0..3].to_i
        m = ymd[5..6].to_i
        d = ymd[8..9].to_i

        s_h = start_time_h_m[0..1].to_i
        s_m = start_time_h_m[3..4].to_i

        e_h = end_time_h_m[0..1].to_i
        e_m = end_time_h_m[3..4].to_i

        start_times << DateTime.new(y, m, d, s_h, s_m)
        end_times << DateTime.new(y, m, d, e_h, e_m)
      end

      all_times = Hash[*start_times.zip(end_times).flatten]

      all_times.each do |start_time, end_time|

        Event.create(
        location_id: location.id,
        start_time: start_time,
        end_time: end_time,
        name: "Free Museum Day",
        venue: event_venue,
        special: special,
        category: "Museums"
        )

      end

when "Thurs"
      schedule.rrule IceCube::Rule.weekly.day(:thursday)
      days = schedule.first 10

      start_time_h_m = hash['start_time']
      end_time_h_m = hash['end_time']

      times_ymd = []

      days.each do |day|
        times_ymd << day.to_s[0..9]
      end

      start_times = []
      end_times = []

      times_ymd.each do |ymd|

        y = ymd[0..3].to_i
        m = ymd[5..6].to_i
        d = ymd[8..9].to_i

        s_h = start_time_h_m[0..1].to_i
        s_m = start_time_h_m[3..4].to_i

        e_h = end_time_h_m[0..1].to_i
        e_m = end_time_h_m[3..4].to_i

        start_times << DateTime.new(y, m, d, s_h, s_m)
        end_times << DateTime.new(y, m, d, e_h, e_m)
      end

      all_times = Hash[*start_times.zip(end_times).flatten]

      all_times.each do |start_time, end_time|

        Event.create(
        location_id: location.id,
        start_time: start_time,
        end_time: end_time,
        name: "Free Museum Day",
        venue: event_venue,
        special: special,
        category: "Museums"
        )

      end

when "Thurs-Sun"
      schedule.rrule IceCube::Rule.weekly.day(:thursday, :friday, :saturday, :sunday)
      days = schedule.first 10

      start_time_h_m = hash['start_time']
      end_time_h_m = hash['end_time']

      times_ymd = []

      days.each do |day|
        times_ymd << day.to_s[0..9]
      end

      start_times = []
      end_times = []

      times_ymd.each do |ymd|

        y = ymd[0..3].to_i
        m = ymd[5..6].to_i
        d = ymd[8..9].to_i

        s_h = start_time_h_m[0..1].to_i
        s_m = start_time_h_m[3..4].to_i

        e_h = end_time_h_m[0..1].to_i
        e_m = end_time_h_m[3..4].to_i

        start_times << DateTime.new(y, m, d, s_h, s_m)
        end_times << DateTime.new(y, m, d, e_h, e_m)
      end

      all_times = Hash[*start_times.zip(end_times).flatten]

      all_times.each do |start_time, end_time|

        Event.create(
        location_id: location.id,
        start_time: start_time,
        end_time: end_time,
        name: "Free Museum Day",
        venue: event_venue,
        special: special,
        category: "Museums"
        )

      end

when "Thurs-Fri"
      schedule.rrule IceCube::Rule.weekly.day(:thursday, :friday)
      days = schedule.first 10

      start_time_h_m = hash['start_time']
      end_time_h_m = hash['end_time']

      times_ymd = []

      days.each do |day|
        times_ymd << day.to_s[0..9]
      end

      start_times = []
      end_times = []

      times_ymd.each do |ymd|

        y = ymd[0..3].to_i
        m = ymd[5..6].to_i
        d = ymd[8..9].to_i

        s_h = start_time_h_m[0..1].to_i
        s_m = start_time_h_m[3..4].to_i

        e_h = end_time_h_m[0..1].to_i
        e_m = end_time_h_m[3..4].to_i

        start_times << DateTime.new(y, m, d, s_h, s_m)
        end_times << DateTime.new(y, m, d, e_h, e_m)
      end

      all_times = Hash[*start_times.zip(end_times).flatten]

      all_times.each do |start_time, end_time|

        Event.create(
        location_id: location.id,
        start_time: start_time,
        end_time: end_time,
        name: "Free Museum Day",
        venue: event_venue,
        special: special,
        category: "Museums"
        )

      end

when "Thurs-Fri, Sun"
      schedule.rrule IceCube::Rule.weekly.day(:thursday, :friday, :sunday)
      days = schedule.first 10

      start_time_h_m = hash['start_time']
      end_time_h_m = hash['end_time']

      times_ymd = []

      days.each do |day|
        times_ymd << day.to_s[0..9]
      end

      start_times = []
      end_times = []

      times_ymd.each do |ymd|

        y = ymd[0..3].to_i
        m = ymd[5..6].to_i
        d = ymd[8..9].to_i

        s_h = start_time_h_m[0..1].to_i
        s_m = start_time_h_m[3..4].to_i

        e_h = end_time_h_m[0..1].to_i
        e_m = end_time_h_m[3..4].to_i

        start_times << DateTime.new(y, m, d, s_h, s_m)
        end_times << DateTime.new(y, m, d, e_h, e_m)
      end

      all_times = Hash[*start_times.zip(end_times).flatten]

      all_times.each do |start_time, end_time|

        Event.create(
        location_id: location.id,
        start_time: start_time,
        end_time: end_time,
        name: "Free Museum Day",
        venue: event_venue,
        special: special,
        category: "Museums"
        )

      end

when "Tues-Sat"
      schedule.rrule IceCube::Rule.weekly.day(:tuesday, :wednesday, :thursday, :friday, :saturday)
      days = schedule.first 10

      start_time_h_m = hash['start_time']
      end_time_h_m = hash['end_time']

      times_ymd = []

      days.each do |day|
        times_ymd << day.to_s[0..9]
      end

      start_times = []
      end_times = []

      times_ymd.each do |ymd|

        y = ymd[0..3].to_i
        m = ymd[5..6].to_i
        d = ymd[8..9].to_i

        s_h = start_time_h_m[0..1].to_i
        s_m = start_time_h_m[3..4].to_i

        e_h = end_time_h_m[0..1].to_i
        e_m = end_time_h_m[3..4].to_i

        start_times << DateTime.new(y, m, d, s_h, s_m)
        end_times << DateTime.new(y, m, d, e_h, e_m)
      end

      all_times = Hash[*start_times.zip(end_times).flatten]

      all_times.each do |start_time, end_time|

        Event.create(
        location_id: location.id,
        start_time: start_time,
        end_time: end_time,
        name: "Free Museum Day",
        venue: event_venue,
        special: special,
        category: "Museums"
        )

      end

when "Tues-Sun"
      schedule.rrule IceCube::Rule.weekly.day(:tuesday, :wednesday, :thursday, :friday, :saturday, :sunday)
      days = schedule.first 10

      start_time_h_m = hash['start_time']
      end_time_h_m = hash['end_time']

      times_ymd = []

      days.each do |day|
        times_ymd << day.to_s[0..9]
      end

      start_times = []
      end_times = []

      times_ymd.each do |ymd|

        y = ymd[0..3].to_i
        m = ymd[5..6].to_i
        d = ymd[8..9].to_i

        s_h = start_time_h_m[0..1].to_i
        s_m = start_time_h_m[3..4].to_i

        e_h = end_time_h_m[0..1].to_i
        e_m = end_time_h_m[3..4].to_i

        start_times << DateTime.new(y, m, d, s_h, s_m)
        end_times << DateTime.new(y, m, d, e_h, e_m)
      end

      all_times = Hash[*start_times.zip(end_times).flatten]

      all_times.each do |start_time, end_time|

        Event.create(
        location_id: location.id,
        start_time: start_time,
        end_time: end_time,
        name: "Free Museum Day",
        venue: event_venue,
        special: special,
        category: "Museums"
        )

      end

when "Wed-Sun"
      schedule.rrule IceCube::Rule.weekly.day(:wednesday, :thursday, :friday, :saturday, :sunday)
      days = schedule.first 10

      start_time_h_m = hash['start_time']
      end_time_h_m = hash['end_time']

      times_ymd = []

      days.each do |day|
        times_ymd << day.to_s[0..9]
      end

      start_times = []
      end_times = []

      times_ymd.each do |ymd|

        y = ymd[0..3].to_i
        m = ymd[5..6].to_i
        d = ymd[8..9].to_i

        s_h = start_time_h_m[0..1].to_i
        s_m = start_time_h_m[3..4].to_i

        e_h = end_time_h_m[0..1].to_i
        e_m = end_time_h_m[3..4].to_i

        start_times << DateTime.new(y, m, d, s_h, s_m)
        end_times << DateTime.new(y, m, d, e_h, e_m)
      end

      all_times = Hash[*start_times.zip(end_times).flatten]

      all_times.each do |start_time, end_time|

        Event.create(
        location_id: location.id,
        start_time: start_time,
        end_time: end_time,
        name: "Free Museum Day",
        venue: event_venue,
        special: special,
        category: "Museums"
        )

      end

when "Wed, Fri-Sun"
      schedule.rrule IceCube::Rule.weekly.day(:wednesday, :friday, :saturday, :sunday)
      days = schedule.first 10

      start_time_h_m = hash['start_time']
      end_time_h_m = hash['end_time']

      times_ymd = []

      days.each do |day|
        times_ymd << day.to_s[0..9]
      end

      start_times = []
      end_times = []

      times_ymd.each do |ymd|

        y = ymd[0..3].to_i
        m = ymd[5..6].to_i
        d = ymd[8..9].to_i

        s_h = start_time_h_m[0..1].to_i
        s_m = start_time_h_m[3..4].to_i

        e_h = end_time_h_m[0..1].to_i
        e_m = end_time_h_m[3..4].to_i

        start_times << DateTime.new(y, m, d, s_h, s_m)
        end_times << DateTime.new(y, m, d, e_h, e_m)
      end

      all_times = Hash[*start_times.zip(end_times).flatten]

      all_times.each do |start_time, end_time|

        Event.create(
        location_id: location.id,
        start_time: start_time,
        end_time: end_time,
        name: "Free Museum Day",
        venue: event_venue,
        special: special,
        category: "Museums"
        )

      end

else

  puts "ahh something went wrong!"

end

    end
  end

end 