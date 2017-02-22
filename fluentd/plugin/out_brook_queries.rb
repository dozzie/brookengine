#!/usr/bin/ruby1.9.1
#
# BrookEngine queries manager
# ===========================
#
# fluent.conf
# -----------
#
# <match **>
#   type brook_queries
#
#   port 5268
#   bind 127.0.0.1
#
#   control_socket /var/run/brook/daemons.sock
#   queries /etc/brookengine/queries.yaml
#   logging /etc/brookengine/queries.logging
#   brook_send_address 127.0.0.1:5168 # plugin can't detect; must be provided
#   #brook_read_address $bind:$port
# </match>
#
#-----------------------------------------------------------------------------

require "json"
require "cool.io"
require "fluent/output"
require "fluent/config/error"

class BrookEngineQueries < Fluent::Output
  Fluent::Plugin.register_output("brook_queries", self)

  config_param :port, :integer, :default => 5268
  config_param :bind, :string, :default => "127.0.0.1"
  config_param :backlog, :integer, :default => 1

  #config_param :control_socket, :string
  #config_param :queries, :string
  #config_param :logging, :string
  #config_param :brook_send_address, :string
  #config_param :brook_read_address, :string, :default => nil

  def configure(conf)
    super
  end

  def start
    @loop = Coolio::Loop.new

    $log.info "listening query pub-sub socket on #{@bind}:#{@port}"
    @subscribers = {}
    @socket = Coolio::TCPServer.new(@bind, @port, Handler, self)
    @socket.listen(@backlog) unless @backlog.nil?
    @loop.attach(@socket)

    @io_thread = Thread.new(&method(:run))

    # TODO: start daemonshepherd
  end

  def shutdown
    @loop.watchers.each {|w| w.detach if w.attached? }
    @loop.stop
    @io_thread.join
    @socket.close
  end

  def emit(tag, es, chain)
    es.each {|time, record|
      message = record.to_json + "\n"
      @subscribers.each_key {|sock|
        begin
          sock.write(message)
        rescue
          # broken connection will be closed without our intervention
        end
      }
    }
    chain.next
  end

  def subscribe(sock)
    $log.info "subscribe"
    @subscribers[sock] = true
  end

  def unsubscribe(sock)
    $log.info "unsubscribe"
    @subscribers.delete(sock)
  end

  def run
    @loop.run(0.1) # 100ms, so the loop doesn't stuck on shutdown
  rescue => e
    $log.error "unexpected error", error: e, error_class: e.class
    $log.error_backtrace
  end

  class Handler < Coolio::Socket
    def initialize(io, pubsub)
      super(io)

      # NOTE: `io' is a TCPSocket instance
      opt = [1].pack("I!")  # { int bool_value; }
      v = io.setsockopt(Socket::SOL_SOCKET, Socket::SO_KEEPALIVE, opt)
      # 75 seconds of idle before sending first keepalive message; value the
      # same as Linux' default interval between keepalive messages
      opt = [75].pack("I!") # { int idle_time; }
      v = io.setsockopt(Socket::IPPROTO_TCP, Socket::TCP_KEEPIDLE, opt)

      @pubsub = pubsub
    end

    def on_connect
      @pubsub.subscribe(self)
    end

    def on_read(data)
      # no data expected on this socket, so anything that comes is an error
      close
    end

    def on_close
      @pubsub.unsubscribe(self)
    end
  end
end

# vim:ft=ruby:foldmethod=marker
