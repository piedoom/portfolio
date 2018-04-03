+++
title = "Resamplr's Sampler: Engine"
date = 2018-03-25
[extra]
image = "sampler/sections.png"
+++

Yeah, I know the title seems weird.  Let me explain: [Resamplr](/projects/resamplr) is my fledgling audio company.  The flagship product is a low-cost **sampler**, or virtual instrument.  

The current industry standard for digital samplers is Kontakt 5 by Native Instruments.  If I'm going to be honest, it's not the best thing I've ever used.  Sometimes industry standard software stagnates.  So what's wrong, and how can we make it better?

# What's Wrong?
{{ key(title="Problem") }}

There are several things things wrong with current solutions.  I've summed them up into 3 big points.  

1. They're too expensive.  Kontakt costs about $400 just to play things.
2. They're not developer friendly.  Creating a sampled instrument can sometimes feel like programming bank software in COBOL.
3. User Experience is looked over.  This goes for nearly *all* audio products.  A lengthy manual is usually required.

The cool thing about this list is that we just described a target audience.  

# Who wants it?
{{ key(title="Users") }}

No matter how awesome a product is, it needs a user base.  Otherwise it won't succeed.  Let's take a look at some common user stories based on the problems stated above. 

1. **Established User**

They want to use Engine in their production work.  They already have libraries available to them.  They know what sounds they wants to use.

2. **Creative User**

They want to find new sample libraries for use in production.  They are already in their workstation but need a new sound for a particular section.  

3. **Engineer**

They are creating a commercial sample library with the help of a recording professional.  They are adept at code and prefer programming over GUI.

Engine is more likely to have **hobbyist** and **non-professional** users, since its most immediate selling point is the price.

# User Flow
{{ key(title="Flow") }}

Although I often enjoy immediately delving into the design of a product, I find it's best to plan beforehand.  To help, I created user flows to compliment each use case.

{{ image(path="sampler/user1.png") }}
{{ image(path="sampler/user2.png") }}
{{ image(path="sampler/user3.png") }}

# Wireframes
{{ key(title="Wireframes") }}

With the architecture in place, wireframes could start!  

{{ image(path="sampler/wireframe1.png") }}
{{ image(path="sampler/wireframe2.png") }}

## Issues
With these wireframes, I drew too much influence from the very product I sought to destroy, Kontakt.  I scrapped the entire wireframe direction and tried something different.  I needed to structure my wireframes *solely* around my user flows.

# Wireframes Take 2: Hi-Fi Edition
{{ key(title="More Frames") }}
Instead of UI elements everywhere, I decided on a tab system to keep all related elements at hand.  This proved to be much more ergonomic.  For colors, I kept to the branding I set with [Resamplr](/projects/resamplr), and my other plugin [Animate](/projects/plugins).  

This tab-based design has a great side-effect: it encourages type *User 1* to mingle with the *User 2* and *3* types.  By displaying more advanced content alongside basic controls, we can slowly introduce a casual user into becoming a creator.

Below, the "section" tab is pictured.  This allows users to "group" notes together, and assign a sample to a note.
{{ image(path="sampler/sections.png") }}

{{ album2(path1="sampler/scripts.png", path2="sampler/files.png") }}

# Create it
{{ key(title="Create") }}
Engine is my passion project, and I'm still working on it!  This is very much WIP stuff, and I'm still hard at work on wireframes.  In the meantime, you can take a look at my messy but somewhat-interesting API proposal.  It's not exactly what one would expect to find on a design blog, [but here's a link to it anyways.](/extra/engineapi)