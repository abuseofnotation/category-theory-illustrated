---
layout: default
---


<img src="../cover.svg" height="700px">

<div style="break-after:page"></div>

Praise
===

> "The range of applications for category theory is immense, and visually conveying meaning through illustration is an indispensable skill for organizational and technical work. Unfortunately, the foundations of category theory, despite much of their utility and simplicity being on par with Venn Diagrams, are locked behind resources that assume far too much academic background.
>
>Should category theory be considered for this academic purpose or any work wherein clear thinking and explanations are valued, beginner-appropriate resources are essential. There is no book on category theory that makes its abstractions so tangible as "Category Theory Illustrated" does. I recommend it for programmers, managers, organizers, designers, or anyone else who values the structure and clarity of information, processes, and relationships."

[Evan Burchard](https://www.oreilly.com/pub/au/7124), Author of "The Web Game Developer's Cookbook" and "Refactoring JavaScript"


> "The clarity, consistency and elegance of diagrams in 'Category Theory Illustrated' has helped us demystify and explain in simple terms a topic often feared."

[Gonzalo Casas](https://gnz.io/), Software developer and lecturer at ETH Zurich

{% for chapter in site.chapters%}

<div style="break-after:page"></div>

{{ chapter.content }}

{% endfor %}

<script>
window.print()
</script>
