class BenchmarkChannel < ApplicationCable::Channel
  def subscribed
    Rails.logger.info "a client subscribed: #{id}"
    stream_from "all"
  end

  def echo(data)
    transmit data
  end

  def broadcast(data)
    ActionCable.server.broadcast "all", data
    data["action"] = "broadcastResult"
    transmit data
  end
end
