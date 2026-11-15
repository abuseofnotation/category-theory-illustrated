# The Yoneda lemma

1954. Paris. Gare du Nord -- the busiest train station in the world. Noise. Streams of passengers are moving in all directions, when new people constantly entering and leaving. But the two people who sit in the cafe, somehow manage to remain undisturbed --- for hours and hours they speak. The younger one is called Nobuo Yoneda, a mathematician and computer scientists who will later work on the ALGOL programming language. And the older one -- Saunders Mac Lane is a category theorist, gathering material for his book "Categories for the working Mathematician". Saunders is interviewing Nobuo, asking him questions (probably) writing stuff in his notebook. When Nobuo leaves the cafe to catch a train, Saunders decides to accompany him, and they continue talking... Now, just what exactly did Nobuo say to Saunders, during this session, we don't know. But what we know is that Saunders named one of the central results of Category theory to him: The Yoneda Lemma.


"Yoneda" is indeed unusual name, but it is also unusual for a significant result to be called a "lemma", as "lemma" is a name reserved for *simple* results, results that constitute steps toward a larger goal ("theorem"). This is true of the Yoneda lemma, except it is a *very* significant step towards *many* goals. This is why it is sometimes called the most significant trivial result in mathematics.

## Homomorphism functors


### Homomorphism sets

The notion of a *homomorphism set* is one of the first things we defined in the first chapter of this book:

{: .definition}

> For any two objects $A$ and $B$ the homomorphism set of $A$ to $B$, (denoted $A \Rightarrow B$ or $Hom(A,B)$) is the set containing one element for each morphism that goes from $A$ to $B$.

So, for a given category $C$, there is a bunch of those homomorphism sets, or hom-sets in short. 

![A category next to its hom-sets: A category which has objects A B and C and some morphisms between them and two hom-sets: hom(A, B) and hom(B, C) hom(A, C) etc. that contain those morphisms.](../12_yoneda/hom_sets.svg)

The Yoneda lemma defines a correspondence between them (the hom sets of $C$) and $C$ itself. But to arrive to it, we must understand what are the morphisms (functions) between those sets are.

### Functions between hom sets

Given a Hom set between $A$ and $B$ (i.e. $Hom(A, B)$) and a Hom set between $A$ and $C$ (i.e. $Hom(A, C)$)...

![A category with three morphisms, next to its hom-sets: A category which has objects A B and C that has one morphism from A to B, one morphism from B to C and their composition --- a morphism from A to C, next to three hom-sets: hom(A, B) and hom(B, C) and hom(A, C) that contain those morphisms.](../12_yoneda/hom_sets_morphisms_1.svg)

... a morphism between them ($Hom(A, B) \to Hom(A, C)$) would be a function that converts a function $A \to B$, to a function $A \to C$. There is only one way to do that --- a composition with a $B \to C$ function.

![A category with three morphisms, next to its hom-sets: A category which has objects A B and C that has one morphism from A to B, one morphism from B to C and their composition --- a morphism from A to C, next to three hom-sets: hom(A, B) and hom(B, C) and hom(A, C) that contain those morphisms.](../12_yoneda/hom_sets_morphisms_1.svg)

This is the general way to write morphisms 

{: .definition}

> For every morphism between $f: B \to C$ between objects in a category 
(and given another object $A$ from the same category) we can define a corresponding function between their corresponding hom-sets : $Hom(A,f): Hom(A, B) \to Hom(B,C)$ , representing the result of composing $f$ with each of the functions from $Hom(A,B)$. That is, given a function $g: A \to B$ (viewed as an element of $Hom(A, B)) , $Hom(A,f)$ would convert it to the function $f \circ g: A \to C$ (viewed as an element from $Hom(B,C)$.

## Homomorphism functors 

You might already suspect that there is a connection between the hom sets of a given category $C$ and the category itself.

In the second chapter, of the book, we learned about how we can represent set elements as functions from the singleton set and how can we apply functions to these "generalized" elements via functional composition. This is nothing but a generalization of this approach for categories



Pick one of the homomorphism sets and take only the functions that have this set as target.

https://emptylimit.github.io/discussion/generalised-elements.html

https://maartenfokkinga.github.io/utwente/mmf91m.pdf
