+++
title = "Resamplr Animate"
date = 2018-03-22
tags = ["ui/ux","desktop app","audio"]
[extra]
summary = "Create simple effects or sophisticated sounds with Animate: a flexible and intuitive audio filter automation program."
video = "plugins/banner.mp4"
duration_weeks = 2
show_synopsis = true
+++

# Intro
> If you haven't taken a look at [Resamplr](/projects/resamplr) yet, I highly recommend doing so before checking out this post!  It'll help put everything in context.

You've probably used "bass boost" or "equalizer" effects while playing a song.  These effects are called "filters" in the audio realm.  A filter is an audio effect that ducks or gains certain frequencies.  For instance, a bass boost filter adds gain to lower (bassier) frequencies.

## Problem
There are currently no applications that allow for creative filter design.  Furthermore, those applications are difficult to animate or change over time.

{{ key(title="Sketches") }}
# Sketches
{% grid(path="plugins/animate-wireframes.png", header="Layout Sketch", type="image") %}
I began sketching the idea for the filter application.  I kept in mind goals and features when adding (or omitting) certain functionality.
{% end %}

{% grid(path="plugins/animate-wireframe-hifi.png", reverse=true, header="Wireframe", type="image") %}
Each logical section is segmented for easy identification and modification.  The top left panel is a visual representation of the waveform.  The top right panel allows the user to modify a filter.  The bottom panel allows users to animate between filters.
{% end %}

{{ key(title="Styles") }}
# Invisible Tutorials
Audio plugins are challenging because they require a design that leads the user with little explaination (as nobody wants to read 3 hours of documentation).


{% grid(path="plugins/animate-style.png", header="Wireframe", type="image") %}
I keep a limited, indicative color pallette that has great contrast.  I have different shades and highlights of yellow as markers animation.  Because color sometimes doesn't convey enough information, shape contrast is used.  For instance, the "diamond" shape indicates a keyframe is present on the current frame.  This is similar to programs such as After Effects and may be an affordance to some users.
{% end %}

{{ key(title="Comps") }}
# Comps
Here, several colors are used to help users immediately identify UI components.  A filled yellow indicates a control, and transluscent purple displays a waveform of some sort.

{{ image(path="plugins/animate-comp.png") }}

Even though the elements are physically seperated due to layout constraints, color coding allows the user to easily understand what parameter affects which node.
