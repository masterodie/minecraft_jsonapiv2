module Minecraft
    module JSONAPIv2
        class API
            attr_reader :user

            def initialize(options={})
                @user= options[:user]
                @conn = Minecraft::JSONAPIv2::Request.new(options)
            end

            def call(method)
                if method.is_a? Array
                    method.each { |m| call m }
                else
                    if method.is_a? Hash
                        response = Minecraft::JSONAPIv2::Response.new( @conn.make_request(method) ).response[method[:name].gsub(/\./, '_')]
                        response = Mash.new(response) if response.is_a? Hash
                    end
                end
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
                    response = Mash.new(response) if response.is_a? Hash
                    begin
                        unless response.nil?
                            response
                        else
                            raise NoResponseError
                        end
                    end
                end
            end
        end
    end
end

# Custom Error classes
class NoResponseError < StandardError
end


