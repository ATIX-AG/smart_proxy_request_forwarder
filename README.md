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

Your smart proxy should now be usable.

# Contributing

Fork and send a Pull Request. Thanks!

# Copyright

Copyright (c) 2025 ATIX AG - https://atix.de

This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with this program. If not, see http://www.gnu.org/licenses/.
