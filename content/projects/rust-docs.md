+++
title = "Rust Docs"
date = 2018-05-28
tags = ['ui/ux','web']
[extra]
summary = "The Rust Language needs a better way to create external documentation websites.  I use a data-based approach to determine the victories and pitfalls of current solutions."
video = "cg/banner.mp4"
duration_weeks = 2
show_synopsis = true
+++

{{ disclaimer(unfinished=true) }}

{{ key(title="Background") }}

# Background
[Rust](https://www.rust-lang.org/en-US/) is a systems programming language with a focus on memory safety.  I write the language in day-to-day projects and contributions like [the VST crate](https://github.com/rust-dsp/rust-vst) used for creating digital instruments.

Rust uses a documentation generator to help users understand an API or application ([here is one example](https://docs.rs/rand/0.5.0/rand/)).  However, sometimes maintainers wish to create more attractive landing pages filled with tutorials and example code.  Notable examples of these websites include [serde.rs](http://serde.rs/), [rocket.rs](https://rocket.rs), and [hyper.rs](https://hyper.rs/).  I call these "external documentation sites", as opposed to the  docs that Rust generates.

{{ key(title="Problem") }}
# Problem & Solution
The problem with these sites is that they all highlight different information.  For example, [rocket.rs](https://rocket.rs) provides a whole host of different info and links while something like [serde.rs](http://serde.rs/) covers only examples and documentation.

My solution is a website creation tool that helps standardize information shown based on user data.

{{ key(title="Data") }}
# Hypotheses & Data

To begin, I wrote a survey designed to gauge user wants and habits when visiting external documentation websites.  Questions were based on several hypotheses:

1. **Non-American users** will have a greater desire to **utilize internationalization tools**
2. **Most people use external documentation sites for learning a new resource**, but rely on generated docs for everything else
3. Most people want **repository links up-front**
4. The first thing visitors want to see is a **quick introduction** or **example** of the library or application in use
5. Maintainers of **larger products are more likely to create external documentation sites**
6. **Most maintainers are looking for a quick solution** to generate an external documentation site at the expense of customization

## Data
A [small form](https://docs.google.com/forms/d/1iHLJ7z6liQ5KY46WIZCklKzxIT7BGz9p2whxceBjVvQ/) composed of several questions related to my hypotheses were linked to relevant spaces such as [The Rust User Forums](http://users.rust-lang.org) and the [Official Rust Subreddit](https://www.reddit.com/r/rust).  I left my form up for several days to make sure users from all time zones had a chance to answer.  Here's what I found:

### How are current solutions?
**Q:** How do you view the usefulness of documentation websites separate from generated docs (such as rocket.rs or hyper.rs)?

<canvas class="chart" id="chart-1"></canvas>

The majority of external documentation websites are happily received, with a **plurality of users commenting** that they are **most useful when first learning** a library or application.

The scope of this project should not intersect with Rust's generated docs - so although many users say that these websites are useful through all stages of development, we will not focus on creating another generated documentation system.

---

### What do users look for?
**Q:** What do you look for when reading an external documentation site?

<canvas class="chart" id="chart-5"></canvas>

---

### What do users look for?
**Q:** What resources do you expect to be featured/important on documentation sites?  Note: this question is more open-ended than the last, and asks for a user's *desired* features.  Participants chose up to 4 answers.

<canvas class="chart" id="chart-6"></canvas>

---

### What developers want it?
**Q:** Have you or do you plan to create an additional website with documentation separate from generated docs?

<canvas class="chart" id="chart-2"></canvas>

A **plurality of Rust users do not believe their application or library needs an external documentation site**.  This is expected, as the **effort put into creating a website is usually only reserved for larger projects**.  

My **focus is on users who are considering a website**, or feel as though a website requires too much effort to set up.

---

### What do developers want?
**Q:** If you were to create a separate documentation site, what would be the most important features when developing?

<canvas class="chart" id="chart-3"></canvas>

Participants picked their **top 3 choices**.  Ease of use, documentation, and visual design are the most important to users surveyed.  

---

### What do developers want? (contd.)
**Q:** What is more important to you when creating a documentation site?

<canvas class="chart" id="chart-4"></canvas>

A vast majority of participants agree that **an external documentation site should be easy to set up, even at the cost of customizability**.  Although a compromise can be made between the two qualities, I forced participants to choose between the two in order to better gauge their needs.

---

## Programmers want something easy to set up and maintain.

1. Some participants don't feel as though they have enough time to create a dedicated website
2. "Ease of use" is voted the most wanted feature 
3. Participants prefer ease of use over customizability 

## Users want examples and quick info!

1. Example code is heavily desired website info, with many users disliking websites with incomplete examples
2. Quick summaries of the project are a must
3. External links such as to GitHub should be readily visible

<!-- put all our chart data here! -->
<script>
    /*var bgcolor = [
                    'rgba(255, 99, 132, 0.2)',
                    'rgba(54, 162, 235, 0.2)',
                    'rgba(255, 206, 86, 0.2)',
                    'rgba(75, 192, 192, 0.2)',
                    'rgba(153, 102, 255, 0.2)',
                ];*/
    var bgcolor = [
        "rgba(209, 219, 88, 0.5)", 
        "rgba(111, 208, 127, 0.5)", 
        "rgba(23, 184, 168, 0.5)", 
        "rgba(71, 151, 181, 0.5)", 
        "rgba(125, 114, 156, 0.5)", 
        "rgba(142, 79, 106, 0.5)"];
    var bdrcolor = [
        "rgba(209, 219, 88, 0.8)", 
        "rgba(111, 208, 127, 0.8)", 
        "rgba(23, 184, 168, 0.8)", 
        "rgba(71, 151, 181, 0.8)", 
        "rgba(125, 114, 156, 0.8)", 
        "rgba(142, 79, 106, 0.8)"];
    // Have you or do you plan to create an additional website with documentation separate from generated docs?
    new Chart(document.getElementById("chart-1").getContext('2d'), {
        type: 'pie',
        data: {
            labels: [
                "No, I do not believe my library or application needs one", 
                "Maybe. It is still something to consider.", 
                "Yes, I plan on creating a separate site or have already created one.", 
                "No, I do not have the time to do so", 
                "No (other reasons)"],
            datasets: [{
                data: [25, 19, 7, 9, 1],
                backgroundColor: bgcolor,
                borderColor: bdrcolor,
                borderWidth: 1
            }]
        }
    });
    // How do you view the usefulness of documentation websites separate from generated docs (such as https://rocket.rs/ or https://hyper.rs)?
    new Chart(document.getElementById("chart-2").getContext('2d'), {
        type: 'pie',
        data: {
            labels: [
                "They are helpful through all stages of development including learning and implementation", 
                "They are helpful only when learning a new resource", 
                "They are largely unhelpful but sometimes have good examples", 
                "They are a confusing and poor resource"],
            datasets: [{
                data: [27, 34, 9, 2],
                backgroundColor: bgcolor,
                borderColor: bdrcolor,
                borderWidth: 1
            }]
        }
    });
    // If you were to create a separate documentation site, what would be the most important features when developing?
    new Chart(document.getElementById("chart-3").getContext('2d'), {
        type: 'bar',
        data: {
            labels: [
                "Easy to set up", 
                "Well documented", 
                "Visually stunning", 
                "Customizable",
                "Multilingual",
                "Interactive (forums, etc.)"],
            datasets: [{
                data: [52, 41, 16, 6, 2, 1],
                backgroundColor: bgcolor,
                borderColor: bdrcolor,
                borderWidth: 1,
                label: "Number of votes"
            }]
        }
    });
    // What is more important to you when creating a documentation site (separate from generated docs)?
    new Chart(document.getElementById("chart-4").getContext('2d'), {
        type: 'polarArea',
        data: {
            labels: [
                "Easy to set up (with less customization)", 
                "Fully customizable (with less ease of use)"
                ],
            datasets: [{
                data: [50, 11],
                backgroundColor: bgcolor,
                borderColor: bdrcolor,
                borderWidth: 1,
                label: "Number of votes"
            }]
        }
    });
    // What was your reason for using this site?
    new Chart(document.getElementById("chart-5").getContext('2d'), {
        type: 'bar',
        data: {
            labels: [
                "Example code", 
                "Features summary",
                "External links",
                "Other"
                ],
            datasets: [{
                data: [51, 42, 17, 2],
                backgroundColor: bgcolor,
                borderColor: bdrcolor,
                borderWidth: 1,
                label: "Number of votes"
            }]
        }
    });
    // What resources do you expect to be featured/important on documentation sites 
    new Chart(document.getElementById("chart-6").getContext('2d'), {
        type: 'bar',
        data: {
            labels: [
                "Example code", 
                "Link to source code",
                "Features summary",
                "Link to docs",
                "Progress updates",
                "Maintenance status",
                "Full documentation",
                "Sponsors",
                "How to add a library to a project",
                "Other"
                ],
            datasets: [{
                data: [62, 52, 51, 48, 31, 22, 15, 14, 9, 11],
                backgroundColor: bgcolor,
                borderColor: bdrcolor,
                borderWidth: 1,
                label: "Number of votes"
            }]
        }
    });
</script>