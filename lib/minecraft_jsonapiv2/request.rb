module Minecraft
    module JSONAPIv2
        class Request
            def initialize(options={})
                @host = options[:host].nil? ? '127.0.0.1' : options[:host]
                @port = options[:port].nil? ? 20059 : options[:port]
                @user = options[:user]
                @auth = Minecraft::JSONAPIv2::Authorization.new(options)
                @json = []
                @req = []
            end

            def make_request(options)
                url = Minecraft::JSONAPIv2::BASE_URI % {host: @host, port: @port}
                request = generate_array_for_json( generate_request(options) ).to_json
                response = HTTParty.post(url, body: request, headers: {'Content-Type' => 'application/json'} )
                @json = []
                @req = []
                response.body
            end

            def generate_request(method)
                if method.is_a? Array
                    method.each do |m|
                        generate_request m
                    end
                else
                    @req.push(
                        user: @user,
                        method: method,
                        key: @auth.key_for(method[:name])
                    )
                end
                @req
            end

            def map_to_array(arguments)
                if arguments.nil?
                    []
                elsif arguments.is_a?(Array) || arguments.is_a?(Hash)
                    arguments
                else
                    [arguments]
                end
            end

            def generate_array_for_json(options={})
                if options.is_a? Array
                    options.each do |o|
                        generate_array_for_json o
                    end
                else
                raise 'No username given' if options[:user].nil?
                raise 'No key given' if options[:key].nil?
                raise 'No method given' if options[:method].nil?
                raise 'No method name given' if options[:method][:name].nil?
                @json.push({
                    name: options[:method][:name],
                    username: options[:user],
                    arguments: map_to_array(options[:method][:args]),
                    key: options[:key],
                })
                end
                @json
            end
        end
    end
end
