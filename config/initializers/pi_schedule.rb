require 'rufus-scheduler'

scheduler = Rufus::Scheduler.new

scheduler.in '60s' do
    on_command = "vcgencmd display_power 0"
    system(on_command)
end

scheduler.in '90s' do
    on_command = "vcgencmd display_power 1"
    system(on_command)
end

scheduler.cron '30 08 * * *' do
    on_command = "vcgencmd display_power 1"
    system(on_command)
end

scheduler.cron '00 22 * * *' do
    off_command = "vcgencmd display_power 0"
    system(off_command)
end

