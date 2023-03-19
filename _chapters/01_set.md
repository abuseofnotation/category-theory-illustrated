---
layout: default
title: Sets
---

Sets
===

Let's begin our inquiry by looking at the basic theory of sets. Set theory and category theory share many similarities. We can view category theory is a *generalization* of set theory. That is, it is meant to describe the same thing as set theory (everything?), but to do it in a more abstract manner, one that is more versatile and (hopefully) simpler. 

In other words sets are an *example of a category* (the *proto-example*, we might say), and it is useful to have examples. 

What is an Abstract Theory
===

> Instead of asking what can be defined and deduced from what is assumed to begin with, we ask instead what more general ideas and principles can be found, in terms of which what was our starting-point can be defined or deduced.
> Bertrand Russell, from Introduction to Mathematical Philosophy

Most scientific and mathematical theories have a specific *domain*, to which they are tied to, and in which they are valid. They are created with this domain in mind and are not intended to be used outside of it. For example, Darwin's theory of evolution is created in order to explain how different *biological species* came to evolve using natural selection, quantum mechanics is a description of how particles behave at a specific scale etc.

Even most mathematical theories, although not inherently *bound* to a specific domain, like the scientific ones, are often strongly related to one, as differential equations are linked to how events change over time. 

Set theory and category theory are different. They are not created to provide a rigorous explanation of how a particular phenomenon works. Instead they provide a more general framework for explaining all kinds of phenomena. They work less like tools and more like languages for defining tools. Theories that are like that are called *abstract* theories. 

The borders of the two are sometimes blurry, because all theories *use abstraction*, otherwise they would be pretty useless: without abstraction Darwin would have to speak about specific animal species or even individual animals. But theories have core concept that don't refer to anything in particular, but instead are left for people to generalize on. All theories are applicable outside of their domains, but set theory and category theory do not have a domain to begin with.

Concrete theories, like the theory of evolution, are composed of concrete concepts. For example the  concept of a *population*, also called a *gene-pool*, refers to a group of individuals that can interbreed. Abstract theories, like set theory, are composed of abstract concepts, like the concept of a set. The concept for a set by itself does not refer to anything. However, we cannot say that it is empty concept, as there are countless things that can be represented by sets, like for example a gene pools can be (very aptly) represented by sets of individual animals. And species of animals can too be represented by set - a set of all populations that can theoretically interbreed.

You already see how abstract theories may be useful. Because they are so simple, they can be used as building blocks of many concrete theories. Because they are common, they can be used to unify and compare different concrete theories, by putting these theories in common grounds (this is very characteristic of category theory, as we will see later.) Moreover, good (abstract) theories can serve as *mental models* for developing our thoughts. 

<!-- comic - brain on category theory -->

<!--
People have tried to be precise and at the same time down to Earth for centuries, and only recently discovered that "precise and down to Earth" is an oxymoron. Let's take Euclidian geometry as an example. Yes, Euclidian geometry is precise, because it is valid for all sets of objects, called ("point" "line" "angle" and "circle" etc.), which have relationships, as defined by the five famous axioms. Yes, geometry does, in many instances, describe the natural world, because there are many sets of objects which have these relations. However, its "precise" part and its "down to Earth" part have nothing to do with each other. We can, for example, define a point as any stain on the floor of your room and that a line as a piece of duct tape, put on the same floor - that will be a completely valid application of the Euclidian laws, albeit not very useful one. Or we can try to use geometry to reason about points on the surface of the Earth, which is a very useful application, of geometry, however not of Euclidian geometry, because Euclidian geometry only describes points on a flat plane, and the Earth is not flat. You can argue that these are actually two separate theories there, which just happen to be perceived as one. You have the axioms, or the postulates on one hand, which are not useful for anything on their own, and you have applications in science and engineering which are somewhat based on them, but not quite. 
-->

Sets
===

Perhaps unsurprisingly, everything in set theory is defined in terms of sets. A set is a collection of things where the "things" can be anything you want (like individuals, populations, genes etc.) Consider, for example, these balls.

![Balls](../01_set/elements.svg)


Let's construct a set, call it $G$ (as gray) that contains *all* of them as elements. There can only be one such set: Because a set has no structure (there is not order, no ball goes before or after another, there are no members which are "special" with respect to their membership of the set) two sets that contain the same elements are just two pictures of the same set.

![The set of all balls](../01_set/all.svg)

