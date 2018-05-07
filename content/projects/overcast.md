+++
title = "Overcast"
date = 2018-04-02
tags = ["ui/ux", "experimental", "wip", "phone app"]
[extra]
video = "weather-station/banner.mp4"
no_title_on_hover = true
duration_weeks = 1
summary = "Overcast is a internet-connected array of sensors that help automate everything from climate control to gardening to event planning."
show_synopsis = true
+++

{{ disclaimer(unfinished=true) }}

# Other Versions
This page is a remake of [another project of the same name](/projects/weather-station).  However, my older project focused more on fun visuals and data visualization.  I wanted to redo my idea with a greater focus on user experience and real-world impact.

{{ key(title="Background") }}
# Background
Overcast is a personal, interconnected collection of sensors that read the environment.  Data is available to the user through a phone app, and (with the user's consent) available to third parties in order to more accurately predict weather patterns.  

In concept, the user would set up multiple sensors inside and around their place of residence.  Some of these sensors might include:

- Soil moisture sensors for monitoring indoor plants or gardens
- Outdoor temperature sensors
- Indoor temperature sensors for adjusting climate control
- UV light sensors / Pollutant detectors for sending precautionary information

{{ key(title="Goals") }}
# Goals
The goal of Overcast is to provide **clear, concise data in a conversational and approachable way** to help users make **educated decisions based on environmental info**.  Overcast also aims to help **automate home tasks** such as heating and air conditioning in an efficient way that **saves users money**.  In summary, it must:

1. Provide information in a human way
2. Help plan events
3. Help automate tasks

Overcast's main UX inspiration is derived from - oddly enough - [the Elm compiler](http://elm-lang.org/blog/compiler-errors-for-humans).  I really loved how it took something generally seen as opaque (compiler messages for a programming language) and turned it into a conversation.

{{ key(title="Flow") }}
# User Flow
With the goals and expectations set, I designed a user flow to set a foundation for my UX design.  
{{ image(path="overcast/user-flow1.png", noshadow=true, small=true, nointeraction=true) }}

{{ key(title="UX") }}
# User Experience
## Onboarding
If the user has never opened the application before, a short onboarding will help them set up new devices.

{{ image(path="overcast/user-flow2.png", noshadow=true, small=true, nointeraction=true) }}

{% grid(small=true, max=350, reverse=false, type="image", header="Search for Devices", path="overcast/first-time.png") %}
On a first time start, any sensors within range of the user's network will be available for setup.  Because Overcast relies on many sensors, the user can set up multiple devices at one time.
{% end %}

{% grid(small=true, max=350, reverse=false, type="image", header="Finish Device Selection", path="overcast/push-button.png") %}
After selecting desired devices, users must press a link button on Overcast's home station in order to finish setting up sensors.
{% end %}

{% grid(small=true, max=350, reverse=false, type="image", header="Creating an Account", path="overcast/sign-up.png") %}
In order to access features like family sharing, event planning, and location, users must set up an account.  However, Overcast can be used without an account, and this step can be skipped.
{% end %}

## Dashboard

After setting up, users can access sensor data immediately.  Although each sensor can be individually read, **Overcast translates raw data into helpful suggestions**.  Is your lawn soil too dry?  Overcast might suggest you turn on the sprinklers.  Is there going to be a storm the same day as the family picnic?  Overcast will help you contact your friends and reschedule.

{% grid(small=true, max=350, reverse=true, type="image", header="Overview", path="overcast/dashboard.png") %}
Overcast provides interactive *cards* that briefly describe the **climate** and how it may **affect the user's home or plans.**  The first card, named "Overview", gives the user a brief summary of how to prepare for the day.
{% end %}

{% grid(small=true, max=350, reverse=true, type="image", header="Device Control", path="overcast/dashboard2.png") %}
After daily Overview card, Overcast will offer home automation and event planning suggestions.  Users can easily swipe right to enact Overcast's plans. 
{% end %}

# WIP
More is coming soon!  This project is a work in progress.  Please check back later for more updates.