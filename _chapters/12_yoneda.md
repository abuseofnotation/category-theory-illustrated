---
layout: default
title: The Yoneda lemma
---
# The Yoneda lemma

*1954, Paris, Gare du Nord --- the busiest train station in the world.*

*Streams of passengers are moving in all directions, with new people constantly entering and leaving, all in a sometimes rather noisy manner. But the two people who sit in the station cafe somehow manage to remain undisturbed --- for hours and hours they speak.*

*The younger one is called Nobuo Yoneda, a mathematician and computer scientists who will later work on the ALGOL programming language.*

*And the older one -- Saunders Mac Lane is a category theorist, gathering material for his book "Categories for the working Mathematician".*

*Saunders is interviewing Nobuo, asking him questions (probably) writing stuff in his notebook. When Nobuo leaves the cafe to catch a train, Saunders decides to accompany him, and they continue talking. Now, just what exactly did Nobuo say to Saunders, during this session, we don't know. But what we know is that afterwards Saunders named one of the central results of category theory to him: The Yoneda Lemma.*

The Yoneda lemma is a peculiar result, and even it's name is peculiar: "Yoneda" is indeed unusual name, but it is also unusual for a significant result to be called a "lemma", as "lemma" is a name reserved for *simple* results, results that constitute steps toward a larger goal ("theorem"). This is true of the Yoneda lemma, except it is a *very* significant step towards *many* goals. This is why it is sometimes called the most significant trivial result in mathematics.

## Hom-functors

The Yoneda lemma defines a very simple correspondence a version of which is valid for every category that exists. Briefly, it states that every category corresponds to the category of its hom-functors. But to understand that, you need to know what a hom-functor is. Let's go.

### Hom-sets 

The notion of a *homomorphism set* (or hom-set for short) is one of the first things we defined in the first chapter of this book:

{: .definition}

> For any two objects $A$ and $B$ the homomorphism set of $A$ to $B$, (denoted $A \Rightarrow B$ or $Hom(A,B)$) is the set containing one element for each morphism that goes from $A$ to $B$.


![Two objects and their hom set: Two objects A and B with some arrows between them a hom-set: hom(A, B) that contain those arrows.](../12_yoneda/hom_set.svg)

So, for any given category $C$, there is a bunch of those homomorphism sets, or hom-sets in short.

![A category next to its hom-sets: A category which has objects A B and C and some morphisms between them and some hom-sets: hom(A, B) and hom(B, C) hom(A, C) etc. that contain those morphisms.](../12_yoneda/hom_sets.svg)

(Note that some the morphisms are results of composition).

### Hom(A,-) sets

Now, let's think about the morphisms between those hom-sets. Hom-sets are sets, and so morphisms between them are *functions* (although the morphisms that are contained in them are not necessarily functions). More specifically, they are functions that convert the set of morphisms with a given type signature, a set of morphisms with another type signature.

As you suspect, there is no general/formulaic way to connect morphisms with random type signatures, however, there is one way to connect morphisms with *appropriate* type signatures: composition.

To utilize it, we pick a starting point for out structure of hom-sets, an object from $C$ from which we will begin (usually called $A$, the first letter of the alphabet), discarding all hom-sets that aren't connected to it, leaving only the hom-sets that start from $A$ (we usually denote those $Hom(A,-)$, the dash being a placeholder for any object). 

![A category next to its Hom(A,-) hom-sets, that start with the same object: A category which has objects A X and Y and some morphisms between them, and three hom-sets: hom(A, A) and hom(A, X) hom(A, Y).](../12_yoneda/hom_sets_a.svg)

