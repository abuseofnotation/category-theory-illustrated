---
layout: default
title: Types
---

In this chapter we will talk about types. This might be disappointing for you, if you expected to learn about as many *new* categories as possible (which you don't even suspect that they are categories till the unexpected reveal), as we've been talking about the category of types in a given programming language ever since the first chapter, and we already know how they form a category. We are also already familiar with the Curry-Howard correspondence that connects types and logic. However, types are not just about programming languages. And they are more than just another category. They are also at the heart of a mathematical theory known as *type theory*. 

Type theory is an alternative to set theory, as well as category theory itself, as a foundational language of mathematics, and it is as powerful tool as any of those formalisms. 

Sets, Types and Russell's paradox
===

We started talking about sets again. Most books about category theory (and mathematics in general) begin with sets, and often go back to sets. Even in a book about category theory like this one, the standard definitions of most mathematical objects involve sets. Indeed, upon hearing the definition about monoids being one-object categories, a person who only knows about sets might say:

> "Forget that! Have you seen a set? It's the same thing, but you also have this binary operation."

Or for *orders* as being categories with one morphism: 

> "Have you seen a set? It's the same thing, but some elements are bigger than others."

The reason for the prevalence of this set-centric viewpoint is actually trivial: *sets are simple to understand*, especially when we are operating on the conceptual level that is customary for introductory materials. We all, for example, group together a set of supplies that are needed for a given activity, (e.g. a *protractor*, a *compass*, and a *pencil* for the math class, or *paper*, a cans of *paint* and *brushes* when drawing) so as not to forget some of them. Or we group people that often hang out together as this or that company. And so, when we draw a circle around a few things, everyone knows what we are talking about. 

![Sets](../06_type/sets.svg)

However, this initial understanding of sets is somewhat *too simple*, (or *naive*, as mathematicians call it), as, when it is examined closely, it leads to a bunch of paradoxes which are not easy to resolve, the most famous of which is Russell's paradox.

Russell's paradox
---

Besides being interesting on its own right, Russell's paradox is one of the motivations for creating type theory, so we will start this chapter by understanding how and why it occurs. 

Most sets that we saw (like the empty set and singleton sets) do not contain *themselves*. 

![Sets that don't contains themselves](../06_type/sets_dont_contain_themselves.svg)

However, as the elements of sets are again sets, *a set can contain itself*. 

![A set that contains itself](../06_type/set_contains_itself.svg)

This ability is the root cause of Russel's paradox. 

The paradox occurs when we will try to visualize *the set of all sets that do not contain themselves*. In the original set notation, it can be defined, as the set such that it contains all sets $x$ such that $x$ is not a member of $x$ (or $\\\{x \mid x ∉ x \\\}$).

![Russel's paradox - option one](../06_type/russells_paradox.svg)

However, there is something wrong with this picture --- if we look at the definition, we recognize that the set that we just defined *also does not contain itself* and therefore it belongs there as well.

![Russel's paradox - option one](../06_type/russells_paradox_2.svg)

Hmm, something is not quite right here either --- because of the new adjustments that we made, our set now *contains itself*. 

And removing the set, so it's no longer an element of itself would just take us back to where we started, so we have no way to go --- this is Russell's paradox. 

Resolving the paradox in set theory
---

The set of sets that do not contain themselves doesn't sound like a ver useful set. And it really isn't --- in fact, I haven't seen it mentioned for any other reason, other than the construction of Russell's paradox. So, most people's initial reaction when learning about Russell's paradox would be something like this: 

>"Wait, can't we just add some rules that say that you cannot draw the set of set that don't contain itself?"

This was exactly what the mathematicians Ernst Zermelo and Abraham Fraenkel set out to do (no pun intended). And the extra rules they added led to a new definition of set theory, known as *Zermelo–Fraenkel set theory*, or *ZFC* (the *C* at the end is a separate story) which is a version of set theory that is free of paradoxes. ZFC was a success, and it is still in use today, however it compromises one of the best features that sets have, namely their *simplicity*. 

What do we mean by that? Well, the original formulation of set theory (which is nowadays called *naive* set theory) was based on just one (rather vague) rule/axiom: "Given a property P, there exists a set, containing all objects that have this property" i.e. any bunch of objects can form a set. 

![Naive set theory](../06_type/naive_sets.svg)

In contrast, ZFC is defined by a larger number of (more restrictive) axioms, as for example, the *axiom of pairing*, which states that given any two sets, there exist a set which contains them as elements.

![The axiom of pairing in ZFC](../06_type/zfc_pairing.svg)

...or *the axiom of union*, that states that if you have two sets you also have the set that contains all their elements.

![The axiom of union in ZFC](../06_type/zfc_union.svg)

There are a total of about 8 such axioms (depending on the flavour of the theory). They are curated in a way that allows us to construct all sets that are interesting, without being able to construct the infamous set that contain itself. However, accepting ZFC would mean accepting that set theory is not as simple and straightforward, as it looks like. 

Indeed, it is more complex than category theory, and more complex than this other theory about which we will learn about in a minute...

Resolving the paradox with type theory
---

While Zermelo was working on refining the axioms of set theory in order to avert Russell's paradox, Russell himself took a different route toward solving his paradox and decided to ditch sets altogether, and develop an entirely new mathematical concept that is free of paradoxes *by design*. One where you don't need to patch things up with extra axioms to avoid having illogical constructions. An so, in 1908, the same year in which Zermelo published the first version of ZFC,  Russell came up with his *theory of types*.

Type theory is not at all similar to set theory, but it is at the same time, not entirely different from it, as the concepts of *types* and *terms* are clearly reminiscent of the concepts of *sets* and *elements*. 

|Theory |Set theory| Type Theory|
|------ | ---------| --------|
|A(n) | Element     | Term       |
|Belongs to a | Set     | Type       |
|Notation | $a \in A$ |  $a : A$  | 

The biggest difference, between the two, when it comes to *structure* is that terms are bound to their types. 

So, while in set theory, one element can be a member of many sets

![A set and a subset](../06_type/set_subset.svg)

In type theory, a term can have only one type. (note that the red ball in the small circle is different from the red ball in the bigger circle)

![A type and a subtype](../06_type/type_subtype.svg)

Due to this law, types cannot contain themselves, so Russell's paradox, is entirely avoided. 

The law may sound weird e.g. because a term can only belong to one type, in type theory, the natural number 1 is denoted as $1: \mathbb{N}$) and it is an entirely separate object from the integer 1 (denoted or $1: \mathbb{Z}$) 

![A set and a subset](../06_type/int_nat_type.svg)

It only starts to make some sense once we realize that we can always convert the more general version of the value to the more specific one, using the image function that we learned about in the first chapter.

![A set and a subset](../06_type/int_nat_type_function.svg)

As you would see shortly, the concept of types has to do a lot with the concept of functions.


On types and sets again
---

> "Every propositional function φ(x)—so it is contended—has, in addition to its range of truth, a range of significance, i.e. a range within which x must lie if φ(x) is to be a proposition at all, whether true or false. This is the first point in the theory of types; the second point is that ranges of significance form types, i.e. if x belongs to the range of significance of φ(x), then there is a class of objects, the *type* of x, all of which must also belong to the range of significance of φ(x)" --- Bertrand Russell - Principles of Mathematics

In the last section, we almost fell in the trap of explaining types as something that is are "like sets, but... " (e.g. they are like sets, but a term can only be a member of one type). However, while it may be technically true, any such explanation would not be at all appropriate, as, while types started as alternative to sets, they actually ended up being quite different. So, thinking in terms of sets won't get you far. Indeed, if we take the proverbial set theorist from the previous section, and ask them about types, their truthful response would have be:

> "Have you seen a set? Well, it has nothing to do with it.


What is type theory
===

So let's see how do we define a type theory in its own right. 

But first...

Long disclaimer
---

Before we begin, let's get this long disclaimer out of the way:

Notice that in the last sentence we said *a* type theory, not "type theory" or "the type theory". This is because  there are not one, but many different (albeit related) formulations of type theory that are, confusingly, called type *theories* (and, less confusingly, *type systems*), such as *simply-typed lambda calculus* or *intuitionistic type theory*. For this reason, it makes sense to speak about *a* type theory.

Have I confused you enough? No?

The term "type theory" (uncountable) refers to the whole field of study of type theories, just like category theory is the study of categories. But, (take a deep breath) you can sometimes think of the different type systems as "different versions of type theory" and so, when people talk about a given set of features that are common to all type systems, they sometimes use the term "type theory" to refer to any random type system that has these features.

What are types?
---

Anyhow, let's get back to our subject (however we want to call it). As we said, type theory was born out of Russell's search for a way to define all collections of objects that are *interesting*, without accidentally defining collections that lead us ashtray (e.g. to his eponymous paradox), and without having to make up a multitude of additional axioms (a-la ZFC). 

He thought a lot (at least I imagine he did) and he managed to devise a formal system that fits all these criteria, based on a revolutionary new idea... which is basically the same idea that is at the heart of category theory (I don't know why he never got credit for being a category theory pioneer): 

> The *interesting* collections, the collections that we want to talk about in the first place, are the *collections that are the source and target of functions*.

Let's think again about the set of all sets that don't contain themselves. Besides being the cause of Russell paradox, this set is quite useless (unless we count causing paradoxes as useful). And if we dig into it, we eventually discover why: there are no functions from any other set to this set, so *we cannot get to it* from anywhere. And, conversely, we cannot get anywhere from it. This set is a oasis at the center of the dessert... or perhaps a little dessert in the center of big oasis... Contact me if you can think of some good metaphor.

<!--

![
THE STUDIO 
JENCEL
A set without functions is just a dead end
ALYSSA
Even worse, as a dead end is at least reachable.
](../comic/02.svg){: .comic-web-panel }

-->

Building types
---

We saw that type theory is not so different from set theory when it comes to *structure that it produces* --- all types are sets (although not all sets are types) and all functions are... well functions. However, type theory is very different from set theory when it comes to *the way the structure comes about*, in the same way as the intuitionistic approach to logic is different from the classical approach (by the way, if this metaphor made the connection between type theory and intuitionistic logic too obvious for you, do me a favour, please don't mention it and act surprised when we make it explicit).

In set theory, (and especially in its naive version) all possible sets and functions are *already there from the start*, as the Platonic world of forms. What we do is merely exploring the ones that interests us.

![Sets and functions in set theory](../06_type/set_theory_functions.svg)

In type theory, we start with a space that is empty.

*[diagram ommited]*

From there, we have to build our types. One by one. With our bare hands (OK, we do have some cool mathematical tools that assist us).

Type formation, term introduction, term elimination
---

> "In general, we can think of data as defined by some collection of selectors and constructors, together with specified conditions that these procedures must fulfill in order to be a valid representation." --- Harold Abelson, Gerald Jay Sussman, Julie Sussman --- Structure and Interpretation of Computer Programs

Before introducing the specific formulae for building types, I want to elaborate on the general idea. In the last section, we said:

> The interesting collections, the collections that we want to talk about in the first place, are the collections that are the *source* and *target* of functions.

This definition may seem a bit vague, but it is trivial when we look at how types are defined in computer programming. It is obvious, even when viewed through the lense of traditional imperative languages, that the definition of a type consists of the definitions of rules for constructing functions and more generally morphisms.

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

What kinds of rules? We can categorize them in three groups.

1. First off, a type has to have a *definition* which specifies what it is. Note that this is not a morphism from one type to the other, but from one type universe, to another type universe to another. In type theory, this is known as a *type formation rule*. 

![A type represented as a ball](../06_type/rule_type_formation.svg)

2. Next up, a type has to have at least one at least one arrow pointing to the new type. 
In programming, this arrow is called a *constructor*. In type theory, this is known as a *term introduction rule* ("term" being the word for "value").

![A type and an arrow pointing towards it](../06_type/rule_term_introduction.svg)

3. Finally, as we don't want to construct types just for the sake of constructing new types, a type has to have at least one arrow coming from the new type.  In programming, these are the type's methods. In type theory, this is known as a *term elimination rule* (as if we are eliminating the type by replacing it with the result of the method).

![A type and an arrow, coming from it ](../06_type/rule_term_elimination.svg)


OK, I think we got too far in trying to define type theory without actually defining type theory, so we will proceed with the formulas... after our second long disclaimer.

Picking a theory (another long disclaimer)
---

As we said in the first long disclaimer, there is not one, but many type theories, so if we want to do type theory, we we have to pick one type theory, to work with (if this sentence confuses you, read the disclaimer again).

Picking a type theory, or type system let's call it, also involves picking a *language* that this theory is described in terms of. When hearing about language, programmers would probably think of the popular feature-rich programming languages, like TypeScript or Java. *Type theorists*, on the other hand, have different preferences --- since they are interested in the type system, not the language, they don't really care about language features, and so the language of choice of most of them is the simplest, most minimal language that is possible to exist, namely *Lambda Calculus*. If you haven't heard about it, this is language that has only has (anonymous) functions and nothing else.

To please both parties (or to annoy them both), we will go with a language that is somewhere in between --- namely (a subset of) *Haskell*. This will not make much difference in terms of the theory, as Haskell is based on Lambda calculus, but will make things easier for programmers. Unlike Lambda Calculus that, which only has functions, Haskell supports defining product constructors as a primitive (which itself makes no difference from a formal standpoint, as we can easily go from products to functions via currying and uncurrying). 

Also, last but not least, Haskell constructors and functions can have names (believe me, this helps).

Since we are picking Haskell, we will work in the type theory/type system of Haskell. This is a type system, discovered by Jean-Yves Girard in 1972, called polymorphic lambda calculus or *System F*. 

Base types. The boolean type
===

So, let's start with an empty space, when nothing is defined. 

![An empty diagram](../06_type/empty_type.svg)

In Haskell we can do that by removing the standard library, (called "Prelude") which is typically imported implicitly.

```haskell
{-# LANGUAGE NoImplicitPrelude #-}
```
And we use one more extension, that would allow us to write type definitions that are a bit more explicit.

```haskell
{-# LANGUAGE GADTs, NoImplicitPrelude #-}
```

So, let's define some types. But how? Let's start with base types, like the *booleans*. For them, the process is quite simple, because we can just straight out *list out their values*.

```haskell
data Bool where
  True  :: Bool
  False :: Bool
```
Let's go through this definition:

Type formation
---

First, `data Bool`, says that there exist a datatype that we call "Bool".

![The Boolean type without values --- an empty circle](../06_type/bool_type_empty.svg)


Term introduction
---

Then, `True :: Bool` says that "$True$ is a boolean" i.e. it adds one value to this newly created datatype. 

![ The Boolean type with one value: a circle with one ball --- True](../06_type/bool_type_true.svg)

And `False :: Bool` creates another such value.

![The full Boolean type: a circle with two balls True and False](../06_type/bool_type_full.svg)

Et voila, we have just defined a type!

Wait, didn't we say that types are defined by arrows? Yes, but we have to start from somewhere, and so Haskell allows you to define some primitive types directly. And if we want to go fully arrow-driven, we can do what we did in chapter 2 and represent those types as arrows from the *initial type* (but we have to define the initial type as a primitive).

Term elimination
---

And are we done? Not quite, for we must define at least one arrow, coming *from* our new type, for it to be useful in any way (otherwise, it will just be a one-way street). For the Booleans, this function is called `ifElse`

```haskell
ifElse :: forall a. Bool -> a -> a -> a
ifElse True a b = a 
ifElse False a b = b


```
You can see that the functions in Haskell are pretty rudimentary to define --- you just map each individual value of one type, to the value of another one.

Here are some expressions which use the function accompanied with indications of what they return (`--` is Haskell's comment syntax)

```haskell
ifElse True 1 2 --1
ifElse False 1 2 --2
```

Isomorphisms between types
---

But why (with the risk of repeating myself) does this exact type has to be the Boolean type? What is stopping our colleague Bobby who always wants to do everything their way, to define their own version of Boolean and using it in their project.

```haskell
data BobbysBool where
  BobbysTrue  :: Bool
  BobbyFalse :: Bool
```

The answer is "nothing". But that is not a huge deal --- we can just whip up a function to convert their Bool to ours:

```haskell
convert BobbysBool -> Bool
convert BobbysTrue = True
convert BobbyFalse = False
```

This function is also reversible. Which means that the two types are isomorphic i.e. they are one and the same type, *up to a (unique) isomorphism*.

Polymorphic types. The Maybe type
===

Now, we will define the type we in Haskell call, `Maybe` (and what in other languages is usually called `Option`). If you haven't encountered it, the Haskell documentation provides a very good description:

>The Maybe type encapsulates an optional value. A value of type Maybe a either contains a value of type a (represented as `Just a`), or it is empty (represented as `Nothing`). Using `Maybe` is a good way to deal with errors or exceptional cases without resorting to drastic measures such as error.

But, once you learn to read it, the type definition, by itself is clear enough:

```haskell
data Maybe a where
  Nothing :: forall a. Maybe a
  Just :: forall a. a -> Maybe a
```
Here is a brief description

Type formation
---

Maybe is the second simplest type, after `Bool` and it looks a lot like `Bool`, but, unlike `Bool`, `Maybe` is a *polymorphic* type, as we can tell by looking at the *type formation rule*

```haskell
data Maybe a 
```

Maybe is different from Bool in that it is polymorphic. i.e. there is not just one `Maybe`, but many `Maybe`'s --- one for each type `a` e.g. if there is `Bool`, there is also`Maybe Bool`.

![The `Maybe Boolen` type without values --- A type-universe function, connecting the Bool circle to a new empty circle.](../06_type/maybe_type_empty.svg)

Polymorphic types are a morphisms from the universe of types, to itself (i.e. the kind of `Maybe` is `Type -> Type`), while `Bool` is just a `Type`.

Term introduction
---
Now, it's time to fill our type.

The first line is similar to what we saw with boolean. It says that there is a value called `Nothing` in each `Maybe` type.

```haskell
  Nothing :: forall a. Maybe a
```
So, here it is (we are drawing just `Maybe Boolean`, but the other `Maybe` types would look similar).

![The `Maybe Boolen` type without values: A type-universe function, connecting the Bool circle to a new empty circle.](../06_type/maybe_type_nothing.svg)


Of course there would be no point in having many `Maybe`s if they all are all isomorphic to each other. That's where the second line comes.

```haskell
  Just :: forall a. a -> Maybe a
```
The constructor `Just` represents an arrow from type `a` to type `Maybe a` e.g. from `Boolean` to `Maybe Boolean`.

![The `Maybe Boolen` type without values: A type-universe function, connecting the Bool circle to a new empty circle.](../06_type/maybe_type_full.svg)


Term elimination
---

The `Maybe` type is used for handling errors i.e. for defining *partial functions*. Let's say we want to define a function that does not have an arrow for all values in the source. Does this mean that this function cannot be defined?

![A partial function from  `Nat` to `Boolen`: returns False for composite numbers, True for primes and is not defined for 0 and 1](../06_type/isprime_int_bool.svg)

No, we just have to wrap the target type in `Maybe` and it becomes a regular function.

![A function from  `Nat` to `Maybe Boolen`: returns `Just False` for composite numbers, `Just True` for primes and `Nothing` for 0 and 1](../06_type/isprime_int_maybe_bool.svg)

To close the case, we define one good function for deconstructing/eliminating the type maybe i.e. to convert it to something else, by using a function for converting its underlying type.


```haskell
maybe :: forall a b. b -> (a -> b) -> Maybe a -> b
maybe n _ Nothing  = n
maybe _ f (Just x) = f x
```
Notice that this function defines an arrows from type `Maybe a` to any type `b`, provided that a function `a -> b` (and a value of `b`) is provided.

Inductive types. The natural number type.
===

Learning mathematics can feel overwhelming, because of the huge, even infinite, body of knowledge: how do you proceed so big of a task? But it turns out the answer is simple: you start off knowing 0 things, 0 theories. Then, you learn 1 theory - congrats, you have learned your first theory and so you would know a total of 1 theories. Then, you learn 1 more theory and you would already know a total of 2 theories. Then learn 1 more theory and then 1 more and, given enough time and dedication, you may learn all theories.

This argument applies not only to mathematical theories, but to everything else that is "countable", so to say. This is because it is the basis of the mathematical definition of natural numbers, as famously synthesized in the 19th century by the Italian mathematician Giuseppe Peano.

1. $0$ is a natural number.
2. If $n$ is a natural number, $n+1$ is a natural number.

(There are some laws as well, but we will cover them later.)

Or as we Haskellians say:

```haskell
data Nat where
  Zero :: Nat
  Succ :: Nat -> Nat
```
Let's follow the arrows. 


Type formation
---

The first line indicates that the natural numbers type is a normal non-polymorphic, or "monomorphic" type.

```haskell
data Nat 
```

Term introduction
---

The first constructor is also 

```haskell
  Zero :: Nat
```


```haskell
  Succ :: Nat -> Nat
```

Term elimination
---


More precisely, we can define arrows not only from an existing types to new ones, but *products* of existing types to new ones.  There is not so much to say, as Haskell products work pretty much like regular products, except they can accept any number of arguments, from 0 to infinity (actually it's probably less than that, but nevermind). 

Composite types. The list type.
===

Type formation
---

Term introduction
---

Term elimination
---

<!--
{% if site.distribution == 'print' %}
-->

Interlude: From Haskell and System F
===

<!--
{%endif%}
-->



Types and logic
===



Types and Category Theory
===

Now, let's see the categorical perspective of what are we taling about. We already know that a type corresponds to an *object* in the category of types, and a categorical object has to have at three kinds of morphisms in order for the object to play a role in the category, which correspond to the three types of functions in programming.

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


Interlude: Terminal objects are nullary products
---

Natural deduction
===

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


The product type
---

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



<!--
{% if site.distribution == 'print' %}
-->

Answers
===

<!--
{%endif%}
-->
