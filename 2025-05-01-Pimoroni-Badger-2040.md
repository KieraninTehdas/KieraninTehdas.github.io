---
layout: post
title: Creating a Pimoroni Badger 2040 custom badge
---

It's a new year so time for another post! I recently received delivery of a new hardware
toy - a [Pimoroni Badger 2040 programmable E Ink display badge](https://shop.pimoroni.com/products/badger-2040?variant=39752959852627).

I bought it as I'm going to a conference later in the year and I wanted a cool name badge!
The example code preloaded on the RP2040 includes a badge with a badger picture, but it
wasn't quite what I wanted so I started looking into something more custom. The example badge
is drawn dynamically, but the idea of crafting something pixel by pixel doesn't appeal to me.

Searching didn't yield many helpful results, but thankfully I came across an [excellent post on 
thoughtasylum.com](https://www.thoughtasylum.com/2022/05/01/the-badger-2040-custom-badges/)
in which the author had solved this problem with idea of using pre-built images.
The badger includes an example for displaying images and all you need to do is copy
the image file to a directory on the board and you're away which is ideal! The software
on the device must have changed over the intervening 3 years as I needed some minor
tweaks to their process, but thankfully the tweaks were simplifications.

## Creating a badge image

In the aforementioned post the author describes how they used Affinity Designer with a
296x128px template to create a custom badge image. Unfortunately Affinity Designer costs
£70, isn't available for Linux, and have no design chops so that was out. Open source to the rescue!

Another quick search for vector image software brought me to [Inkscape](https://inkscape.org/)
which I vaguely recognised I think as something pre-installed on Ubuntu? This turned
out to be perfect.

After opening Inkscape the first job is to create a new image and resize the canvas. Control + Shift
+ D opens the document properties menu where you can set the size to be 296px by 128px
and then set the orientation to landscape. Just make sure the units is set to pixels when
setting the dimensions! I also found creating guides around the page in the Guides tab was
helpful.

You can then use the text tool to add writing or do whatever drawing or badge design you want.
When you're done, export the image as a jpeg.

The final step to make your image ready for use is what caught me out for a while. When I
copied my image across to the badge, I got an error on the display when trying to view it.

The problem turned out to be that the image was a progressive jpeg and the documents are
very clear that the Badger needs images to be non-progressive. I was able to fix this
with one of my favourite utilities, the convert command from ImageMagick.

`convert -interlace none input.jpg output.jpg`

This should give you a non-progressive jpeg. You just need to copy that into the appropriate
directory on the Badger and job's a goodun. Thonny is very popular for doing anything
with MicroPython based boards, but I personally spend all my working day in vim and
the terminal so I prefer the fine [mpremote](https://docs.micropython.org/en/latest/reference/mpremote.html).

Connecting to the Badge is a little bit fiddly. Hit the reset button on the Badge, give it
a second, and then see if mpremote will connect. In Thonny you need to hit the stop
button to stop the main program from executing.

Use `mpremote fs cp yourImage.jpb :images/yourImage.jpg` to copy your image into the `/images`
directory on the Badger. Alternatively, use Thonny. Hit reset again and go to the images
example, and hopefully there's your badge! You may need to scroll down a little, I think
the images are in alphabetical order by display name.

Images to follow!

