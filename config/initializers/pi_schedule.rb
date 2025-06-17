require 'rufus-scheduler'

scheduler = Rufus::Scheduler.singleton

scheduler.every '10m' do
  Time.use_zone('America/Los_Angeles') do
    current_hour = Time.current.hour

    # 7 am local time
    morning_hour = 7

    # 11pm local time
    evening_hour = 23

    # Turn display on between 7am and 11pm (23:00)
    if current_hour >= morning_hour && current_hour < evening_hour
      command = "vcgencmd display_power 1"
    else
      command = "vcgencmd display_power 0"
    end

    system(command)
  end
end