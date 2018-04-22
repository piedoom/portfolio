+++
title = "Overcast"
date = 2018-04-02
tags = ["ui/ux", "experimental", "wip", "phone app"]
[extra]
video = "weather-station/banner.mp4"
no_title_on_hover = true
duration_weeks = 2
summary = "Overcast is a personal weather station right at your fingertips.  The concept product is a smarthome device that provides useful weather, air quality, and noise pollution data to the user."
show_synopsis = true
+++

{{ key(title="Intro") }}

{{ disclaimer(unfinished=true) }}
{{ image(path="weather-station/mockups.png", noshadow=true) }}


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

## User Journey 
First and foremost, the user needs to see an overview of today's weather.  They can interact with the application to see more detailed information.
{{ image(path="weather-station/userflow.png", nointeraction=true, small=true) }}


# Wireframes
{{ key(title="Wireframes") }}

With these use cases in mind, I began to design user flows and wireframes.  All revolve around showing data simply and quickly.  

I devised a few patterns to follow.  The first "screen" provides more general information.  If a user swipes, they are provided with more specific details.

{{ album2(path1="weather-station/wireframes/wireframe1.jpg", path2="weather-station/wireframes/wireframe2.jpg" small=true) }}

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

<!--- # 1. UV Light 

# 2. Humidity -->

{{ key(title="Sketches") }}
# Sketches
I began my work with a series of sketches illustrating how each metric would be displayed.  The goals of the project's data visualization are to **be fun**, **be visually related to the data**, and **be accurate**.

> Some of the sketches aren't here yet!  Check back at a later date to see progress with this project.

## Noise Pollution
This sensor measures noise levels in decibels.  Higher levels mean it's noisey outside.  Noise is most usually attributed to traffic, yardwork, pets, and other people.  Measuring volume levels can help users find and remove excessive noise sources. 

{% grid(small=true, max=350 type="image", header="Line Graph", path="weather-station/sketches/noise-sketch-2.jpg") %}
Initially, I took a simple line graph and added a waveform shape following the curve of the graph.  The data shown was clear, but it wasn't creative or fun.
{% end %}

{% grid(small=true, reverse=true, max=350 type="image", header="Waveform", path="weather-station/sketches/noise-sketch-3.jpg") %}
I coordinated the amplitude of a waveform element with the amount of decibels being registered.  This solution incorperates sound elements, but can be difficult to read.
{% end %}

{% grid(small=true, max=350, type="image", header="Polar Coordinates", path="weather-station/sketches/noise-sketch-1.jpg") %}
I mapped decibels to line thickness and darkness.  
{% end %}

{% grid(small=true, max=350, reverse=true, type="image", header="Polar Part 2", path="weather-station/sketches/noise-sketch-4.jpg") %}
I basically put a line graph through polar coordinates, and added texture to emulate the sights and sounds of "white noise."  
{% end %}

<!--- ## Air Quality -->

## Rainfall
Rainfall allows users to measure the amount of precipitation in inches or centimeters.  This metric is vital in understanding travel risks, potential flooding, and other hazards.  It can also help gardeners know when plants need extra watering.

{% grid(small=true, max=350, type="image", header="Stream", path="weather-station/sketches/rainfall1.jpg") %}
I considered creating a stylized generated 3D stream to illustrate precipitation.  However, this representation is too literal.
{% end %}

{% grid(small=true, max=350, reverse=true, type="image", header="Graduated Cylinder", path="weather-station/sketches/rainfall2.jpg") %}
Next up are graduated cylinders.  While more abstracted, the bar graph style doesn't seem to capture a fluid style.
{% end %}

{% grid(small=true, max=350, type="image", header="Rain Gauge", path="weather-station/sketches/rainfall3.jpg") %}
This sketch uses a rain guage and allows users to scrub a timeline to see what rain accumulated over the past several hours. 
{% end %}

{% grid(small=true, max=350, reverse=true, type="image", header="Rain Gauge", path="weather-station/sketches/rainfall4.jpg") %}
A simple styled line graph is the best of all worlds: it's fluid, easily read, and doesn't require any extra interaction to see history.
{% end %}


<!--- # 6. Barometric Pressure # 6. Temperature -->

# Hi-Fi Stuff
{{ key(title="V1") }}

Because this was a shorter personal project, after sketching I delved straight into high fidelity wireframes and compositions. 

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