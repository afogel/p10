set :output, "/logs/cron_log.log"
every 1.minute do
# every 3.minutes do
  runner "Reminder.new.remind!"
  command "echo
end
