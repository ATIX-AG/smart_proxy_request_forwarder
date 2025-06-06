# frozen_string_literal: true

require 'test_helper'
require 'rack/test'
require 'webmock/test_unit'
require 'mocha/test_unit'
require 'smart_proxy_request_forwarder'
require 'smart_proxy_request_forwarder/api'

class RequestForwarderApiTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    Proxy::RequestForwarder::Api.new
  end

  def setup
    @foreman_url = 'http://foreman.example.com'
    Proxy::SETTINGS.stubs(:foreman_url).returns(@foreman_url)
  end

  def test_forward_config_report
    config_report_body = '{"config_report" : {
      "host": "host.url.test",
      "metrics": {}
      }}'
    config_report = { host: 'host.url.test', metrics: {} }
    stub_request(:post, "#{@foreman_url}/api/config_reports").to_return(body: config_report_body, status: 200)

    post 'request_forwarder/config_reports', config_report: config_report

    assert_predicate(last_response, :ok?)
    assert_match(config_report_body, last_response.body)
  end

  def test_forward_hosts_facts
    hosts_facts_body = '{"name": "host.test.url", "facts": {}}'
    stub_request(:post, "#{@foreman_url}/api/hosts/facts").to_return(body: hosts_facts_body, status: 200)

    post 'request_forwarder/hosts/facts', { name: 'host.test.url', facts: {} }

    assert_predicate(last_response, :ok?)
    assert_match(hosts_facts_body, last_response.body)
  end
end
