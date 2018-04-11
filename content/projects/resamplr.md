+++
title = "Resamplr"
date = 2018-03-28
[extra]
video = "resamplr/banner.mp4"
no_title_on_hover = true
+++

{{ key(title="Intro") }}

Resamplr has been a passion project of mine since High School.  The goal is to create a modern and approachable audio software company.  This is a summary of the past 5 years I've experimented with its design.



# Beginnings

I began working on Resamplr (or at least the foundations) around Senior year in High School.  Since I was little, I always loved to create music digitally.  I'd often use digitally "sampled" instruments to add some vibrancy to my tracks.  As I grew older, I began to sample instruments of my own, including experiments like homemade instruments and strange combinations like bowed guitars.  I shared these instruments with the internet, and the response was great. 

## Creating a website

{{ key(title="Rev 1 (2014)") }}

In high school, I began to create my own custom website for the sounds I made.  I had brief encounters with WordPress and Wix, but in the end they proved too cumbersome for my use case.   I learned some PHP and HTML, and came up with this:

{{ gifv(path="resamplr/rev1.mp4") }}

If you're thinking "Wow, this looks awful" - well, I was much younger.  **This whole post is supposed to show my personal progress when it comes to design and interaction.**  So let's start critiquing and improving, shall we?

# Rev 2

{{ key(title="Rev 2 (2016)") }}

A year or so later, I came back with some new skills.  I learned how to create full stack web applications through my job with **iCanCode Club**.  I took my design knowlege from college and began applying that to my new layout.  I had a few priorities in mind:

1. It's a commerce site.  Products should be within the first fold and be featured.
2. Familiar.  I looked at other popular audio companies like 8Dio and Spitfire Labs.
3. It should be professional looking, because we're serving professionals, right?

I was wrong about all three of these points.  Let's see what happened!

## The Style Guide

Remember what I said about clean and professional?  I kept everything pretty sterile looking.  Not only that, but I was one of the poor kids who got sucked into the "use thin fonts for literally everything! It's readable, I promise!" phase. 

{{ image(path="resamplr/rev2style.png") }}

{{ album4(path1="resamplr/rev2home.png", path2="resamplr/rev2login.png", path3="resamplr/rev2product.png", path4="resamplr/rev2player.png") }}

OK, it wasn't all bad.  You can see how much I progressed with portions, typography, and color with this revision.  But as my friend [Jack](http://jackkaiser.me) put it, *It's boring*.  Music is a fundamental aspect of human creativity.  Design should reflect that.

I also began to realize that the majority of my customers were younger hobbyists, not professionals.  This audience was looking more towards a *relatable* brand.

{{ break(image="resamplr/banner2.jpg") }}

# Rev 3
{{ key(title="Rev 3 (2018)") }}

Instead of looking at audio websites this time, I started my search with *graphics* and *styles* that fit the design language.  

1. **Be Personal**.  Don't be corporate.  Consumer should feel as though they always come first.
2. **Be Friendly**.  Don't over-complicate interactions.  Rewarding users with unique interactions is great, but it shouldn't be overdone.
3. **Be Modern**.  Don't overuse imagery, borders, or other elements that can contribute to visual noise.  This isn't a photography website, so make sure that images all contribute to the *audio* product being sold.
4. **Be Dynamic**.  After all, we're artists.  

The main objective is to provide a **different** and **better** experience for all users - an experience that is **easier, more intuitive, cleaner, and more developer-friendly** than competitors. 

{{ image(path="resamplr/design3.png") }}
{{ image(path="resamplr/design4.png") }}
{{ image(path="resamplr/design5.png") }}

# Designing for Sound

To start, I use complementary colors and angular accents.  I am party inspired by Jazz-era graphics with bold colors and trapezoidal shapes, as well as how the complementary colors "buzzed" similarly to sound waves. 

I keep UI elements simple, and typefaces utilitarian.  While the injection of color and style is great, it shouldn't shout over the main attraction, which is audio.

{{ image(path="resamplr/style3.png") }}

## Putting it together

With these ideas in mind, I created mockups.

{{ album5(path1="resamplr/Home.png", path2="resamplr/signup.png", path3="resamplr/about.png", path4="resamplr/product.png", path5="resamplr/product2.png") }}


# Creating it
{{ key(title="Create it") }}

So, what else is there to do but make it?  Resamplr is [live](https://resamplr.com).  I used Rails 5 and traditional HTML/CSS for the current implementation.  

I'm working to transfer the Rails project into a custom Rust based server with Elm as the frontend choice.  You can see my progress [here](https://github.com/resamplr/resamplr-web).  I'm not usually one to boast about Github stars, but I'm pretty proud of the 44 I received thus far.