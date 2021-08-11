About
===

About category theory
---

> Category Theory is considered by many to be an involved domain of study to get into. It becomes a ground for unification of mathematical ideas for a wide variety of domains. And the way it achieves this is by taking an abstract vantage point on the ideas, their properties, and processes in these disciplines. This viewpoint gives it the ability to reason about analogies happening in distinct domains and draw rigorous analogies across the patterns happening in them in a rigorous way.

Source: https://github.com/prathyvsh/category-theory-resources

Category theory has a variety of applications: 

- It is used in **programming language theory**, for example the usage of monads in functional programming. 
- It is used in other scientific disciplines e.g. quantum mechanics:

> The conference series Quantum Physics and Logic (QPL), founded by Peter Selinger in 2003 under a different name (but with the same abbreviation!), was a particularly important forum for the development of the key results leading up to this book. In fact, the first paper about diagrammatic reasoning for novel quantum features (Coecke, 2003) was presented at the first QPL. The categorical formalisation of this result (Abramsky and Coecke, 2004), now referred to as categorical quantum mechanics, became a hit within the computer science semantics community, and ultimately allowed for several young people to establish research careers in this area. **Top computer science conferences (e.g. LiCS and ICALP) indeed regularly accept papers on categorical quantum mechanics, and more recently leading physics journals (e.g. PRL and NJP) have started to do so too**.

Source: Picturing Quantum Processes by Bob Coecke (Cambridge University Press - 2017)

- It may also be used as an axiomatic foundation for mathematics, as an alternative to set theory and other proposed foundations. 
- Last but not least (perhaps even most importantly) category theory has a very good potential as a *teaching tool* allowing for a variety of concepts: 

About the book
---

I am writing a primer in category theory and of various related concepts in "higher" mathematics that is *really* accessible to people with no prior exposure to the subject without being dumbed down, by utilizing visual explanations.

My book will serve as chapter 0, going through the gist of the material that any other similar introductory book covers, but covering it in a way that would enable non-mathematicians to swift through with ease.

Reading it would enable my readers to then effortlessly go through any academic introduction to category theory, as well as to start tacking resources that use category theory as a tool to threat other subjects.

About the author
---

Similar resources
===

To my knowledge, Category Theory Illustrated does not have any *direct* competition, as the materials I have seen are usually have a much more high barrier to entry.

A good list of category theory introductions can be found here:

https://github.com/prathyvsh/category-theory-resources

In this document, I will concentrate on the following two: 

- Category Theory for Programmers by Bartosz Milewski (self-published- 2018) - Full text: https://github.com/hmemcpy/milewski-ctfp-pdf/

- Category Theory for the Sciences by David I. Spivak (MIT press - 2014) - Free version available at: http://math.mit.edu/~dspivak/CT4S.pdf

I chose those two because:

1. They are the closest to my book that I could find.
2. Their readers (and authors) represent the two biggest target audiences for my book - programmers (nerds) and scientists (academics).

I am attaching excerpts from both of them, as well as one from CTI, that explain the concept of an *order*

Category Theory for Programmers
---

> A preorder is a set with an ordering relation between its elements that’s traditionally written as <= (less than or equal). The “pre” in preorder is there because we’re only requiring the relation to be transitive and reflexive but not necessarily antisymmetric (so it’s possible to have cycles).

> A set with the preorder relation gives rise to a category. The objects are the elements of this set. A morphism from object a to b either doesn’t exist, if the objects cannot be compared or if it’s not true that a <= b; or it exists if a <= b, and it points from a to b. There is never more than one morphism from one object to another. Therefore any hom-set in such a category is either an empty set or a one-element set. Such a category is called thin.

> It’s easy to convince yourself that this construction is indeed a category: The arrows are composable because, if a <= b and b <= c then a <= c; and the composition is associative. We also have the identity arrows because every element is (less than or) equal to itself (reflexivity of the underlying relation).

Source: https://bartoszmilewski.com/2015/10/28/yoneda-embedding/

Category Theory for the Sciences 
---

> 3.4.1 Definitions of preorder, partial order, linear order

> Definition 3.4.1.1. Let S be a set and R Ď S ˆS a binary relation on S; if ps,s1q P R
we will write s ≤ s1. Then we say that R is a preorder if, for all s,s1,s2 P S we have

> Reflexivity: s ≤ s, and

> Transitivity: if s ≤ s1 and s1 ≤ s2, then s ≤ s2.

> We say that R is a partial order if it is a preorder and, in addition, for all s,s1 P S we
have

> Antisymmetry: If s ≤ s1 and s1 ≤ s, then s “ s1.

> We say that R is a linear order if it is a partial order and, in addition, for all s,s1 P S we have

