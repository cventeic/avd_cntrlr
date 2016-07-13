
module AvdCntrlr

  class GpsdParser
    attr_reader :config_string, :addr, :port

    def initialize(opts = {})
      @config_string = "?WATCH={\"enable\":true,\"json\":true}"
      @addr = opts[:addr] 
      @port = opts[:port]

      @parser = Yajl::Parser.new

      #print = lambda { |data| puts data.inspect }
      #@parser.on_parse_complete = print
    end

    def extract_location(gpsd_msg)
      loc = OpenStruct.new

      @parser.parse(gpsd_msg) do |gpsd_output|
        puts "json = #{gpsd_output}"

        loc.lat = gpsd_output.fetch("lat", nil)
        loc.lon = gpsd_output.fetch("lon", nil)
        loc.alt = gpsd_output.fetch("alt", nil)

        puts "\n lat = #{loc.lat}, lon = #{loc.lon}, alt = #{loc.alt}"
      end

      loc
    end

  end

end
