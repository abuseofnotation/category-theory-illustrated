---
layout: default
title: Natural transformations
---

Natural transformations 
===

> I didn’t invent categories to study functors; I invented them to study natural transformations. --- Saunders Mac Lane

In this chapter, we will introduce the concept of a morphism between functors or *natural transformation*. Understanding natural transformations will enable us to define category equality and some other advanced concepts.

Natural transformations really are at the heart of category theory, however, their importance is not obvious at first. So, before introducing them, I like to talk, once more, about the body of knowledge that this heart maintains (I am good with metaphors... in principle).

I can put this next section anywhere in this book, and it would always be neither here nor there. But anyway, if you are studying math, you are probably interested in the *nature of the universe*. "What is the quintessential characteristic of all things in this world?" I hear you ask...

Objects are overrated AKA Heraclitus was right!
===

> The world is the collection of facts, not of things. --- Ludwig Wittgenstein

What is the quintessential characteristic of all things in this world? Some 2500 years ago, the philosopher Parmenides gave an answer to this question, postulating that the nature of universe is permanence, stasis. According to his view, what we perceive as processes/transformations/change are merely illusory appearances ("Whatever is is, and what is not cannot be"). He said that that things never really change, they only *appear* to change, or (another way to put it), only appearances change, but the *essence* does not (I think, this is pretty how the world "essence" came to exist).

Although far from obviously true, his view is easy for people to relate to --- objects are all around us, everything we "see", both literary (in real life), or metaphorically (in mathematics and other disciplines), can be viewed as *objects*, persisting through space and time. If we subscribe to this view, then we would think that the key to understanding the world is understanding *what objects those are*. In my opinion, this is what set theory does, to some extend, as well as classical logic (Plato was influenced by Parmenides when he created his theory of forms).

However, there is another way to approach the question about the nature of the universe, which is equally compelling. Because, what is an object, when viewed by itself? Can we study an object in isolation? And will there anything left to study about it, once it is detached from its environment? If a given object undergoes a process to get all of it's part replaced, is it still the same object?

Asking such questions might lead us to suspect that, although what we *see* when we look at the universe are the objects, it is the processes/relations/transitions or *morphisms* between the objects that are the real key to understanding it. For example, when we think hard about everyday objects we realize that each of them has a specific *functions* (note the term) without which, a thing would not be itself e.g. is a lamp that doesn't glow, still a lamp? Is there food that is non-edible (or an edible item that isn't food)? And this is even more valid for mathematical objects, which, without the functions that go between them, are not objects at all. So, instead of thinking about objects that just happen to have some morphisms between them, we might take the opposite view and say *that objects are only interesting as sources and targets of morphisms.* 

Although old, dating back to Parmenides' alleged rival Heraclitus, this view has been largely unexplored, until the 20th century, when a real mathematical revolution happened: Bertrand Russell created type theory, his student Ludwig Wittgenstein wrote a little book from from which the above quote comes from. A book which was admired by a group of mathematicians and logicians, known as the "Vienna circle", part of which was Rudolph Carnap who, coined the word "functor"...

Equivalent categories
===

So, are you ready to hear about natural transformations? Actually it is my opinion that you are not (no offence, they are just very hard). So, we will take the longer route. 

My aim is to introduce natural transformation as a motivating example for creating a way to say that two categories are equal. But for that, we need to understand what equal categories are and should be.

Isomorphism invariance
---

An embodiment of Heraclitus' view in the realm of category theory is concept of *isomorphism invariance* that we implicitly touched several times. 

All categorical constructions that we covered (products/coproducts, initial/terminal objects, functional objects in logic) are *isomorphism-invariant*.
Or, equivalently, they define an objects *up to an isomorphism*. 

Or, if there are two or more objects that are isomorphic to one another, and one of them has a given property, then the rest of them would to also have this property as well. 

In short, in category theory **isomorphism = equality**.

The key to understanding category theory lies in understanding isomorphism invariance. And the key to understanding isomorphism invariance are natural transformations.

Categorical isomorphisms are *not* isomorphism-invariant
---

Let's ask ourselves the same question that we were pondering at the beginning of the previous chapter --- what does it mean for two categories to be equal. 

In the prev chapter, we talked a lot about how great isomorphisms are and how important they are for defining the concept of equality in category theory, but at the same time we said that *categorical isomorphisms* do not capture the concept of equality of categories.

![Isomorphic categories](../11_natural_transformations/isomorphic_categories.svg)

This is because (though it may seem contradictory at first) *categorical isomorphisms aren't isomorphism invariant*, i.e. categories that only differ by having some additional isomorphic objects aren't isomorphic themselves.

