require 'geokit'
require 'geoip'

module Geokit
  module Geocoders

    # Should be overriden as Geokit::Geocoders::geo_ip_database in your configuration file
    @@geo_ip_database = 'REPLACE_WITH_GEOCITY_LOCATION'
    __define_accessors

    class GeoIpGeocoder < Geocoder
      private
      def self.db
        @@db ||= GeoIP.new(Geocoders.geo_ip_database)  
      end
      
      def self.do_geocode(address, options = {})
        city = db.city(address)
        return GeoLoc.new if not city
        
        GeoLoc.new.tap do |gl|
          gl.provider     = 'geoip'
          gl.city         = city.city_name
          gl.state        = city.region_name
          gl.zip          = city.postal_code
          gl.country_code = city.country_code2
          gl.lng          = city.longitude.to_f
          gl.lat          = city.latitude.to_f
          gl.success      = !!gl.city && !gl.city.empty?
        end
        
      rescue
        logger.error "Caught an error during GeoIp geocoding call: "+$!
        return GeoLoc.new
      end
    end

  end
end
