module Minecraft
    module JSONAPIv2
        class Response
            attr_reader :response, :raw_response
            def initialize(data)
                @response = {}
                data = JSON.parse(data)
                @raw_response = data
                if data.count == 1
                  data = data[0]
                end
                if data.is_a? Array
                    data.each do |d|
                        @response[d['source'].gsub(/\./, '_')] = d['success']
                    end
                    @response = Mash.new @response.rubyify_keys!
                else
                    @response = data['success']
                    @response = Mash.new @response if @response.is_a? Hash
                end
                @response
            end
        end
    end
end
