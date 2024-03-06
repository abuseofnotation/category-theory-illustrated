---
layout: default
title: About 
---

{: style="text-align: center"}
In memory of 

{: style="text-align: center"}
Francis William Lawvere 

{: style="text-align: center"}
1937 --- 2023

<div style="page-break-after: always; opacity: 0 ; height: 400px"> 
\pagebreak 
</div>

{: style="text-align: right"}
*"Try as you may,*

{: style="text-align: right"}
*you just can't get away,*

{: style="text-align: right"}
*from mathematics"*

{: style="text-align: right" }
Tom Lehrer 

<div style="page-break-after: always; opacity: 0 ; height: 400px"> 
\pagebreak 
</div>

The story behind this book
===

I was interested in math as a kid, but was always messing up calculations, so I decided it was not my thing and started pursuing other interests, like writing and visual art.

A little later I got into programming and I found that this was similar to the part of mathematics that I enjoyed. I started using functional programming in an effort to explore the similarity and to improve myself as a developer. I discovered category theory a little later.

Some 5 years ago I found myself jobless for a few months and decided to publish some of the diagrams that I drew as part of the notes I kept when was reading "Category Theory for Scientists" by David Spivak. The effort resulted in a rough version of the first two chapters of this book, which I published online.

A few years after that some people found my notes and encouraged me write more. They were so nice that I forgot my imposter syndrome and got to work on the next several chapters.

On math
===

Ever since Newton's Principia, the discipline of mathematics is viewed in the somewhat demeaning position of "science and engineering's workhorse" --- only "useful" as a means for helping scientists and engineers to make technological and scientific advancements, i.e., it is viewed as just a tool for solving "practical" problems. 

Because of this, mathematicians are in a weird and, I'd say, unique position of always having to defend what they do with respect to its value for *other disciplines*. I again stress that this is something that would be considered absurd when it comes to any other discipline. 

People don't expect any return on investment from *physical theories*, e.g., no one bashes a physical theory for having no utilitarian value.

And bashing philosophical theories for being impractical would be even more absurd --- imagine bashing Wittgenstein, for example:

> "All too well, but what can you do with the picture theory of language?" 
> "Well, I am told it does have its applications is programming language theory..."

Or someone being sceptical to David Hume's scepticism:

> "That's all fine and dandy, but your theory leaves us at square one in terms of our knowledge. What the hell are we expected to do from there?"

Although many people don't necessarily subscribe to this view of mathematics as a workhorse, we can see it encoded inside the structure of most mathematics textbooks --- each chapter starts with an explanation of a concept, followed by some examples, and then ends with a list of problems that this concept solves. 

There is nothing wrong with this approach, but mathematics is so much more than solving problems. It was the basis of a religious cult in ancient Greece (the Pythagoreans), it was seen by philosophers as means to understanding the laws which govern the universe. It was, and still is, a language which can allow for people with different cultural backgrounds to understand each other. And it is also art and a means of entertainment.

Category theory embodies all these aspects of mathematics, so I think it's very good grounds to writing a book where all of them shine --- a book that isn't based on solving of problems, but exploring concepts and seeking connections between them. A book that is, overall, pretty.

Who is this book for 
====

So, who is this book for? Some people would phrase the question as "Who *should* read this book", but if you ask it this way, then the answer is nobody. Indeed, if you think in terms of "should", mathematics (or at least the type of mathematics that is reviewed here) won't help you much, although it is falsely advertised as a solution to many problems (it is, in fact, something much more).

Let's take an example --- many people claim that Einstein's theories of relativity are essential for GPSes to work properly. Due to relativistic effects, the clocks on GPS satellites tick faster than identical clocks on the ground.

They seem to think that if the theory didn't exist, the engineers that developed the GPSes would have faced this phenomenon in the following way:

> Engineer 1: Whoa, the clocks on the satellites are off by X nanoseconds! 
>
> Engineer 2: But that's impossible! Our mathematical model predicts that they should be correct. 
>
> Engineer 1: OK, so what do we do now?
>
> Engineer 2: I guess we need to drop this project until we have a viable mathematical model that describes time in the universe.

