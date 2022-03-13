require 'rufus-scheduler'

scheduler = Rufus::Scheduler.new

scheduler.cron '30 12 * * *' do
    on_command = "vcgencmd display_power 1"
    system(on_command)
end

scheduler.cron '00 03 * * *' do
    off_command = "vcgencmd display_power 0"
    system(off_command)
end

scheduler.cron '38 15 * * *' do
    off_command = "vcgencmd display_power 0"
    p "running #{off_command}" 
    p system(off_command)
end