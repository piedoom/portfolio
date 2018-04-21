+++
title = "Overcast"
date = 2018-04-02
tags = ["ui/ux", "experimental", "wip", "phone app"]
[extra]
video = "weather-station/banner.mp4"
no_title_on_hover = true
duration_weeks = 2
summary = "Overcast is a personal weather station right at your fingertips.  The concept product is a smarthome device that provides useful weather, air quality, and noise pollution data to the user."

+++

{{ key(title="Intro") }}

{{ disclaimer(unfinished=true) }}

{{ album3(path1="weather-station/rainfall-mockup.png", path2="weather-station/noise-mockup.png", path3="weather-station/air-quality-mockup.png") }}

{{ key(title="Research") }}

{% grid(type="image", path="weather-station/inspo.png", header="Research") %}
    Honestly, I'm not that much of a weather buff.  I needed to learn more, so I started with some basic terminology research.  I needed to associate a term's number with an emotional response.  Pictured are sources I took direction from.
{% end %}

# User Experience
Different than most other weather applications, the purpose of this app is to provide information in a fun, unique, and brief manner.  Interaction and information design is the highlight.

### Use Cases:
1. They want to know the current weather overview for the day
2. They want to know a current aspect of the weather for an event (e.g. the U.V. index would be helpful when planning a day out to the beach)
3. They want to predict the weather in a few hours or days to plan activities
4. They want to use the weather data in their own projects and applications

While weather can be predicted based on previous history and current location, Weather Station focuses on current data opposed to predictions. 


# Wireframes
{{ key(title="Wireframes") }}

With these use cases in mind, I began to design user flows and wireframes.  All revolve around showing data simply and quickly.  

I devised a few patterns to follow.  The first "screen" provides more general information.  If a user swipes, they are provided with more specific details.

{{ album2(path1="weather-station/wireframes/wireframe1.jpg", path2="weather-station/wireframes/wireframe2.jpg") }}

# Experiments
{{ key(title="Experiments") }}

Now to the hard part: actually deciding what to display, and how to display it.  Let's start with the former.  I chose what to measure based on what sensors were small, cheap, and easily concealed.  This meant small components like humidity detectors were ideal, whereas bulky and expensive tools like anemometers were unlikely to be included.  Here's a list of what I chose to include:

1. UV Light
2. Humidity
3. Noise Pollution
4. Air Quality
5. Rainfall
6. Barometric Pressure
7. Temperature

Because this was a shorter personal project, I delved straight into high fidelity wireframes and compositions. 

I chose an analogous color theme for each graphic to mimic a natural palette.  While each graph has different colors, they all abide to the same style.  I also wanted colors and design to change depending on data, so I designed two screens each at different extremes.

{{ album4(path1="weather-station/old/rainfall-heavy.png", path2="weather-station/old/rainfall-light.png", path3="weather-station/old/uv-bad.png", path4="weather-station/old/uv-good.png") }}

{{ album4(path1="weather-station/old/noise-bad.png", path2="weather-station/old/noise-good.png", path3="weather-station/old/air-quality-finished.png", path4="weather-station/old/air-quality-good.png") }}

# Comps
{{ key(title="Comps") }}

I really like the way my first compositions displayed data, but I think they are a little too muted in color.  The typography could use work as well.  It just doesn't convey that "fun" feeling!  Here's a second pass.

{{ album4(path1="weather-station/rainfall-heavy.png", path2="weather-station/rainfall-2.png", path3="weather-station/uv-index.png", path4="weather-station/uv-index-low.png") }}

{{ album4(path1="weather-station/noise-loud.png", path2="weather-station/sound-light.png", path3="weather-station/air-quality-bad-after-anim.png", path4="weather-station/air-quality-good.png") }}

# Physical Product
{{ key(title="Renders") }}

Coming soon!