# PowLastLogin

[![Build Status](https://travis-ci.org/humancopy/pow_last_login.svg?branch=master)](https://travis-ci.org/humancopy/pow_last_login) [![hex.pm](http://img.shields.io/hexpm/v/pow_last_login.svg?style=flat)](https://hex.pm/packages/pow_last_login)

A [Pow](https://github.com/danschultzer/pow) extension that adds the ability to track when and from which IP address a user logged in.

You can then add to your templates a message such as:

```elixir
You last logged in <%= Timex.format!(@conn.assigns.current_user.last_login_at, "{relative}", :relative) %> from <%= @conn.assigns.current_user.last_login_from %>.
```

Time formatting courtesy of [timex](https://github.com/bitwalker/timex), thanks ;)

## Installation

Installing PowLastLogin is super simple.

Add PowLastLogin to the list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    # ...
    {:pow_last_login, "~> 0.1.1"}
    # ...
  ]
end
```

Run `mix pow.extension.ecto.gen.migrations --extension PowLastLogin` followed by `mix ecto.migrate` to get the columns added to the users table.

Add it to the list of Pow extensions, and if you didn't already, also the `controller_callbacks` option:

```elixir
config :my_app, :pow,
  user: MyApp.Users.User,
  repo: MyApp.Repo,
  extensions: [...PowLastLogin],
  controller_callbacks: Pow.Extension.Phoenix.ControllerCallbacks
```

And in the `user` schema file:

```elixir
use Pow.Extension.Ecto.Schema,
    extensions: [...PowLastLogin]
```


That's it :)

## Real IP

If you're behind a proxy (e.g. CloudFlare) you should use a plug (such as [RemoteIp](https://github.com/ajvondrak/remote_ip)) to get the real IP of the client.

## LICENSE

(The MIT License)

Copyright (c) 2018-2019 Dan Schultzer & the Contributors

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the 'Software'), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