![Isomorphic categories](../11_natural_transformations/equal_categories.svg)

For this reason, we need a new concept of equality of categories. A concept that would ellucidate the *differences* between categories with different structure, but also the *sameness* of categories who have the same categorical structures, disregarding the differences that are irrelevant for category-theoretic standpoint. That concept is *equivalence*.

<!--comic
**Parmenides:** This category surely cannot be equal to the other one --- it has a different amount of objects!

**Heraclitus:** Who cares bro, they are isomorphic.
-->

Equivalences are isomorphism invariant
---

To understand equivalent categories better, let's go back to the functor between a given map and the area it represents (we will only consider the thin categories (AKA orders) for now). In order for this functor to be invertible (and the categories --- isomorphic) the map should represent the area completely i.e. there should be arrow for each road and a point for each little place.

![Isomorphic categories](../11_natural_transformations/isomorphic_map.svg)

Such a map is necessary if your goal is to know about all *places*, however, like we said, when working with category theory, we are not so interested in *places*, but in the *routes* that connect them i.e. we focus not on *objects* but on *morphisms*.

For example, if there are intersections that are positioned in such a way that there are routes from one and to the other and vice-versa a map may may collapse them into one intersection and still show all routes that exist. 

![Equivalent categories](../11_natural_transformations/equivalent_map.svg)

These two categories are *not isomorphic* --- going from one of them to the other and back again doesn't lead you to the same object. 

However, going from one of them to the other would lead you at least to an *isomophic object*. 

![Equivalent categories](../11_natural_transformations/equivalent_map_equivalence.svg)

In this case we say that the orders are *equivalent*.

Defining equivalence in terms of objects
---

So, two orders are isomorphic if there are two functors, such that going from one to the other and back again leads you to the same object.

And two orders are equivalent if going from one of them to the other and back again leads you to the same object, *or to an object that is *isomorphic* to the one you started with.* 

![Equivalent orders](../11_natural_transformations/equivalent_orders.svg)

But when does this happen? To understand this, we plot the orders as a Hasse diagram.

![Equivalent orders](../11_natural_transformations/equivalent_orders_hasse.svg)

You can see that, althought not all objects are connected one-to-one, *all objects at a given level are connected to objects of the corresponding level*.

To formalize that notion, we remember the concept of *equivalence classes* that we covered in the chapter about orders. Let's visualize the relationship of the equivalence classes of the two orders that we saw above.

![Orders with isomorphic equivalence classes](equivalent_order_classes.svg)

You can see that they are isomorphic. And that is no coincidence: two orders are equivalent precisely when the orders made of their equivalence classes are isomorphic.

This is a definition for equivalence of orders, but unfortunately, it is not true for all categories --- when we are working with orders, we can get away by just thinking about *objects*, but categories demands that we think about morphisms i.e to prove two categories are equivalent, we should establish an isomorphism between their *morphisms*. 

For example, the following two categories are *not* equivalent, although their equivalence classes are isomorphic --- the category on the left has just one morphism, but the category on the right has two.

![Non-equivalent categories](../11_natural_transformations/unequal_categories.svg)

We could define equivalence of categories by extending the notion of equivalence classes of orders to what we call *skeletons* of categories, a skeleton of a category being a subcategory which does not contain any isomorphic objects. However, we will leave this (pardon my French) as an *exercise for the reader*. Why? We already did this when we *upgraded* the notion of normal set-theoretic functions to *functors*, and so it makes more sense to build up on that notion.

Also, we need a motivating example for introducing natural transformations, remember?

Defining equivalence in terms of morphisms
---

In the chapter about orders, we presented a definition of order *isomorphisms*, that is based on *objects*:

> An order isomorphism is essentially an isomorphism  between the orders' underlying sets (invertible function). However, besides their underlying sets, orders also have the arrows that connect them, so there is one more condition: in order for an invertible function to constitute an order isomorphism it has to *respect those arrows*, in other words it should be *order preserving*. More specifically, applying this function (let's call it $F$) to any two elements in one set ($a$ and $b$) should result in two elements that have the same corresponding order in the other set (so $a ≤ b$ if and only if $F(a) ≤ F(b)$). 

That a way to define them, but it is not the best way. Now that we know about functors (which, as we said, serve as functions between the orders and other categories), we can devise a new, simpler definition, which would also be valid for all categories, not just orders, and for all forms of equality (isomorphism and equivalence).

![isomorphic orders](../11_natural_transformations/isomorphic_orders.svg)