> Comparability: Either s ≤ s1 or s1 ≤ s.
> We denote such a preorder (or partial order or linear order) by pS,≤ q.

> Exercise 3.4.1.2.
> a.) Decide whether the table to the left in Display (3.9) constitutes a linear order.
> b.) Show that neither of the other tables are even preorders.

Source: http://math.mit.edu/~dspivak/CT4S.pdf (page 93)

Orders also discussed on page 132 in the same link

Category Theory Illustrated
---

> The most straightforward type of order that you think about is linear order i.e. one in which every object has its place depending on every other object. In this case the ordering criteria is completely deterministic and leaves no room for ambiguity in terms of which element comes before which. For example, ordering the colors by the length of their waves (or by how they appear in the rainbow).

![Linear order](_chapters/04_order/linear_order.svg)

> In most programming languages, we can order objects linearly by providing a function which, given two objects, tells us which one of them is "bigger" (comes first) and which one is "smaller".

```
[1, 3, 2].sort((a, b) => { 
  if (a > b) {
    return true 
  } else {
    return false
    } 
})
```

> But in order for such a function to really define an order (e.g. give the same output every time, independent of how the objects were shuffled initially), it has to obey several rules. 

> Incidentally, (or rather not incidentally at all), these rules are nearly equivalent to the mathematical laws that define the criteria of the relationship between elements in an order i.e. those are the rules that define which element can point to which. Let's review them.

> Reflexivity 

> Let's get the most boring law out of the way - each object has to be bigger or equal to itself, or **a ≤ a** (the relationship between elements in an order is commonly denoted as **≤** in formulas, but it can also be represented with a simple arrow from first object to the second). 

![Reflexivity](_chapters/04_order/reflexivity.svg)

> No special reason for this law to be so, except that the "base case" should be covered somehow. 

> We can formulate it the opposite way too and say that each object should *not* have the relationship to itself, in which case we would have a relation than resembles *bigger than*, as opposed to *bigger or equal to* and a slightly different type of order, sometimes called a *strict* order.

> Transitivity


> The second law is maybe the least obvious, (but probably the most essential) - it states that if object **a** is bigger than object **b**, it is automatically bigger than all objects that are smaller than object **b** or **a ≤ b and b ≤ c ➞ a ≤ c**. 

![Transitivity](_chapters/04_order/transitivity.svg)

> This is the law that to a large extend defines what an order is: if I am better at playing soccer than my grandmother, then I would also be better at it than my grandmother's friend, whom she beats, otherwise I wouldn't really be better than her.

> Antisymmetry

> The third law is called antisymmetry and it states that the function that defines the order should not give contradictory results (or in other words you have **x ≤ y** and **y ≤ x** only if **x = y**). 

![antisymmetry](_chapters/04_order/antisymmetry.svg)

> It also means that no ties are permitted - either I am better than my grandmother at soccer or she is better at it than me.

> Totality

> The last law is called *totality* (or *connexity*) and it mandates that all elements that belong to the order should be comparable - **a ≤ b or b ≤ a**. That is, for any two elements, one would always be "bigger" than the other. 

> By the way, this law makes the reflexivity law redundant, as reflexivity is just a special case of totality when **a** and **b** are one and the same object, but I still want to present it for reasons that will become apparent soon.

![connexity](_chapters/04_order/connexity.svg)

> You might say that this law is not as self-evident as the rest of them - if you think about different types of real-life objects that we typically order, you would probably think of some situations in which it does not apply. For example, if we aim to order all people based on soccer skills there are many ways in which we can rank a person compared to their friends their friend's friends etc. but there isn't a way to order groups of people who never played with one another.


Features
===

I will now continue by with examining the points which make my work unique compared to those and other similar books.

Diagrams
---

Category theory is very *visual* in its nature. Category-theoretic diagrams are not merely supplemental illustrations for the concepts, but are often the very language that is used to define those concepts e.g. defining a more advanced concept such as *natural transformation* without diagrams is practically impossible. So having a lot of diagrams is essential for people who are inexperienced to understand the concepts. 

However, books on category theory typically have as many diagrams as other math textbooks. I consider this a huge missed opportunity for making the subject more approachable, which was the original motivation for the creation of CTI.

Besides being more in quantity, the diagrams of CTI are many different kinds combining and combine different prioms from traditional communication design, such as the use of color for example, in order to illuminate the different subjects and abstractions that I am covering.

