# frozen_string_literal: true

require 'smart_proxy_request_forwarder/proxy_request'

class Proxy::RequestForwarder::Api < Sinatra::Base
  include Sinatra::Authorization::Helpers

  post '/*' do
    do_authorize_any
    case request.path
    when '/request_forwarder/hosts/facts', '/request_forwarder/config_reports'
      response = Proxy::RequestForwarder::ProxyRequest.new.foreman_request(request)
      handle_response(response)
    else
      render_error('The request is invalid')
    end
  rescue StandardError => e
    logger.exception 'Error in request forwarding', e
    render_error(default_error_msg)
  end

  private

  def handle_response(response)
    if response.code.start_with? '2'
      response.body
    else
      render_error(response.body, code: response.code)
    end
  end

  def render_error(message, code: 500)
    status code
    message
  end

  def default_error_msg
    "echo \"Error in request forwarding\"\nexit 1\n"
  end
end
