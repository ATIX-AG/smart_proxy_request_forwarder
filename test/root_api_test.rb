# frozen_string_literal: true

require 'test_helper'
require 'json'
require 'mocha/test_unit'
require 'rack/test'
require 'root/root'
require 'root/root_v2_api'
require 'smart_proxy_request_forwarder'

class RequestForwarderApiFeaturesTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    Proxy::PluginInitializer.new(Proxy::Plugins.instance).initialize_plugins
    Proxy::RootV2Api.new
  end

  def test_features
    Proxy::DefaultModuleLoader.any_instance.expects(:load_configuration_file).with('request_forwarder.yml').returns(enabled: true)

    get '/features'

    response = JSON.parse(last_response.body)

    mod = response['request_forwarder']
    refute_nil(mod)
    assert_equal('running', mod['state'], Proxy::LogBuffer::Buffer.instance.info[:failed_modules][:request_forwarder])
  end
end
