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

As we said in the first long disclaimer, there is not one, but many type theories, so if we want to do type theory, we we have to pick one type theory, to work with (if this sentence confuses you, read the first disclaimer again).

Picking a type theory (or a type system let's call it), also involves picking a *language* that this theory is described in terms of. When hearing about language, programmers would probably think of the popular feature-rich programming languages like TypeScript or Java. *Type theorists*, on the other hand, have different preferences --- since they are interested in the type system, not the language, they don't really care about language features, and so the language of choice of most of them is the simplest, most minimal language that is possible to exist, namely *Lambda Calculus*. If you haven't heard about it, this is language that has only has (anonymous) functions and nothing else.

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

Then, `True :: Bool` says that "$True$ is a boolean" i.e. it adds one value to this newly created datatype. In the diagram, we will represent that as an arrow from the empty type, as per the Elementary Theory of the Category of Sets (see chapter 2).

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
So, here it is.

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

This argument applies not only to mathematical theories, but to everything else that is "countable", so to say. This is because it is the basis of the mathematical definition of natural numbers, as famously synthesized in the 19th century by the Italian mathematician Giuseppe Peano (There are some laws as well, but we will cover them later).

1. $0$ is a natural number.
2. If $n$ is a natural number, $n+1$ is a natural number.

Or as Haskellians say:

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

i.e. there is just one natural numbers type.

![The Natural numbers type without values --- an empty circle](../06_type/nat_type_empty.svg)

Term introduction
---

The first constructor is also trivial.

```haskell
  Zero :: Nat
```
It allows us to construct one value, called zero 


![The Natural numbers type with Zero added --- an circle, containing one ball - "0"](../06_type/nat_type_zero.svg)

i.e. it is a *mot à mot* repetition of Peano's first axiom.

> 1. $0$ is a natural number.

The second constructor is more interesting. 

```haskell
  Succ :: Nat -> Nat
```

It says that there is  constructor, called "Successor" `Succ` (or `+1`, as we can would call it) i.e. this is the equivalent of 

> 2. If $n$ is a natural number, $n+1$ is a natural number.

`Succ` is an arrow from the type of the natural numbers to itself which means that given one natural number, `Succ` constructs another one. 

But right now we have just one term (value) of the natural numbers type: `Zero`. We draw the `Succ` arrow and construct another one, `Succ Zero` (known in some contexts as $1$.

![The Natural numbers type without values --- ](../06_type/nat_type_one_double_diagram.svg)

And now, we have one more value so we have to draw one more `Succ` arrow. This time the result is `Succ Succ Zero` i.e. two.

![The Natural numbers type without values --- an empty circle](../06_type/nat_type_two_double_diagram.svg)

And we go on like this, *ad infinitum*, creating an endless chain of values.

![The Natural numbers type without values --- an empty circle](../06_type/nat_type_full.svg)

Hm, this notation is a bit clunky, if only there were a better way to represent such object. Oh, wait.

![The Natural numbers type without values --- an empty circle](../06_type/nat_type_full_normal.svg)

And this is how you define an *inductive* type (or a *recursive* type, we can also call it). 

Term elimination
---

Wait, there are also elimination rules, I always forget elimination rules. Here it is:

```haskell
foldNat :: Nat -> a -> (a -> a) -> a
foldNat Zero z s = z
foldNat (Succ a) z s  = s (foldNat a z s)
```
This allows us, for example, to convert our `Nat`s to the normal Haskell `Nat`s:

```haskell
foldNat (Succ (Succ Zero)) 0 (+ 1) -- 2
```

Any other canonical function that converts a list to other type can also be defined using the elimination rule.

Composite types. The list type.
===

The landscape of types would be a really... flat place, without the *composite types*. Those are the types that allow you to unite several values of other types, into one. 

The ultimate composite type is the list. The linked list specifically, is a thing of beauty, as we shall see shortly.

```haskell
data List a where
  Nil :: forall a. List a
  Cons :: forall a. a -> List a -> List a
```
Let's unpack:

Type formation
---

The type formation rule tells us the `List` (like `Maybe`) is a composite type. 

```haskell
data List a 
```

This means, that there is not one, but many  `List` types, such as `List Nat` `List Bool` etc (infinitely many, if you consider lists of lists (of lists)). Those are usually read as "List of natural numbers", "List of Booleans" etc. 

![The `List Nat` and `List Bool` types without values --- A type-universe function, connecting `Bool` and `Nat` to `List Bool` and `List Nat` empty circles.](../06_type/list_type_empty.svg)

Term introduction
---

Now, let's check the constructors. The first defines a static value, one for each list, representing the empty list. 

```haskell
Nil :: forall a. List a
```

We will call this value `Nil` (although native Haskell lists use the `[]` symbol).

![The `List Nat` type with just a Nil value --- A circle with a single ball inside it. An arrow from the unit type, pointing to that value](../06_type/list_type_nil.svg)

And now for the more interesting part. The signature of `Cons`, our second constructor is the following.

```haskell
Cons :: forall a. a -> List a -> List a
```
The `List a -> List a` part is pretty similar to the inductive `Succ` constructor, And indeed, like `Succ`, `Cons` is a recursive constructor that generates an infinite amount of terms. However, unlike `Succ` that has signature `Nat -> Nat` (i.e. for each `Nat`, there is another one) `Cons` has a signature `a -> List a -> List a` --- there is one `List a -> List a` constructor for every value of `a`. We can visualize `Cons` as an arrow, which points not to a value, but to another arrow. 

![The `Cons` function --- An arrow from the `Nat` type, pointing to an arrow from the list type to itself: 0 -> Nil -> (0,Nill), 1 -> Nil -> (1,Nill) etc. ](../06_type/list_type_cons.svg)

You can view this constructor as the operation of adding the value `a` to a list (and returning a new list).

As you probably expect, the `List` type is inductive i.e. every arrow that you draw generates more arrows (here, we only draw *part* of them (the ones that come from the list `(1,Nill)`).

![The `Cons` function --- An arrow from the `Nat` type, pointing to an arrow from the list type to itself: 0 -> (1, nill) -> (0, (1,Nill)), 1 -> (1, Nil) -> (1,(1,Nill)) etc. ](../06_type/list_type_cons_2.svg)

The result is a type with values that are... well, *lists* of other values, 

Term elimination
---

Now, let's write the term elimination rule.

```haskell
foldList :: (b -> a -> b) -> b -> List a -> b
foldList f z Nil = z
foldList f z (Cons x xs) = foldList f (f z x) xs
```

**Task 1:** There is a certain mapping from `List` to `Boolean` which is very intuitive. So intuitive, that some dialects of Lisp have no `Boolean` type and all and rely just on this mapping. Try to guess this mapping.

![The list type: (Nil) (1,Nill), (1,(1,Nill)), (1,(1,Nill)) etc. and the `Boolean` type: True and False with places to draw arrows List to Bool](../06_type/list_bool_task.svg)

**Task 2:** Define this mapping (between `List` and `Bool`) in Haskell. Define it once by writing a function from scratch, and twice, with using the `foldList` function.

```haskell
f :: (Bool -> a -> Bool) 
f = undefined
```

```haskell
foldList f False 
```

**Task 3:** I present to you the type `List Unit` where `Unit` is the singleton type, known as $1$ (a type with one value). Draw the values of `List Unit` until you run out of space.

![The list type, containing one value (`Nil`) the Unit type (containing one circle), with function `(Unit) -> Nil -> (Unit, Nil)`.](../06_type/list_unit_task.svg)

**Task 4:** The `List Unit` type is actually isomorphic to another type that we reviewed here. Find out which.

Positive and negative types. Either and Tuples.
===


Now, we will quickly present two more types, (hm... I have the feeling that I actually have seen those before).

Either
---

The `Either` type is an interesting one. 

![The Either type ](../06_type/either_type.svg)

It is a type that is parametrized by two types `a` and `b`, and has two constructors/term introduction rules --- one constructor, called `Left`, that takes a value of `a`. And another one, called `Right` that takes a `b`. Here is the definition of Either:

```haskell
data Either a b where
  Left   :: forall a b. a -> Either a b
  Right  :: forall a b. b -> Either a b
  deriving (P.Show)
```
(We will not publish a `fold` function.)

Tuple
---

The next type that we will introduce is the `Tuple` type, which is also parametrized by `a` and `b`, but it contains *both* a value of `a` and a value of `b`. 

![The Either type ](../06_type/tuple_type.svg)

Here we will do something different --- instead of the definition, we will directly present the type elimination rules.

```haskell
first  :: forall a b. Tuple a b -> a
second :: forall a b. Tuple a b -> b
```

**Task 5:** Write a constructor of Tuple. Write a `fold` function for Either.

Positive and negative types
---

The `Either` type is uniquely defined by its introduction rules i.e. the elimination rules can be derived from the introduction rules.

```haskell
forall a b. a -> Either a b
forall a b. b -> Either a b
```

`Tuple`, on the other hand, is defined by its elimination rules i.e. the introduction rules can be derived from them:

```haskell
forall a b. Tuple a b -> a
forall a b. Tuple a b -> b
```
Types that, like `Either`, are defined by their introduction rules are called *positive types*. Types that are defined by their elimination are *negative*. All types that we saw so far (except `Tuple`) are positive. 

**Task 6:** Besides `Tuple`, there is one very important negative type, which we will cover in this chapter (and in various other places).

<!--
{% if site.distribution != 'print' %}
-->

Interlude: From Haskell to System F
===

More precisely, we can define arrows not only from an existing types to new ones, but *products* of existing types to new ones.  There is not so much to say, as Haskell products work pretty much like regular products, except they can accept any number of arguments, from 0 to infinity (it's most probably less than that, but nevermind). 

<!--
{%endif%}
-->


Formal definition
===

We saw how Lambda Calculus *works*, now we will see how it is defined formally. The answer is that, as all type systems, it is defined by *typing rules*. And what are typing rules? Well, basically they are also arrows. (Surprised?) 

Natural deduction
---

Yes, Haskell's, typing rules are indeed arrows, but they are defined in a language that is different from Haskell, called *natural deduction*. Natural deduction is like Haskell, but it uses a syntax where, where the premise and the conclusion are separated by a horizontal dash, e.g. instead of...

```haskell
a -> b
```

...we write...

$$\frac
    a
    b
$$

Aside from that, there is no big difference between natural deduction and Haskell. Take, for example the boolean type. We defined it in Haskell like this:

```haskell
data Bool where
  True  :: Bool
  False :: Bool
```

However, in some type systems (e.g. in most programming languages) the Boolean type is defined as one of the "primitive" types that are part of the type system itself. If we want for our type system to feature the Boolean type as a primitive, we define it using natural deduction. 

$$\frac
    {}               
    {Bool :: Type}
$$

There is a type called Bool (technically, this is not a typing rule, but a "kinding" rule (and thus the double-colon)).

$$\frac
    {}               
    {True : Bool}
$$

$$\frac
    {}
    {False : Bool}
$$

$True$ and $False$ are Bools.

Oh I forgot, in natural deduction it is permitted to have conclusions without premises.

Contexts
---

Is this *too* simple? Let's add the concept of the typing *context* (or typing *environment*) to the mix.

Here's the deal: Types and variables have to be stored *somewhere*. So, given a bunch of values (e.g. $x$, $y$, $z$ etc.) and a bunch of types (e.g. $A$, $B$, $C$ etc.), a context is a *set* (Oops, I did it again) of all variables and their types e.g. ${ (x, A), (y, B), (z, B)... }$.

We usually denote the context with the letter $\Gamma$, and we use the $\vdash$ symbol to denote something that follows from that context (oh, no not another arrow) e.g. $\Gamma \vdash a : b$ means that in the context $\Gamma$, there is a variable $a$ that has the type $b$.).

So, when we consider the contex, the above definition becomes

$$\frac
    {}               
    {\Gamma \vdash Bool :: Type}
$$

i.e. the context includes the type $Bool$ 

$$\frac
    {}               
    {\Gamma \vdash True : Bool}
$$

i.e. the context includes the value $True$ of type $Bool$

$$\frac
    {}
    {\Gamma \vdash False : Bool}
$$

i.e. the context includes the value $False$ of type $Bool$

Thus, we straight away define the Boolean type to be part of the context.

Value-level arrows --- The Simply-typed Lambda Calculus.
---

With that, we start listing the axioms of Lambda Calculus. They are nothing more than the definition of the type of value-level arrows. i.e. functions.

There are several typing rules that we have to define, starting with the most basic one, which is sometimes called *Var*, that states the following: if we previously said that $x$ has type $A$, then $x$ has type $A$.

$$\frac
    {x : A \in \Gamma}
    {\Gamma \vdash x : A}
$$

Now, we proceed to define the types of the arrows.

We start with the type formation rule (or the kinding rule, as it is called here).

$$\frac
    {\Gamma \vdash A :: Type, \Gamma \vdash B :: Type}
    {\Gamma \vdash A \to B :: Type}
$$

And then the two typing rules. One is the term introduction for lambda terms, which is called *abstraction* (or *Abs*).

$$\frac
    {\Gamma, x:A \vdash y: B}
    {\Gamma \vdash \lambda z : A \to B}
$$

(i.e. if we have a way given a value $x$ of type $A$ to obtain a value $y$ of type $B$, then we have ourselves a function $A \to B$).

And there is also term elimination for lambdas, i.e. function *application* (App).

$$\frac
    {\Gamma \vdash z: A \to B, \Gamma \vdash x: A}
    {\Gamma \vdash z x : B }
$$


For example, if we take the function $length: string \to int$. For it the abstraction would be: 

$$\frac
    {\Gamma, x:string \vdash y: int}
    {\Gamma \vdash \lambda length : string \to int}
$$

And function *application*  would be

$$\frac
    {\Gamma \vdash length: string \to int, \Gamma \vdash x: string}
    {\Gamma \vdash length\ x : int }
$$

The rules we reviewed so far define a type system called *Simply-typed Lambda Calculus* (STLC). This is a system which is just like Haskell/System F, except *you cannot make your own types*. In STLC all types have to be defined as part of the language (in the way in which we defined the Boolean type above). 

And furthermore, the types in STLC are all *monomorphic* i.e. we define the List of strings is defined separately from the list of integers (and there is no way to define a function that works in all lists, regardless of the type of values they are storing). 

To combat this problem, and to ascend ourselves from *Simply-typed* Lamblda Calculus and *Polymorphic* Lambda Calculus (System F), we add the type-level arrows.

Hold it, actually we should talk about Kinds first.

Kinds
---

In the expression $x: A$, $A$ is a type. But then what is $Type$ in the Expression $A :: Type$? We cannot say that $A$ has a *type* $Type$, cause we see that Russell's paradox lurking behind our back. In Lambda Calculus, it is resolved in the following way:

* values have types (which are annotated with single-colon -- $:$) 
* types have types-of-types i.e. *kinds* (which are annotated with a double-colon -- $::$. 

This means that besides a type system and typing rules, we have a *kind-system* and *kinding rules*. But don't throw this book out of the window! The kinding system for both STLC and System F is pretty easy to define.

In STLC there is just one kind, that we call $Type$ (sometimes it is marked with a $*$).

$$\frac
    {}
    {\Gamma \vdash Type}
$$

And then the type definition rules are defined using this kind e.g. 

$$\frac
    {}
    {\Gamma \vdash Bool :: Type}
$$

And, in System F, we would see later.

Type-level arrows and polymorphic functions --- System F
---

We started defining STLC by defining value-level *variables*, using the trivial *Var* typing rule, 

$$\frac
    {x : A \in \Gamma}
    {\Gamma \vdash x : A}
$$

System F we also have *type-level variables*, with the *TVar* *kinding* rule.

$$\frac
    {A :: K \in \Gamma}
    {\Gamma \vdash A :: K}
$$

Now, let's proceed with the arrows themselves. Value-level arrows convert values to other values.

$$\frac
    {\Gamma \vdash A :: Type, \Gamma \vdash B :: Type}
    {\Gamma \vdash A \to B :: Type}
$$

In System F, we have *type-level* arrows that convert types to other types. They are defined with this kinding rule:

$$\frac
    {\Gamma, (\alpha :: A) \vdash (B :: Type)}
    {\Gamma \vdash \forall (\alpha :: A). (B.A :: Type)}
$$

For example, for the $Maybe$ type, this rule would say

$$\frac
    {\Gamma, (\alpha :: Type) \vdash Maybe\ \alpha :: Type}
    {\Gamma \vdash \forall (\alpha :: type). Maybe\ \alpha :: Type}
$$

The more interesting (and harder) part is augmenting value-level arrows to work with polymorphic types i.e. to have functions which accept a type as an argument, in addition to a value.

For example, let's say we have a $MaybeString$ type, which works only with strings. Then, a function that wraps a some value in a $Maybe$ would look like this:

$$z :: string \to MaybeString $$

From this, we abstract the type $String$ (with the rule *TAbs* to build a polymorphic function, which looks like this.

$$z' :: \forall \alpha. \alpha \to Maybe\ \alpha$$

And then, we use *TApp* to apply the type parameter $String$ to the abstract function to get our original function. Haskell does that automatically for us, so this is not a real Haskell syntax, but in the original notation of System F it looks like this.

$$z = z'[String]$$

If you have an ides, you can look at the typing rules themselves, *type abstraction* (or *TAbs*), 

$$\frac
    {\Gamma, (\alpha :: A) \vdash z : C}
    {\Gamma \vdash (\Lambda \alpha :: A . z) : \forall (\alpha :: A) . C}
$$

And *type application* (*TApp*)

$$\frac
    {\Gamma \vdash z' : \forall (\alpha :: A) . C , \Gamma  \vdash (X :: A)}
    {\Gamma \vdash z'[X] : C[\alpha := X]}
$$

Types and Logic
===

A statement can be viewed as a type and a proof of the statement --- a value of that type.

Types Logic and Category Theory
===

Now, let's see the categorical perspective of what are we taling about. We already know that a type corresponds to an *object* in the category of types, and a categorical object has to have at three kinds of morphisms in order for the object to play a role in the category, which correspond to the three types of functions in programming.

In thinking of a category as a type theory, the objects of a category are regarded as types (or sorts) and the arrows as mappings between the corresponding
types. Roughly speaking, a category may be thought of a type theory shorn of its syntax. In the 1970s Lambek20 established that, viewed in this way, cartesian closed categories correspond to the typed λ-calculus. Later Seely [1984] proved that locally Cartesian closed categories correspond to Martin-L¨of, or predicative, type theories. Lambek and Dana Scott independently observed that C-monoids, i.e., categories with products and exponentials and a single, nonterminal object correspond to the untyped λ-calculus. The analogy between type theories and categories has since led to what Jacobs [1999] terms a “type-theoretic boom”, with much input from, and applications to, computer science

Value-level arrows are morphisms.

What about type level arrows? We will learn in the next chapter.


Addendum: The connection between tuple function top and bottom.
===

Terminal objects are nullary products

<!--
{% if site.distribution != 'print' %}
-->

Answers
===

**Task 1:** There is a certain mapping from `List` to `Boolean` which is very intuitive. So intuitive, that some dialects of Lisp have no `Boolean` type and all and rely just on this mapping. Try to guess this mapping.

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

<!--
{%endif%}
-->
