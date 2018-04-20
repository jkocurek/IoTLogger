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
      result = new Result  
      result.name = response_array[0]
      result.value = response_array[1]
      result.high = response_array[2]
      result.low = response_array[3]
//      if sensor.temp < room.low
//        sensor.status = "Cold"
//      elsif sensor.temp > room.low 
//        sensor.status = 'Hot'
//      else 
//        sensor.status = 'Normal'
//      end
//      if sensor.status != 'Normal'
//        Pusher.trigger('my-channel', 'my-event', { message: 'Abnormal Status'})
//      end
      result.save
    end
  end
end