Although I am not an expert in special relativity, I suspect that the way this conversation would have developed would be closer to the following:

> Engineer 1: Whoa, the clocks on the satellites are off by X nanoseconds!
>
> Engineer 2: This is normal. There are many unknowns.
>
> Engineer 1: OK, so what do we do now?
>
> Engineer 2: Just adjust it by X and see if it works. Oh, and tell that to some physicist. They might find it interesting.

In other words, we can solve problems without any advanced math, or with no math at all, as evidenced by the fact that the Egyptians were able to build the pyramids without even knowing Euclidean geometry. And with that I am not claiming that math is so insignificant, that it is not even good enough to serve as a tool for building stuff. Quite the contrary, I think that math is much more than just a simple tool. Thinking itself is mathematical. So going through any math textbook (and of course especially this one) would help you in ways that are much more vital than finding solutions to "complex" problems.

Some people say that we don’t use maths in our daily life. But, if true, that is only because other people have solved all hard problems for us and the solutions are encoded on the tools that we use, however not knowing math means that you will be forever a consumer, bound to use those existing tools and solutions and thinking patterns, not being able to do many things on your own.

And so "Who is this book for" is not to be read as who should, but who *can* read it. Then the answer is "everyone".

About category theory
===

Like we said, the fundaments of mathematics are the fundaments of thought. Category theory allows us to formalize those fundaments that we use in our daily (intellectual) lives.

The way we think and talk is based on intuition that develops naturally and is a very easy way to get our point across. However, that is part of the problem: sometimes intuition makes it *too easy* for us to say something that can be interpreted in many ways, some of which are wrong. For example, when I say that two things are equal, it would seem obvious to you what I meant, although it isn't obvious at all (how are they equal?, in what context?, etc.) 

It's in these situations that people often resort to *diagrams* to refine their thoughts. Diagrams (even more than formulas) are ubiquitous in science and mathematics.

Category theory formalizes the concept of diagrams and their components --- arrows and objects --- to create a language for presenting all kinds of ideas. In this sense, category theory is a way to unify knowledge, both mathematical and scientific, and to unite various modes of thinking with common terms. 

As a consequence of that, category theory and diagrams are also a very understandable way to communicate a formal concept clearly, something I hope to demonstrate in the following pages.

Summary
===

In this book we will visit various such modes of knowledge and along the way, see all kinds of mathematical objects, viewed through the lens of categories.

We start with *set theory* in chapter 1, which is the original way to formalize different mathematical concepts.

Chapter 2 we will make a (hopefully) gentle transition from sets to *categories* while showing how the two compare and (finally) introducing the definition of category theory.

In the next two chapters, 3 and 4, we jump into two different branches of mathematics and introduce their main means of abstraction, *groups and orders*, observing how they connect to the core category-theoretic concepts that we introduced earlier.

Chapter 5 also follows the main formula of the previous two chapters, getting to the heart of the matter of why category theory is a universal language, by showing its connection with the ancient discipline of *logic*. As in chapters 3 and 4, we start with a crash course in logic itself.

The connection between all these different disciplines is examined in chapter 6, using one of the most interesting category-theoretical concepts --- the concept of a functor.

In chapter 7 we review another more interesting and more advanced categorical concept, the concept of a *natural transformation*.

Acknowledgments
===

Thanks to my wife Dimitrina, for all her support.

My daughter Daria, my "anti-author" who stayed seated on my knees when I was writing the second and third chapters and mercilessly deleted many sentences, most of them bad.

Thanks to my high-school arts teacher, Mrs Georgieva who told me that I have some talent, but I have to work.

Thanks to Prathyush Pramod who encouraged me to finish the book and is also helping me out with it.

And also to everyone else who submitted feedback and helped me fix some of the numerous errors that I made --- knowing myself, I know that there are more.