This example may look overly-simple but in fact it is just as valid as any other one. 

The key insight that makes the concept useful is the fact that it enables you to reason about several things as if they were one.
 
Subsets 
---

Let's construct one more set. The set of *all balls that are warm color*. Let's call it $Y$ (because in the diagram is colored in **y**ellow.)

![The set of all balls of warm colors](../01_set/subset.svg)

Notice that $Y$ contains only elements that are also present in $G$. That is, every element of the set of $Y$ is also an element in the set $G$. When two sets have this relation, we may say that $Y$ is a *subset* of $G$ (or $Y \subseteq G$). A subset resides completely inside its superset When the two are drawn together.

![Y and G together](../01_set/set_subset.svg)

Singleton Sets
---

The set of all *red balls* contains just one ball. We said above that sets summarize *several* elements into one. Still, sets that contain just one element are perfectly valid - simply put, there are things that are *one of a kind*. The set of kings/queens that a given kingdom has is a singleton set. 

![The singleton set of red balls](../01_set/singleton.svg)

What's the point of the singleton set? Well, it is part of the language of set theory e.g. if we have a function which expects a set of given items, but  if there is only one item that meets the criteria, we can just create a singleton set with that item.

The Empty set
---

Of course if one is a valid answer, so can be zero. If we want a set of all *black balls*  $B$ or all the *white balls*, $W$, the answer to all these questions is the same - the empty set.

![The empty set](../01_set/void.svg)

Because the a set is defined only by the items it contains, the empty set is *unique*- there is no difference between the set that contains zero *balls* and the set that contains zero *numbers*, for instance. Formally, the empty set is marked with the symbol $\varnothing$ (so $B = W = \varnothing$).

The empty set is a special one, for example, it is a subset of every other set or mathematically speaking, $\forall A  \to \varnothing \subseteq A$ ($\forall$ means "for all")

Functions
===

> By function I mean the unity of the act of arranging various representations under one common representation.
> Immanuel Kant, from Critique of Pure Reason

A function is a relationship between two sets that matches each element of one set, called the *source set* of the function, with exactly one element from another set, called the *target set* of the function. 

These two sets are also called the *domain* and *codomain* of the function, or its *input* and *output*.  In programming, they go by the name of *argument type* and *return type*. In logic, they correspond to the *premise* and *conclusion* (we will get there.) We might also say, depending on the situation, that a given function *goes* from this set to that other one, *connects* this set to the other, or that it *converts* a value from of this set to a value from the other one. These different terms demonstrate the multifaceted nature of the concept of function.

