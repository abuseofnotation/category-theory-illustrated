---
layout: default
title: Types
---


In this chapter we will talk about types. This might be disappointing, if you expected to learn about as many *new* categories as possible (for which you don't even suspect that they are categories till the unexpected reveal), as we've been giving examples with the category of types in a given programming language ever since the first chapter, and so we already know how they form a category. We are also already familiar with the Curry-Howard correspondence that connects types and logic. However, types are not just about programming languages, and they are not just another category. They are also at the heart of a mathematical theory known as *type theory*. They are an alternative to set theory, as well as category theory itself, as a foundational language of mathematics, and they are as powerful tool as any of those formalisms.

Sets, Types and Russell's paradox
===

Sets
---

So, here we are, back at sets. We discussed once, that most books about category theory (and mathematics in general) begin with sets, and often go back to sets. Even in a book about category theory like this one, the standard definitions of most mathematical objects start by "It like is a set, but..."

* **Category** --- It is a like set, but you don't see the sets, not their elements (or alternatively: "It is like a set, but elements are connected").
* **Monoid** --- It is like a set, but you also have this binary operation.
* **Order** --- It is like a set, but the elements are ordered.

**Task:** Provide short definitions of these objects that don't mention sets.

The reason for the prevalence of this set-centric viewpoint (I used to be baffled by it, but now I get it) is that *sets are simple to understand*, especially when we are operating on the conceptual level that is customary for introductory materials. We all, for example, group together a set of supplies that are needed for a given activity, (e.g. a protractor, a compass, and a pencil for the math class, or paper, paint and brush when drawing) so as not to forget some of them. Or we group people that often hang out together as this or that company. And so, when we draw a circle around a few things, everyone knows what we are talking about. 

![Sets](../06_type/sets.svg)

However, this initial understanding of sets is somewhat *too simple*, (or *naive*, as mathematicians call it), as, when it is examined closely, it leads to a bunch of paradoxes which are not easy to resolve. The most famous of them is Russell's paradox.

Russell's paradox
---

Besides being interesting on its own right, Russell's paradox is one of the motivations for creating type theory, so we will start this chapter by understanding how and why it occurs. 

Most sets that we discussed (like the empty set and singleton sets) do not contain *themselves*. 

![Sets that don't contains themselves](../06_type/sets_dont_contain_themselves.svg)

However, in set theory everything is a set, and the elements of sets are again sets, so *a set can contain itself*. This is the root cause of Russel's paradox. 

![A set that contains itself](../06_type/set_contains_itself.svg)


In order to understand Russell's paradox, we will try to visualize *the set of all sets that do not contain themselves*. In the original set notation, it can be defined, as the set such that it contains all sets $x$ such that $x$ is not a member of $x$ (or $\\\{x \mid x ∉ x \\\}$).

![Russel's paradox - option one](../06_type/russells_paradox.svg)

However, there is something wrong with this picture --- if we look at the definition, we recognize that the set that we just defined *also does not contain itself* and therefore it belongs there as well.

![Russel's paradox - option one](../06_type/russells_paradox_2.svg)

Hmm, something is not quite right here either --- because of the new adjustments that we made, our set now *contains itself*. 

And removing the set, so it's no longer an element of itself would just take us back to where we started, so we have no way to go --- this is Russell's paradox. 

Resolving the paradox in set theory
---

The set of sets that do not contain themselves doesn't sound like a ver useful set. And it really isn't --- in fact, I haven't seen it mentioned for any other reason, other than the construction of Russell's paradox. So, most people's initial reaction when seeing it would be something like:

![
THE STUDIO 
ART STUDENT
Wait, can't we just add some rules 
that say that you cannot draw 
the set of set that don't contain itself?
](../comic/01.svg){: .comic-web-panel }

This was exactly what Ernst Zermelo and Abraham Fraenkel set out to do (no pun intended). And the extra rules they added led to a new definition of set theory, known as *Zermelo–Fraenkel set theory*, or *ZFC* (the *C* at the end is a separate story) which is a version of set theory that is free of paradoxes. ZFC was a success, and it is still in use today, however it compromises one of the best features that sets have, namely their *simplicity*. 

What do we mean by that? Well, the original formulation of set theory (which is nowadays called *naive* set theory) was based on just one (rather vague) rule/axiom: "Given a property P, there exists a set, containing all objects that have this property" i.e. any bunch of objects can form a set. 

![Naive set theory](../06_type/naive_sets.svg)

In contrast, ZFC is defined by a larger number of (more restrictive) axioms, as for example, the *axiom of pairing*, which states that given any two sets, there exist a set which contains them as elements.

![The axiom of pairing in ZFC](../06_type/zfc_pairing.svg)

...or *the axiom of union*, that states that if you have two sets you also have the set that contains all their elements.

![The axiom of union in ZFC](../06_type/zfc_union.svg)

There are a total of about 8 such axioms (depending on the flavour of the theory), curated in a way that allows us to construct all sets that are interesting, without being able to construct sets that lead to a contradiction. However, as we said. However, accepting ZFC would mean accepting that set theory is not as simple and straightforward, as it looks like. Indeed, it is more complex than category theory, and than this other theory which we will learn about in a minute...

Resolving the paradox with type theory
---

While Zermelo was working on refining axioms of set theory in order to avert Russell's paradox, Russell himself took a different route towards solving his paradox and decided to ditch sets altogether, and develop an entirely new mathematical concept that is free of paradoxes *by design*, one where you don't need to patch things up with extra axioms to avoid having illogical constructions. An so, in the same year  in which Zermelo published the first version of ZFC, (1908) Russell came up with his *theory of types*.

Type theory is not at all similar to set theory, but it is at the same time, not entirely different from it, as the concepts of *types* and *terms* are clearly reminiscent of the concepts of *sets* and *elements*. 

|Theory |Set theory| Type Theory|
|------ | ---------| --------|
|An | Element     | Term       |
|Belongs to a | Set     | Type       |
|Notation | $a \in A$ |  $a : A$  | 

The biggest difference, between the two, when it comes to *structure* is that terms are bound to their types. 

So, while in set theory, one element can be a member of many sets

![A set and a subset](../06_type/set_subset.svg)

In type theory, a term can have only one type. (note that the red ball in the small circle is different from the red ball in the bigger circle)

![A type and a subtype](../06_type/type_subtype.svg)

Due to this law, types cannot contain themselves, so because of it, Russell's paradox, is entirely avoided. 

The law may sound weird --- we are basically saying that if you have the type **Human** that contains all humans and the type **Mathematician** that contains all mathematicians, than the mathematician **Jencel** is a different object than the human **Jencel**.

<!--comic(and no, I am not implying that mathematicians aren't human). -->

It only starts to make some sense once we realize that we can always convert the more general version of the value to the more specific one, using the image function that we learned about in the first chapter.

![A type and a subtype with a function](../06_type/type_subtype_function.svg)

As you would see shortly, the concept of types has to do a lot with the concept of functions.

What are types
===

> "Every propositional function φ(x)—so it is contended—has, in addition to its range of truth, a range of significance, i.e. a range within which x must lie if φ(x) is to be a proposition at all, whether true or false. This is the first point in the theory of types; the second point is that ranges of significance form types, i.e. if x belongs to the range of significance of φ(x), then there is a class of objects, the *type* of x, all of which must also belong to the range of significance of φ(x)" --- Bertrand Russell - Principles of Mathematics


On types and sets again
---

In the last section, we almost fell in the trap of explaining types as something that is are "like sets, but... " (e.g. they are like sets, but a term can only be a member of one type). However, while it may be technically true, any such explanation would not be at all appropriate, as, while types started as alternative to sets, they actually ended up being quite different. So, thinking in terms of sets won't get you far as a type theorist. 

Indeed, if I get to rephrase an old Bulgarian joke, if a person who only knows sets, has to explain what monoids are, they can just say: 

"Have you seen a set? It's the same thing, but you also have this binary operation."

Or *orders*: 

"Have you seen a set? It's the same thing, but you also have this notion that some elements are bigger than others."

But for *types*, their response would be:

"Have you seen a set? Well, that's something completely different."

So let's see how do we define a type theory in its own right.

Long disclaimer
---

Notice that in the last sentence we said *a* type theory, not "type theory" or "the type theory". This is because (time for a long disclaimer) there are not one, but many different (albeit related) formulations of type theory that are, confusingly, called type *theories* (and, less confusingly, *type systems*), such as *simply-typed lambda calculus* or *intuitionistic type theory*. For this reason, it makes sense to speak about *a* type theory. <!--comic: Dr. Smisloff --- I think they are not confused enough --> 

The term "type theory" (uncountable) refers to the whole field of study of type theories, just like category theory is the study of categories. But, (take a deep breath) you can sometimes think of the different type systems as "different versions of type theory" and so, when people talk about a given set of features that are common to all type systems, they sometimes use the term "type theory" to refer to any random type system that has these features. 

What are types?
---

Anyhow, let's get back to our subject (however we want to call it). As we said, type theory was born out of Russell's search for a way to define all collections of objects that are *interesting*, without accidentally defining collections that lead us ashtray (e.g. to his eponymous paradox), and without having to make up a multitude of additional axioms (a-la ZFC). 

He thought a lot (at least I imagine he did) and he managed to devise a formal system that fits all these criteria, based on a revolutionary new idea... which is basically the same idea that is at the heart of category theory (I don't know why he never got credit for being a category theory pioneer): the *interesting* collections, the collections that we want to talk about in the first place, are the *collections that are the source and target of functions*.

Let's think again about the set of all sets that don't contain themselves. Besides being the cause of Russell paradox, this set is quite useless (if we count causing paradoxes as useful). And if we dig into it, we eventually discover the reason for this: there are no functions from any other set to this set, so *we cannot get to it* from anywhere (and, conversely, we cannot get anywhere from it, as there are no functions for which it is the source). 

![
THE STUDIO 
JENCEL
A set without functions is just a dead end
ALYSSA
Even worse, as a dead end is at least reachable.
](../comic/02.svg){: .comic-web-panel }

Building types
===

We saw that type theory is not so different from set theory when it comes to *structure that it produces* --- all types are sets (although not all sets are types) and all functions are... well functions. However, type theory is very different from set theory when it comes to *the way the structure comes about*, in the same way as the intuitionistic approach to logic is different from the classical approach (by the way, if this metaphor made the connection between type theory and intuitionistic logic too obvious for you, do me a favour, please don't mention it and act surprised when we make it explicit).

In set theory, (and especially in its naive version) all possible sets and functions are *already there from the start*, as the Platonic world of forms. What we do is merely exploring the ones that interests us.

![Sets and functions in set theory](../06_type/set_theory_functions.svg)

In type theory, we start with a space that is empty. 

[digram ommitted] 

From there, we have to build our types. One by one. With our bare hands (OK, we do have some cool mathematical tools that assist us).

We can define some finite types, like the *booleans*, by just listing out their values, for example when we say "$\top$ is a Boolean".

And then "$\bot is a boolean". Et voila, we have just defined a type.

Then, we start defining functions (and other kinds of morphisms), and only *through the functions* we create the non-primitive types.

do the types come to be. 

Because a term can only belong to one type, in type theory, the natural number 1 is denoted as $1: \mathbb{N}$) and it is an entirely separate object from the integer 1 (denoted or $1: \mathbb{Z}$) 

![A set and a subset](../06_type/int_nat_type.svg)

In programming
----

> "In general, we can think of data as defined by some collection of selectors and constructors, together with specified conditions that these procedures must fulfill in order to be a valid representation." --- Harold Abelson, Gerald Jay Sussman, Julie Sussman --- Structure and Interpretation of Computer Programs

After exploring something so abstract, I think it's good to get our hands dirty with some more concrete. We already have some idea of what a type is: a type is a collection of terms, that is the source and target of *functions*. This definition may seem a bit vague, but it is trivial when we look at how types are defined in computer programming.

```
class MyType<A> {

  a: A;
  constructor(a) {
    this.a = a;
  }

  getA() {
    return this.a;
  }

}
```

It is obvious, even when viewed through the lense of traditional imperative languages, that the definition of a type consists of the definitions of *a bunch of functions*. However, not just any random collection of functions would suffice -- there are 3 special kinds of functions that have to be defined in order for a type to work. 

First off, a type has to have a *definition* which specifies what it is. Note that this is not a function between values, but a function between types --- a *type-level function*. In programming, we call these types of functions *generic types*, but they are functions nevertheless --- we supply some types and get a definition of the new type.

```
class MyType<A> {
  a: A;
```

(For non-generic types, the rule would correspond to a type-level function with no arguments, which would correspond to a (non-generic) type.)

Next up, a type has to have at least one *constructor* which allows us to produce a value/term of that type. The constructor is a "normal" value-level function.

```
  constructor(a) {
    this.a = a;
  }
```

Finally, a type has to have at least one *method* in order to be useful --- we don't want to construct types just for the sake of constructing new types. 

Methods are functions that allow us to do something with a value of that type, once we constructed it.

```
  getA() {
    return this.a;
  }
```

(There are also methods that mutate the type's properties, but we don't talk about these in functional programming.)

In Category Theory
---

Now, let's see the categorical perspective of what are we taling about. We already know that a type corresponds to an *object* in the category of types, and a categorical object has to have at three kinds of morphisms in order for the object to play a role in the category, which correspond to the three types of functions in programming.

Firstly, a categorical object has to have a morphism that defines it. This one is more special, as it is not an ordinary morphism in the object's category, but we will discuss what exactly it is later (it is connected to the idea of a universal property.)

Secondly, a categorical object has to have at least one morphism coming *to* it, from some other object in the category. In other words, it has to be the *target* of at least one arrow.

And thirdly, it has to have morphisms from it to some other objects. Has to be the *source* of at least one arrow.

In type theory
---

We will now see how these type-creating functions look like in type theory. 


The functions that define a type are called *typing rules* and each of them has a name.


For this, we need to get to know the formal language that is used for defining them, called *natural deduction*.

$$\frac
  {A \; \mathrm{type}}
  {MyType \; A \; \mathrm{type}}
$$

$$\frac
  {a : A}
  {mytype\;a : MyType \; A}
$$

$$\frac
  {mytype\;a : MyType \; A}
  {a : A}
$$


Typing rules and the principle of substitution
===

So, why do we call morphisms in type theory *rules*? To understand that, we have to understand the principle that is underneath all of type theory --- the principle of substitution.

We already saw that functions in type theory and set theory look identical --- 

However, in set theory, sets are just assumed to exist, as for example the set of colors, as any other set is just assumed to exist.

And type theory, functions are build.


These ways, type theory holds, is nothing more than the process of *substituting* one value with another, according to a finite number of rules.

This principle is also underneat the way axiom schemas are used in logic, but it is actually much more general than that. It is also the principle behind algrebra in general e.g. the rules of addition are nothing but rules that define when can you substitute a value to another.

But wait, are substitution rules really powerful enough to represent all functions? How would we go about in representing types that have an infinite number of terms (such as the natural numbers), and functions between them (such as the `sum` function).


Type theory and logic
--- 

Type theory and computation
---


The product type
===

> "In general, we can think of data as defined by some collection of selectors and constructors, together with specified conditions that these procedures must fulfill in order to be a valid representation." --- Hal Abelson Jerry Sussman and Julie Sussman, SICP 

Type formation rules
---

When we define a new type we firstly want to *provide a type definition* show what the type should look like. This is known as the *type-formation rule*. 

$$\frac{\Gamma \vdash A \; \mathrm{type} \quad \Gamma \vdash B \; \mathrm{type}}{\Gamma \vdash A \times B \; \mathrm{type}}$$

Term introduction rules
---

OK, now that we have the definition of the type, we would typically want a way to create values from that type or, in other words we would need *constructors*.

```
  constructor(a, b) {
    this.a = a;
    this.b = b;
  }
```

In type-theoretic terms, we would call constructor a *term introduction rule*, (*term* being the type-theoretic word for value).


Introduction rules for product types:

$$\frac{\Gamma \vdash A \; \mathrm{type} \quad \Gamma\vdash B \; \mathrm{type}}{\Gamma, x:A, y:B \vdash (x, y):A \times B}$$

Term elimination rules
---

$$\frac{\Gamma \vdash A \; \mathrm{type} \quad \Gamma \vdash B \; \mathrm{type}}{\Gamma, z:A \times B \vdash \pi_1(z):A} \qquad \frac{\Gamma \vdash A \; \mathrm{type} \quad \Gamma \vdash B \; \mathrm{type}}{\Gamma, z:A \times B \vdash \pi_2(z):B}$$

Computation rule
---

$$\frac{\Gamma \vdash A \; \mathrm{type} \quad \Gamma\vdash B \; \mathrm{type}}{\Gamma, x:A, y:B \vdash \beta_{\times 1}(x, y):\pi_1((x, y)) =_A x} \qquad \frac{\Gamma \vdash A \; \mathrm{type} \quad \Gamma \vdash B \; \mathrm{type}}{\Gamma, x:A, y:B \vdash \beta_{\times 2}(x, y):\pi_2((x, y)) =_{B} y}$$

Uniqueness rules 
---

$$\frac{\Gamma \vdash A \; \mathrm{type} \quad \Gamma \vdash B \; \mathrm{type}}{\Gamma, z:A \times B \vdash \eta_{\times}(z):z =_{A \times B} (\pi_1(z), \pi_2(z))}$$



Types as mathematical foundation
===

Types and computation
===

Types and logic
===


Numbers as types
===

Learning mathematics, can feel overwhelming, because of the huge, even infinite, body of knowledge: how do you proceed so big of a task? But it turns out the answer is simple: you start off knowing 0 things, 0 theories. Then, you learn 1 theory - congrats, you have learned your first theory and so you would know a total of 1 theories. Then, you learn 1 more theory and you would already know a total of 2 theories. Then learn 1 more theory and then 1 more and, given enough time and dedication, you may learn all theories.

This little argument applies not only to learning mathematical theories, but to everything else that is "countable", so to say. This is because it is the basis of the mathematical definition of natural numbers, as famously syntesized in the 19th century by the Italian mathematician Giuseppe Peano:

1. $0$ is a natural number.
2. If $n$ is a naturan number, $n+1$ is a natural number.

And then, he gave the following laws.


Types and categories
===

In thinking of a category as a type theory, the objects of a category are
regarded as types (or sorts) and the arrows as mappings between the corresponding
types. Roughly speaking, a category may be thought of a type theory shorn of
its syntax. In the 1970s Lambek20 established that, viewed in this way, cartesian
closed categories correspond to the typed λ-calculus. Later Seely [1984] proved
that locally Cartesian closed categories correspond to Martin-L¨of, or predicative,
type theories. Lambek and Dana Scott independently observed that C-monoids,
i.e., categories with products and exponentials and a single, nonterminal object
correspond to the untyped λ-calculus. The analogy between type theories and
categories has since led to what Jacobs [1999] terms a “type-theoretic boom”,
with much input from, and applications to, computer science
