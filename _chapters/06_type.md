---
layout: default
title: Types
---

# Types

In this chapter we will talk about types. This might be disappointing for you, if you expected to learn about as many *new* categories as possible (which you don't even suspect are really categories till the unexpected reveal)---we've been talking about the category of types in a given programming language ever since the first chapter, and we already know how they form a category. However, types are not just about programming languages. And they are more than just another category. They are also at the heart of a mathematical theory known as *type theory*. 

Type theory is an alternative to set theory, as well as category theory itself, as a foundational language of mathematics, and it is as powerful a tool as any of those formalisms. 

## Sets, Types and Russell's paradox

We started talking about sets again. Most books about category theory (and mathematics in general) begin with sets, and often go back to sets. Even in a book about category theory, like this one, the standard definitions of most mathematical objects involve sets. Indeed, upon hearing the definition about monoids being one-object categories, a person who only knows about sets might say:

> "Forget that! Have you seen a set? It's the same thing, but you also have this binary operation."

Or for *orders* as being categories with one morphism: 

> "Have you seen a set? It's the same thing, but some elements are bigger than others."

The reason for the prevalence of this "set-centric" viewpoint is actually trivial: *sets are simple to understand*, especially when we are operating on the conceptual level that is customary for introductory materials. 

We all, for example, group together a set of supplies that are needed for a given activity, (e.g. a *protractor*, a *compass*, and a *pencil* for the math class, or *paper*, cans of *paint* and *brushes* when drawing) so as not to forget some of them. Or we group people that often hang out together as this or that company. And so, when we draw a circle around a few things, everyone knows what we are talking about. 

![Sets](../06_type/sets.svg)

However, this initial understanding of sets is somewhat *too simple*, (or *naive*, as mathematicians call it), as, when it is examined closely, it leads to a bunch of paradoxes which are not easy to resolve, the most famous of which is Russell's paradox.

### Russell's paradox

Besides being interesting in its own right, Russell's paradox is one of the motivations for creating type theory, so we will start this chapter by understanding how and why it occurs. 

Most sets that we saw (like the empty set and singleton sets) do not contain *themselves*. 

![Sets that don't contain themselves](../06_type/sets_dont_contain_themselves.svg)

However, as the elements of sets are again sets, *a set can contain itself*. 

![A set that contains itself](../06_type/set_contains_itself.svg)

This ability is the root cause of Russell's paradox. 

The paradox occurs when we try to visualize *the set of all sets that do not contain themselves*. In the original set notation, it can be defined, as the set such that it contains all sets $x$ such that $x$ is not a member of $x$ (or $\{x \mid x \notin x\}$).

![Russell's paradox - option one](../06_type/russells_paradox.svg)

However, there is something wrong with this picture --- if we look at the definition, we recognize that the set that we just defined *also does not contain itself* and therefore it belongs there as well.

![Russell's paradox - option one](../06_type/russells_paradox_2.svg)

Hmm, something is not quite right here either --- because of the new adjustments that we made, our set now *contains itself*. 

And removing the set, so it's no longer an element of itself would just take us back to where we started, so we have no way to go --- this is Russell's paradox. 

### Resolving the paradox with sets

The set of sets that do not contain themselves doesn't sound like a very useful set. And it really isn't --- in fact, I haven't seen it mentioned for any other reason, other than the construction of Russell's paradox. So, most people's initial reaction when learning about Russell's paradox would be something like this: 

>"Wait, can't we just add some rules that say that you cannot draw the set of sets that don't contain themselves?"

This was exactly what the mathematicians Ernst Zermelo and Abraham Fraenkel set out to do (no pun intended). And the extra rules they added led to a new definition of set theory, known as *Zermelo–Fraenkel set theory*, or *ZFC* (the *C* at the end is a separate story) which is a version of set theory that is free of paradoxes. ZFC was a success, and it is still in use today, however it compromises one of the best features that sets have, namely their *simplicity*. 

What do we mean by that? Well, the original formulation of set theory (which is nowadays called *naive* set theory) was based on just one (rather vague) rule/axiom: "Given a property P, there exists a set, containing all objects that have this property" i.e. any bunch of objects can form a set. 

![Naive set theory](../06_type/naive_sets.svg)

In contrast, ZFC is defined by a larger number of (more restrictive) axioms, as for example, the *axiom of pairing*, which states that given any two sets, there exists a set which contains them as elements.

![The axiom of pairing in ZFC](../06_type/zfc_pairing.svg)

...or *the axiom of union*, that states that if you have two sets you also have the set that contains all their elements.

![The axiom of union in ZFC](../06_type/zfc_union.svg)

There are a total of about 8 such axioms (depending on the flavour of the theory). They are curated in a way that allows us to construct all sets that are interesting, without being able to construct the infamous set that contains itself. However, accepting ZFC would mean accepting that set theory is not as simple and straightforward, as it looks like. 

Indeed, it is more complex than category theory, and more complex than the other theory which we will learn about in a minute...

### Resolving the paradox with types


While Zermelo was working on refining the axioms of set theory in order to avert Russell's paradox, Russell himself took a different route towards solving his paradox and decided to ditch sets altogether, and develop an entirely new mathematical concept that is free of paradoxes *by design* -- one where you don't need to patch things up with extra axioms to avoid having illogical constructions. And so, in 1908, the same year in which Zermelo published the first version of ZFC,  Russell came up with his *theory of types*.

Type theory is not at all similar to set theory, but it is at the same time, not entirely different from it, as the concepts of *types* and *terms* are clearly reminiscent of the concepts of *sets* and *elements*. 

|Theory |Set theory| Type Theory|
|------ | ---------| --------|
|    | Element     | Term       |
|Belongs to a | Set     | Type       |
|Notation | $a \in A$ |  $a : A$  | 

The biggest difference, between the two, when it comes to *structure* is that terms are bound to their types. 

So, while in set theory, one element can be a member of many sets

![A set and a subset](../06_type/set_subset.svg)

In type theory, a term can have only one type. (note that the red ball in the small circle is different from the red ball in the bigger circle)

![A type and a subtype](../06_type/type_subtype.svg)

Due to this law, types cannot contain themselves, so Russell's paradox, is entirely avoided. 

The law may sound weird e.g. because a term can only belong to one type, in type theory, the natural number 1 is denoted as $1: \mathbb{N}$ and it is an entirely separate object from the integer 1 (denoted as $1: \mathbb{Z}$) 

![A set and a subset](../06_type/int_nat_type.svg)

It only starts to make some sense once we realize that we can always convert one version of the value to the other, using the image function that we learned about in the first chapter.

![A set and a subset](../06_type/int_nat_type_function.svg)

As you would see shortly, the concept of types has to do a lot with the concept of functions.

## What is type theory

> "Every propositional function φ(x)—so it is contended—has, in addition to its range of truth, a range of significance, i.e. a range within which x must lie if φ(x) is to be a proposition at all, whether true or false. This is the first point in the theory of types; the second point is that ranges of significance form types, i.e. if x belongs to the range of significance of φ(x), then there is a class of objects, the *type* of x, all of which must also belong to the range of significance of φ(x)" --- Bertrand Russell - Principles of Mathematics

In the last section, we almost fell in the trap of explaining types as something that are "like sets, but... " (e.g. they are like sets, but a term can only be a member of one type). However, while it may be technically true, any such explanation would not be at all appropriate, as, while types started as alternative to sets, they actually ended up being quite different. So, thinking in terms of sets won't get you far. Indeed, if we take the proverbial set theorist from the previous section, and ask them about types, their truthful response would have to be:

> "Have you seen a set? Well, it has nothing to do with it."

So let's see how we define a type theory in its own right. 

But first...

### Long disclaimer

Before we begin, let's get this long disclaimer out of the way:

Notice that in the last sentence we said *a* type theory, not "type theory" or "the type theory". This is because  there are not one, but many different (albeit related) formulations of type theory that are, confusingly, called type *theories* (and, less confusingly, *type systems*), such as *Simply-typed lambda calculus* or *Polymorphic Lambda calculus*. For this reason, it makes sense to speak about *a* type theory.

Have I confused you enough? No?

In some contexts, the term "type theory" (uncountable) refers to the whole field of study of type theories, just like category theory is the study of categories. But, (take a deep breath) you can sometimes think of the different type systems as "different versions of type theory" and so, when people talk about a given set of features that are common to all type systems, they sometimes use the term "type theory" to refer to any random type system that has these features.

### What are types?

Anyhow, let's get back to our subject (however we want to call it). As we said, type theory was born out of Russell's search for a way to define all collections of objects that are *interesting*, without accidentally defining collections that lead us astray (e.g. to his eponymous paradox), and without having to make up a multitude of additional axioms (a-la ZFC). 

He thought a lot (at least I imagine he did) and he managed to devise a formal system that fits all these criteria, based on a revolutionary new idea... which is basically the same idea that is at the heart of category theory (I don't know why he never got credit for being a category theory pioneer). The idea is the following: The *interesting* collections, the collections that we want to talk about in the first place, are the *collections that are the source and target of functions*. So, we might say.

{: .definition}

> A type is something that can be the source and/or target of an arrow.

(To make the definition more general, we use the more general term --- "arrow", but you can think of arrows as functions for now.)

Let's think again about the set of all sets that don't contain themselves. Besides being the cause of Russell paradox, this set is quite useless (unless we count causing paradoxes as useful). And if we dig into it, we eventually discover why: there are no (interesting) functions from any other set to this set, so *we cannot get to it* from anywhere. And, conversely, we cannot get anywhere from it (there are no functions where it is the source either). This set is like an oasis at the center of the desert... or perhaps a little desert in the center of big oasis... Contact me if you can think of some good metaphor.

<!--

![
THE STUDIO 
JENCEL
A set without functions is just a dead end
ALYSSA
Even worse, as a dead end is at least reachable.
](../comic/02.svg){: .comic-web-panel }

-->

### Building types

We saw that type theory is not so different from set theory when it comes to *structure that it produces* --- all types (at least on the first level) are sets, although not all sets are types. And all functions are... well functions. However, type theory is very different from set theory when it comes to *the way the structure comes about*, in the same way as the intuitionistic approach to logic is different from the classical approach (by the way, if this metaphor made the connection between type theory and intuitionistic logic too obvious for you, do me a favor, please don't mention it and act surprised when we make it explicit).

In set theory, (and especially in its naive version) all possible sets and functions are *already there from the start*, as the Platonic world of forms. What we do is merely exploring the ones that interests us.

![Sets and functions in set theory](../06_type/set_theory_functions.svg)

In type theory, we start with a space that is empty.

*[diagram omitted]*

From there, we have to build our types. One by one. With our bare hands (OK, we do have some cool mathematical tools that assist us).

### Type formation, term introduction, term elimination

> "In general, we can think of data as defined by some collection of selectors and constructors, together with specified conditions that these procedures must fulfill in order to be a valid representation." --- Harold Abelson, Gerald Jay Sussman, Julie Sussman --- Structure and Interpretation of Computer Programs

Before introducing the specific formulae for building types, I want to elaborate on the general idea. In the last section, we said that a type is something that can be the source and/or target of an arrow. This definition may seem a bit vague, but it is trivial when we look at how types are defined in computer programming. It is obvious, even when viewed through the lens of traditional imperative languages, that the definition of a type consists of the definitions of rules for constructing functions (and more generally arrows).

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

First off, a type has to have a *definition* which specifies what it is. Note that this arrow is different from what we perceive as an arrow --- it is not a value-level arrow (going from one type to the other), but is a type-level arrow (from one category of types, to another). This is known as a *type formation rule*. 

![A type represented as a ball](../06_type/rule_type_formation.svg)

Next up, a type has to have at least one arrow pointing to the new type. This is known as a *term introduction rule* ("term" being the word for "value").
In programming, it is called a *constructor*, and it is a value-level arrow (e.g. function).

![A type and an arrow pointing towards it](../06_type/rule_term_introduction.svg)

Finally, as we don't want to construct types just for the sake of constructing new types, a type has to have at least one arrow coming *from* this new type. This is value-level arrow (function) known as a *term elimination rule* (as if we are eliminating the type by replacing it with the result of the method).

![A type and an arrow, coming from it ](../06_type/rule_term_elimination.svg)

In summary

{: .definition}

>A type is defined by defining these three arrows:
>1. One type-level arrow (type formation).
>2. At least one value-level arrow for which the type is the target (term introduction).
>3. At least one value-level arrow for which it is the source (term elimination).

OK, I think we went too far in trying to define type theory without actually defining type theory, so we will proceed with the formulas... after our second long disclaimer.

### Picking a theory (another long disclaimer)

As we said in the first long disclaimer, there is not one, but many type theories. So if we want to do type theory, we have first pick *a* type theory (if this sentence confuses you, read the first disclaimer again).

Picking a type theory (or a type system let's call it), also involves picking a *language* that this theory is described in terms of. When hearing about language, programmers would probably think of the popular feature-rich programming languages like TypeScript or Java. *Type theorists*, on the other hand, have different preferences --- since they are interested in the type system, not the language, they don't really care about the features, and so the language of choice of most of them is the simplest, most minimal language that is possible to exist, namely *Lambda Calculus*. If you haven't heard about it, this is language that only has (anonymous) functions and nothing else.

To please both parties, (and annoy them both, at the same time), we will go with a language that is somewhere in between --- namely (a subset of) *Haskell*. This will not make much difference in terms of the theory, as Haskell is based on Lambda calculus, but will make things easier for programmers: unlike Lambda Calculus, which only has functions, Haskell supports defining product constructors as a primitive (which itself makes no difference from a formal standpoint, as we can easily go from products to functions via currying and uncurrying). 

Also, last but not least, Haskell constructors and functions can have names (believe me, this helps).

Since we are picking Haskell, we will work in the type theory/type system of Haskell. This is a type system, discovered by Jean-Yves Girard in 1972, called *Polymorphic Lambda Calculus* or *System F*. 

### The Unit type

We start with an empty space, when nothing is defined, except for the singleton type, known as the $Unit$ type in Haskell.

![An empty diagram, containing only the unit type](../06_type/unit_type.svg)

A type which has only one value, which we can use as a starting point.

{: .definition}

> The $Unit$ type ($1$) is the type with one value.

### The Lambda type

There is actually one more prerequisite which is not so easy to explain: namely the *arrow types* for each pair of objects, known as the *Lambda* types. In Lambda Calculus arrows between types are types as well (a feature sometimes called "first-class functions" in programming context).

{: .definition}

> For any types $A$ and $B$, there is a type $A \to B$, called the *Lambda* type of $A$ and $B$, which has all arrows that connect $A$ and $B$ as values. 

We won't go into more detail here, because the Lambda type is defined and works in the same way as the implication object in intuitionistic logic, as defined in the previous chapter. As you will learn, it also has the same role.

## Base types. The boolean type

Once we have a starting point we can define some types. But how? Let's start with base types, like the *booleans*. For them, the process is quite simple, because we can just straight out *list out their values*.

{: .definition}
$$
\begin{aligned}
\mathrm{Bool} &:\ \mathrm{Type} \\
\mathrm{True} &:\ \mathrm{Bool} \\
\mathrm{False} &:\ \mathrm{Bool}
\end{aligned}
$$

Let's go through this definition:

### Type formation

First, $Bool: Type$, says that there exists a type that we call "Bool".

![The Boolean type without values --- an empty circle](../06_type/bool_type_empty.svg)


### Term introduction

Then, $True : Bool$ says that "$True$ is a boolean" i.e. it adds one value to this newly created datatype. In the diagram, we will represent that as an arrow from the singleton type, known as the $Unit$ type in Haskell, as per the Elementary Theory of the Category of Sets from chapter 2.

![ The Boolean type with one value: a circle with one ball --- True](../06_type/bool_type_true.svg)

And $False : Bool$ creates another such value.

![The full Boolean type: a circle with two balls True and False](../06_type/bool_type_full.svg)

Et voila, we have just defined a type!

### Term elimination

Wait, scratch that. We actually haven't defined a type. Or rather we have defined one, but it is quite useless. For it would only be useful once we define at least one arrow, coming *from* it (otherwise, it will just be a one-way street). For the Booleans, this function is usually called $ifElse$.

{: .definition}

$$
\begin{aligned}
\mathrm{ifElse} : \forall a.\ \mathrm{Bool} \to a \to a \to a \\
\mathrm{ifElse}\ True\ a\ b\ =\ a\\
\mathrm{ifElse}\ False\ a\ b\ =\ b 
\end{aligned}
$$

You can see that the functions in Haskell are pretty rudimentary to define --- you just map each individual value of one type, to the value of another one.

Here are some expressions which use the function accompanied with indications of what they return (`--` is Haskell's comment syntax)

```haskell
ifElse True 1 2 --1
ifElse False 1 2 --2
```

### Isomorphisms between types

But why (with the risk of repeating myself) does this exact type has to be the Boolean type? What is stopping our colleague Bobby who always wants to do everything their way, to define their own version of Boolean and using it in their project.

{: .definition}

$$
\begin{aligned}
\mathrm{BobbysBool} &:\ \mathrm{Type} \\
\mathrm{BobbysTrue} &:\ \mathrm{BobbysBool} \\
\mathrm{BobbysFalse} &:\ \mathrm{BobbysBool}
\end{aligned}
$$

The answer is "nothing". But that is not a huge deal --- we can just whip up a function to convert their Bool to ours:

{: .definition}

$$
\begin{aligned}
convert\ BobbysBool &\to Bool \\
convert\ BobbysTrue\ &=\ True \\
convert\ BobbysFalse\ &=\ False 
\end{aligned}
$$

This function is also reversible. Which means that the two types are isomorphic i.e. they are one and the same type, *up to a (unique) isomorphism*.


### Other base types

Almost forgot: in the same way as we constructed the Booleans, we can construct any other finite/base types, such as the type of balls.

{: .definition}

$$
\begin{aligned}
\mathrm{Ball} &:\ \mathrm{Type} \\
\mathrm{OrangeBall} &:\ \mathrm{Ball} \\
\mathrm{RedBall} &:\ \mathrm{Ball} \\
\mathrm{YellowBall} &:\ \mathrm{Ball} 
\end{aligned}
$$

![The type of balls: a circle with several colorful balls](../06_type/balls_construct.svg)

## Polymorphic types. The Maybe type

Now, we will define the type that is known in Haskell as, $Maybe$ (and what in other languages is usually called $Option$). If you haven't encountered it, the Haskell documentation provides a very good description:

>The Maybe type encapsulates an optional value. A value of type Maybe a either contains a value of type a (represented as $Just[a]$), or it is empty (represented as $Nothing$). Using $Maybe$ is a good way to deal with errors or exceptional cases without resorting to drastic measures such as error.

But, once you learn to read it, the type definition, by itself is clear enough:

{: .definition}

$$
\begin{aligned}
\mathrm{Maybe} &:\ \mathrm{Type} \to \mathrm{Type} \\
\mathrm{Nothing} &:\ \forall a.\ \mathrm{Maybe}[a] \\
\mathrm{Just} &:\ \forall a.\ a \to \mathrm{Maybe}[a]
\end{aligned}
$$

### Type formation

$Maybe$ looks a lot like $Bool$, but, unlike $Bool$, $Maybe$ is a *polymorphic* type, as we can tell by looking at the *type formation rule*

{: .definition}

$$
\mathrm{Maybe} :\ \mathrm{Type} \to \mathrm{Type} 
$$

Maybe is polymorphic i.e. there is not just one $Maybe$, but many $Maybe$'s --- one for each type `a` e.g. Let's take the type $Bool$ as an example. Because $Bool$ is a type, then (according to this rule) $Maybe[Bool]$ is also a type.

![The `Maybe Boolean` type without values --- A type-universe function, connecting the Bool circle to a new empty circle.](../06_type/maybe_type_empty.svg)

Polymorphic types are arrows from the universe of types, to itself (i.e. the kind of $Maybe$ is $Type \to Type$), while $Bool$ is just a $Type$.

### Term introduction: Nothing

Now, it's time to fill our type.

The first line is similar to what we saw with boolean. 

{: .definition}

$$
\mathrm{Nothing} :\ \forall a.\ \mathrm{Maybe}[a]
$$

It says that there is a value called $Nothing$ for all $Maybe$ types (that's what $\forall$ means -- "for all").

![The `Maybe Boolean` type without values: A type-universe function, connecting the Bool circle to a new empty circle.](../06_type/maybe_type_nothing.svg)


### Term introduction: Just

Of course there would be no point in having many $Maybe$s if they all are the same. That's where the second line comes.

{: .definition}

$$
\mathrm{Just} :\ \forall a.\ a \to \mathrm{Maybe}[a]
$$

The constructor $Just$ represents an arrow from type $a$ to type $Maybe[a]$ e.g. from $Boolean$ to $Maybe[Boolean]$.

![The $Maybe Boolean$ type without values: A type-universe function, connecting the Bool circle to a new empty circle.](../06_type/maybe_type_full.svg)

### Using Maybe

The $Maybe$ type is used for handling errors i.e. for defining *partial functions*. Let's say we want to define a function that does not have an arrow for all values in the source. Does this mean that this function cannot be defined?

![A partial function from  $Nat$ to $Boolean$: returns False for composite numbers, True for primes and is not defined for 0 and 1](../06_type/isprime_int_bool.svg)

No, we just have to wrap the target type in $Maybe$ and it becomes a regular function.

![A function from  $Nat$ to $Maybe Boolean$: returns $Just False$ for composite numbers, $Just True$ for primes and $Nothing$ for 0 and 1](../06_type/isprime_int_maybe_bool.svg)

### Term elimination

To close the case, we define one function for deconstructing/eliminating the type maybe i.e. to convert it to something else, by using a function for converting its underlying type.

{: .definition}

$$
\begin{aligned}
maybe : \forall\ a\ b.\ b\ \to (a \to b) \to Maybe[a] &\to b \\
maybe\ n\ f\ Nothing\ &=\ n \\
maybe\ n\ f\ Just[x]\ &=\ f\ x 
\end{aligned}
$$

Notice that this function defines an arrow from type $Maybe[a]$ to any type $b$, provided that a function $a \to b$, and a value of $b$ is provided.

## Inductive types. The natural number type.

Learning mathematics can feel overwhelming at first: you might not know how to proceed with such huge, even infinite, body of knowledge. But, it turns out the answer is simple: you start off knowing 0 things. Then, you learn 1 theory -- congrats, you have learned your first theory and so you would know a total of 1 theories. Then, you learn 1 more theory and you would already know a total of 2 theories. Then learn 1 more theory and then 1 more and, given enough time and dedication, you may learn all theories.

This argument applies not only to mathematical theories, but to everything else that is "countable", so to say. This is because it is the basis of the mathematical definition of natural numbers, as famously synthesized in the 19th century by the Italian mathematician Giuseppe Peano

<!--TODO (There are some laws as well, but we will cover them later). -->

1. $0$ is a natural number.
2. If $n$ is a natural number, $n+1$ is a natural number.

Or as Haskellians say:

{: .definition}

$$
\begin{aligned}
\mathbb{N} &:\ \mathrm{Type} \\
\mathrm{Zero} &:\ \mathbb{N} \\
\mathrm{Succ} &:\ \mathbb{N} \to \mathbb{N}
\end{aligned}
$$

Let's follow the arrows. 

### Type formation

The first line indicates that the natural numbers type is a normal non-polymorphic, or "monomorphic" type.

{: .definition}

$$
\mathbb{N} :\ \mathrm{Type}
$$

![The Natural numbers type without values --- an empty circle](../06_type/nat_type_empty.svg)

### Term introduction: Zero

The first rule is also trivial.

{: .definition}

$$
\mathrm{Zero} :\ \mathbb{N}
$$

It allows us to construct one value, called zero 


![The Natural numbers type with Zero added --- an circle, containing one ball - "0"](../06_type/nat_type_zero.svg)

i.e. it is a *mot à mot* repetition of Peano's first axiom.

> 1. $0$ is a natural number.

### Term introduction: Successors

The second rule is more interesting. 

{: .definition}

$$
\mathrm{Succ} :\ \mathbb{N} \to \mathbb{N}
$$

It says that there is a constructor, called "Successor" $Succ$ (or `+1`, as we would call it) i.e. this is the equivalent of 

> 2. If $n$ is a natural number, $n+1$ is a natural number.

$Succ$ is an arrow from the type of the natural numbers to itself which means that given one natural number, $Succ$ constructs another one. 

But right now we have just one term (value) of the natural numbers type: $Zero$. We draw the $Succ$ arrow and construct another one, $Succ\ Zero$ (known in some contexts as $1$.

![The successor function of the Natural numbers type --- 0 points to s(0)](../06_type/nat_type_one_double_diagram.svg)

And now, we have one more value so we have to draw one more $Succ$ arrow. This time the result is $Succ\ Succ\ Zero$ i.e. two.

![The successor function of the Natural numbers type --- 0 points to s(0), s(0) points to s(s(0))](../06_type/nat_type_two_double_diagram.svg)

And we go on like this, *ad infinitum*, creating an endless chain of values.

![The Natural numbers type: 0, s(0), s(s(0)), s(s(s(0))) etc.](../06_type/nat_type_full.svg)

Hm, this notation is a bit clunky, if only there were a better way to represent such values... Oh, wait.

![The Natural numbers type: 0, 1, 2, 3 etc.](../06_type/nat_type_full_normal.svg)

And this is how you define an *inductive* type (or a *recursive* type, we can also call it). 

### Term elimination

Wait, there are also elimination rules, I always forget elimination rules, here they are.


{: .definition}

$$
\begin{aligned}
foldNat : \mathbb{N} \to a \to (a \to a) &\to a\\
foldNat\ Zero\ z\ s\ &=\ z\\
foldNat\ (Succ\ a)\ z\ s\ &= s\ (foldNat\ a\ z\ s)
\end{aligned}
$$

This allows us, for example, to convert our `Nat`s to the normal Haskell `Nat`s:

```haskell
foldNat (Succ (Succ Zero)) 0 (+ 1) -- 2
```

Any other canonical function that converts natural numbers to other types can also be defined using the elimination rule.

## Composite types. The list type.

The landscape of types would be a really... flat place, without the *composite types*. Those are the types that allow you to unite several values of other types, into one. 

The ultimate composite type is the list. The linked list , specifically, is a thing of beauty:

{: .definition}

$$
\begin{aligned}
\mathrm{List} &:\ \mathrm{Type} \to \mathrm{Type} \\
\mathrm{Nil} &:\ \forall a.\ \mathrm{List}[a] \\
\mathrm{Cons} &:\ \forall a.\ a \to \mathrm{List}[a] \to \mathrm{List}[a]
\end{aligned}
$$

Let's unpack:

### Type formation

The type formation rule tells us that $List$ (like $Maybe$) is a polymorphic type. 

{: .definition}

$$
\mathrm{List} :\ \mathrm{Type} \to \mathrm{Type}
$$

This means, that there is not one, but many  $List$ types, such as $List[Nat]$ $List[Bool]$ etc (infinitely many, if you consider lists of lists (of lists)). Those are usually read as "List of natural numbers", "List of Booleans" etc. 

![The `List Nat` and `List Bool` types without values --- A type-universe function, connecting `Bool` and `Nat` to `List Bool` and `List Nat` empty circles.](../06_type/list_type_empty.svg)

### Term introduction: Nil

Now, let's check the constructors. The first defines a static value, one for each list, representing the empty list. 


{: .definition}

$$
\mathrm{Nil} :\ \forall a.\ \mathrm{List}[a]
$$

![The `List Nat` type with just a Nil value --- A circle with a single ball inside it. An arrow from the unit type, pointing to that value](../06_type/list_type_nil.svg)

We will call this value $Nil$ (native Haskell lists use the `[]` symbol).

### Term introduction: Cons

And now for the more interesting part: $Cons$, our second term introduction rule, ($Cons$ is short for construct, by the way) can be viewed as the operation of adding the value $a$ to a list (and returning that list).

{: .definition}

$$
\mathrm{Cons} :\ \forall a.\ a \to \mathrm{List}[a] \to \mathrm{List}[a]
$$

On first glance, $Cons$ looks pretty similar to the inductive $Succ$ constructor that we saw. And indeed, like $Succ$, $Cons$ is an inductive/recursive constructor that generates an infinite amount of terms. 

However, unlike $Succ$, which has signature $X \to X$ (i.e. for each $X$, there is another one), $Cons$ has a signature $a \to (X \to X)$ --- there is one List constructor for *every value of the type* $a$. We can visualize $Cons$ as an arrow, which points to another arrow. 

![The `Cons` function --- An arrow from the `Nat` type, pointing to the type of arrows from list type to itself: x -> (1,x), x -> (2,x), x -> (3,x) etc. ](../06_type/list_type_cons_internal.svg)

Why are we able to have arrows coming from other arrows? Perhaps this is the place to remind you that in Lambda calculus arrows between types are types as well.

So, let's start plotting these arrows, starting with the base value $Nil$.

![The `Cons` function --- An arrow from the `Nat` type, pointing to an arrow from the list type to itself: 0 -> Nil -> (0,Nil), 1 -> Nil -> (1,Nil) etc. ](../06_type/list_type_cons.svg)

As we said, the $List$ type is inductive i.e. every arrow that you draw generates more arrows (here, we only draw *part* of them (the ones that come from the orange ball)).

![The `Cons` function --- An arrow from the `Nat` type, pointing to an arrow from the list type to itself: 0 -> (1, Nil) -> (0, (1,Nil)), 1 -> (1, Nil) -> (1,(1,Nil)) etc. ](../06_type/list_type_cons_2.svg)

The result is a type with values that are... well, *lists* of other values, 

### Term elimination

Now, let's write the term elimination rule.

{: .definition}

$$
\begin{aligned}
foldList \ :\ (b \to a \to b) \to b \to List[a] &\to b \\
foldList\ f\ z Nil &= z\\
foldList\ f\ z (Cons\ x\ xs) &= foldList\ f\ (f\ z\ x)\ xs
\end{aligned}
$$

This rule is also the most useful function for manipulating lists.

**Task 1:** There is a certain mapping from $List$ to $Boolean$ which is so useful, that some dialects of Lisp have no $Boolean$ type at all and rely just on this mapping. Draw it.

![The list type: (Nil) (1,Nil), (1,(1,Nil)), (1,(1,Nil)) etc. and the `Boolean` type: True and False with places to draw arrows List to Bool](../06_type/list_bool_task.svg)

**Task 2:** Define this mapping (between `List` and `Bool`) in Haskell. Define it once by writing a function from scratch, and twice, with using the `foldList` function.

```haskell
f :: (Bool -> a -> Bool) 
f = undefined
foldList f False 
```

**Task 3:** I present to you the type $List Unit$ (where $Unit$ is the singleton type, (a type with one value). Draw the values of $List Unit$ until you run out of space.

![The list type, containing one value (`Nil`) the Unit type (containing one circle), with function `(Unit) -> Nil -> (Unit, Nil)`.](../06_type/list_unit_task.svg)

**Task 4:** The $List Unit$ type is actually isomorphic to another type that we reviewed here. Find out which.

## Positive and negative types. Either and Tuples.

Now, we will quickly present two more types, (hm... I have the feeling that I actually have seen those before).

### Either

The $Either$ type is an interesting one. 

![The Either type ](../06_type/either_type.svg)

It is a type that is parametrized by two types $a$ and $b$, and has two constructors/term introduction rules --- one constructor, called $Left$, that takes a value of $a$. And another one, called $Right$ that takes a $b$. Here is the definition of Either (excluding the term elimination rule).


{: .definition}

$$
\begin{aligned}
\mathrm{Either} &:\ \mathrm{Type} \to \mathrm{Type} \to \mathrm{Type} \\
\mathrm{Left} &:\ \forall a\,b.\ a \to \mathrm{Either}[a\ b] \\
\mathrm{Right} &:\ \forall a\,b.\ b \to \mathrm{Either}[a\ b]
\end{aligned}
$$

### Tuple

The next type that we will introduce is the $Tuple$ type, which is also parametrized by $a$ and $b$, but each value of it contains *both* a value of $a$ and a value of $b$. 

![The Tuple type ](../06_type/tuple_type.svg)

Here we will do something different --- instead of the definition, we will directly present the type elimination rules.

{: .definition}

$$
\begin{aligned}
first\ :\ \forall\ a\ b. Tuple[a\ b] \to a \\
second\ :\ \forall\ a\ b. Tuple[a\ b] \to b
\end{aligned}
$$

**Task 5:** Write a constructor of Tuple. Write a `fold` function for Either.

### Positive and negative types

The $Either$ type is uniquely defined by its introduction rules i.e. the elimination rules can be derived from the introduction rules.

{: .definition}

$$
\begin{aligned}
\mathrm{Left} &:\ \forall a\,b.\ a \to \mathrm{Either}[a\ b] \\
\mathrm{Right} &:\ \forall a\,b.\ b \to \mathrm{Either}[a\ b]
\end{aligned}
$$

$Tuple$, on the other hand, is defined by its elimination rules i.e. the introduction rules can be derived from them:

{: .definition}

$$
\begin{aligned}
first\ :\ \forall\ a\ b. Tuple[a\ b] \to a \\
second\ :\ \forall\ a\ b. Tuple[a\ b] \to b
\end{aligned}
$$

Types that, like $Either$, are defined by their introduction rules are called *positive types*. Types that are defined by their elimination are *negative*. All types that we saw so far (except $Tuple$) are positive.

Positive and negative types are dual to each other. 

Positive/negative types correspond to the categorical concepts of limit/colimit, but we will learn more about those later.

**Task 6:** Besides $Tuple$, there is one very important negative type, which we covered in this chapter (and in various other places).

### Conclusion

In this section, we started from almost nothing --- just the $Unit$ type. Then we defined a lot of stuff, very quickly.

![All types we have seen so far (with combinations): Unit, Bool, Maybe Bool, Nat, Maybe Nat, List of Nat, Bool or Nat](../06_type/all_types.svg)

One can see that some types that programmers use are still missing, but those can be defined in much the same way as the types we already defined: e.g. $char$ is just a base type, $string$ is just $List[char]$ etc.


## Church encoding: From Haskell to Lambda Calculus 

In the previous section, we did define a lot of stuff, very quickly, But we relied on Haskell's Generalized Algebraic Datatypes (GADTs) and it is not obvious that it is possible to achieve the same things with just functions. However, it *is* possible: there exists a mechanism for encoding every type as a function, known as *Church encoding*, named after the creator of Lambda Calculus, Alonzo Church. 

### Base types. the Boolean type

Consider the Boolean type, which we defined like this:


{: .definition}

$$
\begin{aligned}
\mathrm{Bool} &:\ \mathrm{Type} \\
\mathrm{True} &:\ \mathrm{Bool} \\
\mathrm{False} &:\ \mathrm{Bool}
\end{aligned}
$$

Here is a version of the same thing, with just functions.

{: .definition}

$$
\begin{aligned}
type\ \mathrm{Bool} &= \forall a. a \to a \to a \\
false &: \mathrm{Bool} \\
false\ a\ b &= b \\
true &: \mathrm{Bool} \\
true\ a\ b &= a 
\end{aligned}
$$

Here $Bool$ is just a shorthand for the function $\forall a. a \to a \to a $ which accepts two values of type $a$ for all $a$ and returns another one. We can see that under this definition, $True$ is a function that returns the first $a$, and $False$ is a function that returns the second one.

Don't believe that these can function as booleans? Here is an implementation of the $ifElse$ function:

{: .definition}

$$
\begin{aligned}
ifElse &: \forall a. \mathrm{Bool} \to a \to a \to a \\
ifElse &\ v\ a\ b\  = v\ a\ b 
\end{aligned}
$$

The implementation is trivial, because the datatype itself is doing the work. This is one of the main principle behind the "Church encodings" of datatypes as they are called --- the datatype encodes the term elimination rule.

Here is how you would use this:

```haskell
  ifElse true "True" "False" -- "True"
  ifElse false "True" "False" -- "False"
```



### Polymorphic types. The Maybe type

The Boolean type is, of course, a basic type. So, let's consider the $Maybe$ type, which is more complex:

{: .definition}

$$
\begin{aligned}
\mathrm{Maybe} &:\ \mathrm{Type} \to \mathrm{Type} \\
\mathrm{Nothing} &:\ \forall a.\ \mathrm{Maybe}[a] \\
\mathrm{Just} &:\ \forall a.\ a \to \mathrm{Maybe}[a]
\end{aligned}
$$

$Maybe$ is more complex, because it can *contain another value* in itself (with the $Just$ constructor). Here is where we learn another important principle of Church encoding: using curried functions to hold values.

{: .definition}

$$
\begin{aligned}
type\ Maybe[a] &= \forall m. m \to (a \to m) \to m \\
nothing &: Maybe[a] \\
nothing\ n\ j &= n \\
just &:\ a \to Maybe[a] \\
just\ val\ n\ j\ &= (j\ val) 
\end{aligned}
$$

### The general principle

By now, you have probably seen that the Church-encoding of the type has the same constructors as the "normal" type --- the difference is only that it accepts them as parameters. 

If we have a type which is like $Maybe$, but with just one value (like the $1$ type)...

{: .definition}

$$
\begin{aligned}
\mathrm{Nothing} &:\ \forall a.\ \mathrm{Maybe}[a] 
\end{aligned}
$$

...its Church encoding would be...

{: .definition}

$$
\begin{aligned}
\forall m. m \to m 
\end{aligned}
$$

(This is indeed the Church encoding of the $1$ type)

And then, if we extend the type to also have the $Just$ constructor...

{: .definition}

$$
\begin{aligned}
\mathrm{Nothing} &:\ \forall a.\ \mathrm{Maybe}[a] \\
\mathrm{Just} &:\ \forall a.\ a \to \mathrm{Maybe}[a]
\end{aligned}
$$

...the encoding is extended like this...

{: .definition}
 
$$
\begin{aligned}
\forall m. m \to (a \to m) \to m 
\end{aligned}
$$

This is why the signature of the Church-encoded type is almost identical as the signature of the $fold$ function, used to eliminate it:

{: .definition}

$$
\begin{aligned}
foldMaybe &: \forall a\ m. m \to (a \to m) \to Maybe[a] \to m 
\end{aligned}
$$

and the $fold$ function itself is trivial. Generally, the Church encoding of the type is basically a curried  $fold$ function, a function, which, given the same arguments as the "folding" functions, produces the same results.

The general principle of Church encoding, is that a type is fully characterized by what you can do with it, so instead of providing constructors for types, which we later eliminate with the $fold$, we skip straight to the $fold$.

**Task 7:** Write a Church-encoded version of the natural numbers type

## Polymorphic lambda calculus -- Formal definition

So far, we saw how Lambda Calculus *works*. Now, we are about to see how it is defined formally. The answer is that, like all type systems, it is defined by *typing rules*. And what are typing rules? Well, basically they are also arrows. (Surprised?) 

### Natural deduction

Yes, Haskell's typing rules are indeed arrows, but they are defined in a language that is different from Haskell, called *natural deduction*. Natural deduction is like Haskell, but it uses a syntax where the premise and the conclusion are separated by a horizontal dash, e.g. instead of...

$$
a \to b
$$

...we write...

$$\frac{a}{b}$$

Aside from that, there is no big difference between natural deduction and Haskell. Take, for example the boolean type. We defined it in Haskell like this:
 
{: .definition}

$$
\begin{aligned}
\mathrm{Bool} &:\ \mathrm{Type} \\
\mathrm{True} &:\ \mathrm{Bool} \\
\mathrm{False} &:\ \mathrm{Bool}
\end{aligned}
$$

If we want to define it using natural deduction, so it is one of the "primitive" types that are part of the type system itself (as it is defined in most programming languages), it would look like this.

{: .definition}

$$\frac{}{\mathrm{Bool} :: \mathrm{Type}}$$

This means that there is a type called Bool (technically, this is not a typing rule, but a "kinding" rule (and thus the double-colon)).

{: .definition}
 
$$\frac{}{\mathrm{True} : \mathrm{Bool}}$$

{: .definition}

$$\frac{}{\mathrm{False} : \mathrm{Bool}}$$

$\mathrm{True}$ and $\mathrm{False}$ are Booleans.

Oh I forgot, in natural deduction it is permitted to have conclusions without premises.

**Task 8:** Define the elimination rule for Booleans, using natural deduction.

### Contexts

Is this *too* simple? Let's add the concept of the typing *context* (or typing *environment*) to the mix.

Here's the deal: Types and variables have to be stored *somewhere*. So, given a bunch of values (e.g. $x$, $y$, $z$ etc.) and a bunch of types (e.g. $A$, $B$, $C$ etc.), a context is a *set* (Oops, I did it again) of all variables and their types e.g. ${ (x, A), (y, B), (z, C)... }$.

We usually denote the context with the letter $\Gamma$, and we use the $\vdash$ symbol to denote something that follows from that context (oh, no not another arrow) e.g. $\Gamma \vdash a : b$ means that in the context $\Gamma$, there is a variable $a$ that has the type $b$.).

So, when we consider the context, the above definition becomes

{: .definition}

$$\frac{}{\Gamma \vdash \mathrm{Bool} :: \mathrm{Type}}$$

i.e. the context includes the type $\mathrm{Bool}$ 

{: .definition}

$$\frac{}{\Gamma \vdash \mathrm{True} : \mathrm{Bool}}$$

i.e. the context includes the value $\mathrm{True}$ of type $\mathrm{Bool}$

{: .definition}

$$\frac{}{\Gamma \vdash \mathrm{False} : \mathrm{Bool}}$$

i.e. the context includes the value $\mathrm{False}$ of type $\mathrm{Bool}$

Thus, we straight away define the Boolean type to be part of the context.

### Value-level arrows 

With that, we list the axioms of Lambda Calculus, which contain nothing more than the definition of the type of value-level arrows (functions).

There are several typing rules that we have to define, starting with the trivial rule *Var*, that states the following: if we previously said that $x$ has type $A$, then $x$ has type $A$.

{: .definition}

> Variable typing rule (Var)
>
>$$\frac{x : A \in \Gamma}{\Gamma \vdash x : A}$$

Now, we proceed to define the types of the arrows.

We start with the type formation rule (or the *kinding* rule).

{: .definition}

> Lambda type formation rule
>
>$$\frac{\Gamma \vdash A :: Type, \Gamma \vdash B :: Type}{\Gamma \vdash A \to B :: Type}$$

And then the two typing rules. One is the *term introduction* for lambda terms, which is called *abstraction* (or *Abs*).

{: .definition}

> Lambda term introduction rule (Abs)
>
>$$\frac{\Gamma, x:A \vdash y: B}{\Gamma \vdash \lambda z : A \to B}$$

(i.e. if we have a way given a value $x$ of type $A$ to obtain a value $y$ of type $B$, then we have ourselves a function $A \to B$).

And there is also term elimination for lambdas, i.e. function *application* (*App*).

{: .definition}

> Lambda term elimination rule (App)
>
>$$\frac{\Gamma \vdash z: A \to B, \Gamma \vdash x: A}{\Gamma \vdash z x : B }$$

To understand how those rules work, let's take the function $length: string \to int$ as an example. 

{: .definition}

> Term introduction of "length"
>
>$$\frac{\Gamma, x:string \vdash y: int}{\Gamma \vdash \lambda length : string \to int}$$

{: .theorem}

> Term application of "length"
>
> $$\frac{\Gamma \vdash length: string \to int, \Gamma \vdash x: string}{\Gamma \vdash length\ x : int }$$

Those rules are all you need to define value-level arrows.

### Simply-typed Lambda Calculus

The rules we reviewed so far don't define Polymorphic Lambda Calculus, but they define a simpler type system aptly called *Simply-typed Lambda Calculus*.

{: .definition}

> The *simply-typed Lambda Calculus* (STLC) is the type system which only has one type constructor --- function (lambda), with typing rules *Abs* and *App* (for term introduction and elimination). It also has the *Var* typing rule.

### Polymorphism

Simply-typed lambda calculus is just like Polymorphic Lambda Calculus, except that... it is not polymorphic i.e. we cannot define the polymorphic types like $Maybe$.

{: .definition}

$$
\begin{aligned}
\mathrm{Maybe} &:\ \mathrm{Type} \to \mathrm{Type} \\
\mathrm{Nothing} &:\ \forall a.\ \mathrm{Maybe}[a] \\
\mathrm{Just} &:\ \forall a.\ a \to \mathrm{Maybe}[a]
\end{aligned}
$$

The best we can do is to define a separate versions of the type, e.g. one which works just for $\mathrm{int}$.

{: .definition}

$$
\begin{aligned}
\mathrm{MaybeInt} &:\ \mathrm{Type} \\
\mathrm{NoInt} &:\ \mathrm{MaybeInt} \\
\mathrm{JustInt} &: \mathrm{int} \to \mathrm{MaybeInt}
\end{aligned}
$$

And one for $\mathrm{string}$

{: .definition}

$$
\begin{aligned}
\mathrm{MaybeString} &:\ \mathrm{Type} \\
\mathrm{NoString} &:\ \mathrm{MaybeString} \\
\mathrm{JustString} &:\mathrm{string} \to \mathrm{MaybeString}
\end{aligned}
$$

Furthermore, in STLC we cannot define *functions* that work for polymorphic $Maybe$ (regardless of the type they are holding), so we have to redefine not only the types, but all functions that use them.

To combat this problem, and to ascend ourselves from *Simply-typed* to *Polymorphic* Lambda Calculus (AKA System F), we define type-level arrows.

But, actually we should talk about Kinds first...

### Kinds

In the expression "$x: A$" , "$A$" denotes the type of the value. But then what is $Type$ in the Expression "$A :: Type$"? We cannot say that $Type$ is a *type*, cause we will see Russell, lurking behind our back, with his eponymous paradox. In Lambda Calculus, it is resolved in the following way:

* **Values** have **types** (which are annotated with single-colon -- $:$) 
* **Types** have types-of-types i.e. **kinds** (which are annotated with a double-colon -- $::$.
* **Kinds** have... OK, let's stop here for now...

This means that besides a type system and typing rules, we have a *kind-system* and *kinding rules*. But please, don't throw this book out of the window -- the kinding system for both STLC is pretty easy to define: there is just one kind, that we call $\mathrm{Type}$ (sometimes it is marked with a $*$).

{: .definition}

> Kinding rule in STLC
>
> $$\frac{}{\Gamma \vdash Type}$$

And then the type definition rules are defined like this (i.e. everything is of kind $\mathrm{Type}$:

{: .theorem}

$$\frac{}{\Gamma \vdash \mathrm{Bool} :: \mathrm{Type}}$$

And for Polymorphic Lambda Calculus, we would see in the next section.

### Type-level arrows 

We started defining STLC by defining value-level *variables*, using the trivial *Var* typing rule, 

{: .definition}

> Variable typing rule (Var)
>
>$$\frac{x : A \in \Gamma}{\Gamma \vdash x : A}$$

In Polymorphic Lambda Calculus we also have *type-level variables*, which are defined with a similar rule.

{: .definition}

> Type Variable kinding rule (TVar)
>
>$$\frac{A :: K \in \Gamma}{\Gamma \vdash A :: K}$$

Now, let's proceed with defining the type of the arrows themselves. 

In Polymorphic Lambda Calculus, as in STLC, we have value-level arrows that convert values to other values...

{: .definition}

>Lambda type formation rule
>
>$$\frac{\Gamma \vdash A :: Type, \Gamma \vdash B :: Type}{\Gamma \vdash A \to B :: Type}$$


And, we also have *type-level* arrows that convert types to other types. They are defined with this kinding rule:

{: .definition}

>Type-level lambda kind formation rule
>
>$$\frac{\Gamma, (\alpha :: A) \vdash (B :: Type)}{\Gamma \vdash \forall (\alpha :: A). (B :: Type)}$$

For example, for the $Maybe$ type, this rule would say

{: .definition}

>Type-level lambda type formation rule for Maybe
>
$$\frac{\Gamma, (\alpha :: Type) \vdash Maybe[\alpha]:: Type}{\Gamma \vdash \forall (\alpha :: Type). Maybe[\alpha]:: Type}$$

### Polymorphic functions

The more interesting (and harder) part of polymorphism is augmenting value-level arrows to work with polymorphic types i.e. to have functions which accept a type as an argument, in addition to a value.

For example, if we work in the context of STLC and we use the $MaybeString$ type that we defined in the last section (and that works only with strings), we can define a function with the following type signature 

{: .definition}

>A monomorphic function 
>
>$$z :: string \to MaybeString$$

Using the capabilities of Polymorphic Lambda Calculus,  we can abstract the type $String$ (with the rule *TAbs* to build a polymorphic function, which looks like this.

{: .definition}

>A polymorphic function, using *TAbs*
>
> $$z' :: \forall \alpha. \alpha \to Maybe\ \alpha$$

And then, we use *TApp* to apply the type parameter $String$ to the abstract function to get our original function. 

{: .definition}

>A monomorphic function, using *TApp*
>
> $$z = z'[String]$$

(This is not a real Haskell syntax, as Haskell does type application automatically --- you just provide the value and the language deduces the type from it).

Here are the typing rules of polymorphic functions themselves:


{: .definition}

>*Type abstraction* (or *TAbs*)
>
>$$\frac{\Gamma, (\alpha :: A) \vdash z : C}{\Gamma \vdash (\Lambda \alpha :: A . z) : \forall (\alpha :: A) . C}$$

{: .definition}

>*Type application* (*TApp*)
>
>$$\frac{\Gamma \vdash z' : \forall (\alpha :: A) . C , \Gamma  \vdash (X :: A)}{\Gamma \vdash z'[X] : C[\alpha := X]}$$

And with this, we conclude the definition of System F.

{: .definition}

> The *polymorphic Lambda Calculus* (System F) is the type system which only has one type constructor --- polymorphic lambda, with typing rules *Abs* and *App* (for introduction and elimination of terms) and kinding rules *TAbs* and *TApp* (for introduction and elimination of types). It also has the *Var* typing rule. and *TVar* kinding rule.

Now we are ready to see how it relates to our main subject matter.

<!--

## TODO Interlude: Higher-kinds --- System F Omega

"System Fω can be stratified into an infinite hierarchy of Systems Fn, where F0 corresponds to the usual polymorphic System F (quantifying over kinds ∗), F1 to System F with type operators (quantifying over kinds e.g. ∗ → ∗), F2 additionally quantifying over kinds e.g. (∗ → ∗) → ∗ ("to the left of 2 arrows", so to speak), and so on."

-->

## Type systems as Categories

We already drew some parallels between type theory and category theory, but there is more than just mere parallels: when viewed through the proper angle, type systems *are* a certain type of categories. And, more: we already know which one! 

### Types as objects arrows as morphisms

Let's start from the basics.

Every type is an object.

![A bunch of balls](../06_type/category_type.svg)

And every value-level arrow (function) is a morphism.

![A bunch of balls, connected with each other with arrows](../06_type/category_arrow.svg)

And now for something not so trivial --- values. 

### Values as morphisms too

We said that category theory is all about arrows. Here, we seemingly turned away from this, and we started drawing values and internal diagrams again, as for examples the natural numbers type.

![The Natural numbers type: 0, 1, 2, 3 etc.](../06_type/nat_type_full_normal.svg)

But there is no discrepancy. We said that in type theory, "the only values are the ones which are sources and targets of arrows". In the case of natural numbers, it is the $successor$ arrow, and the $zero$ arrow.

![An internal diagram of the natural numbers type, one arrow pointing from the one-element set to value 0, one arrow, pointing from 0 to 1, one arrow pointing from 1 to 2  etc.](../06_type/category_nat_internal.svg)

This means that *values are actually just another way to represent arrows*. 

For example, the type of natural numbers be represented externally like this. 

![An external diagram of the functions of the natural numbers type --- 0: 1 -> N  and S: N -> N](../06_type/category_nat_external_zero.svg)

This is where we go back to a simple theorem about set/type elements that we learned in the second chapter:

{: .theorem}

> Each element of any set $X$ is isomorphic to a function $$1 \to X$$ (where $$1$$ means the singleton set).

So, arrow from $1 \to X$ for some type $X$ is equivalent to a *value* of $X$ when we view it as a set.

This means that the *arrow* from $1 \to \mathbb{N}$ which we call $0$ is isomorphic to the *value* $0$.

Besides $1 \to \mathbb{N}$, we have one more arrow $s : \mathbb{N} \to \mathbb{N}$. So, what happens when we combine the two? We get another  $1 \to \mathbb{N}$ arrow --- $s \circ 0$, the successor of $0$, i.e. $1$.

![An external diagram of the functions of the natural numbers type with added one more arrow s.0, the composition of s and 0](../06_type/category_nat_external_one.svg)

And if we do this again, we get $s \circ s \circ 0$.

![An external diagram of the functions of the natural numbers type with added one more arrow s.s.0, the composition of s and s.0](../06_type/category_nat_external_two.svg)

We can see that it plays out in the same way as the old definition. Rather than going *back* to values, we went *full circle* and discovered (or rediscovered, since we knew it from the Elementary Theory of the Category of Sets) that values are just a more convenient way to draw arrows.

### Simply-typed Lambda calculus as a Cartesian Closed Category

OK, we got it: if we view types as objects and arrows *and values* as morphisms, the entire type theory/type system can be viewed as a category. But which category? To understand, we review the special features that Lambda Calculus has: we know that it has the Lambda type, AKA the function type, so we need a category with a function type. To define it, you also need the terminal object ($1$ object) and products, so we are searching for a category has to has those. Surprisingly, we already know which category has all those features. We examined it in the previous chapter, when we covered logic.

{: .theorem}

> Simply-typed Lambda Calculus can be seen as a Cartesian Closed Category---the tuple and either types are the "and" and "or" operations, the Unit and Empty types are the values "True" and "False" and the Lambda type is the exponential object.

### Untyped Lambda calculus as a Cartesian Closed Monoid 

We won't cover it in depth, but I think that it is worth mentioning that there is also such a thing as a *Untyped* Lambda Calculus. This is a language that only has one type --- function and every function accepts every other, as an argument.

So, how does Untyped Lambda Calculus fit in our picture? It fits perfectly: it corresponds to Cartesian Closed Monoids (C-monoids for short). Those are cartesian closed categories with only one object.

### Polymorphic Lambda calculus as...

We established that value-level arrows correspond *to morphisms*.

But what about *type-level arrows* (AKA polymorphic types)? What do they correspond to? 

We will get on with this in the next chapter!

## Curry-Howard-Lambek correspondence

Before we close this off, let's think about the following: why do Lambda Calculus and Intuitionistic logic correspond to almost the same type of categories --- Cartesian Closed.

To understand, we look into the correspondence between logics and categories that we studied in the previous chapter. 

{: .theorem}

> The logical system of intuitionistic logic can be seen as a Bicartesian Closed Category---the "and" and "or" operations are the product/coproducts, the values "True" and "False" are the initial/terminal objects and the implication operation is the exponential object.

This is almost the exact same definition that we now have about types (the only difference is that Lambda Calculus can work without coproducts and an initial object, so it's a Cartesian Closed category, whereas Intuitionistic logic needs those, so it's *Bi*cartesian).

This means that the similarities between Intuitionistic Logic and Lambda Calculus don't end with both of them being "categorical". They are actually one and the same thing: 

- Logical propositions can be viewed as *types*. 
- A proof of a given proposition is nothing but a value of the corresponding type. - The Lambda type is the implication object. 
- Functional application (App) is *modus ponens*.

| Intuitionistic logic        | Simply-typed Lambda calculus   | Cartesian closed category        |
|-----------------------------|--------------------------------|----------------------------------|
| Proposition                 | Type                           | Object                           |
| Implication                 | Arrow                          | Morphism                         |
| Primary proposition         | Value of type A                | Morphism 1 → A (global element)  |
| Implication object (A → B)  | Lambda type (A → B)            | Exponential object B^A           |
| And (A ∧ B)                 | Tuple (A × B)                  | Product A × B                    |
| Or (A ∨ B)                  | Either (A + B)                 | Coproduct A + B                  |
| True (⊤)                    | Unit type                      | Terminal object (1)              |
| False (⊥)                   | Empty type                     | Initial object (0)               |
| Negation  A → ⊥             | Function A → Empty             | Morphism A → 0                   |

In short, in the last chapter, we talked about the correspondence (known as Curry-Howard-Lambek correspondence) between Intuitionistic logic and Cartesian Closed Categories and now we are adding a third branch of the correspondence --- Lambda Calculus.

<!--

## Addendum: The connection between tuple function top and bottom.
Terminal objects are nullary products
Tuple and functions are related via tensor-hom
--> 

## Appendix: definitions in Haskell

I thought a lot about whether to provide the definitions of the basic types in executable Haskell, or as formulas (i.e. monospaced or modern). At the end, I decided that formulas are better, but all of them are indeed Haskell, with several caveats:


First, we want to start from a blank state. In Haskell we can do that by removing the standard library, (called "Prelude") which is typically imported implicitly.

```haskell
{-# LANGUAGE NoImplicitPrelude #-}
```
And we use one more extension, that would allow us to write type definitions that are a bit more explicit.

```haskell
{-# LANGUAGE GADTs, NoImplicitPrelude #-}
```

And that is pretty much it. That and using `forall` instead of the $\forall$ symbol.

```
{-# LANGUAGE GADTs,  NoImplicitPrelude #-} 
import qualified Prelude as P

data Bool where
  True :: Bool
  False :: Bool
  deriving (P.Show)

ifElse :: forall a. Bool -> a -> a -> a
ifElse True a b = a 
ifElse False a b = b

data Either a b where
  Left   :: forall a b. a -> Either a b
  Right  :: forall a b. b -> Either a b
  deriving (P.Show)

foldEither :: forall a b c. (a -> c) -> (b -> c) -> Either a b -> c
foldEither fa fb (Left  val) = fa val
foldEither fa fb (Right val) = fb val

data Tuple a b where
  Tuple :: forall a b. a -> b -> Tuple a b 
  deriving (P.Show)

first  :: Tuple a b -> a
first    (Tuple a b) = a

second :: Tuple a b -> b
second   (Tuple a b) = b

data Maybe a where
  Nothing :: forall a. Maybe a
  Just :: forall a. a -> Maybe a
  deriving (P.Show)

foldMaybe :: forall a b.  b -> (a -> b) -> Maybe a -> b
foldMaybe n _ Nothing  = n
foldMaybe _ f (Just x) = f x

data List a where
  Nil :: forall a. List a
  Cons :: forall a. a -> List a -> List a
  deriving (P.Show)

foldList :: (b -> a -> b) -> b -> List a -> b
foldList f z Nil = z
foldList f z (Cons x xs) = foldList f (f z x) xs

data Nat where
  Zero :: Nat
  Succ :: Nat -> Nat
  deriving (P.Show)

foldNat :: Nat -> a -> (a -> a) -> a
foldNat Zero z s = z
foldNat (Succ a) z s  = s (foldNat a z s)

plus :: Nat -> Nat -> Nat
plus Zero n = n
plus (Succ m) n = Succ (plus m n)

not :: Bool -> Bool
not False = True
not True = False

main = do 
  P.print (ifElse True 1 2) --1
  P.print (ifElse False 1 2) --2
  P.print (foldNat (Succ (Succ Zero)) 0 (P.+ 1)) -- 2

```

<!--
{% if site.distribution != 'print' %}
-->

## Answers

**Task 1:** There is a certain mapping from `List` to `Boolean` which is very intuitive. So intuitive, that some dialects of Lisp have no `Boolean` type at all and rely just on this mapping. Try to guess this mapping.

---

**Task 2:** Define this mapping (between `List` and `Bool`) in Haskell. Define it once by writing a function from scratch, and twice, with using the `foldList` function.

---

**Task 3:** I present to you the type `List Unit` where `Unit` is the singleton type, known as $1$ (a type with one value). Draw the values of `List Unit` until you run out of space.

OK, here they are (we will draw just the end result, not the arrows). 

![The values of the List Unit type, `(Unit, Nil)` `(Unit, (Unit, Nil))` `(Unit, (Unit, (Unit, Nil)))`, etc](../06_type/list_unit_task_answer.svg)

---

**Task 4:** The `List Unit` type is actually isomorphic to another type that we reviewed here. Find out which.

It is isomorphic to the type of Natural numbers (`Nat`). `List` and `Nat` are both inductive types, the only difference between the two is that the inductive constructor of `List` `Cons` is parametrized by a type i.e. there is one constructor for each value of the type, whereas `Nat` has just one `Succ` constructor. Therefore, a list of a type that has just one value, like `Unit`, is isomorphic to `Nat`.

---

**Task 5:** Write a constructor of Tuple. Write a `fold` function for Either.

First the constructor for tuple. It is very straightforward, in order to be able to have functions that output an `a` and a `b`, you have to *input* an `a` and a `b` in the constructor.

```haskell
data Tuple a b where
  Tuple :: forall a b. a -> b -> Tuple a b 
```

The `fold` function of `Either` is also straightforward, although it may not appear so from a first glance: As the name suggest, an `Either a b`  is either an `a` or a `b`, so to convert `Either a b -> c`, you have to provide `(a -> c)` and `(b -> c)`.

```haskell
foldEither :: forall a b c. (a -> c) -> (b -> c) -> Either a b -> c
foldEither fa fb (Left  val) = fa val
foldEither fa fb (Right val) = fb val
```

---

**Task 6:** Besides `Tuple`, there is one very important negative type, which we will cover in this chapter (and in various other places).

It is the *function* type. We can think of functions as "objects that can be evaluated", which means that, as Tuples, they are characterized by their term elimination rule: a function `a -> b` (together with a value `a`) can be reduced to a value `b`.

---

**Task 7:** Write a Church-encoded version of the natural numbers type

Here it is


$$
\begin{aligned}
type\ \mathbb{N} &= \forall b. b \to (b \to b) \to b \\
zero &: \mathbb{N} \\
zero\ z\ s &= z \\
succ &: \mathbb{N} \to \mathbb{N} \\
succ\ n\ z\ s &= s\ (n\ z\ s) 
\end{aligned}
$$

$$
\begin{aligned}
foldNat &: \forall a\ b. b \to (b \to b) \to \mathbb{N} \to b \\
foldNat\ z\ s\ n &= n\ z\ s 
\end{aligned}
$$

**Task 8:** Define the elimination rule for Booleans, using natural deduction.

The elimination rule(the $ifElse$ function) expressed as a typing rule is this: 

$$\frac{\Gamma \vdash b : \mathrm{Bool} \qquad \Gamma \vdash x : a \qquad \Gamma \vdash y : a}{\Gamma \vdash \mathrm{ifElse}\ b\ x\ y : a}$$

Given a boolean $b$, and two values of some type $a$, we can produce a value of type $a$. 

<!--
{%endif%}
-->

