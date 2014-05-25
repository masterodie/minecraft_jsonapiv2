module Minecraft
    module JSONAPIv2
        class Response
            attr_reader :response, :raw_response
            def initialize(data)
                @response = {}
                data = JSON.parse(data)
                @raw_response = data
                if data.is_a? Array
                    data.each do |d|
                        @response[d['source'].gsub(/\./, '_')] = d['success']
                    end
                else
                    @response[data['source'].gsub(/\./, '_')] = data['success']
                end
                @response.rubyify_keys!
            end
        end
    end
end
