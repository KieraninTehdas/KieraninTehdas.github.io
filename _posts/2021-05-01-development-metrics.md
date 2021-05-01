---
layout: post
title: The Point Of Development Metrics
---

> **Metric**: a system for measuring something
>
> &mdash; Cambridge Dictionary

I've been thinking a bit about development metrics recently.
More specifically I've been wondering what the point of them is. By development metrics
I mean measures relating to processes and people and their work, rather than "engineering" metrics
like cpu usage or the number of messages handled in the last hour. That said, I think my recent
thoughts apply to these "hard" metrics in the same way.

So far my experience of development metrics has been short-lived weekly roundups containing
a collection of random numbers from disparate sources.
No one paid the roundups any attention and when they did they felt confused
and victimised by them.

>Why is there a red arrow next to my support period where the number of tickets
>went up? Did I not do well enough? It was crazy busy with support requests and there was
>nothing more I could have done?

At the time I was broadly against the weekly metrics digest and rather pretentiously quoted
Eliyahu Goldratt "tell me how you will measure me and I will tell you how I will behave".
The metrics being shared didn't make sense to me in my everyday experience and so seemed pointless.
There's a good chance I was just ignorant and didn't see why the metrics were useful, but it has led
me to realise that metrics are in and of themselves pointless. They are simply measures to help you
achieve something. You don't measure a room just to know its dimensions; you want to know if a piece
of furniture will fit or calculate how much wallpaper you're going to need in order to redecorate.
Knowing a measurement or metric alone is useless without a reason for it.

![measures]

## What Are You Trying To Achieve?

A potential development metric could be the number of commits made by developers in a given week.
Initially this seems like a good idea. What can we infer from the number though? Do more commits
mean more work got done that week? What if a solution had to be rewritten multiple times (lots of
commits) or the focus of a week was discovery or design (hardly any commits)? What does it mean if the number goes up or down from the week before?

In the way I have presented this, I would argue that this metric is useless.
It is convenient as we can probably get a number from Github (I must point out that other version
control systems are available) and so I suspect it could be a candidate to measure just to say you
track things.

_However_, context is absolutely everything. Maybe we've been having problems with people not
committing frequently leading to sweeping changes being introduced in a single commit. Maybe we're
losing a lot of development time trying to track down where a bug was introduced because the commit
history is so coarse grained. More frequent, smaller commits is the solution we decide upon.
How do we know if we're achieving this? In this case, there may be a point to using the
number of commits per unit time as a metric. We have a clear goal (frequent, smaller commits) and
the number of commits per week could be sufficient to tell us how close we are to achieving
that goal.

Even in this contrived example though, the number of commits per unit time may still not be
appropriate despite its convenience. Our goal was to reduce wasted
time spent searching through massive diffs. More frequent commits was just a means to an end.
This highlights to me another key point about metrics: they are often proxies.
Measuring time wasted may be easy or it may not. The most useful measure of achieving some outcome
is often hard to define and harder still to measure, so a proxy metric is the best we can do. In our
toy problem, a good solution may be to track the number of commits and how many lines each commit
affects.

I think it's also very important to make sure everyone understands why we're measuring what we're
measuring and that we're using the metrics as a way of seeing how close we are to achieving some
objective. To go back to my real world example of number of support tickets, bad feeling could have
been avoided by communicating that the number of new tickets and solved tickets per unit time was
intended to measure how challenging support was. The goal could have been to make it manageable for
the support engineer and to identify whether it was the sheer number of incoming tickets or their
complexity that was giving people a tough time.

## Solution Looking For a Problem

To really labour my point, I think metrics can easily become a solution looking for a problem.
So to conclude, how do **I** think metrics should be used? Before considering gathering and
certainly sharing any metrics, I think you need to ask a few questions:

1. What are we trying to achieve? _Code shouldn't wait for a review for more than a day_
2. How can I measure it? _Track the length of time between a pull-request being opened and the first review comment being posted_
3. What do I want to see? _The metric decrease. ie. the time to review reducing_
4. Is this a proxy/is there additional context that needs to be considered? _Someone may take a lot
of time to complete an in-depth review leading to a high metric value, but a good review.
Someone else may insta-approve leading to a low value, but we've created another problem..._

You then need to consider how you're going to present the metrics and the target value if
appropriate, as well as the frequency you'll publish them and indeed who will be interested.

---

Photo by <a href="https://unsplash.com/@sernarial?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText">patricia serna</a> on <a href="https://unsplash.com/collections/3497526/metrics-and-meauserments?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText">Unsplash</a>
  

[measures]: /assets/measures.jpg 
