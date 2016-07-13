
module AvdCntrlr

  def self.read_avd_auth_token()
    auth_token = File.read(ENV['HOME'] + '/.emulator_console_auth_token')
    puts "auth_token = #{auth_token}"
    auth_token
  end

  class AvdComms 
    def initialize(opts = {})
      @socket = nil
      @opts = opts
    end

    def connect_to_avd()
      @socket= Net::Telnet::new("Host" => @opts[:host],
                                "Port" => @opts[:port],
                                "Timeout" => 10,
                                "Prompt" => /^OK/n)

      #@socket.read_until("OK", 5)

      @socket.cmd("auth #{@opts[:auth_token]}")
    end

    def send_fix(loc)
      @socket.cmd("geo fix #{loc.lon} #{loc.lat} #{loc.alt}") unless loc.lat.nil? || loc.lon.nil? || loc.alt.nil?
    end
  end

end

