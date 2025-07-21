# frozen_string_literal: true

require 'smart_proxy_request_forwarder/api'

map '/api' do
  run Proxy::RequestForwarder::Api
end
