require 'rufus-scheduler'

scheduler = Rufus::Scheduler.singleton

scheduler.cron '30 12 * * *' do
    on_command = "vcgencmd display_power 1"
    system(on_command)
end

scheduler.cron '00 03 * * *' do
    off_command = "vcgencmd display_power 0"
    system(off_command)
end

scheduler.cron '47 15 * * *' do
    off_command = "vcgencmd display_power 0"
    system(off_command)
end