Here is a function, $f$ which converts each ball from the set $R$ to the ball with the opposite color in another set $G$ (in mathematics a function's name is often accompanied by the names of its source and target sets, like this: $f: R → G$)

![Opposite colors](../01_set/function_one_one.svg)

This is probably one of the simplest type of functions that exist - one which encodes a *one-to-one relationship* between the sets - *one* element from the source is connected to exactly *one* element from the target (and the other way around).

But functions can also express relationships of the type *many-to-one*, where *many* elements from the source might be connected to *one* element from the target (but not the other way around). For example, a function can express a relationship in which several elements from the source set relate to the same element of the target set.

![Function from a bigger set to a smaller one](../01_set/function_big_small.svg)

Such functions might represent operations such as *categorizing* a given collection of objects by some criteria, or partitioning them, based on some property that they might have.

A function can also express relationships in which some elements from the target set do not play a part.

![Function from a smaller set to a bigger one](../01_set/function_small_big.svg)

An example might be the relationship between some kind of pattern or structure and the emergence of this pattern in some more complicated context.

We saw how versatile functions are, but there is one thing that you cannot have in a function. You cannot have a source element that is not mapped to anything, or that is mapped to more than one target element - that would constitute a *many-to-many* relationship and as we said functions express many-to-one relationships. There is a reason for that "design decision", and we will arrive at it shortly.

Functions in everyday life
---

Sets and functions can express relationships between all kinds of objects, and even people. Every question that you ask that has an answer can be expressed as a function.

The question "How far are we from New York?" is a function with set of all places in the world as source set and its target set consisting of the set of all positive numbers.

The question "Who is my father?" is a function whose source is the set of all people in the world.

**Question:** What is the target of this function?

Note that the question "Who is my child?" is *NOT* a straightforward function, because a person can have no children, or can have multiple children. We will learn to represent such questions as functions later.

**Question:** Do all functions that we drew at the beginning *express* something? Do you think that a function should express something in order to be valid? 

The Identity Function
---

For every set $G$, no matter what it represents, we can define the function that does nothing, or in other words, a function which maps every element of $G$ to itself. It is called the *the identity function* of $G$ or $idG: G → G$.

![The identity function](../01_set/function_identity.svg)

You can think of $idG$ as a function which represents the set $G$ in the realm of functions. Its existence allows us to prove many theorems, that we "know" by intuition, formally.

Functions and Subsets
---

For each set and subset, no matter what they represent, we can define the function that maps each element of the subset to itself:

![Function from a smaller set to a bigger one](../01_set/function_small_big.svg)

Every set is a subset of itself, in which case this function is the same as the identity.

Functions and the Empty Set
---

There is a unique function from the empty set to any other set.

![Function with empty set](../01_set/function_empty.svg)

**Question:** Is this really valid? Why? Check the definition.

Note that this statement is also a result from the one saying that there is a function between a Subset and a Set, and the one that says that the empty set is a subset of any other set.

**Question:** What about the other way around. Are there functions with the empty set as a target as opposed to its source?

Functions and Singleton Sets
---

There is a unique function from any set to any singleton set.

![Function with a singleton set](../01_set/function_singleton.svg)

**Question:** Is this really the only way to connect *any* set to a singleton set in a valid way?

**Question:** Again, what about the other way around?

Sets and Functions with numbers
===

All numerical operations can be expressed as functions, acting on the set of (different types of) numbers. 

Number sets
---

Because not all functions work on all numbers, we separate the set of numbers to several sets many of which are subsets to one another, such the set of whole numbers $\mathbb{Z} := {-\infty... -3 -2, -1, 0, 1, 2, 3... \infty }$, the set of positive whole numbers, (also called "natural" numbers), $\mathbb{N} := {1, 2, 3... \infty }$. We also have the set of Real numbers $\mathbb{R}$ (which includes almost all numbers and the set of positive real numbers (or $\mathbb{R}_{>0}$). 

Number functions
---

Each numerical operation is a function between two of these sets. For example, squaring a number is a function from the set of real numbers to the set of real positive numbers (because both sets are infinite, we cannot draw them in their entirety, however we can draw a part of them).

![The square function](../01_set/square.svg)

I will use the occasion to reiterate some of the more important characteristics of functions:

- All numbers from the target have (or should have) two arrows pointing at them (one for the positive square root and one for the negative one), and that is OK. 

- Zero from the source set is connected to itself in the target set - that is permitted.
- Some numbers aren't the square of any other number - that is also permitted.

Overall everything is permitted, as long as you can always provide exactly one result (also known as *The result™*) per value. For numerical operations, this is always true, simply because math is designed in a way.

> Every generalization of number has first presented itself as needed for some simple problem: negative numbers were needed in order that subtraction might be always possible, since otherwise a − b would be meaningless if a were less than b; fractions were needed in order that division might be always possible; and complex numbers are needed in order that extraction of roots and solution of equations may be always possible.
> Bertrand Russell, from Introduction to Mathematical Philosophy

Note that most mathematical operations, such as addition, multiplication etc. require two numbers in order to produce a result. This does not mean that they are not functions, it means that they are just a little more fancy ones. Depending on what we need, we may present those operations as functions from the sets of *tuples* of numbers to the set of numbers, or we may say that they take a number and return a function. More on that later.

Sets and Functions in Programming
===

Sets are used extensively in programming, especially in their incarnation as *types* (also called *classes*). All sets of numbers that we discussed earlier also exist in most languages as types.

Sets and types
---

Sets are not exactly the same thing as types, but all types are (or can be seen as) sets, for example, we can view the `Boolean` type as a set containing two elements - `true` and `false`.

![Set of boolean values](../01_set/boolean.svg)

Another very basic set in programming is the set of keyboard characters, or `Char`. Characters are actually used rarely by themselves and mostly as parts of sequences.

![Set of characters](../01_set/char.svg)

Most of the types of programming are composite types - they are a combination of the primitive ones that are listed here. Again, we will cover these later.

**Question:** What is the type equivalent of subsets in programming?

Functions and methods/subroutines
---

Some functions in programming (also called methods, subroutines, etc.) kinda resemble mathematical functions - they sometimes take one value of a given type (or in other words, an element that belongs to a given set) and always return exactly one element which belongs to another type (or set). For example here is a function which that takes an argument of type `Char` and returns a `Boolean`, depending on whether the character is a letter.

![A function from Char to Boolean](../01_set/char_boolean.svg)

However functions in most programming languages can also be quite different from mathematical functions - they can perform various operations that have nothing to do with returning a value, which are sometimes called side effects. 

Why are functions in programming different? Well, at the time when most programming paradigms that are in use today were created, computer resources were much more limited than today, and programming - much more cumbersome, so people had bigger problems than the fact that their functions were not mathematically sound. Nowadays, many people feel that mathematical functions are too limiting and hard to use.

They might be right, mathematical functions have one big advantage over non-mathematical ones - their type signature tells you everything that the function does. This is probably the reason why most functional languages are strongly-typed.

Purely-functional programming languages
---

We said that, while all mathematical functions are also programming functions, the reverse is not true for *most* programming languages. There are some languages, that don't permit non-mathematical functions, and for which this equality holds. They are called *purely-functional* programming languages 

A peculiarity in such languages is that they don't directly allow for writing functions that perform operations other than returning values, like rendering stuff on screen, I/O etc.

In purely functional programming languages, such operations are outsourced to the language's runtime, using a style of programming called *continuation passing style*.

{% if site.distribution == 'print'%}

Interlude - type theory
===

Type theory and set theory are related in that type theory can be seen as a more restrictive version of set theory. In set theory you have only one kind of object that is (you guessed it) - set and a set can contain anything, including other sets. In type theory, you generally have two concepts - types and values. 

Russell's paradox
---

In order to understand type theory better, it's useful to see why it was created originally and its first formulation was developed by Bertrand Russell in response to a paradox in the original formulation of set theory (called *naive* set theory today), arising due to the fact that, unlike types (which can only contain *values*), sets can contain other sets. 

In particular, a set can contain itself.

![A set that contains itself](../01_set/set_contains_itself.svg)

Unlike the set above, most sets that we discussed (like the empty set and singleton sets) do not contain themselves. 

![Sets that don't contains themselves](../01_set/sets_dont_contain_themselves.svg)

In order to understand Russell's paradox we will try to visualize *the set all sets that do not contain themselves*. In the original set notation we can define this set to be such that it contains all sets $x$ such that $x$ is not a member of $x$), or $\{x \mid x ∉ x \}$

![Russel's paradox - option one](../01_set/russells_paradox.svg)

If we look at the definition, we recognize that the set that we just defined does not contain itself and therefore it belongs there as well.

![Russel's paradox - option one](../01_set/russells_paradox_2.svg)

Hmm, something is not quite right with this diagram as well - because of the new adjustments that we made, our set now *contains itself*. And removing it from the set would just bring us back to the previous situation. So this is Russell's paradox. 

From set theory to type theory
---

To avert this and related paradoxes, we have to impose certain restrictions to the ways in which you can define sets. And while doing so is possible without any significant changes to the set theory's core (the new paradox-free "version" of set theory by *Zermelo and Fraenkel* is still in use today), Russell himself took a different route and he developed an entirely new mathematical theory that is *like set theory*, but which is much more strict and rigid.

The theory of types defines two primitive concepts - *types and values* which correspond to *sets and set elements*, but at the same time differ in many respects.

Types 
---

Types contain values, so they are like sets in this respect (although this is not true for all formulations of type theory). In fact, every type can be seen as a set of its values. However, unlike sets, which can contain other sets, *a type cannot contain other types*. And so, *not every set is a type* (although the reverse is true.) The proper way to think about type is as a collection of values that *share some common characteristics*.

Values 
---

Values are like set elements, in that they constitute the contents of a type. However, while a given object can be an element of many sets, a given value *belongs to only one type* (we can also say that it *is* a given type) i.e. the type of each value is an intrinsic property of the value.

This may seem weird at first, e.g. when we create a subtype for example, as in the type-theoretic example of our constructing the set of all balls with warm colors, we end up with two instances of all objects that are members of both types, but it actually makes sense after we get used to it, after all we can always convert the more general version of the value to the more specific one, using the function that exist between each set and its subset.

Conclusion
---

I won't get into more details, as there are many versions of type theories which are very different from one another, so examining them wouldn't be easy (e.g. if we look into programming languages, each language uses a different type system and different ways to construct subtypes.) Instead, we will return to using set theory, which in contrast has just a few formulations that are very similar to one another.

But the choice of formal system is not important - all concepts that we are examining here are so essential that they have their counterparts in all set and type theories.

{%endif%}

Functional Composition 
===

Now, we were just about to reach the heart of the matter regarding the topic of functions. And that is functional composition. Assume that we have two functions, $g: Y → P$ and $f: P → G$ and the target of the first one is the same set as the source of the second one.

![Matching functions](../01_set/functions_matching.svg)

If we apply the first function $g$ to some element from set $Y$, we will get an element of the set $P$. Then, if we apply the second function $f$ to *that* element, we will get an element from type $G$.

![Applying one function after another](../01_set/functions_one_after_another.svg)

We can define a function that is the equivalent to performing the operation described above. Let us call it $h: Y → G$. We may say that $h$ is the *composition* of $g$ and $f$, or $h = f \bullet g$ (notice that the first function is on the right, so it's similar to $b = f(g(a)$).

![Functional composition](../01_set/functions_compose.svg)

Composition is the essence of all things categorical. The key insight is that the sum of two parts is no more complex than the parts themselves.  

**Question:** Think about which are the qualities of a function that make composition possible. e.g. does it work with other types of relationships, like many-to-many and one-to-many.

The Power of Composition
---

To understand how powerful composition is, consider the following: one set being connected to another means that each function from the second set can be transferred to a corresponding function from the first one.

If we have a function $g: P → Y$ from set $P$ to set $Y$, then for every function $f$ from the set $Y$ to any other set, there is a corresponding function $f \bullet g$ from the set $P$ to the same set. In other words, every time you define a new function from $Y$ to some other set, you gain one function from $P$ to that same set for free.

![Functional composition connect](../01_set/morphism_general.svg)

For example, if we again take the relationship between a person and his mother as a function, with the set of all people in the world as source, and the set of all people that have children as its target, composing this function with other similar functions would give us all relatives on a person's mother side.

Although you might be seeing functional composition for the first time, the intuition behind it is there - we all know that each person whom our mother is related to is automatically our relative as well - our mother's father is our grandfather, our mother's partner is our father etc.

Representing Composition with Commutative Diagrams
---

In the last diagram, the equivalence between $f \bullet g$ and the new function $h$ is expressed by the fact that if you follow the arrow $h$ for any element of set $Y$ you will get to the same element of the set $G$ as the one you will get if you follow the $g$ and then follow $f$. Diagrams that express such equivalence between sequences of function applications are called *commutative diagrams*.

![Functional composition](../01_set/functions_compose.svg)

If we "zoom-out" the view of the last diagram so it does not show the individual set elements, we get a more general view of functional composition.

![Functional composition for sets](../01_set/functions_compose_sets.svg)

In fact, because this diagram commutes (that is, all arrows, starting from a given set element ultimately lead to the same corresponding element from the resulting set), this view is a more appropriate representation of the concept (as enumerating the elements is redundant). 

Having this insight allows us to redefine functional composition in a more visual way.

> The composition of two functions $f$ and $g$ is a third function $h$ defined in such a way that this diagram commutes.

![Functional composition - general definition](../01_set/functions_compose_general.svg)

Diagrams that show functions without showing the elements of the sets are called *external diagrams*, as opposed to the and the ones that we saw before, which are *internal*.

At this point you might be worried that I had forgotten that I am supposed to talk about category theory and I am just presenting a bunch of irrelevant concepts. I really tend to do that, but not now - the fact that *functional composition* can be presented without even mentioning category theory doesn't stop it from being one of the category theory's *most important concepts*, we will see why shortly, but we have to review a few more things before.

Isomorphism
===

Let's check another concept which is very important in category theory (although it is not exclusive to it) - the concept of an *isomorphism*. 

To do that, we go back to the examples of the types of relationships that functions can represent, and to the first and most elementary of them all - the *one-to-one* type of relationship. We know that all functions have exactly one element from the source set, pointing to one element from the target set. But for one-to-one functions *the reverse is also true* - exactly one element from the target set points to one element from the source. 

![Opposite colors](../01_set/function_one_one.svg)

If we have a one-one-function that connects sets that are of the same size (as is the case here), then this function has the following property: all elements from the target set have exactly one arrow pointing at them. In this case, the function is *invertible*, that is, if you flip the arrows of the function and its source and target, you get another valid function.

![Opposite colors](../01_set/isomorphism_one_one.svg)

Invertible functions are called *isomorphisms*. When there exists an invertible function between two sets we say that the sets are *isomorphic*. For example, because we have an invertable function that converts the temperature measured in *Celsius* to temperature measured in *Fahrenheit* and vise versa, we can say that the temperatures measured in Celsius and Fahrenheit are isomorphic.

Isomorphism means "same form" in Greek (although actually their form is the only thing which is different between two isomorphic sets.)

More formally, two sets $R$ and $G$ are isomorphic (or $R ≅ G$) if there exist functions $f: G → R$ and its reverse $g: R → G$, such that $f \bullet g = idR$ and $g \bullet f = idG$ (notice how the identity function comes in handy.)

Isomorphism and identity
---

If you look closely you would see that the identity function is invertible too (its reverse is itself), so each set is isomorphic to itself in that way.

![The identity function](../01_set/isomorphism_identity.svg)

Therefore, the concept of an isomorphism contains the concept of equality - all equal things are also isomorphic.

Isomorphism and composition
---

An interesting fact about isomorphisms is that if we have functions that convert a member of set $A$ to a member of set $B$ and the other way around . Then, because of functional composition, we know that any function from/to $A$ has a corresponding function from/to $B$.

![The architecture of isomorphism](../01_set/isomorphism_general.svg)

For example, if you have a function "is the partner of" that goes from the set of all married people to the same set, than that function is invertible. That is not to say that you are the same person as your significant other, but rather that every statement about you, or every relation you have to some other person or object is also a relation between them and this person/object, and vice versa. 

Composing isomorphisms
---

Another interesting fact about isomorphisms is that if we have two isomorphisms that have a set in common, then we can obtain a third isomorphism between the other two sets that would be the result of their (the isomorphisms) composition.

Composing two isomorphisms into another isomorphism is possible by composing the two pairs of functions that make up the isomorphism in the two directions. 

![Composing isomorphisms](../01_set/isomorphisms_compose.svg)

Informally, we can see that the two morphisms are indeed reverse to each other and hence form an isomorphism. If we want to prove that fact formally, we will do something like the following: 

Given that if two functions are isomorphic, then their composition is equal to an identity function, proving that functions $g \bullet f$ and $f' \bullet g'$, are isomorphic is equivalent to proving that their composition is equal to identity.

$g \bullet f \bullet f' \bullet g' = id$

But we know already that $f$ and $f'$ are isomorphic and hence $f\bullet f' = id$, so the above formula is equivalent to (you can reference the diagram to see what that means):

$g \bullet id \bullet g' = id$

And we know that anything composed with $id$ is equal to itself, so it is equivalent to:

$g \bullet g' = id$

which is true, because $g$ and $g'$ are isomorphic and isomorphic functions composed are equal to identity.

By the way, there is another way to obtain the isomorphism - by composing the two morphisms one way in order to get the third function and then taking its reverse, But to do this, we have to prove that the function we get from composing two bijective functions is also bijective. 

Isomorphisms Between Singleton Sets
---

Between any two singleton sets, we may define the only possible function.

![The only possible function between singletons](../01_set/singleton_function.svg)

The function is invertible, which means that all singleton sets are isomorphic to one another, and furthermore (which is important) they are isomorphic *in one unique way*.

![Isomorphic singletons](../01_set/singleton_isomorphism.svg)

Following the logic from the last paragraph, each statement about something that is one of a kind can be transferred to a statement about another thing that is one of a kind. 

**Question:** Try to come up with a good example that shows how a statement that demonstrates the isomorphism between singleton sets (I obviously couldn't). Consider that all of people and objects are sharing one and the same universe.

Equivalence relations and isomorphisms
===

We said, that isomorphic sets aren't necessarily the same set (although the reverse is true.) However, it is hard to get away from the notion that being isomorphic means that they are *equal* or *equivalent* in some respect. For example, all people who are connected by the *isomorphic* mother/child relationship share some of the same genes. 

And in computer science, if we have functions that convert an object of type $A$ to an object of type $B$ and the other way around (as for example the functions between a data structure and its id, we also can pretty much regard $A$ and $B$ as two formats of the same thing, as having one means that we can easily obtain the other.

Equivalence relations
---

What does it mean for two things to be equivalent? The question sounds quite philosophical, but there is actually is a formal way to answer it i.e. there is a mathematical concept that captures the concept of equality in a rather elegant way - the concept of an *equivalence relation*. 

So what is an equivalence relation? We already know what a relation is - it is a connection between two sets (an example of which is function.) But when is a relation an equivalence relation? Well, according the definition it is when it follows three laws, which correspond to three intuitive ideas about equality. Let's review them.

Reflexivity
---

The first idea that defines equivalence, is that *everything is equivalent with itself*. 

![Reflexivity](../01_set/reflexivity.svg)

This simple principle translates to the equally simple law of *reflexivity*: for all sets $A$, $A=A$.

Transitivity
---

The second idea that defines the concept of equivalence is the idea that things that are equal to another thing must also equal between themselves. 

![Transitivity](../01_set/transitivity.svg)

Mathematically, for all sets $A$ $B$ and $C$, if $A=B$ and $B=C$ then $A=C$. 

Note that we don't need to define what happens in similar situations that involve more than three sets, as they can be settled by just multiple application of this same law. 

Symmetry
---
If one thing is equal to another, the reverse is also true (i.e the other thing is also equal to the first one. This idea is called *symmetry*. Symmetry is probably the most characteristic property of the equivalence relation, which is not true for almost any other relation. 

![symmetry](../01_set/symmetry.svg)

In mathematical terms: if $A=B$ then $B=A$.

Isomorphisms as equivalence relations
---

Isomorphisms *are* indeed equivalence relations. And "incidentally", we already have all the information needed to prove it (in the same way in which James Bond seems to always incidentally have exactly the gadgets that are needed to complete his mission.) 

We said that most characteristic property of the equivalence relation is its *symmetry*. And this property is satisfied by isomorphisms, due to the isomorphisms' most characteristic property, namely the fact that they are *invertible*.

![Symmetry of isomorphisms](../01_set/isomorphism_symmetry.svg)

**Task:** One law down, two to go: Go through the previous section and verify that isomorphisms also satisfy the other equivalence relation laws.

The practice of using isomorphisms to define an equivalence relation is very prominent in category theory where isomorphisms are denoted with $≅$, which is almost the same as $=$ (and is also similar to having two opposite arrows connecting one set to the other.)

{% if site.distribution == 'print'%}

Interlude - numbers as isomorphisms
===

Many people would say that the concept of a number is the most basic concept in mathematics. But actually they are wrong - *sets and isomorphisms are more basic*! Or at least, numbers can be defined using sets and isomorphisms. 

To understand how, let's think about how do you teach a person what a number is (in particular, here we will concentrate on the *natural*, or counting numbers.) You may start your lesson by showing them a bunch of objects that are of a given quantity, like for example if you want to demonstrate the number $2$, you might bring them like two pencils, two apples or two of something else. 

![Two balls](../01_set/number_two.svg)

When you do that, it would be important to highlight that you are not refering to only the left object, or only about the right one, but that we should consider both things as at once (i.e. both things as one), so if the person whom you are explaining happens to know what a set is, this piece of knowledge might come in handy. And also, being good teachers we might provide them with some more examples of sets of 2 things.

![A set of two balls](../01_set/number_two_sets.svg)

This is a good starting point, but the person may still be staring at the objects instead of the structure - they might ask if this or that set is $2$ as well. At this point you might give up, or, if the person whom you are explaining happens to know about isomorphisms as well (let's say they lived in a cave with nothing but this book with them), you can easily formulate your final definition, saying that the number $2$ is represented by those sets and all other sets that are isomorphic to them, or by the *equivalence class* of sets that have two elements, as the formal definition goes (don't worry, we will learn all about equivalence classes later.)

![A set of two balls](../01_set/number_two_isomorphism.svg)

At this point there is no more examples that we can add. In fact, because we consider all other sets as well, we might say that this is not just a bunch of examples, but a proper *definition* of the number $2$. And we can extend that to include all other numbers. In fact, the first definition of a natural number (presented by Gottlob Frege in 1884) is roughly based on this very idea.

Before we close this chapter, there is one meta-note that we should definitely make: according to the definition of a number that we presented, a number is not an *object*, but a whole *system of interconnected objects*, containing in this case an infinite number of objects. This may seem weird to you, but it's actually pretty characteristic of the categorical way of modeling things.

{%endif%}
