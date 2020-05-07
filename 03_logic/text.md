Some other categories
===

Every category theory guide (including mine) starts by talking about set theory. However, looking back, I really don't know why that is the case - most other books that focus around a specific subject don't start by introducing an entirely different subject. Perhaps the set-first approach is the best way to introduce people to categories, or perhaps that is just one of the things that people just do, simply because everyone else does it. But one thing is for sure - we don't need to study sets in order to understand categories. So in this chapter I would like to start over and talk about categories as a first concept. 

So pretend like it's a new book:

Starting over with categories
===

So, a category is a collection of objects (things) where the "things" can be anything you want. Consider, for example, these ~~colourful~~ grey balls:

![Balls](elements.svg)

A category consists of a collection of objects as well as some arrows connecting some of them to one another, that we call (the arrows) morphisms.

![A category](category.svg)

Wait a minute - we said that all sets form a category, but at the same time any one set can be seen as a category on its own right (just one which has no morphisms). This is true and an example of a phenomenon that is very characteristic of category theory - one structure can be examined from many different angles and may play many different roles, often in a recursive fashion.

This particular analogy (a set as a category with no morphisms) is, however, not very useful - category theory is *all about the morphisms*. If in set theory, arrows are nothing but a connection between a source and a destination, in category theory it's the *objects* that are nothing but a source and destination for the arrows that connect them to other objects. This is why in this chapter the arrows, and not the objects, are coloured - the category of sets should really be called the category of set functions.

Speaking of which, note that objects in a category can be connected by multiple arrows and that arrows having the same domain and codomain does not in any way make them equivalent.

![Two objects connected with multiple arrows](arrows.svg)

Why is that is pretty obvious if we go back to set theory for a second (maybe we really have to do this from time to time) - there are, for example, an infinite number of functions that go from number to boolean and the fact that they have the same signature does in no way make them equivalent to one another.

![Two sets connected with multiple functions](set_arrows.svg)

Composition
---

One of the few, or maybe even the only, requirement for a structure to be called a category is that two morphisms can make a third, or in other words that morphisms are *composable*. In practice this means that given two successive arrows, we can draw a third one that is equivalent to the consecutive application of the other two.

![Composition of morphisms](composition.svg)


Formally, this requirement says that there should exist an operation (denoted with the symbol **○**) such that for each two functions **g: A → B** and **f: B → C**, there exists a function **(f ○ g): A → C**.

**NB:** Note that the functional compositions are written from right to left. e.g. applying **g** and then applying **f** is written **f ○ g** and not the other way around (you can think of it as a shortcut to **f(g(a))**).

Again, note that this criteria is not met by just *any* morphism with this type signature. There is *exactly one* morphism that fits these criteria and there may be some which don't.


![Composition of morphisms in the context of additional morphism](composition_arrows.svg)

Commuting diagrams
---

The diagram above, uses colors to illustrate the fact that the green morphism is equivalent to the other two (and not just some unrelated morphism), but in practice this notation is a little redundant - the only reason to draw diagrams with arrows in the first place is represent paths between objects that are equivalent to each other, all other paths just belong in different diagrams. So let's drop the colors:

![Composition of morphisms - a commuting diagram](composition_commuting_diagram.svg)

Diagrams that are like that (ones in which any two paths between two objects are equivalent to one another) are called commutative diagrams (or diagrams that commute). All diagrams that we have here (except the wrong ones) commute.


The law of associativity
---

Functional composition is special not only because you can take any two morphisms with appropriate signatures and make a third, but because you can do so indefinitely, i.e. given **n** successive arrows, each of which starts from the object that the other one finishes, we can draw one (exactly one) arrow that is equivalent to the consecutive application of all **n** arrows.

![Composition of morphisms with many objects](composition_n_objects.svg)

This approach for building stuff is often used in programming. You don't need to look further than the way the pipe operator in bash (`|`) that feeds the standard output of a program with the standard input of another program is (ab)used to observe how (and if you *want* to look further, note that there is a whole programming paradigm, called concatenative programming, that is based on the notion of composition).

But let's get back to the math. The definition above can be reduced to multiple applications of the following formula: given 4 objects and 3 between them morphisms **f** **g** **h**, **(h ○ g) ○ f** should bein equal to **h ○ (g ○ f)** 

**Task** show how the definition can be reduced to the formula.

![Composition of morphisms with many objects](composition_associativity.svg)

This formula (or diagram) is the definition of a property called **associativity** that is required for categories, as well as many other structures that we will examine below.

If we view functional composition as an algebraic operation, the fact that is associativive means that brackets don't matter when we are using it successively, in the multiplication operation is associative **(1 . 2) . 3 = 1 . (2 . 3)**. While division is not **(1 / 2) / 3 = 1 / (2 / 3)**.


Identity
---

In order to be able to define more stuff using morphisms, we define what we call the "identity morphism" for each object. In short, this is a morphism, that doesn't do anything to the object.

![The identity morphism (but can also be any other morphism)](identity.svg)

It's important to mark this morphism, because there can be (let's add the very important (and also very boring) reminder) many morphisms that go from one object to the same object, many of which actually do stuff. For example mathematics deals with a multitude of functions that have the set of numbers as domain and codomain, such as **negate**, **square**, **add one**, and are not at all the identity morphism.

**Question:** What is the identity morphism in the category of sets?

Isomorphisms
---

Once we have the concept of identity morphism defined we can have a category-theoretic definition of an isomoprhism (which is important, because the concept of an isomorphism is very important for Cathegory theory). We can say that an isomorphism between two objects (**A** and **B**) consists of two functions - (**A → B**.  and **B → A**) such that their compositions are equivalent to the identity functions of the respective objects. Or alternatively we can just draw a diagram.

![Isomorphism](isomorphism.svg)

The fact that it commutes means that going from the one of objects (**A** and **B**) to the other one and then back again is the same as applying the identity morphism i.e. doing nothing. 


