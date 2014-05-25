module Minecraft
    module JSONAPIv2
        class API
            attr_reader :user

            def initialize(options={})
                @user= options[:user]
                @conn = Minecraft::JSONAPIv2::Request.new(options)
            end

            def call(method)
                response = Minecraft::JSONAPIv2::Response.new( @conn.make_request(method) ).response[method[:name].gsub(/\./, '_')]
                response = Mash.new(response) if response.is_a? Hash or response.is_a? Array
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
                    response = Minecraft::JSONAPIv2::Response.new( @conn.make_request(name: name.to_s.gsub(/_/, '.'), args: args) ).response[name.to_s]

                    super if (response.nil?)
                    response = Mash.new(response) if response.is_a? Hash or response.is_a? Array
                    response
                end
            end
        end
    end
end

# Custom Error classes
class NoResponseError < StandardError
end


