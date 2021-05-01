---
layout: post
title: "Lights, Camera, (GitHub) Action"
date: 2020-06-23 18:15:17 +0100
---

Hello! I'm back! It's been a while since my last post, but in my defence I've been extremely busy with family things.

I've recently started to take an interest in what's possible with GitHub actions.
A little while back at work I added an action to run pytest in one of our Python repos on every push and generate a coverage report.
I'd attempted it a while ago using Jenkins, but didn't get very far as it was all completely alien to me how you're even meant to 
get a Python environment set up, or even how Jenkins runs under the hood. Having left it alone for several months we had a service outage of some 
of the code living in that repo that would have been caught if the tests had been running properly and regulalry (oops). Turns out there's not much 
point in writing tests if no one knows to run them or has to run them manually every time!

Well GitHub actions to the rescue. In about two hours I was able to knock together a workflow that did the appropriate setup with Pipenv and then ran pytest
and coverage.py. It now runs on every push, so hopefully we'll not get caught out again by a silly mistake. I'd really like it to display the coverage report in
prs, maybe with a diff, so that's a little job for future me.

On the homefront, I thought I'd try using GitHub actions for these very GitHub pages.
I wrote [my previous post](https://kieranintehdas.github.io/2020/05/28/patterns-of-effective-teams.html "Patterns Of Effective Teams") maybe a day after my first post, 
but I wanted to publish it a few days later. Jekyll by itself can handle publishing future posts when they're ready, but this isn't the case when publishing on GitHub pages.
As a little exercise, I thought I'd come up with a GitHub action that looks for posts dated in the future, sets them to published, and commits them.

<span style="display:block;text-align:center"> [![GitHub Actions](/assets/GitHub-Mark-120px-plus.png)](https://help.github.com/en/actions)

I planned the job to run on a schedule and only look for posts since the last run, but that opened a can of works and I decided to just keep it simple. It also turned out to be 
a pain editing just one line in a file. Given I just wanted to do something simple, there didn't seem much use in going mad and overengineering, so I ended up with a little 
Python script which checks the content of a `ready-for-publish` folder for any posts dated before the run time. It then shifts them to `_posts`, commits and pushes.

With a little more reading, I suspect even this is overkill. [From this post on someone else's GH page](http://sangsoonam.github.io/2018/12/27/writing-upcoming-posts-in-github-pages.html) 
it appears that just changing a config should hide future posts correctly. It would then just be a case of looking for posts that have been added since last publish or something
and adding an empty commit to trigger a re-publish. I'm not sure how best you'd go about tracking what needs published; maybe even just maintaining a simple text file of filenames
or something would do it!

Anyway my main goal was to try and get my head around GitHub actions a bit better, specifically how you go about making your own. The initial learning curve was pretty steep 
as I wanted to use Python which requires your code to run in a Docker container. [This blog](https://www.jacobtomlinson.co.uk/posts/2019/creating-github-actions-in-python/)
was very handy for having something to mimic getting the Docker business set up. I debated just using Javascript to sidestep all that, but decided against it as I know the Python
standard library and third-party libraries a whole lot better.

It took a while to get it working as I didn't get much uninterrupted time, but that's no bother when you're just doing something for fun and it worked out in the end!

As I mentioned above, with a bit more thought I suspect I can simplify things further by keeping everything in the `_posts` directory and pushing empty commits when it's
time to publish something new. Anyway, that's something to keep future me occupied. I'm thinking I might either try and get more familiar with Django by trying to contribute
to an open source site I like, or else look for some other small open source project I might be able to contribute to. Who knows: I might even get around to writing more posts!
