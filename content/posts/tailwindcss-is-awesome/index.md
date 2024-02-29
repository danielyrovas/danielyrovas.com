+++
title = 'Tailwindcss Is Awesome'
date = 2023-11-26T16:26:31+11:00
tags = ["Web Development"]
+++

### First impressions

I was forced to try TailwindCSS for a project I worked on. My group members decided to use it, and I wasn't going to be doing much of the styling so I agreed, despite my reservations - my first impressions with Tailwind definitely weren't so good.

I thought it would be rather annoying to need to write classes everywhere, especially in comparison to the classless style of CSS. Surely this would be far slower than writing some simple CSS that could target the elements in the HTML without needing a class, right? Or at least, only 1 class would be needed for the parent element, then all the children can be styled automatically using CSS selectors...

### What is with all that cruft littering my HTML?
I also thought it made the HTML really ugly, *though digging through HTML is my job at the moment, so perhaps not surprising.*

I recently tried writing some styling using Sassy CSS, and I struggled with it a lot. I think using Tailwind has broken my ability to write regular CSS. There is something about Tailwind that just makes sense. Defining custom CSS classes to apply using the same tailwind method is super simple, theming is about as easy as it will ever get, and I can even get it to theme content in a classless way (which entirely defeats the point of TailwindCSS, but sometimes is necessary when you don't control the HTML).

I think the only detractor is that it requires a build step (and it is not built into the Zola static site generator like SCSS is).
