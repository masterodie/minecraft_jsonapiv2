module Minecraft
    module JSONAPIv2
        class Authorization
            attr_reader :username, :key

            def initialize(options={})
                raise "No username given" if options[:user].nil?
                raise "No password given" if options[:password].nil?
                raise "No salt given" if options[:salt].nil?
                @user = options[:user]
                @pass = options[:password]
                @salt = options[:salt]
                @key = nil
            end

            def key_for(method)
                @key = Digest::SHA256.new.update([@user, method, @pass, @salt].join).to_s
            end
        end
    end
end
