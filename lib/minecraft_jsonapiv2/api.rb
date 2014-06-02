module Minecraft
  module JSONAPIv2
    class API
      attr_reader :user

      def initialize(options={})
        @user= options[:user]
        @conn = Minecraft::JSONAPIv2::Request.new(options)
      end

      def call(method)
          request = Minecraft::JSONAPIv2::Response.new( @conn.make_request(method) )
          get_response_for request
      end

      def get_response_for(request)
        response = request.response
        begin
          unless response.nil?
            response
          else
            raise NoResponseError
          end
        end

      end

      def method_missing(name, *args, &block)
        if block_given?
          block.call Minecraft::JSONAPIv2::Namespace.new(self, name.to_s)
        else
          request = Minecraft::JSONAPIv2::Response.new( @conn.make_request(name: name.to_s.gsub(/_/, '.'), args: args) )
          get_response_for request
        end
      end
    end
  end
end

# Custom Error classes
class NoResponseError < StandardError
end


