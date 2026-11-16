# The Yoneda lemma

1954. Paris. Gare du Nord, called "the busiest train station in the world". Streams of passengers are moving in all directions, with new people constantly entering and leaving, all in a sometimes rather noisy manner. But the two people who sit in the station cafe somehow manage to remain undisturbed --- for hours and hours they speak. The younger one is called Nobuo Yoneda, a mathematician and computer scientists who will later work on the ALGOL programming language. And the older one -- Saunders Mac Lane is a category theorist, gathering material for his book "Categories for the working Mathematician". Saunders is interviewing Nobuo, asking him questions (probably) writing stuff in his notebook. When Nobuo leaves the cafe to catch a train, Saunders decides to accompany him, and they continue talking. Now, just what exactly did Nobuo say to Saunders, during this session, we don't know. But what we know is that afterwards Saunders named one of the central results of category theory to him: The Yoneda Lemma.

"Yoneda" is indeed unusual name, but it is also unusual for a significant result to be called a "lemma", as "lemma" is a name reserved for *simple* results, results that constitute steps toward a larger goal ("theorem"). This is true of the Yoneda lemma, except it is a *very* significant step towards *many* goals. This is why it is sometimes called the most significant trivial result in mathematics.

## Hom-functors

### Hom-sets 

The notion of a *homomorphism set* (or hom-set for short) is one of the first things we defined in the first chapter of this book:

{: .definition}

> For any two objects $A$ and $B$ the homomorphism set of $A$ to $B$, (denoted $A \Rightarrow B$ or $Hom(A,B)$) is the set containing one element for each morphism that goes from $A$ to $B$.

So, for any given category $C$, there is a bunch of those homomorphism sets, or hom-sets in short. 

![A category next to its hom-sets: A category which has objects A B and C and some morphisms between them and two hom-sets: hom(A, B) and hom(B, C) hom(A, C) etc. that contain those morphisms.](../12_yoneda/hom_sets.svg)

### Morphisms between hom-sets

So, those are hom-sets of a given category, and what the Yoneda lemma defines is a kind of correspondence between a category and it's hom-sets, a version of which is valid for all categories that exist.

But to arrive to it, we must understand what are the morphisms between those hom-sets are.

As, hom-sets are sets, morphisms between them would be *functions* (although the morphisms that are contained in them are not necessarily functions), More specifically, they are functions that convert the set of morphisms with a given type signature, to the set of morphisms with another type signature.

There is not a general/formulaic way to connect morphisms with any *type* signatures, however, there is one way to connect morphisms with an appropriate type signatures: composition.


To utilize it, we pick a starting point for out structure of hom-sets, an object from $C$ that we will call $A$ (the first letter of the alphabet), from which we will begin.

Now, once we pick $A$, let's look at only the hom-sets of the morphisms that start from $A$ (called $Hom(A,-)$, the dash being a placeholder for any object). We already see a partial correspondence between those sets and $C$, as there is exactly one hom-set for each object of $C$ (except for the objects that are not connected to $A$ at all).

Now, the functions: given a hom-set $Hom(A, X)$ containing the morphisms between $A$ and some random object $X$ and a hom-set $Hom(A, Y) with morphisms between $A$ and some *other* random object $Y$...

![A category with three morphisms, next to its hom-sets: A category which has objects A X and Y that has one morphism from A to X, one morphism from X to Y and their composition --- a morphism from A to Y, next to three hom-sets: hom(A, X) and hom(X, Y) and hom(A, Y) that contain those morphisms.](../12_yoneda/hom_sets_morphisms_1.svg)

... a function between them i.e. a function $Hom(A, X) \to Hom(A, Y)$ would be a function that converts any random morphism $g: A \to X$, some morphism $fg: A \to Y$. As we hinted, we do that via composition: A way to map a morphism $g: A \to X$ to a morphism $fg: A \to Y$ is just a morphism $f: X \to Y$. 

That is, the sets of functions between hom-sets $Hom(A, X) \to Hom(A, Y)$ is the same as the set of morphism $f: X \to Y$. 

![A category with three morphisms, next to its hom-sets: A category which has objects A X and Y that has one morphism from A to X, one morphism from X to Y and their composition --- a morphism from A to Y, next to three hom-sets: hom(A, X) and hom(X, Y) and hom(A, Y) that contain those morphisms.](../12_yoneda/hom_sets_morphisms_2.svg)

{: .theorem}

> For every morphism between $f: X \to Y$ between objects in a category 
 we can define a corresponding morphism between their corresponding hom-sets: $Hom(A,f): Hom(A, X) \to Hom(X,Y)$ representing the result of composing $f$ with each of the functions from $Hom(A,X)$. That is for each morphism $g: A \to X$ (which can be viewed as an element of $Hom(A, X)), the set $Hom(A,f)$ would convert it to the morphism $f \circ g: A \to Y$ (which can viewed as an element from $Hom(A,Y)$.

This statement is already close to the correspondence that we are speaking of, but still note that our structure is only a partial reflection of $C$. Not all objects are connected to $A$, and even from the ones that are, not all morphisms factor through the identity morphism of $A$ (there are morphisms $X \to Y $ that are not a result of composition with $A$).

## Homomorphism functors 

You might already suspect that there is a connection between the hom sets of a given category $C$ and the category itself.

In the second chapter, of the book, we learned about how we can represent set elements as functions from the singleton set and how can we apply functions to these "generalized" elements via functional composition. This is nothing but a generalization of this approach for categories



Pick one of the homomorphism sets and take only the functions that have this set as target.

https://emptylimit.github.io/discussion/generalised-elements.html

https://maartenfokkinga.github.io/utwente/mmf91m.pdf
