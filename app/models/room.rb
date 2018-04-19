require 'pusher'

Pusher.app_id = '471098'
Pusher.key = 'a643ec07311ea7899ff7'
Pusher.secret = 'dbffd1f577257bd8f10c'
Pusher.cluster = 'us2'
Pusher.logger = Rails.logger
Pusher.encrypted = true

class Room < ApplicationRecord
  def parse_response(response)
    response_array = response.split(":")
    if(Room.exists?['name = response_array[0]'])
      room = Room.where('name = response_array[0]')
      sensor = new Sensor  
      sensor.name = response_array[0]
      sensor.temp = response_array[1]
      sensor.high = response_array[2]
      sensor.low = response_array[3]
      if sensor.temp < room.low
        sensor.status = "Cold"
      elsif sensor.temp > room.low 
        sensor.status = 'Hot'
      else 
        sensor.status = 'Normal'
      end
      if sensor.status != 'Normal'
        Pusher.trigger('my-channel', 'my-event', { message: 'Abnormal Status'})
      end
      sensor.save
    end
  end
end
