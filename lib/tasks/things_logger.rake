require 'rubygems'  
require 'active_record'  
require 'socket'
require 'logger'

namespace :logger_IoT do
  desc "Creates a task which logs data from things devices"
  task :things, [:configuration] => :environment do |task, args|
    ActiveRecord::Base.logger = Logger.new('log/query.log')
    configuration = YAML::load(IO.read('config/database.yml'))
    ActiveRecord::Base.establish_connection(configuration[args[:configuration]])

    server = TCPServer.open(2018)
    while true do
      Thread.start(server.accept) do |client|
        response = client.gets
        pp response
        Room.parse_response(response)
        client.close
      end
    end
  end
end

