+++
title = "The Reel: Sports Highlights"
date = 2018-03-26
tags = ["ui/ux","motion","client work"]
[extra]
video = "the-reel/banner.mp4"
no_title_on_hover = true
summary = "The Reel is a mobile app for following, browsing, and sharing short sport highlights clips."
duration_weeks = 4
show_synopsis = true
+++

{{ key(title="Intro") }}


{{ gifv(path="the-reel/video.mp4", max="400px", controls="true") }}

# Wireframes

{{ key(title="Wireframes") }}

User flows are straightforward and simple.  Users should be able to "sit back" and watch as many videos as they'd like without obtrusive interactions.  
{{ image(path="the-reel/wireframe.png") }}

{% grid(type="image", path="the-reel/moodboard.png", header="Styles") %}
    Styles are inspired by darker sports-related brands, particularly Nike's line.  The general "trend" is composed of darker background colors accented with neon highlights.  This app should feel sporty, after all.
{% end %}

{{ key(title="Gallery") }}

{% grid(type="video", small=true, max=350, path="the-reel/login.mp4", header="Signing Up") %}
    While users can sign up with traditional email addresses, signing in with Google or Facebook is also provided.  Users can also use the application without signing in to experience the features before saving them to an account.
{% end %}

{% grid(type="video", small=true, max=350, path="the-reel/feed.mp4", header="Feed") %}
    The feed is where the user should be spending 99% of their time.  It's a content funnel.  Each video is chosen algorithmically based on the user's location, primary language, interests and likes.  The goal is to always provide *one more video* that piques the user's interest.
{% end %}

{% grid(type="video", small=true, max=350, path="the-reel/like.mp4", header="Liking a Video") %}
    In order to provide a more granular control over shown content, the user can "like" a video.  That video will be saved to their account to watch or share later.  It will also help guide the home feed algorithm to display fitting content.
{% end %}

{% grid(type="video", small=true, max=350, path="the-reel/following.mp4", header="Following Topics") %}
    While anticipated automatically, users can manage their interests.  They can search for specific sports, athletes, and networks to follow.  Users can also unfollow suggested topics in this section.
{% end %}

# Stills

{{ key(title="Stills") }}

{{ album6(path1="the-reel/login.png", path2="the-reel/video.png", path3="the-reel/home.png", path4="the-reel/search.png", path5="the-reel/like.png", path6="the-reel/remove.png") }}