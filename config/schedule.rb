#set :output, "/path/to/my/cron_log.log"
#
every 1.day do
  rake "mailing:notify"
end
