# smart_proxy_request_forwarder

A plugin into Foreman's Smart Proxy to forward config reports and facts from external
configuration servers such as Puppet or Salt masters to Foreman.

## Public API

### POST /request_forwarder/config_reports

### POST /request_forwarder/hosts/facts

Both API endpoints are forwarded directly to Foreman without further parameter check.


# Installation

**Clone smart-proxy**
```shell
git clone https://github.com/theforeman/smart-proxy
```

**Clone all the repositories**
```shell
git clone https://github.com/atix-ag/smart_proxy_request_forwarder
```

**In smart-proxy directory**

Add the gem to smart-proxy's `bundler.d` from local checkouts.
```shell
cat > bundler.d/smart_proxy_request_forwarder.local.rb <<EOF
gem 'smart_proxy_request_forwarder', path: '../smart_proxy_request_forwarder'
END
```

Install the gems
```shell
bundle install
```

Configure `smart_proxy_request_forwarder` as usual
```bash
cat > config/settings.d/request_forwarder.yml <<EOF
---
:enabled: true
EOF
```

Start the Smart Proxy

```shell
bundle exec bin/smart-proxy
```

Your smart proxy should now be usable
