---
layout: post
title: bin/rails server
---

Let's start at the beginning. The simplest way to start a Rails app, and the way you'll
encounter if you're following the [Rails Guide](https://guides.rubyonrails.org/getting_started.html#starting-up-the-web-server),
is with the `bin/rails server` command.

```
=> Booting Puma
=> Rails 7.1.3.4 application starting in development
=> Run `bin/rails server --help` for more startup options
Puma starting in single mode...
* Puma version: 6.4.2 (ruby 3.1.2-p20) ("The Eagle of Durango")
*  Min threads: 5
*  Max threads: 5
*  Environment: development
*          PID: 9552
* Listening on http://127.0.0.1:3000
* Listening on http://[::1]:3000
Use Ctrl-C to stop
```

Navigating to `localhost:3000` in a browser will show the running Rails app.
Puma is a webserver, but what does it actually do and why? That'll be the focus of another post,
but taking a step even further back, what does `bin/rails` actually mean? This is an example of a binstub.

# Binstubs

The very handy [rbenv]() defines a binstub as follows:

> Binstubs are wrapper scripts around executables (sometimes referred to as "binaries",
> although they don't have to be compiled) whose purpose is to prepare the environment
> before dispatching the call to the original executable.

They're effectively small scripts to ensure everything is ready before running a binary.
When creating a new Rails project, several binstubs are generated which can be found in `/bin`,
such as `rails` and `setup`.

Before trying to get into binstubs, it's useful to have a quick think about dependencies and bundle.

## Bundle(r)

Dependency management is a nightmare in most languages. I've actually found it least stressful
in Ruby so far thanks to Bundler. Bundler is a tool for managing the dependencies for managing
the dependencies of a Ruby application or library and for packaging the code into an executable.
Packaged Ruby code is known as a `gem`.

Bundler takes care of installing all of the gems that we need and ensuring consistent versions
that are the same, or same enough, regardless of when or where the depencies get installed.

The dependencies of an application are specified in a `Gemfile`. This is all analoagous to `npm`
and `package.json` or something like `pipenv` or `poetry` in Python. I've purposefully ignored `pip`
here as my understanding is it works a little differently.

We can install gems using the `gem install` command. `gem install` will install the gem
such that it's available for the entire system. We can install `rubocop` with `gem install rubocop`
in any directory.

System wide gems aren't advisable for any application dependencies however as different projects may
need different, very specific versions. This is where Bundler comes in. It installs dependencies in
isolation for the specific project. Instead of using simply `rubocop` as we would if we had installed
rubocop with `gem install`, we have to use `bundle exec rubocop` if we want the specific version of
rubocop that our project needs.

## What does the rails binstub do?

In most cases, `bundle exec rails` and using the binstub `bin/rails` will do the same thing.
Using `bundle exec rails` even uses the rails binstub under the hood. So what does it actually do?
This is the content of the rails binstub on my machine, as generated for a Rails 7 project.

```
#!/usr/bin/env ruby
APP_PATH = File.expand_path("../config/application", __dir__)
require_relative "../config/boot"
require "rails/commands"
```

So really nothing much. The main thing it does is set the `APP_PATH` variable which
makes it much easier to run commands, particularly in ci environments, as you don't need
to fiddle about with getting into the correct directory. You can be outside of your application
directory entirely and run `./somewhere/my-app/bin/rails server` and it will "just work"TM.
