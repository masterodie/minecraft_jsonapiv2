require_relative '../../spec_helper'

describe Minecraft::JSONAPIv2::API do
  before do
    @api = Minecraft::JSONAPIv2::API.new(host: '10.10.0.10', port: 20059, user: 'admin', password: 'changeme', salt: 'mmm')
  end

  describe 'method' do
    it 'must raise method not found' do
      lambda { @api.foobar }.must_raise NoMethodError
    end

    it 'must be String if response is String' do
      @api.server_version.must_be_instance_of String
    end

    it 'must be Mash when API response is Hash' do
      @api.server.must_be_instance_of Mash
    end
  end

  describe 'methhod with arguments' do
    it 'must equal called arguments' do
      @api.players_name('masterodie').name.must_equal 'masterodie'
    end

    it 'must be Mash response is Hash' do
      @api.server.must_be_instance_of Mash
    end
  end

  describe 'block' do
    it 'must respond' do
      @api.server {|s| s.version }.must_be_instance_of String
    end
  end

  describe 'manual call' do
    it 'must raise no response' do
      lambda { @api.call(name: 'foobar') }.must_raise NoResponseError
    end

    it 'must be String response is string' do
      @api.call(name: 'server.version').must_be_instance_of String
    end

    it 'must be Mash when response is Hash' do
      @api.call(name: 'server').must_be_instance_of Mash
    end
  end
end