We begin with the definition of **set isomorphism**:

> Two **sets** $A$ and $B$ are **isomorphic** (or $A ≅ B$) if there exist functions $f: A \to B$ and its reverse $g: B \to A$, such that $f \circ g = ID_{A}$ and $g \circ f = ID_{A}$.

To amend it so it is valid for all categories  by just replacing the word "function" with "functor" and "set" with "category":

> Two **categories** $A$ and $B$ are **isomorphic** (or $A \cong B$) if there exist *functors* $f: A \to B$ and its reverse $g: B \to A$, such that $f \circ g = ID_{A}$ and $g \circ f = ID_{A}$.

**Task:** Show that the two definitions are equivalent.

Believe it or not, this definition, is just one find-and-replace operation away from the definition of *equivalence*. We get there only by replace equality with isomorphism (so, $=$ with $\cong$). 

> Two **categories** $A$ and $B$ are **equivalent** (or $A \simeq B$) if there exist *functors* $f: A \to B$ and its reverse $g: B \to A$, such that $f \circ g \cong ID_{A}$ and $g \circ f \cong ID_{A}$.

Like we said at the beginning, with isomorphisms, going back and forth brings us to the same object, while with equivalence the object is just *isomorphic* to the original one. This is truly all there is to it. 

There is only one problem, though --- *we never said what it means for functors to be isomorphic*.

Natural transformations, natural isomorphisms and categorical equivalence
===

So, how can we make the above definition "come to life"? The title of this chapter outlines the things we need to define: 

1. *Morphisms between functors* (called *natural transformations*).
2. *Functor isomorphisms* (called *natural isomorphisms*). 
3. Finally *categorical equivalences*.

If this sounds complicated, remember that we are doing the same thing we always did --- talking about isomorphisms. In the very first chapter of this book, we introduced *set isomorphisms*, which are quite easy, and now we reached the point to examine *functor isomorphisms*. So, we are doing the same thing. 
<!--comic-->
Although actually...

But actually, natural transformations are quite different from morphisms and functors, (the definition is not "recursive", like the definitions of functor and morphism are). This is because functions and functors are both morphisms between objects (or *1-morphisms*), while natural transformations are *morphisms between morphisms* (known as *2-morphisms*).

But enough talking, let's draw some diagrams. 

We know that natural transformations are morphisms between functors, so let's draw two functors. 

![Two functors](../11_natural_transformations/natural_functors_objects.svg)

The functors have the same signature. Naturally, how else would we have morphisms between them? 

Now, a functor is comprised of two mappings (object mapping and morphism mapping) so a mapping between functors, would consist of "object mapping mapping" and "morphism mapping mapping" (yes, I often do get in trouble with my choice of terminology, why do you ask?).

Object mapping mapping
---

Let's first connect the object mappings of the two functors, creating what we called "object mapping mapping". 

It is simpler than it sounds when we realize that we only need to connect the object in functors' *target category*. The objects in the source category would just always be the same for both functors, as both functors would include *all* object from the source category (as that is what functors (and morphisms in general) do). 

In other words, mapping the two functors' object components involves nothing more than specifying a bunch of morphisms in the target category: one morphism for each object in the source category i.e. each object from the image of the first functor, should have one arrow coming from it (and to an object of the second functor, so, for example, our current source category has two objects and we specify two morphisms.

![Two functors and a natural transformation](../11_natural_transformations/natural_transformation.svg)

Note that this mapping does not map every object from the source category,  i.e. not all objects have arrows coming from them (e.g. here the black and blue square do not have arrows), although, in some cases, it *might*.

**Question:** When exactly would the mapping encompass all objects?

Morphism mapping mapping
---

The morphism part might seem hard... until we realize that, once the connections between the object mappings are already established, there is only one way to connect the morphisms --- we take each morphism of the source category and connect the two morphisms given by the two functors, in the target category. And that's all there is to it. 

![Two functors](../11_natural_transformations/natural_functors.svg)

Oh, actually, there is also this condition that the above diagram should commute (the naturality condition), but that happens pretty much automatically.

The naturality condition
---

Just like anything else in category theory, natural transformations have some laws that they are required to pass. In this case it's one law, typically called the naturality law, or the naturality condition. 

Before we state this law, let's recap where are we now. We have two functors $F$ and $G$ that have the same type signature (so $F : C \to D$ and $G : C \to D$ for some categories $C$ and $D$), and a family of morphisms in the target category $D$ (denoted $\alpha : F \Rightarrow G$) one for each object in $C$, that map each target object of the functor $F$ (or the image of $F$ in $D$ as it is also called) to some target objects of functor $G$. This is a *transformation*, but not necessarily a *natural* one. A transformation is natural, when this diagram commutes for all morphisms in $C$.

