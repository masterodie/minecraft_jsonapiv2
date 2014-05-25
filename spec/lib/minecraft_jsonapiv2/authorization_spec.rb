require_relative '../../spec_helper.rb'

describe Minecraft::JSONAPIv2::Authorization do
    describe 'key_for' do
        before do
            @auth = Minecraft::JSONAPIv2::Authorization.new(user: 'admin', password: 'changeme', salt: 'mmm')
        end

        it 'must be String' do
            @auth.key_for(name: 'server.version').must_be_instance_of String
        end

        it 'must have the right length' do
            @auth.key_for(name: 'server.version').length.must_equal 64
        end
    end
end
