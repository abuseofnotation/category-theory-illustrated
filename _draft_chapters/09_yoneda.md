# The Yoneda lemma

1954 Paris. Gare du Nord -- the busiest train station in the world. Noise. Streams of passengers moving in all directions. But the two people who sit in the cafe, somehow manage to remain undisturbed. The younger one is called Nobuo Yoneda, a mathematician and computer scientists who will later work on the ALGOL programming language. And the older one -- Saunders Mac Lane is a mathematician, who is gathering material for his book "Categories for the working mathematician". Saunders is interviewing Nobuo, asking him questions and writing stuff in his notebook. When Nobuo leaves the cafe to catch a train, Saunders decides to accompany him, and they continue talking... Now, just what exactly did Nobuo say to Saunders, during this session, we don't know. But what we know is that Saunders named one of the central results of Category theory to him: The Yoneda Lemma.

"Yoneda" is indeed unusual name, but it is also unusual for a result to be called a "lemma" --- "lemma" is a name reserved for *simple* results, results that constitute steps toward a larger goal ("theorem"). What's unique about the Yoneda lemma is that it is a step toward many goals. This is why it is sometimes called the most significant trivial result in mathematics.


## Homomorphism functors

The Yoneda lemma concernes a bijection between homomorphism functors, so before presenting it, we have to understand what a homomorphism functor is, starting with remembering homomorphism sets.

### Homomorphism sets


Given any category, we can generate the set of the sets of all morphisms that have a specific type signature with respect to a given object from that category. This is called the *Homomorphism set*, denoted $Hom(B, - )$, $B$ being the object that you picked (for example, let's pick the brown ball).

![Homomorphism set](hom_set.svg)

This set forms a category where the morphism sets are the objects (again morphism sets are *objects*) and the morphisms are the same as in the original category. And between those two categories (the original and the weird morphism-based one) there is a functor, called the homomorphism functor.

![Homomorphism set](hom_functor.svg)

With homomorphism functors, we can *represent* any category in the category of sets. This is why homomorphism functors and all functors that are isomorphic to them are called *representable* functors.

Sets are completely determined by their elements. Similarly, objects in a locally small category are determined by their generalised elements.

https://emptylimit.github.io/discussion/generalised-elements.html

https://maartenfokkinga.github.io/utwente/mmf91m.pdf
