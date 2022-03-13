require 'rufus-scheduler'

scheduler = Rufus::Scheduler.singleton

scheduler.every '5m' do
    #on from utc 12 pm to 3 am
    current_hour_utc = Time.current.hour

    # 8 am ET
    morning_hour_utc = 12

    # 11pm ET
    evening_hour_utc = 3

    if current_hour_utc >= morning_hour_utc || current_hour_utc <= evening_hour_utc
        command = "vcgencmd display_power 1"
    else
        command = "vcgencmd display_power 0"
    end

    system(command)
end