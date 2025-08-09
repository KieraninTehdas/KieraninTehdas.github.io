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

The very handy [rbenv defines a binstub](https://github.com/rbenv/rbenv/wiki/Understanding-binstubs) as follows:

> Binstubs are wrapper scripts around executables (sometimes referred to as "binaries",
> although they don't have to be compiled) whose purpose is to prepare the environment
> before dispatching the call to the original executable.

They're effectively small scripts to ensure everything is ready before running a binary.
When creating a new Rails project, several binstubs are generated which can be found in `/bin`,
such as `rails` and `setup`.

## What does the rails binstub do?

This is the content of the rails binstub on my machine, as generated for a Rails 7 project.

```
#!/usr/bin/env ruby
APP_PATH = File.expand_path("../config/application", __dir__)
require_relative "../config/boot"
require "rails/commands"
```

The script is small enough that I think we can afford to step through it line by line.

### `#!/usr/bin/env ruby`

This is a shebang. It's not related to Ruby per-se. It's used in Unix-like environments as a way to execute a
file like a command, but hiding the implementation and interpreter. The shebang is what lets us run `bin/rails`
rather than having to type `ruby bin/rails`. We don't have to specify which interpreter should execute the content
of the file as the file itself specifies the interpreter.

### `APP_PATH = File.expand_path("../config/application", __dir__)`

Let's start with the right hand side of this assignment. `File.expand_path` returns the absolute path
to the file passed as the first argument. As [per the docs](https://www.rubydoc.info/stdlib/core/File.expand_path),
relative paths are referenced from the current working directory. The second argument `__dir__` is a Ruby kernel method
which returns the path to the directory which contains the file which called the method. Sticking some debug logging
into the binstub makes this mildly clearer. Assume that we're running `bin/rails` from `~/ruby` which contains
`some_project` directory, so we run the command as `some_project/bin/rails`. The outputs are as follows,

```
puts Dir.pwd => /home/me/ruby
puts __dir__ => /home/me/ruby/some_project/bin
puts File.expand_path("../config/application") => /home/me/config/application
puts File.expand_path("../config/application", __dir__) => /home/me/ruby/some_project/config/application
puts File.expand_path("../config/idontexist", __dir__) => /home/me/ruby/some_project/config/idontexist
```

You'll see from the last example that `expand_path` doesn't actually check that the first argument exists!
The third example without the `__dir__` second argument gives us back a dud path. It finds the parent of the current
working directory, `/home/me/ruby`, and sticks on `config/application` giving us a valid path to a non-existent file.

For this reason, we need the `__dir__` argument to ensure we get back a path to the file we want, relative to the file our
command is running from, not where we ran our command. This is we want to go up a directory from our
project's `bin/` directory. This allows us to run `bin/rails` from anywhere we care to, but ensures the `APP_PATH` variable
points to the correct file. Being able to run the command correctly from anywhere is particularly useful in CI
environments and removes the need for a lot of tedious moving around paths to get into just the right directory.

Two lines of questioning now open up:

1.  What is `APP_PATH` and where is it used?
2.  What is `../config/application` and why are we keeping a path to it in a variable?

A quick grep for `APP_PATH` in the root directory of a Rails project (or at least one of my Rails projects)
returns no results besides the line in the binstub we're looking at, so the variable isn't being used in application
code we can edit.
