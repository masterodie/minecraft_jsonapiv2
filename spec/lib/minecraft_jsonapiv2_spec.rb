require_relative '../spec_helper.rb'

describe Minecraft::JSONAPIv2 do
    describe 'shortcut' do
        before do
           @api = Minecraft::JSONAPIv2.new(host: '10.10.0.10', port: 20059, user: 'admin', password: 'changeme', salt: 'mmm')
        end

        it 'should work' do
            @api.must_be_instance_of Minecraft::JSONAPIv2::API
        end
    end
end
