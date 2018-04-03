+++
+++

# Resamplr Engine

1. [Description](#description)
2. [UI Components](#ui-components)
3. [Engine Components](#engine-components)

## Description
This document will provide a draft of methods needed to create Resamplr's Engine.  It is sectioned based on whether the method is front-end or back-end, as well as other factors.  Every method should have a `C++` version, as well as an example in our scripting language (That language is subject to change, but is currently written in Chaiscript.  However, most if not all examples can be easily translated and do not use any specialized language features).

---

To keep the line between user-defined structures and builtin methods unambiguous, Engine recommends that all builtin methods come from a base static class.  These are as follows (although naming will change):

Non-UI: `Engine::some_func();`

UI:            `EngineUI::some_func();`

This way, both developers and readers will understand the difference.

## A note on verbosity
Current samplers rely on UI controls for much of their library building (e.g., Kontakt requires the user to use their UI for building key maps.  While this is user-friendly, and should be looked into further, being reliant on GUI is the source of several problems.

1. The library isn't portable between developers.  Because everything cannot be described in code, it may be difficult for developers to share specific snippets.
2. The library is limited and certain attributes cannot be changed by the end-user.   
3. GUI editing and visual coding can be obtrusive to some people's workflows.

Engine provides methods for doing **all** functions through scripts, from loading files, to specifying loop times.  This allows for greater developer and end-user flexibility.  With a few characters, the user can patch a library and create something new.

Although this methodology allows for greater flexibility, it is sometimes at the cost of clarity and ease-of-use.  Engine **should** implement visual editing further into its development, especially for visually-heavy functions like wave looping and key mapping.  However, those visual editing tools will provide the same functionality as scripting to ensure the greatest flexibility possible.

## High-level Structure
![a](https://lh4.googleusercontent.com/MC-Ntw8Mqri7nc3rYKMcnJQ1Q5KyDvzE3HSuH6N7mJ-rbIo7OTkjxHHnKQ6k25CmvF-LnV9wP3lgCyDp_zbP=w2498-h989)

### Code Style
- Class names use Pascal casing.
- Functions and variables use snake case


## UI Components
This section details how user interfaces are created, displayed, and manipulated.  All methods omit `EngineUI::` before them.

### Text Label
A basic text label in JUCE.  This is mostly used for annotating controls with useful information.  However, labels can also be used as input boxes if set editable.  Although the same class, the script implementation has been split to aid readability.
  
[C++ impl](https://juce.com/doc/classLabel)

Script:

```js
// TODO
```

### Editable Text Label
[C++ impl](https://juce.com/doc/classLabel)

Script:

```js
// TODO
```

## Engine Components
This section will detail anything not related to the display of widgets and GUI elements.  That includes stuff like MIDI & event handling, looping, sample loading, and more.  This section will be broken up into smaller parts.

### Engine Structure Overview
Engine is structured in a way that allows for comfortable abstractions while maintaining flexibility.  Similar to other samplers, it uses **groups**, **samples**, **key regions**, **velocity regions**, and **keyswitches**.  It also introduces the concept of **sections**.

1. Groups
    - Groups allow for multiple samples to be "grouped" together
    - Groups are the highest level 
    - Groups make necessary functions like round robins possible
2. Samples
    - Samples are audio clips of any length that are loaded into Engine
    - For example, a simple pitched flute instrument might have one sample every 3 notes
    - Because manipulating samples is often the most time-intensive part of building a sample library, samples are not bound to any specific regions or groups.  Those methods just refer to samples, allowing for sample and code reuse.
3. Key Regions
    - Key regions are samples assigned to a range of keys within a group
    - Key regions allow samples to be pitch-stretched if needed (for example if the library only provided one sample every 3 notes).
    - Key regions do not contain a reference to samples
    - Key regions must contain at least one velocity region
4. Velocity Regions
    - Velocity regions are samples bound to trigger at a specific velocity (`0-127` in the MIDI spec).
    - Velocity regions contain the reference to a sample.  
    - Velocity  regions allow for different samples to be played per note depending on the velocity
    - Multiple velocity regions can be bound to one sample so that the same sample can be played from velocity `0-17` and `88-127` without code duplication.
    - Multiple samples with the same Key region and velocity region are supported for layering effects
5. Keyswitches
    - Keyswitches are special Key Regions that allow the user to execute code (e.g., a group switch, etc).
6. Sections
    - Sections are basically supergroups.  They contain a list of groups, and can perform special functions.
    - Sections help further organize the instrument.

### Hierarchy
    Section
    |>  Group
        |> Key Region
            |> Velocity Regions
                |> Sample
        |> Keyswitch
    
    Sample
        > Loop info
        > Pitch
        > Volume
        > Panning

### Section Creation
Create a Section or Supergroup.

#### Examples

Creating a Section
```js
Engine::create_section(
    // A user-friendly name for this section
    String: name,
    // OPTIONAL: an array of groups for this
    // section to use.  (Note that groups can
    // be shared among sections).
    Group[]: groups,
    // OPTIONAL: A builtin mode for this section
    // (maybe use a function argument
    // for user-defined modes?)
    SectionMode: mode
)
```

Creating a round robin
```js
// CREATE GROUPS HERE
//
Engine::create_section("my_section", 
[group_1, group_2, group_3], 
SectionMode::RoundRobin);

// Alternatively, register groups after
// section is created.
Engine::create_section("my_section",
mode: SectionMode::RoundRobin);

// CREATE A GROUP HERE
//
Engine::add_group(my_new_group);
```

---

### Group Creation
Create a group container.

#### Example
```js
Engine::create_group(
    // A user-friendly name to call this group
    String: name, 
    // OPTIONAL: Key regions to register
    KeyRegion[]: key_regions,
)
```

---

### KeyRegion Creation
Create a region for notes to be played.
    
```js
Engine::create_key_region(
    // OPTIONAL: A user-friendly name for this key region
    String: name,
    // The base note of this key region, from 0-127.
    // This will pitch samples if this key region extends
    // beyond one note.  It can be overridden per each
    // velocity region, if needed.
    u8: base_note,
    // OPTIONAL: The range of notes this key region covers, as a 
    // 2-value tuple with values ranging from 0-127.
    // If it is left out, the range will be `1` and start 
    // and end at the `base_note`.
    (u8, u8): range,
    VelocityRegion[]: velocity_region
)
```
---

### VelocityRegion Creation
Assign a sample to a specific key region and velocity.

```js
Engine::create_velocity_region(
    // OPTIONAL: A user-friendly name for this velocity region
    String: name,
    // OPTIONAL: The base note override for this velocity region
    u8: base_note,
    // The range of velocities this region covers as a
    // 2-value tuple with values ranging from 0-127.
    // The default is (0, 127).
    (u8, u8): range
    // A reference to a sample that will be played
    Sample: sample
)
```

### Sample Loading
Load a sample or samples and manipulate them.

```js
// TODO
```  

---

### Sample Program
Below is a sample program for a simple instrument.  It will allow us to play two keys between `60` and `62`, with 3 samples ranging full velocity. 

```js
// create a section to contain all of our groups and samples,
// and immediately add a group to it.
var instrument = Engine::create_section("my instrument"); 
instrument.add_group( 
    Engine::create_group("my group")
);

// get our newly created group and begin manipulating it
instrument.groups[0].add_key_region(
    Engine::create_key_region(base_note: 60, range: (60,62))
);

// get our newly created key region and add samples to it
instrument.groups[0].key_regions[0].add_velocity_regions(
    [ 
        Engine::create_velocity_region(range: (0,60), sample: my_sample_1),
        Engine::create_velocity_region(range: (61,100), sample: my_sample_2),
        Engine::create_velocity_region(range: (101,127), sample: my_sample_3)
    ]
);
```

---

We can also use alternative methods to reuse code.  For instance, if we wanted to have several regions shared across groups, we could do this:


```js
// create a couple of regions that we'll want to reuse later
var region_1 = Engine::create_key_region(base_note: 60, range: (60, 62));
region_1.add_velocity_regions(
    [ 
        Engine::create_velocity_region(range: (0,60), sample: my_sample_1),
        Engine::create_velocity_region(range: (61,100), sample: my_sample_2),
        Engine::create_velocity_region(range: (101,127), sample: my_sample_3)
    ]
);

// create a section to contain all of our groups and samples,
// and immediately adds groups to it.
var instrument = Engine::create_section("my instrument", 
    mode: SectionMode::RoundRobin); 
    
instrument.add_groups( 
    [
        Engine::create_group("my group"),
        Engine::create_group("my second group")
    ]
);

// add our region to every group 
for (group in instrument.groups) {
    group.add_key_region(region_1);
}
```

## Audio Synthesis API
The audio synthesis API deals with the loading and playing of samples. 

###  Loading Wave Samples
Samples can be loaded in as one or several files.  Wave samples or PCM data are different than a "Sample" struct as they are just files that the "Sample" structure can then refer to.  PCM samples are stored in `Engine::io::samples` as a hashmap.

```js
Engine::io::samples; 
// =====>
[
    { "my_path_1/my_wav.ogg", File },
    { "my_path_2/my_wav.ogg", File }
]
```
Because sample files may be located across directories, the key of our hash is the whole relative path.

Although it is possible to store files in a regular variable, using the API ensures that code users and GUI users are accessing the same hash.

In the above example, `File` is basically a byte array containing PCM data.  

### Loading Wave Samples in Code
Instead of using the Engine GUI for loading samples, it can be done entirely through our program.

The following will load a sample and assign it to variable `e`.  It **does not** automatically add the sample to the `Engine::io::samples` hash.
```js
var e = Engine::io::load("path/to/file.ogg");
``` 

The following loads and adds the sample(s) to the hash.
```js
Engine::io::add("path/to/file.ogg");
// or
Engine::io::add("path/here.ogg", "another/path.ogg");
```

### Removing samples in Code
Unloading samples may prove useful to conserving memory, but it is not currently in the scope of this project.  

### Using samples

Sample files must have additional data before being usable in our library.  For instance, some developers prefer a large file with multiple notes sampled as opposed to a file per sample.  We need to allow for metadata.  

Whereas file references exist in `Engine::io`, Samples that refer to those files exist in `Engine::samples`.

### Example structure
```js
Sample { 
    // One shot, loop, etc.
    mode: SampleMode,
    // Reference to a wav file.  Multiple samples can reference
    // the same file.
    file: File,
    // samples from file beginning until 
    // sample starts 
    start: i32,
    // samples from file beginning until
    // sample ends
    end: i32,
    // Loop sections (can be more than one!)
    loop_sections: Loop[]   
}
```
Example loop struct
```js
Loop {
    start: i32,
    end: i32,
    // Crossfade time between the end and start
    // of the loop in ms
    crossfade_time: i32,
    // OPTIONAL: Times to loop before ending
    // default -1 means forever
    times: i32
}
``` 

### Creating samples from loaded files
```js
Engine::samples::add(string: key, Sample: sample);
```

### Example
```js
Engine::init = function() {
    // my_file includes one note
    // my_file2 includes another note played
    // in another style
    Engine::io::load("my_file.ogg", "my_file2.ogg");

    // loop through both files
    for file in Engine::io::samples {
        // by default, the start and end
        // of the sample is the beginning and
        // end of the file
        Engine::samples::add({
            mode: SampleMode::OneShot,
            file: file,
            // It's one shot, so we don't need
            // loop sections
        });
    }
}
```
### The need for GUI
Loading files, creating samples, and editing loop zones is very annoying to do by hand.  This is a section where a GUI would be incredibly useful.   

### Example barebones program

```js
Engine::init = function() {
    // load in a few sample files.  They are one octave each (12 notes)
    // and each note is 50,000 samples apart
    Engine::io::load("octave1.ogg", "octave1_style2.ogg");
    
    // create our samples
    for file in Engine::io::samples {
    
        // create a group per each style of playing.
        // Both groups will automatically be put into a default section
        // since we didn't define one.
        var group = Engine::create_group("group" + file.key);
        
        // We know there are 12 notes spaced 50,000 samples apart.
        // This isn't common in practice but is good for demonstrative
        // purposes when we don't have a GUI.
        for (var i = 0; i < file.length) {
        
            // create a new keyregion in our group.  our notes start
            // at 48 and go to 60 (or an octave starting at C).
            var key_region = group.add_key_region({ base_note: (48 + i) });
            
            // add a velocity region.  We don't have different velocities per
            // key region, so this will be from 0-127.
            var velocity_region = key_region.add_velocity_region({ range: (0, 127)});
            
            // create a sample snippet and add it to our group.
            // If we wanted to have the sample snippets available elsewhere
            // we would want to register them with Engine::etc.
            velocity_region.add_samples({ 
                mode: SampleMode::OneShot,
                start: i * 50000,
                end: (i * 50000) + 50000,
                file: file
            });
        }
    }
}

Engine::note_on = function(e) {
    // do something here
}
```

We could also do the above more declaratively:

```js
Engine::init = function() {
    // load in a few sample files.  They are one octave each (12 notes)
    // and each note is 50,000 samples apart
    Engine::io::load("octave1.ogg", "octave1_style2.ogg");
    Engine::create_group({
        name: "some_name",
        key_regions: [{
            base_note: 50,
            velocity_regions: [{ 
                sample: {
                    file: Engine::io::files["octave1.ogg"],
                    start: 0,
                    end: 50000
                }
            }]
        },{
            base_note: 51,
            velocity_regions: [{ 
                sample: {
                    file: Engine::io::files["octave1.ogg"],
                    start: 50000,
                    end: 100000
                }
            }]
        }]
    });
    // etc...
}
```
<!--stackedit_data:
eyJoaXN0b3J5IjpbMjExMTIyNTA3MCwtMTM5NjU5MDM2NiwtMT
g0NjMyMDI5M119
-->