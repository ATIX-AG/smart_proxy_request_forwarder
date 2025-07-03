# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'smart_proxy_request_forwarder/version'

Gem::Specification.new do |gem|
  gem.name          = 'smart_proxy_request_forwarder'
  gem.version       = Proxy::RequestForwarder::VERSION
  gem.authors       = ['Nadja Heitmann']
  gem.email         = ['nadjah@atix.de']
  gem.homepage      = 'https://github.com/ATIX-AG/smart_proxy_request_forwarder'
  gem.summary       = 'Request forwarder for Foreman smart proxy'
  gem.description   = <<-EOS
    Forward reports and facts from external config management systems to Foreman
  EOS

  gem.extra_rdoc_files = ['README.md', 'LICENSE']
  gem.files         = Dir['lib/smart_proxy_request_forwarder.rb', '{bundler.d,lib/smart_proxy_request_forwarder,settings.d}/**/*'] + gem.extra_rdoc_files
  gem.require_paths = ['lib']
  gem.license = 'GPL-3.0-only'

  gem.required_ruby_version = '>= 2.7', '< 4'

  gem.add_dependency('rest-client', '~> 2.0')
  gem.add_dependency('sqlite3', '~> 1.0')

  gem.metadata['rubygems_mfa_required'] = 'true'
end