Both books that I am reviewing have less diagrams than CTI. From the resources that I have examined, the only author who stresses on diagrams as much as I do is Tai-Danae Bradley (her blog is https://www.math3ma.com/).

The diagrams in CTI had received universal praise from many audiences. The university professor Gonzalo Casas used some of them for his lectures on robotic fabrication at ETH Zurich.
Lecture slides:
https://raw.githubusercontent.com/compas-teaching/COMPAS-II-FS2021/main/lecture_06/lecture_06.pdf

Other lecture resources
https://github.com/compas-teaching/COMPAS-II-FS2021/tree/main/lecture_06

Verbosity of language
---

Leaving the diagrams aside, we can see that the descriptions in CTI are much more verbose than equivalent descriptions in other books. This is clearly visible in the excerpts published - although the authors of the books that I am reviewing have quite different styles of presentation, they both move much faster with the exposition, which would be OK for readers who have prior experience with math and computer science, but would be impossible to follow by a newbie in category theory, without either rereading each part a lot of times or doing cross-reference with secondary resources, most likely both (I know that from my own experience). 

In CTI, I try above all to keep a really slow pace and be gentle in my exposition, taking the time to stress out the important parts of the descriptions and the places where misunderstanding might occur, such as the fact that the term "object" has entirely different meanings in computer science and in category theory. 

Chapter on logic
---

Category theory is deeply bound with mathematical logic. Although the connection is mentioned in many books, it isn't fully examined by any introductory texts on category theory that I have seen. 

CTI has a dedicated chapter on logic (the longest one in the book), which introduces the connection and makes use of it to give context to some categorical phenomena, such as limits.

Target audiences
===

The types of people who read CTI:

Programmers, who are curious about category theory, because they are into functional programming.
---

Functional programming is on the rise with both new languages and technologies that are gaining traction (Elixir, Clojure), and mainstream languages, trying to catch up (Java, JavaScript). There are many programmers who are interested in Category theory, but lack the math background to tackle the existing resources. CTI is a way for those people to understand "what the fuss is about" and then study 

Students who are studying category-theory-related disciplines
---

Having a just a little insight in category theory opens the gate to a growing number of resources that use category theory and diagrammatic language to introduce other subjects: 

- Picturing Quantum Processes by Bob Coecke and Aleks Kissinger (Cambridge University Press - 2017) that uses it to introduce quantum mechanics

By the way, I showed Bob the first few chapters of CTI and he liked them :)

- Visual Group Theory by Nathan Carter (MATHEMATICAL ASSOCIATION OF AMERICA - 2009) sample: http://www.mathcs.emory.edu/~dzb/teaching/421Fall2014/VGT-Ch-1-2.pdf

- "Topology. A Categorical Approach" by Tai-Danae Bradley, Tyler Bryson and John Terilla (MIT press - 2020)

As David Spivak puts it in his review of "Topology. A Categorical Approach":

> This book is at the leading edge of what will *likely become a major pedagogical trend in mathematics: teaching the fundamentals from a categorical perspective*.

Any other kind of nerds who want to learn some mathematics just for fun.
---

Aside from being informative, CTI is easy and fun to read, so many people read it just as a form of recreation.

Feedback
===

I have reseived a lot of positive feedback on CTI, and a lot of people shared it on social media. 

Comments
---

> This is the most beautiful and clearly written introduction to categories I’ve ever seen. Highly recommended.

https://twitter.com/y0b1byte/status/1417567589241339912

> Great stuff man! Internet needs more accessible Category Theory expositions.
https://twitter.com/prathyvsh/status/1253303971185221634

> What a wonderful resource this Illustrated Category Theory series is. It's an easy(ier), concise, on-ramp to the topic, that would make a nice introduction. A good resource for sharing. I look forward to the remaining topics. Thanks Boris!

 https://www.reddit.com/r/haskell/comments/mhs3ov/category_theory_illustrated/gt9xbp9?utm_source=share&utm_medium=web2x&context=3

> Awesome website! Well written and crystal clear. It's truly a feat to explain simply such a complex topic. 

https://news.ycombinator.com/item?id=26659190

> My God that site is beautiful. If only every "maths" site could looks like this, I'd have won a field medal!

https://news.ycombinator.com/item?id=26660369

> I saw your site on Hacker News. I just wanted to send a note saying it's beautiful! I have been writing Haskell (PureScript really) for years, and I've been wanting to get more into Category Theory. I'm excited to read through your site, and thanks for taking the time to create it!

(received by email)

> Thank you for creating Category Theory Illustrated, for me the book makes the concepts easier to understand and build an intuition.

(received by email)

Discussions:
---

Lobsters: https://lobste.rs/s/bc11fo/category_theory_illustrated_monoids

HackerNews: https://news.ycombinator.com/item?id=26658111


Twitter shares:
---

https://twitter.com/search?q=category-theory-illustrated&src=typed_query&f=live