![The commuting square of a natural transformation](../11_natural_transformations/natural_transformation_square.svg)

i.e. a transformation is natural when every morphism $f$ in $C$ is mapped to morphisms $F(f)$ by $F$ and to $G(f)$ by $G$ (not very imaginative names, I know), in such a way, that we have $\alpha \circ F(f) = G(f) \circ \alpha$ i.e. when starting from the white square, when going right and then down (via the yellow square) is be equivalent to going down and then right (via the black one).

We may view a natural transformation is a mapping between morphisms and commutative squares: two functors and a natural transformation between two categories means that for each morphism in the source category of the functors, there exist one commutative square at the target category.

![Commutin squares of a natural transformation](../11_natural_transformations/natural_transformation_squares.svg)

When we fully understand this, we realize that commutative squares are made of morphisms too, so, like morphisms, they compose --- for any two morphisms with appropriate type signatures that have we can compose to get a third one, we have two naturality squares which compose the same way.

![Composition of commuting squares of a natural transformation](../11_natural_transformations/natural_transformation_squares_composition.svg)

Which means natural transformation make up a... 

(Oh wait, it's too early for that, is it?)

Natural isomorphisms 
---

After understanding natural transformations, natural isomorphisms, are a no-brainer: a natural transformation is just a family of morphisms in a given category that satisfy certain criteria, then what would a natural *isomorphism* be? That's right --- it is a family of *isomorphisms* that satisfy the same criteria. The diagram is the same as the one for ordinary natural transformation, except that $\alpha$ are not just ordinary morphisms, but isomorphisms.

![Two functors and a natural transformation](../11_natural_transformations/natural_isomorphism.svg)

And the turning those morphisms into isomorphisms makes the diagram commute in more than one way i.e. if we have the naturality condition 

$\alpha \circ F(f) = G(f) \circ \alpha$ i.e. the two paths going from **white** to **blue** are equivalent.

We also have:

$F(f) \circ  \alpha  =   \alpha  \circ G(f)$ i.e. the two paths going from **black** to **yellow** are also equivalent.

Constructing categorical equivalences
---

I am sorry, what were we talking about again? Oh yeah --- categorical equivalence. Remember that categorical equivalence is the reason why we tackle natural transformations and isomorphisms? Or perhaps it was the other way around? Never mind, let's recap what we discussed so far:

1. At the beginning of the section we introduced the notion of equivalence as two functors, such that going from one of them to the other and back again leads you to the same object, or to an *object that is isomorphic* to the one you started with. 

2. And then, we discussed that for categories that are not thin (thick?) the situation is a bit more complex, due to the fact that we should worry not only about isomorphic objects, but about *isomorphic morphisms*. 

Now, we will show how these two notions are formalized by the definition that we presented.

> Two **categories** $A$ and $B$ are **equivalent** (or $A \simeq B$) if there exist *functors* $f: A \to B$ and its reverse $g: B \to A$, such that $f \circ g \cong ID_{A}$ and $g \circ f \cong ID_{A}$.

To understand, this how are the two related, let's construct the identity functor of the category that we have been using as an example all this time. Note that we are drawing the one and the same category two times (as opposed to just drawing an arrow coming from each object to itself), to make the diagrams more readable.

![The identity functor](../11_natural_transformations/equivalent_orders_identity.svg)

Then, we draw the composite of the two functors that establish an equivalence between the two categories, highlighting the 3 "interesting" objects, i.e. the ones due to which the categories aren't isomorphic.

![The composite functor between the two functors that make up the equivalence](equivalent_orders_composite.svg)

Now, we ask ourselves, in which cases does there exist an isomorphism between those two functors?

![An equivalence diagram](../11_natural_transformations/equivalent_orders_functors.svg)

The answer: exactly when those three objects are isomorphic to one-another: if we draw those green arrows in a different way (remember, this is the same category on the top and the bottom), we can see that these are are exactly the arrows that enable us to construct a two-way transformation (i.e. an *isomorphism*) between the two functors (the others are just identity arrows).

![An equivalence diagram, showing a transformation](../11_natural_transformations/equivalent_orders_transformation.svg)

And when would this isomorphism be such that preserves the structure of the category (so that each morphism from the output of the composite functor has an equivalent one in the output of the identity)? Exactly when the isomorphism is *natural* i.e. when every morphism points to a commuting square -- this ensures not only that no morphism is lost, when applying the composite functor, but that the morphisms in the target of the functor behave in the same way as their counterparts in the source.

![ An equivalence diagram, showing a natural transformation](../11_natural_transformations/equivalent_orders_natural_transformation.svg)

With this, we are finished with categorical equivalence, but not with natural transformations --- natural transformations are a very general concept, and categorical equivalences are only a very narrow case of them.

Natural transformations in programming. Natural transformations on the list functor
===

Here, we will see some more natural transformations and will examine further this elusive the naturality condition in the context of programming.

Before, we said that we shouldn't worry too much about naturality, as it is satisfied every time. Statistically, however, this is not true --- as far as I am concerned, about 99.999 percent of transformations aren't really natural (I wonder if you can compute that percentage properly?). But at the same time, it just so happens (my favourite phrase when writing about maths) that all transformations that we care about *are* natural. 

Pointed functors again
---

Now, suppose this sounds a bit vague. If only we had some example of a natural transformation in programming, that we can use... But wait, we do have one! We showed a natural transformation in the previous chapter, when we talked about what pointed functors. That's right, a functor is pointed when there is a natural transformation between it and the identity functor i.e. to have one green arrow for every object/type.

![Pointed functor](../11_natural_transformations/pointed_functor.svg)

And this clearly is a natural transformation. As a matter of fact, if we get down to the nitty-griti, it resembles a lot the equivalence diagram that we saw earlier --- both transformations involve the identity functor, and both transformations have the same category as source and target, that's why we can put everything in one circle (we don't do that in the equivalence diagram, but that's just a matter of presentation). The only difference between the two transformations is that an equivalence requires that a functor be *isomorphic* to the identity functor (i.e. it is two-way), while for a functor to be pointed, there must only be a natural transformation from it (one-way) (so the equivalence functor is pointed, but not the other way around). 

Polymorphic functions as natural transformations 
---

In the previous chapter, we said that a natural transformation is equivalent to a polymorphic function in programming. But wait, wasn't natural transformation something else (and much more complicated)?

> Two functors $F$ and $G$ that have the same type signature (so $F : C \to D$ and $G : C \to D$ for some categories $C$ and $D$), and a family of morphisms in the target category $D$ (denoted $\alpha : F \Rightarrow G$) one for each object in $C$. Morphisms that map each object of the target of $F$ (or the image of $F$ in $D$ as it is also called) to some object in the target of $G$. 

Indeed it is (I wasn't lying to you, in case you are wondering), however, in the case of programming, the source and target categories of both functors are the same category ($Set$), so the whole condition regarding the functors' type signatures can be dropped. 

> Two ~~functors~~ generic types $F$ and $G$ ~~that have the same type signature~~ and a family of morphisms in $Set$ (denoted $\alpha : Set \Rightarrow Set$) one for each object in $Set$, that map each target object of the functor $F$ (or the image of $F$ in $D$ as it is also called) to some target objects of functor $G$. 

As we know from the last chapter, a functor in programming is a generic type (which, has to have the `map` function with the appropriate signature). 

And what is a "family of morphisms in $Set$ one for each object in $Set$"? Well, the morhpisms in the category $Set$ are functions, so that's just a bunch of functions, one for each type.  In Haskell notation, if we denote a random type by the letter $$a$$), it is $alpha : \forall a. F a \to G a$.

But that's exactly what polymorphic functions are. Here is how would we write the above definition in a more traditional language  (we use capital `<A>` instead of $a$, as customary 

```typescript

function alpha<A>(a: F<A>) : G<A> {
}

```

Generic types work by replacing the `<A>` with some concrete type, like `string`, `int` etc. Specifically, the natural transformation from the identity functor to the list functor that puts each value in a singleton list looks like this $alpha :: \forall\ a. a \to List\ a$. Or in TypeScript:

```typescript

function array<A>(a: <A>) : Array<A> {
    return [a]
}
```

Some examples of natural transformations
---

Once we rid outselves of the feeling of cofusion, that new terminology imposes upon us (this can take years, by the way), we realize that there are, of course, many polymorphic functions/natural transformations that programmers use.

In the previous chapter we discussed one natural transformation/polymorphic function the function $\forall a.a \to [a]$ which puts every value in a singleton list. This function is a natural transformation between the identity functor and the list functor. 

![Natural transformation, defining a pointed functor in Set](../11_natural_transformations/pointed_functor_set_transformation.svg)

This is pretty much the only one that is useful with *this* signature (the others being $a \to [a, a]$, $a \to [a, a, a]$ etc.), but there are many examples with signature $list\ a \to list\ a$, such as the function to *reverse* a list.

![The natural transformation, for reversing a list in Set](../11_natural_transformations/reverse_set_transformation.svg)

...or *take1* that retrieves the first element of a list
 
![The natural transformation, for taking the first element of a list in Set](../11_natural_transformations/take_set_transformation.svg)

or *flatten* a list of lists of things to a regular list of things (the signature of this one is a little different, it's $list\ list\ a \to list\ a$).

![The natural transformation, for flattening a list in Set](../11_natural_transformations/flatten_set_transformation.svg)

**Task:** Using the first naturality square (displayed above) draw the naturality squares for the rest of the natural transformations.

The naturality condition 
---

So, what does the naturality condition entail, in programming? To understand this, we construct some naturality squares of the transformations that we presented.

We choose two types that play the role of $a$, in our case $string$ and $num$ and one natural transformation, like the transformation between the identity functor and the list functor.

![Pointed functor in Set](../11_natural_transformations/pointed_functor_set.svg)

The diagram commute when for all functions $f$, applying the $Ff$, the mapped/lifted version of $f$ with one functor (in our case this is just $ F f : string \to num$ cause it is the identity functor), followed by ($alpha :: F b \to G\ b$), is equivalent to applying ($alpha:: F a \to G\ a$), and then the mapped version of $f$ with the other functor (in our case $G f :: List\ a \to List\ b$) i.e. 

$$\alpha \circ F\ f \cong G\ f \circ \alpha$$

(in the programming world, you would also see it as something like  $\alpha (map\ f x) = map\ f (\alpha x)$, but note that here $map$ function means two different things on the two sides, Haskell is just smart enough to deduce which $fmap$ to use).

And in TypeScript, when we are talking specifically about the identity functor and the list functor, the equality is expressed as:

```
[x].map(f) == [f(x)]
```

So, is this equation true in our case? To verify it, we take one last peak at the world of values.

We aquire an $f$, that is, we a function that acts on simple values (not lists), such as the function $length : string \to num$, which returns the number of characters a string has and convert it, (or *lift* it, as the terminology goes) to a function that acts on more complex values, using the list functor, (and the higher-order function $map$).

![A lifted function](../11_natural_transformations/lifted_function_f.svg)

Then, we take the input and output types for this function (in this case $string$ and $num$), and the two morphisms of a natural transformation (e.g the abstract function $\forall a.a \to [a]$) that correspond to those two types.

![Pointed functor in Set](../11_natural_transformations/pointed_functor_set_transformations.svg)

When we compose these two pairs of morphisms we observe that they indeed commute --- we get two morphisms that are actually one and the same function.

![Pointed functor in Set](../11_natural_transformations/pointed_functor_set_internal.svg)

The above square shows the transformation $\forall a.a \to [a]$ (which is between the identity functor and the list functor, here is another one, this time between the list functor and itself ($\forall a.[a] \to [a]$) --- $reverse$ 

![Pointed functor in Set](../11_natural_transformations/reverse_set_internal.svg)

(and you can see that this would work not just for $length$, but for any other function).

So, why does this happen? Why do these particular transformations make up a commuting square for each and every morphism?

The answer is simple, at least in our specific case: the original, unlifted function $f :: a \to b$ (like our $length :: string \to num$) can only work on the individual values (not with structure), while the natural transformation functions, i.e. ones with signature  $list :: a \to list\ a$ only alter the structure, and not individual values. The naturality condition just says that these two types of functions can be applied in any order that we please, without changing the end result.

This means that if you have a sequence of natural transformations that you want to apply, (such as $reverse$ , $take$, $flatten$ etc) and some lifted functions ($F f$, $F g$), you can mix and match between the two sequences in any way you like and you will get the same result e.g. 

$$take1 \circ reverse \circ F\ f \circ F\ g$$

is the same as 

$$take1 \circ F\ f \circ reverse \circ F\ g$$

...or...

$$ F\ f \circ F\ g \circ take1 \circ reverse$$

...or any other such sequence (the only thing that isn't permitted is to flip the members of the two sequences --- ($take1 \circ reverse$ is of course different from $reverse \circ take1$and if you have $F\ f \circ F\ g$, then $F\ g \circ F\ f$ won't be permitted at all due to the different type signatures).

**Task:** Prove the above results, using the formula of the naturality condition.

Non-natural transformations
---

"Unnatural", or "non-natural" transformations (let's call them just *transformations*) are mentioned so rarely, that we might be inclined to ask if they exist. The answer is "yes and no". Why yes? On one hand, transformations, consist of an innumerable amount of morphisms, forming an ever more innumerable amount of squares and obviously nothing stops some of these squares to be non-commuting. 

For example, if we substitude one morphism from the family of morphisms that make up the natural transformation with some other random morphism that has the same signature, all squares that have this morphism as a component would stop commuting.

![Unnatural transformation](../11_natural_transformations/unnatural_transformation_squares.svg)

This would result in something like an "almost-natural" transformation (e.g. an abstract function that reverses all lists, except lists of integers).

And in the category of sets, where morphisms are functions i.e. mappings between values, it is enough to move just one arrow of just one of those values in order to make the transformation "unnatural" (e.g. a function which reverses all lists, but one specific list).

![Unnatural transformation in set --- like reverse, but one arrow is off](../11_natural_transformations/reverse_set_unnatural.svg)

Finally, if can just gather a bunch of random morphisms, one for each object, that fit the criteria, we get what I would call a "perfectly unnatural transformation" (but this is my terminology).

But, although they do exist, it is very hard to define non-natural transformations. For example, for categories that are *infinite*, there is no way to specify such "perfecly unnatural transformation" (ones where none of the squares commute) without resorting to randomness. And even transformations on finite categories, or the "semi-natural" transformations which we described above (the ones that include a single condition for a single value or type), are not possible to specify in some languages e.g. you can define such a transformation in Typescript, but not in Haskell.

To see why, let's see what the type of a natural transformation is.

$$forall\ a.\ F a \to G a$$

The key is that the definition should be valid *for all* types a. For this reason, there is no way for us to specify a different arrows for different types, without resorting to type downcasting, which is not permitted in languages like Haskell (as it breaks the principle of parametricity).

<!--
{% if site.distribution == 'print' %}
-->

Interlude: Skolem variables and parametrization
---

Let's try to define the "semi-natural" transformation that we described above (the ones that include a single condition for a single value or type) e.g. an abstract function that reverses all lists, except the list of booleans). In Typescript, it will look something like this.

```typescript
function unnatural<A> (a: Array<A>): Array <A>{
    if(typeof a[0] === 'string') {
        return a
    } else {
        return a.reverse()
    }
}
```
<!--comic-->
(Look at this piece of code! Doesn't this seem "unnatural"?)

This will work, but, if you try to do the same in Haskell, for example, it would immediately tell you that you cannot ("`a` is a "rigid type variable" (also known as "Skolem variable" in other context)). Why is it so?  There are some *technical reasons*, as runtime type checks like this one, add performance overhead, because they require the runtime to preserve type information for each value, after compilation, but there is also a strong *philosophical reason*:

A general function should work in a general way. And the generality of a function that checks the type of a value at runtime (and behaves differently for different types) is dubious at best.Such function is like, (if we switch to the logic branch of the Curry-Howard isomorphism) proving a general statement, of the form "All $a$'s have a given property" by merely pointing out that the $a$s that are currently in existence happen to have it. Surely, even if valid in some contexts, such proofs are a very limited in terms of both scope and information they carry e.g. the assertion that all people who are sitted at the table next to you have brown hair doesn't tell you anything of substance, unless there is a deeper reason for it to be true.

In other words, unnatural transformations wouldn't work in Haskell, simply because they are ... unnatural i.e. they do not follow the laws.

By the way, in programming, this principle is called "parametricity" and the natural abstract functions are called "parametrically polymorphic" (whereas the others are called ad-hoc polymorphism).

<!--
{%endif%}
-->

Natural transformations again
===

Now, after we saw the definition of natural transformations, it is time to see the definition of natural transformations (and if you feel that the quality of the humour in this book is deteriorating, that's only because *things are getting serious*).

Let's again review the commuting diagram that represents a natural transformation.

![Two functors](../11_natural_transformations/natural_functors.svg)

This diagram might prompt us into viewing natural transformations as some kind of "double functors" that have not one but two arrows coming from each of their morphisms. 

Double functors don't exist, but this notion, can be formalized, with the aid of the concept of *product categories*.

Product categories
---

A lot of pages ago, when we covered monoids, we talkeed a lot about the concept of a *product* of two or more *groups/monoids*.


![The Klein four as a product group](../11_natural_transformations/klein_four_as_a_product.svg)


The product categories are similar: take any two categories (in practice it is good if one of them is a finite one, but any two would work). 

![Product category - components](../11_natural_transformations/product_components.svg)

And then take the set of all possible pairs of the objects of these categories.

![Product category - objects](../11_natural_transformations/product_set.svg)

Is there a way to make a category from that set? Sure, we saw something similar in the chapter about group/monoid products --- we just take all morphisms coming from any of the two categories and replicate them to all pairs that feature some objects from their type signature.

![Product category](../11_natural_transformations/product_category.svg)

This is the *product category* of the two categories.

Natural transformations as functors of product categories
---

When looking into the last diagram, you might suspect that the categories we chose to demonstrate the notion of the product category is not arbitrary. And you would be right --- we can already see the naturality square in it. 

![Product category](../11_natural_transformations/product_category_target_category.svg)

That is because the category with two objects and one morphism (which, if you remember is called $2$) is the key to constructing a functor that is equivalent to a natural transformation --- because it has two objects, it produces two copies of the source category and because the two objects are connected, the two copies are connected in the same way as the two "images" in the target category are connected. And so all that is left is to draw the two functors.

![Product category](../11_natural_transformations/product_category_natural_transformation.svg)

Formal definition
---

Let's state formally what we saw in these diagrams. As you remember we call our two functors $F$ and $G$ and the our categories $C$ and $D$ (so $F : C \to D$ and $G : C \to D$). 

Also, we call the category with two connected objects $2$ and the morphisms in it are $0$ and $1$.

In this case, our natural transformation $\alpha : F \Rightarrow G$ is just a functor from the product category of $2$ to $C$ so $2 \times C \to G$, such that if we take the subcategory of $C$ comprised of just those objects that have the $0$ object, and the morphisms between them, then that functor is equivalent to $F$, and if we consider the subcategory that contains $1$, then the functor is equivalent to $G$ (we write $\alpha(-,0)=F$ and $\alpha(-,1)=G$). Et voilà!

**Task:** See how the two definitions are equivalent.

Limits and colimits
====

Interlude: Naturality explained
---

Isomorphism is not hard to construct --- given two sets, containing three objects each, there are three isomorphisms that connect them, and that number grows exponentially. 

But most of these isomorphisms, are just random. In our studies, whatever they are, we are only interested in structures that *make sense* in some way. In category theory the abstract notion of making sense is captured by the naturality condition.


Limits
===

Products are one example of what is known in category theory as *limits*. A limit is an object that summarizes a structure (also called a diagram) consisting of other objects and morphisms in a way that allows us to later retrieve some of it.

A limit also has to be unique in the sense that you cannot have two limit objects for the same structure.

The notion of a limit is strongly related with the notion of a commuting diagrams. This is not obvious when we are examining products because the diagram of products does not have several routes reaching to the same point.

Limits can be defined formally, just like everything else that we examine, but we won't bother to do that here.

Products are Limits
---

OK, we said that limits summarize a structure. What is the structure that a product is summarizing? It is a structure that consists of two objects (sets) that are have no connections between them.
 
![External diagram](../11_natural_transformations/product_part_external.svg)
 
Why is the product unique when it comes to representing the two objects? Because any other object that also represents them is connected to the product through a morphism (this is known as the *universal property* of limits).


Natural transformations and associativity
===

The definition of natural transformation just states that (ab)c = a(bc)



Natural transformations from surjective functors are just regular functors.
===
 
Generally, a natural transformation is not a function, it is a *family of morphisms* in the target category, one morphism for each object in the source category i.e. each object from the image of the first functor, should have one arrow coming from it (and to an object of the second functor).

However, in the case of programming, because the source and target categories are both `Set`), a natural transformation there is "a family of morphisms in `Set` one morphism for each object in `Set`" i.e. *a polymorphic function*.

Here is how would a natural transformation would look like in a case resembling yours (this is a natural transformation `Identity => List`, not `List => List`, but the principle is the same).



Free objects
===


https://math.stackexchange.com/questions/131389/what-are-free-objects

Monads
===


Representable functors
===

A Hom-functor can always be converted to any set-valued functor (Yoneda lemma). But not the other way around

Yoneda Lemma
===


https://www.azimuthproject.org/azimuth/show/Applied+Category+Theory+Course#Course


https://eed3si9n.com/herding-cats/day1.html


https://topology.mitpress.mit.edu/


https://www.math3ma.com/blog/what-is-a-natural-transformation

https://graphicallinearalgebra.net/2015/04/23/makelele-and-linear-algebra/

https://www.math.toronto.edu/gscott/WhatVS.pdf

https://www.youtube.com/playlist?list=PLk-BCMYCWSzW-nPNnw19Y6oQJnvaAcp1I

https://brilliant.org/courses/linear-algebra/linear-equations-5/
 https://www.math3ma.com/blog/what-is-category-theory-anyway

