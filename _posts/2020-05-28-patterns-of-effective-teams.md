---
layout: post
title: "Dan North - Patterns Of Effective Teams"
date: 2020-05-28
published: true
---

<https://www.youtube.com/watch?v=lvs7VEsQzKY>
[![Patterns Of Effective Teams](https://img.youtube.com/vi/lvs7VEsQzKY/0.jpg)](https://www.youtube.com/watch?v=lvs7VEsQzKY "Patterns Of Effective Teams")

I am an enormous fan of Dan North and this is probably one of the first conference videos I watched, so what better a place to start! This one is mostly about different techniques you can use to improve the "effectiveness" of your team. I'm planning on briefly summarising the points that jump out at me and trying to sprinkle in how they tally with my experience.

## Productive vs Effective

Dan starts by making a point of how he used the work effective, rather than productive when naming his talk. We should aim for effectiveness rather than productivity as software developers. Our aim is to solve a problem or "deliver business value" as you say if you want to sounds fancy. The goal isn't to crank out 5000 lines of code. I love the phrase "if you can solve a knarly business problem with no software then you win at software"! That's definitely something I really appreciate. I don't really like technology for technology's sake, and I think we often have a tendency to do things with software because we can, rather than because we should or because it's useful to anyone! I'm still as guilty as the next person though of over-engineering a solution with extra bells and whistles that "might be useful".

I was on a web course earlier this week run by Sam Newman where he mentioned thinking about what you're trying to optimise for. The specific context was code reuse, but it's applicable much more widely. Maybe you can reuse a bit of code you have elsewhere that does something similar, but it'll take you 4 weeks. If you just wrote a piece of code to solve your specific problem, it would take 2 weeks. The question to ask yourself is: what do I value the most? Is your goal to maximise the reuse of code? Invest the time and go for the longer solution. Is your goal to get some functionality delivered as quick as possible? Just duplicate it then. This is something I'm acutely aware of from working in an early stage startup. Time to market is everything in that environment. Delivering a technically beautiful solution is very satisfying, but it's worth nothing if you've run out of money and gone bust in the time it's taken you!

## Dreyfus Squared

The Dreyfus model of learning lays out 5 levels of proficiency in a skill.

- Novice - just needs rules to follow and learn. Boil the kettle. Get a cup. Put a teabag in the cup. Pour the water into the cup.
- Advanced Beginner - knows what the rules are and is starting to test them out. What if I pour the water into the cup before I put the teabag in?
- Competent - has internalised the rules and applies them to reach an objective. Make me a cup of tea! Most people get this far with skills.
- Proficient - if you decide you want to focus on a particular skill and put time and effort into being more than competent, then the next step is proficient. You have an instinct of how best to do a thing, but you don't quite trust it yet and fall back on the rules. If I'm making a darjeeling I think I'll want to only steep it for a few minutes so it doesn't taste like plastic. I'll check the instructions.
- Expert - transcends the rules! You've internalised the rules and forget there even are rules. You know instinctively when to follow them and when to break them. The example Dan uses here is that of a chess grandmaster. When it's their move, some part of their brain very quickly goes back and considers all the previous games they've played where they've been in a similar situation and what they did and how that turned out. They're not aware of this though. They just survey the board, take it in, and know which move they should make.

The Dreyfus Squared model describes how to use this knowledge to find the best pairings of people. It's important to remember that it's about a person's skills and not the person themselves! We're all at different levels for different skills.

The context for talking about this is the onboarding of new engineers. If you have someone joining who's effectively a novice, then pairing them with an expert will probably lead to blood. It's the classic problem of one party wishing the other would just tell them what to do, and the second party getting frustrated that the first doesn't understand what they're being told.

A novice with a competent is a good combination though. A competent person understands the rules and can apply them to get somewhere, but can still remember what it's like not to know all this stuff and can still speak the same language.

I find both of these pairings relatively intuitive. When I think back to being at university, it was quite often early stage PhD students who were the most helpful in tutorials, followed by later stage PhDs and then the lecturer. This wasn't always the case of course; I'm massively over-generalising, but if nothing else I find it easier to talk to someone who I know is closer to my level, or was at my level more recently. They won't blind you with things you don't care about just yet and there's less fear about them judging you for being stupid. Maybe that's just me though. I'm quite easily intimidated by people who I think are a lot better than me at a thing and I don't want them to think I'm stupid. I definitely have a habit of playing up my own stupidity, probably for this reason. Sets people's expectations low and who knows, you might just surprise them!

## Inverse Truck/Bus Factor

The number of people who need to get run down before you can get any work done! Nothing to add here. I just find this funny.

## Shallow Silos

This is one I find interesting for our company I work for is now. Making people rotate around roles means that they will end up doing things they're not that interested in or excited about. Understandably they'll probably end up not doing a particularly good job as a result. We're struggling to find frontend engineers so there's been a bit of a push to try and make everyone full stack.

Firstly I'm not really sure I believe in the concept of full stack for a start! I work with several people who are true frontend specialists and have dedicated their working lives to ui and Javascript. It's offensive to my mind to imply that anyone can do what they do. Set people up to do the best work they can on the thing they like and are best at. As long as you have enough breadth of skill to let people go on holiday for example, you should be fine.

![An artist's depiction of a full stack develops](/assets/fullstack_horse.jpg)

This is how I understand the concept of shallow silos. People are siloed in the sense that there's something they specifically are very good at. If the silo is shallow enough though and everyone communicates well, you should see a better outcome than trying to completely break down the silos altogether by making everyone do all the things.

## Warm Welcome

You only have one chance to make a good impression when someone new starts! I definitely felt like I had a warm welcome when I joined my current company. My desk was all set up and laid out nicely and I got a card signed by everyone. It was much easier back then when there was ~20 of us. I had a go at this a year or two ago, but it didn't really work. I think at the time we weren't hiring enough for a start. The confluence page I made sits unloved and forgotten, but it clearly wasn't the time, and I suspect I didn't do a good enough job for it to catch on. We're trying a buddy system now which seems to be working well for our most recent hire anyway.

## Seize The Day

Standups are one of those things I go through love hate relationships with. I hate that they seem to be done often just as a nod to agile or scrum so you can say that's what you're "doing" in job adverts. It says it in all the blog posts, so we'd better do it without thinking about what we want to actually get from them. There's nothing worse than a 20 minute standup which breaks the rhythm of your morning and seems to have little to no value to anyone. Standup meetings are not serial status updates! We're planning for the very near future. Dan suggests the most important standup question as "_what is the best possible today we can have_"? Updates should be things that will the day better. So what about status updates? That should come down to teams caring about status. I love the idea of someone going from developer to developer asking if they want tea, and secretly at the same time picking up how things are going. It's so true that it's easier to pick up how someone is doing in the place where they are doing their work.

What did I do yesterday, what am I doing today, any blockers are the wrong phrases. It should be all about the work! Dan makes a lovely point that people don't get blocked. It's easy to just context switch and if you don't know what to do, have a meeting! It's all about the work that's being done. If work is blocked, we need to know about it as otherwise we might not meet our public commitments.

## Code Critique

What I find most interesting here is the discussion around tradeoffs. If everyone is presenting their own solution, you start to learn about the code that didn't get written. When you look at a pull request to review it, you only see the code that's there. You don't know that the author maybe went through 5 different versions and discarded or changed them for very important reasons! Tradeoffs is something I've been thinking about quite a bit lately after doing the course I mentioned. Everything is a tradeoff in the end in the real world. Time against quality against elegance against maintainability against extendability against skill against and so on and so on.

The idea of idiomatic code is something that sort of bothers me about Java. In general that there doesn't seem to be that much in the way of a standard or idiom and what you find tends to be from Sun in the 90s. I much prefer Python in that respect, or actually in many respects. It's much easier to know what's good and not so good as there's a PEP deciding what idiomatic is! Maybe verbose is the Java idiom? (troll face!)

---

&nbsp;

So there we go, a quick round up of my thoughts on Dan North's talk Patterns Of Effective Teams. I'm not sure what I'll do next and whether it'll be more technical focussed or not. Expect plenty more Dan North though regardless!