We already see a partial correspondence there is exactly one hom-set for each object of $C$ (except for the ones we discarded.

### Morphisms between hom-sets

Now, the functions: given a hom-set $Hom(A, X)$ containing the morphisms between $A$ and some random object $X$ and a hom-set $Hom(A, Y)$ -- morphisms between $A$ and some *other* object $Y$, what would a function between them ($Hom(A, X) \to Hom(A, Y)$) look like? 

![Hom-sets Hom(A, X) and Hom(A, Y): Hom(A,X) contains one element, the A->X arrow. Hom(A,Y) contains two elements: the composition with A->X arrow with the first and the second X->Y arrows respectively.](../12_yoneda/hom_sets_morphisms_zoom_1.svg)

Let's inspect it point-wise: a function, $Hom(A, X) \to Hom(A, Y)$ would be a function that converts any morphism $g: A \to X$, some morphism $fg: A \to Y$. As we hinted, the answer is composition: a way to map a morphism $g: A \to X$ to a morphism $fg: A \to Y$ is (by the definition of a category) just a morphism $f: X \to Y$. 

![Hom-sets Hom(A, X) and Hom(A, Y) and one function between them: Hom(A,X) contains one element, the A->X arrow. Hom(A,Y) contains two elements: the composition with A->X arrow with the first and the second X->Y arrows respectively. There is one function between them, that maps the A->X arrow with the one of the functions that are a composition of A->X and X->Y.](../12_yoneda/hom_sets_morphisms_zoom_2.svg)

That is, the functions between hom-sets $Hom(A, X) \to Hom(A, Y)$ corresponds to the morphisms from $f: X \to Y$. 

![All functions between Hom-sets Hom(A, X) and Hom(A, Y): Two functions Hom(A,X) -> Hom(A, Y), displayed internally. They correspond to the two morphisms X->Y in C](../12_yoneda/hom_sets_morphisms_zoom_3.svg)


So, in other words, there is a connection between the morphisms $f: X \to Y$ and functions $Hom(A,f): Hom(A, X) \to Hom(X,Y)$.

{: .theorem}

> For every morphism between $f: X \to Y$ between any two objects in a any category, we can define a corresponding function between the objects' hom-sets: $Hom(A,f): Hom(A, X) \to Hom(X,Y)$ representing the result of composing $f$ with each of the morphisms from $Hom(A,X)$. That is, for any morphism $g: A \to X$ (which is an element of $Hom(A, X)$), composing it with some function $f: X \to Y$ would give you a morphism $f \circ g: A \to Y$ (an element from $Hom(A,Y)$.

But more importantly, this connection is there for any objects $X$ and $Y$, (and since we have a hom-set for all of them), it actually builds up to a general connection between a category $C$ and the collection of hom-sets $Hom(A,-)$ in $C$.

![A category next to its hom(A,-) hom-sets and their morphisms: A category which has objects A X and Y and some morphisms between them, and three hom-sets: hom(A, A) and hom(A, X) hom(A, Y) which have the exact same morphisms](../12_yoneda/hom_sets_a_morphisms.svg)

### Hom functors

So, with the morphisms in place, we have all the necessary components to build the Hom functor, $C \to Hom(A,-)$. 

![A category next to its hom(A,-) hom-sets and their morphisms: A category which has objects A X and Y and some morphisms between them, and three hom-sets: hom(A, A) and hom(A, x) Hom(A, Y) which have the exact same morphisms](../12_yoneda/hom_functor_a.svg)

The only question is what happens to the objects and morphism in $C$ that aren't related to $A$, are mapped to the empty set and the empty functions that connects it to any other set.

{: .theorem}

Given a category $C$ and any object from this category $A$, there is a functor $C \to Hom(A,-)$ called a hom-functor, that maps any object $X$ from $A$ to the set of morphisms $Hom(A, X)$ and any morphism $f$, to the function $Hom(A,f)$ that composes morphisms.

There is almost nothing to prove: the mapping obviously preserves composition in $C$, simply because it is defined in terms of composition in $C$.

## Yoneda embedding

The hom-functors of the type $Hom(A,-) \to C$ are at the heart of the general correspondence between the hom-sets of $C$ and $C$ which is the Yoneda lemma. 

However, the correspondence between $Hom(A,-)$ and $C$ encoded by a single $Hom(A,-) \to C$ functor is only partial: as we said, not all objects of a given category have their corresponding hom-sets, only the ones connected to the particular object we chose as a $A$. And the morphisms in $C$ (even the ones between those objects) are reflected only insofar as they are connected to $A$ (there is no info for reverse arrows $X \to A$ and $Y \to A$). 

And so, the hom-functor $Hom(A,-) \to C$ is not the representation of the whole *category* $C$, that we talked about. It rather a representation of the *object* $A$.

## Natural transformations between hom-functors

So we arrive at the situation where any object in our category $C$ is connected to the $Hom(C,-)$.




## Generalized elements

In the second chapter, of the book, we learned about how we can represent set elements as functions from the singleton set and how can we apply functions to these "generalized" elements via functional composition. This is nothing but a generalization of this approach for categories

Pick one of the homomorphism sets and take only the functions that have this set as target.

https://emptylimit.github.io/discussion/generalised-elements.html

https://maartenfokkinga.github.io/utwente/mmf91m.pdf
