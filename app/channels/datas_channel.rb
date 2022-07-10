class DatasChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'datas_channel'
  end
end