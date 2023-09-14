---
layout: default
title: Categories
---

From Sets to Categories
===

In this chapter we will see some more set-theoretic constructs, but we will also introduce their category-theoretic counterparts in an effort to gently introduce the concept of a category itself.

When we are finished with that, we will try, (and almost succeed) to define categories from scratch, without actually relying on set theory.

Products
===

In the previous chapter there were several places where needed a way to construct a set whose elements are *composite* of the elements of some other sets: when we discussed mathematical functions, we couldn't define $+$ and $-$ because we could only formulate functions that take one argument. Then, when we introduced the primitive types in programming languages, like `Char` and `Number`, we mentioned that most of the types that we actually use are *composite* types. So how do we construct those?

The simplest composite type, of the sets $B$, that contains $b$'s and the set $Y$, that contains $y$'s is the *Cartesian product* of $B$ and $Y$, that is the set of *ordered pairs* that contain one element of the set $Y$ and one element of the set $B$. Or formally speaking: $Y \times B = \{ (y, b) \}$ where $y ∈ Y, b ∈ B$ ($∈$ means "is an element of").

![Product parts](../02_category/product_parts.svg)

It is denoted $B \times Y$ and it comes equipped with two functions for retrieving the $b$ and the $y$ from each $(b, y)$.

![Product](../02_category/product.svg)

**Question**: Why is this called a product? Hint: How many elements does it have?

{% if site.distribution == 'print'%}

Interlude --- coordinate systems
---

The concept of *Cartesian product* was first defined by the mathematician and philosopher René Descartes as a basis for the *Cartesian coordinate system*, which is why both concepts are named after him (although it does not look like it, as they use the latinized version of his name). 

Most people know how Cartesian coordinate systems works, but an equally interesting question, on which few people think about, is how we can define it using sets and functions. 

A Cartesian coordinate system consists of two perpendicular lines, situated on an *Euclidean plane* and some kind of mapping that resembles a function, connecting any point in these two lines to a number, representing the distance between the point that is being mapped and the lines' point of overlap (which is mapped to the number $0$).

![Cartesian coordinates](../02_category/coordinates_x_y.svg)

Using this construct (as well as the concept of a Cartesian product), we can describe not only the points on the lines, but any point on the Euclidean plane. We do that by measuring the distance between the point and those two lines.

![Cartesian coordinates](../02_category/coordinates.svg)

And since the point is the main primitive of Euclidean geometry, the coordinate system allows us to also describe all kinds of geometric figures such as this triangle (which is described using products of products).

![Cartesian coordinates](../02_category/coordinates_triangle.svg)

So we can say that the Cartesian coordinate system is some kind of function-like mapping between all kinds of sets of (products of) *products of numbers* and *geometric figures* that correspond to these numbers, using which we can derive some properties of the figures using the numbers (for example, using the products in the example below, we can compute that the triangle that they represent has base of $6$ units and height of $5$ units. 

![Cartesian coordinates](../02_category/coordinates_isomorphism.svg)

What's even more interesting is that this mapping is one-to-one, which makes the two realms *isomorphic* (traditionally we say that the point is *completely* described by the coordinates, which is the same thing).

With that, our effort to represent Cartesian coordinates with sets is complete, except we haven't described what these function-like things that connect points to numbers are --- they make intuitive sense as functions, and that they exhibit all relevant properties (many-to-one mapping (or one-to-one in this case)), however, we have only covered functions as mappings between *sets* and in this case, even if we can think of the coordinate system as a set (of points and figures), geometrical figures are definitely not a set, as it has a lot of additional things going on (or additional *structure*, as a category theorist would say). So defining this mapping formally, would require us to also formalize both geometry and algebra, and moreover to do so in a way in which they are compatible with one another. This is some of the ambitions of category theory and this is what we will attempt to do later in this book.

But before we continue with that, let's see some other neat uses of products.

{%endif%}

Products as Objects
---

In the previous chapter, we established the correspondence of various concepts in programming languages and set theory --- sets resemble types, functions resemble methods/subroutines. This picture is made complete with products, that are like stripped-down *classes* (also called *records* or *structs*) --- the sets that form the product correspond to the class's *properties*  (also called *members*) and the functions for accessing them are like what programmers call *getter methods* e.g. the famous example of object-oriented programming of a `Person` class with `name` and `age` fields is nothing more than a product of the set of strings, and the sets of numbers. And objects with more than two values can be expressed as products the composites of which are themselves products.

Using Products to Define Numeric Operations
---

Products can also be used for expressing functions that take more than one argument (and this is indeed how multi-param functions are implemented in languages who actually have tuples, like the ones from the ML family ). For example, "plus" is a function from the set of products of two numbers to the set of numbers, so, $+: \mathbb{Z} \times \mathbb{Z} → \mathbb{Z}$. 

![The plus function](../02_category/plus.svg)

In other words, products are extremely important concept, that is vital if you want to represent any kind of structure.

Defining products in terms of sets 
---

A product, as we said, a set of *ordered* pairs (formally speaking $A \times B ≠ B \times A$). So, to define a product we must define the concept of an ordered pair. So how can we do that? Note that an ordered pair of elements is not just set containing the two elements ---  that would just be a *pair*, but not an *ordered pair*). 

Rather, an ordered pair is a structure that contains two objects as well as information about which of those objects is the first and which one is second (and in programming, we have the ability to assign names to each member of an object, which accomplishes the same purpose as ordering does for pairs.)

The ordered part is important as, while some mathematical operations (such as addition) don't care about order, others (such as subtraction) do (and in programming, when we manipulate an object we obviously want to access a specific property, not just any random property).

![A pair](../02_category/pair.svg)

So does that mean that we have to define ordered pair as a "primitive" type, like we defined sets in order to use them? That's possible, but there is another approach if we can define a construct that is *isomorphic* to the ordered pair, using only sets, we can use that construct instead of them. And mathematicians had come up with multiple ingenious ways to do that. Here is the first one, which was suggested by Norbert Wiener in 1914. Note the smart use of the fact that the empty set is unique. 

![A pair, represented by sets](../02_category/pair_as_set_2.svg)

The next one was suggested in the same year by Felix Hausdorff. In order to use that one, we just have to define $1$, and $2$ first.

![A pair, represented by sets](../02_category/pair_as_set_3.svg)

Suggested in 1921 Kazimierz Kuratowski, this one uses just the component of the pair.

![A pair, represented by sets](../02_category/pair_as_set_1.svg)

Defining products in terms of functions 
---


In the product definitions presented in the previous section worked by *zooming in* into the individual elements of the product and seeing what they can be made of We may think of this as a *low-level* approach to the definition. This time we will try to do the opposite --- we will try to be as oblivious to the contents of our sets as possible i.e. instead of zooming in we will *zoom out*, we will attempt to fly over the difficulties that we met in the previous section and provide a definition of a product in terms of functions and *external* diagrams.

How can we define products in terms of external diagrams i.e. given two sets how can we pinpoint the set that is their product? To do that, we must first think about *what functions* are there for a given product, and we have two of those --- the functions for retrieving the two elements of the pair (the "getters", so to say). 

![Product](../02_category/product.svg)

Formally, if we have a set $G$ which is the product of sets $Y$ and $B$, then we should also have functions which give us back the elements of the product, so $G → Y$ and $G → B$. Now let's switch to the external view.

![Product, external diagram](../02_category/product_external.svg)

This diagram already provides a definition, but not a complete definition, because the product of $Y$ and $B$ is not the only set for which such functions can be defined. For example, a set of triples of $Y \times B \times R$ for any element $R$ also qualifies. And if there is a function from $G$ to $B$ then the set $G$ itself meets our condition for being the product, because it is connected to $B$ and to itself. And there can be many other objects that qualify as well.

![Product, external diagram](../02_category/product_candidates.svg)

However, the set of triples  $Y \times B \times R$ is connected to $Y$ and $B$ only because it can be converted to $Y \times B$: the arrow $Y \times B \times R \to B$ is just the composition of the arrow $Y \times B \times R \to Y \times B$ and the arrow  $Y \times B \to B$. The same reasoning applies to all other objects.

![Product, external diagram](../02_category/products_morphisms.svg)

(Intuitively, all such objects would be *more complex* than the pair objects and you can always have a function that converts a more complex structure, to a simpler one (we saw an example of this when we covered the functions that convert subsets to their supersets).)

More formally, if we suppose that there is a set $I$ that can serve as an impostor product of sets $B$ and $Y$ i.e. that $I$ is such that there exist two functions, which we will call $ib: I → B$ and $iy: I → Y$ that allow us to derive elements $B$ and $Y$ from it, then there must also exist a unique function with the type signature $I → B \times Y$ that converts the impostor from the true product, and $ib$ and $iy$ are just results of composing that function with the usual "getter" functions that go from the pair to the elements (i.e. whichever object we pick for $I$, this digram would commute).

![Product, universal property](../02_category/product_universal_property.svg)


In category theory, this type of property that a given object might possess (participating in a structure such that all similar objects can be converted to/from it) is called a *universal property*. We won't go into more detail about this, as it is a bit early for that now (after all we haven't even yet said what category theory is). 

One thing that we need to point out is that this definition (as, by the way, all the previous ones) does not rule out the sets which are isomorphic to the product --- when we represents things using universal properties, an isomorphism is the same as equality. This is the same viewpoint that we must adopt in programming, especially when we work on the higher level --- there might be many different implementations of pair (e.g. ones provided by different libraries), but as long as they work in the same way (i.e. we can convert one to the other and vice versa) they are all the same for us).

Sums
===

We will now study a construct that is pretty similar to the product but at the same time is very different. Similar because, like the product, it is a relation between two sets which allows you to unite them into one, without erasing their structure. But different as it encodes a quite different type of relation --- a product encodes an *and*  relation between two sets, while the sum encodes an *or* relation. 

The sum of two sets $B$ and $Y$, denoted $B + Y$ is a set that contains *all elements from the first set combined with all elements from the second one*. 

![Sum or coproduct](../02_category/coproduct.svg)

We can immediately see the connection with the *or* logical structure: For example, because a parent is either a mother or a father of a child, the set of all parents is the sum of the set of mothers and the set of fathers, or $P = M + F$.


Defining Sums in Terms of Sets
---

As with the product, representing sums in terms of sets is not so straightforward e.g. when a given object is an element of both sets, then it appears in the sum twice which is not permitted, because a set cannot contain the same element twice. 

As with the product, the solution is to put some extra structure.

![A member of a coproduct](../02_category/coproduct_member.svg)

And, as with the product, there is a low-level way to express a sum using sets alone. Incidentally, we can use pairs.

![A member of a coproduct, examined](../02_category/coproduct_member_set.svg)

Defining sums in terms of functions
---

As you might already suspect, the interesting part is expressing the sum of two sets using functions. To do that we have to go back to the conceptual part of the definition. We said that sums express an *or* relation between two things. 

A property of every *or* relation is that if something is an $A$ that something is also an $A \vee B$ , and same for $B$ (The $\vee$ symbol means *or* by the way). For example, if my hair is *brown*, then my hair is also *either blond or brown*. This is what *or* means, right? This property can be expressed as a function, two functions actually --- one for each set that takes part in the sum relation (for example, if parents are either mothers or fathers, then there surely exist functions $mothers → parents$ and $fathers → parents$).

![Coproduct, external diagram](../02_category/coproduct_external.svg)

As you might have already noticed, this definition is pretty similar to the definition of the product from the previous section. And the similarities don't end here. As with products, we have sets that can be thought of as *impostor* sums --- ones for which these functions exist, but which also contain additional information.

![Coproduct, external diagram](../02_category/coproduct_candidates.svg)

All these sets express relationships which are more vague than the simple sum, and therefore given such a set (an "impostor" set as we called it earlier), there would exist a unique function that would distinguish it from the true sum. The only difference is that, unlike with the products, this time this function goes *from the sum* to the impostor.

![Coproduct, external diagram](../02_category/coproduct_morphisms.svg)


Interlude: Categorical Duality 
===

The concepts of product and sum might already look similar in a way when we view them through their internal diagrams, but once we zoom out to the external view, and we draw the two concepts external diagrams, this similarity is quickly made precise.

I use "diagrams" in plural, but actually the two concepts are captured *by one and the same diagram*, the only difference between the two being that their arrows are flipped --- many-to-one relationships become one-to-many and the other way around.

![Coproduct and product](../02_category/coproduct_product_duality.svg)

The universal properties that define the two construct are the same as well --- if we have a sum $Y + B$, for each impostor sum, such as $Y + B + R$, there exist a trivial function $Y + B  \to Y + B + R$.

And, if you remember, with product the arrows go the other way around --- the equivalent example for product would be the function $Y \times B \times R \to Y \times B $ 

This fact uncovers a deep connection between the concepts of the *product* and *sum*, which is not otherwise apparent --- they are each other's opposites. *Product* is the opposite of *sum* and *sum* is the opposite of *product*.

In category theory, concepts that have such a relationship are said to be *dual* to each other. So the  the concepts of *product* and *sum* are dual. This is why sum is known in a category-theoretic setting as *converse product*, or *coproduct* for short. This naming convention is used for all dual constructs in category theory.

{% if site.distribution == 'print'%}

De Morgan duality
---

Now let's look at how the concepts of product and sum from the viewpoint of *logic*. We mentioned that:

- The *product* of two sets contains an element of the first one *and* one element of the second one.
- A *sum* of two sets contains an element of the first one *or* one element of the second one.

When we view those sets as propositions, we discover the concept of the *product* ($\times$) corresponds exactly to the *and* relation in logic (denoted $\land$). From this viewpoint, the function $Y \times B \to Y$  can be viewed as instance of a logical rule of inference called *conjunction elimination* (also called *simplification*) stating that, $Y  \land B \to Y$, for example, if your hair is partly blond and partly brown, then it is partly blond.

By the same token, the concept of a *sum* ($+$) corresponds the *or* relation in logic (denoted $\lor$). From this viewpoint, the function $Y  \to Y + B$  can be viewed as instance of a logical rule of inference called *disjunction introduction*, stating that, $Y  \to Y \lor B$ for example, if your hair is blond, it is either blond or brown.

This means, among other things, that the concepts of *and* and *or* are also dual --- an idea which was put forward in the 19th century by the mathematician Augustus De Morgan and is henceforth known as *De Morgan duality*, and which is a predecessor to the modern idea of duality in category theory, that we examined before. 

This duality is subtly encoded in the logical symbols for *and* and *or* ($\land$ and $\lor$) --- they are nothing but stylized-versions of the diagrams of products and coproducts (yes, I know they are reversed, but still)...

![Coproduct and product](../02_category/demorgan_duality.svg)

The duality of $\land$ and $\lor$ can be seen in the two formulas that are most often associated with De Morgan which are known as De Morgan laws (although De Morgan didn't actually discover those (they were previously formulated, by William of Ockham (of "Ockham's razor" fame, among other people)).

$\neg(A \wedge B) = \neg{A} \vee \neg{B}$

$\neg(A \vee B) = \neg{A} \wedge \neg{B}$

You can read the second formula as, for example, if my hair is not blond *or* brown, this means that my hair is not blond *and* my hair is not brown, and vice versa (the connection work both ways)

Now we will go through the formulas and we would try to show that they are actually a simple corollary of the duality between *and* and *or* 

Let's say we want to find the statement that is opposite of "blond *or* brown".

$A \vee B$ 

The first thing we want to do is, to replace the statements that constitute it with their opposites, which would make the statement "not blond *or* not brown"

$\neg{A} \vee \neg{B}$ 

However, this statement is clearly not the opposite of "blond *or* brown"(saying that my hair is not blond *or* not brown does in fact allow it to be blond and also allows for it to be brown, it just doesn't allow it to be both of these things).

So what have we missed? Simple:  we replaced the propositions with their opposites, but we didn't replace the *operator* that connects them --- it is still *or* for both propositions. So we must replace it with *or* converse. As we said earlier, and as you can see by analyzing this example, this operator is *and* So the formula becomes "not blond *and* not brown".

$\neg{A} \wedge \neg{B}$ 

Saying that this formula is the opposite or "blond and brown" --- is the same thing as saying that it is equivalent to its negation, which is precisely what the second De Morgan law says.

$\neg(A \vee B) = \neg{A} \wedge \neg{B}$

And if we "flip" this whole formula (we can do that without changing the signs of the individual propositions, as it is valid for all propositions) we get the first law.

$\neg(A \wedge B) = \neg{A} \vee \neg{B}$

This probably provokes a lot of questions and we have a whole chapter about logic to address those. But before we get to it, we have to see what categories (and sets) are.

{% endif %}

Defining the rest of set theory using functions
===

So far, we saw some amazing ways of defining set-theoretic constructs without looking at the set elements and by only using functions and external diagrams.

In the first chapter we defined functions and functional composition with this digram.

![Functional composition](../02_category/functions_compose_sets.svg)

And now, we also defined products and sums.

![Coproduct and product](../02_category/coproduct_product_duality.svg)

What's even more amazing, is that we can define *all of set-theory* using just functions, as suggested by the category theory pioneer Francis William Lawvere. 

Defining set elements using functions
---

Traditionally, everything in set theory is defined in terms of two things: *sets* and *elements*, so, if we want to define it using *sets* and *functions*, we must define the concept of a *set element* in terms of functions.

To do so, we will use the singleton set.

![The singleton set](../02_category/elements_singleton.svg)

OK, let's start by taking a random set which we want to describe.

![A set of three elements](../02_category/elements_set.svg)

And let's examine the functions from the singleton set, to that random set.

![Functions from the singleton set](../02_category/elements_singleton_functions.svg)

It's easy to see that there would be exactly one function for each element of the set i.e. that each element of any set $X$ is isomorphic to a function $$1 \to X$$.

So, we can say that what we call "elements" of a set are the functions from the singleton set to it.

Defining the singleton set using functions
---

Now, as we came up with some definition of set *element*, using just functions, we can try to draw the elements of our set as an external diagram.

![Functions from the singleton set](../02_category/elements_singleton_functions_partly_external.svg)

However, our diagram is not yet fully external, as it depends on the idea of the singleton set, i.e. the set with one *element*. Furthermore, this makes the whole definition circular, as we have to already have the concept of an element in order to define the concept of an one-element set. 

To avoid these difficulties, we devise a way to define the singleton set, using just functions. We do it in the same way that we did for products and sums - by using a unique property that the singleton set has. In particular, there is exactly one function from any other set to the singleton set i.e. if $1$ is the singleton set, then we have $\forall  X  \exists!  X \to 1$.

![Terminal object](../02_category/terminal_object_internal.svg)

It turns out that this property defines the singleton set uniquely i.e. there is no other set that has it, other than the sets that are isomorphic to the singleton set. This is simply because, if there are two sets that have it, those two sets would also have unique morphisms between *themselves* i.e. they would be isomorphic to one another. More formally, if we have two sets $X$ and $Y$, such that $\exists!X \to 1 \land \exists!Y \to 1$ then we also have $X \cong Y$.

![Terminal object](../02_category/terminal_object_internal_isomorphisms.svg)

And because there is no other set, other than the singleton set that has this property, we can use it as a definition of the singleton set and say that if we have $\forall  X  \exists!  X \to 1$, then $1$ is the singleton set.

![Terminal object](../02_category/terminal_object.svg)

With this, we acquire a fully-external definition (up to an isomorphism) of the singleton set, and thus a definition of a set element - the elements of set are just the functions from the singleton set to that set.

![Functions from the singleton set](../02_category/elements_external.svg)

Note that from this property it follows that the singleton set has exactly one element.

![Functions from the singleton set](../02_category/singleton_elements_external.svg)

**Question:** Why exactly (check the definition)? 

Defining the empty set using functions
---

The empty set is the set that has no elements, but how would we say this without referring to elements?  

We said that there exist a unique function that goes *from* the empty set *to* any other set. But the reverse is also true: the empty set is the only set such that there is exist a function from it to any other set. 

![Initial object](../02_category/initial_object.svg)

Observant readers will notice the similarities between the diagrams of initial and terminal object (yes the two concepts are, of course, dual).

![Initial terminal duality](../02_category/initial_terminal_duality.svg)


And some *even more* observant readers may also notice the similarities between the product/coproduct diagrams and the initial/terminal object diagrams.

![Coproduct and product](../02_category/coproduct_product_duality.svg)

(Folks keep it down please, you are *too observant* --- we have, like, 4 chapters till we get to this.)

Functional application
---

Now, as amazed as we are, after seeing the functional definition of a set element, we might be inclined to ask the following: If elements are represented by functions, then how do you *apply* a given function to an element of one set, to get an element of another set?

The answer is surprisingly simple --- in order to apply a function to a set, you must first select an element of the set and *selecting* an element from a set is the same as constructing a function from the singleton set to this element. 

![Functional application - internal diagram](../02_category/application_internal.svg)

And then *applying* a function to an element is the same as composing this function, with the function we want to apply. 

![Functional application - external diagram](../02_category/application_external.svg)

The result is the function that stands for the result of the application.

Conclusion
---

In the future, we may cover the entirety of Lawvere's Elementary theory of the category of sets (or ETCS for short), and list all concepts and axioms that are needed to define a rigorous set theory using functions, but this is enough for you to get the main idea: these these axioms constitute an definition of set theory, which is based entirely on functions. This is big, but there is an even bigger thing there: because it is more general than the traditional definition, this new definition also applies to objects that are not exactly sets, but are *like* sets in some respects. 

You may say that they apply to a whole different *categories of objects*.

Category Theory --- brief definition
===

Maybe it is about time to see what a category is. We will start with a short definition --- a category consists of objects (an example of which are sets) and morphisms that go from one object to another (which can be viewed as functions) and that should be composable. We can say a lot more about categories, and even present a formal definition, but for now it is sufficient for you to remember that sets are one example of a category and that categorical objects are like sets, except that we don't *see* their elements. Or to put it another way, category-theoretic notions are captured by the external diagrams, while strictly set-theoretic notions can be captured by internal ones.

![Category theory and set theory compared](../02_category/set_category.svg)

When we are at the realm of sets we can view the set as a collection of individual elements. In category theory we don't have such notion. However taking this notion away allows us to define concepts such as the sum and product sets in a whole different and more general way. Plus we always have a way to "go back" to set theory, using the tricks from the last section.

But why would we want to have this more general definition? It is because, in this way we can use our theory to describe objects other than sets. We already discussed one such object --- types in programming languages. Remember that we said that programming types (classes) are somewhat similar to sets, and programming methods are somewhat similar to functions between sets, but they are not exactly identical? Category theory allows us to generalize the similarities of these... ahem, categories.

| Category Theory | Set theory | Programming Languages |
| ---             | ---        | ---                   |
| Category        | N/A        | N/A                   |
| Objects and  Morphisms        | Sets and Functions   | Classes and methods |
| N/A             | Element    | Object                |

Notice the somehow weird, (but actually completely logical) symmetry (or perhaps "reverse symmetry") between the world as viewed through the lenses of set theory, and the way it is viewed through the lens of category theory:

| Category Theory | Set theory | 
| ---             | ---        |
| Category        | **N/A**        | 
| Objects and  Morphisms        | Sets and functions |
| **N/A**             | Element    | 

By switching to external diagrams, we lose sight of the particular (the elements of our sets), but we gain the ability to see the whole universe where we were previously trapped in. In the same way as the whole realm of sets can be thought as one category, a programming language can also be thought as a category. The concept of a category allows us to find and analyze similarities between these and other structures.

**NB:** The word "Object" is used in both programming languages and in category theory, but for completely different things. The equivalent a categorical object is equivalent to a *type* or a *class* in programming language theory.

Sets VS Categories
---

One remark before we go: in the last paragraphs I sound as if category theory and set theory are somehow competing with one another. Perhaps that notion would be somewhat correct if category and set theory were meant to describe *concrete* phenomena, in the way that the theory of relativity and the theory of quantum mechanics are both supposed to explain the physical world. Concrete theories are conceived mainly as *descriptions* of the world, and as such it makes sense for them to be connected to one another in some sort of hierarchy. 

Abstract theories, like category theory and set theory, on the other hand, are more like *languages* for expressing such descriptions --- they still can be connected, and *are* connected in more than one way, but there is no inherent hierarchy between the two and therefore arguing over which of the two is more basic, or more general, is just a chicken-and-egg problem, as you would see in the next chapter.

Defining Categories (again)
===

> "...deal with all elements of a set by ignoring them and working with the set's definition." --- Dijkstra (from "On the cruelty of really teaching computing science")

All category theory books (including this one) starts by talking about set theory. However looking back I really don't know why that is the case --- most books that focus around a given subject don't usually start off by introducing an *entirely different subject* before even starting to talk about the main one, even if the two subjects are so related. 

Perhaps the set-first approach *is* the best way to introduce people to categories. Or perhaps using sets to introduce categories is just one of those things that people do, just because everyone else does it. But, one thing is for certain --- we don't *need* to study sets in order to understand categories. So now I would like to start over and talk about categories as a first concept. So pretend like this is a new book (I wonder if I can dedicate this to a different person).

So. A category is a collection of objects (things) where the "things" can be anything you want. Consider, for example, these ~~colorful~~ gray balls:

![Balls](../02_category/elements.svg)

A category consists of a collection of objects as well as some arrows connecting some of them to one another. We call the arrows, *morphisms*.

![A category](../02_category/category.svg)

Wait a minute, we said that all sets form a category, but at the same time any one set can be seen as a category on its own right (just one which has no morphisms). This is true and an example of a phenomenon that is very characteristic of category theory --- one structure can be examined from many different angles and may play many different roles, often in a recursive fashion.

This particular analogy (a set as a category with no morphisms) is, however, not very useful. Not because it's in any way incorrect, but because category theory is *all about the morphisms*. If in set theory arrows are nothing but a connection between a source and a destination, in category theory it's the *objects* that are nothing but a source and destination for the arrows that connect them to other objects. This is why, in the diagram above, the arrows, and not the objects, are colored: if you ask me, the category of sets should really be called *the category of functions*.

Speaking of which, note that objects in a category can be connected by multiple arrows and that arrows having the same source and target sets does not in any way make them equivalent (it does not actually mean that they would produce the same value).

![Two objects connected with multiple arrows](../02_category/arrows.svg)

Why that is true is pretty obvious if we go back to set theory for a second (OK, maybe we really *have* to do it from time to time). There are, for example, an infinite number of functions that go from number to boolean, and the fact that they have the same input type and the same output type (or the same *type signature*, as we like to say) does not in any way make them equivalent to one another.

![Two sets connected with multiple functions](../02_category/set_arrows.svg)

There are some types of categories in which only one morphism between two objects is allowed (or one in each direction), but we will talk about them later.

Composition
---

The most important requirement for a structure to be called a category is that *two morphisms can make a third*, or in other words, that morphisms are *composable* --- given two successive arrows with appropriate type signature, we can draw a third one that is equivalent to the consecutive application of the other two.

![Composition of morphisms](../02_category/composition.svg)

Formally, this requirement says that there should exist an operation (denoted with the symbol $•$) such that for each two functions $g: A → B$ and $f: B → C$, there exists a function $(f • g): A → C$ (again, note that there can be many other morphisms with with the same type signature, but there must be *exactly one* morphism that fits these criteria).

![Composition of morphisms in the context of additional morphism](../02_category/composition_arrows.svg)

**NB:** Note (if you haven't already) that functional composition is written from right to left. e.g. applying $g$ and then applying $f$ is written $f • g$ and not the other way around. (You can think of it as a shortcut to $f(g(a))$).

The law of identity
---

Before the standard Arabic numerals that we use today, there were Roman numbers. Roman numerals weren't any good, because they lacked the concept of *zero* --- a number that indicated the absence of quantity and any number system that lacks this simple concept is bound to remain extremely limited. It is the same in programming, where we have multiple values that indicate the absence of a value. 

The zero of category theory is what we call the "identity morphism" for each object. In short, this is a morphism, that doesn't do anything.

![The identity morphism (but can also be any other morphism)](../02_category/identity.svg)


It's important to mark this morphism, because there can be (let's add the very important (and also very boring) reminder) many morphisms that go from one object to the same object, many of which actually do stuff. For example, mathematics deals with a multitude of functions that have the set of numbers as source and target, such as $negate$, $square$, $add one$, and are not at all the identity morphism.

A structure must have an identity morphism for each object in order for it to be called a category --- this is known as the law of identity.

**Question:** What is the identity morphism in the category of sets?

The law of associativity
---

Functional composition is special not only because you can take any two morphisms with appropriate signatures and make a third, but because you can do so indefinitely, i.e. given $n$ successive arrows, each of which starts from the object that the other one finishes, we can draw one (exactly one) arrow that is equivalent to the consecutive application of all $n$ arrows.

![Composition of morphisms with many objects](../02_category/composition_n_objects.svg)

But let's get back to the math. If we carefully review the definition above, we can see that it can be reduced to multiple applications of the following formula: given 3 objects and 2 morphisms between them $f$ $g$ $h$, combining $h$ and $g$ and then combining the end result with $f$ should be the same as combining $h$ to the result of $g$ and $f$ (or simply $(h • g) • f = h • (g • f)$). 

This formula can be expressed using the following diagram, which would only commute if the formula is true (given that all our category-theoretic diagrams commute, we can say, in such cases, that the formula and the diagram are equivalent).

![Composition of morphisms with many objects](../02_category/composition_associativity.svg)

This formula (and the diagram) is the definition of a property called $associativity$. Being associative is required for functional composition to really be called functional composition (and for a category to really be called category). It is also required for our diagrams to work, as diagrams can only represent associative structures (imagine if the diagram above does not commute, it would be super weird).

Associativity is not just about diagrams. For example, when we express relations using formulas, associativity just means that brackets don't matter in our formulas (as evidenced by the definition $(h • g) • f = h • (g • f)$). 

And it is not only about categories either, it is a property of many other operations on other types of objects as well e.g. if we look at numbers, we can see that the multiplication operation is associative e.g. $(1 \times 2) \times 3 = 1 \times (2 \times 3)$. While division is not $(1 / 2) / 3 = 1 / (2 / 3)$.

This approach (composing indefinitely many things) for building stuff is often used in programming. To see some examples, you don't need to look further than the way the pipe operator in Unix (`|`), which feeds the standard output of a program with the standard input of another program, is (ab)used. If you *want* to look further, note that there is a whole programming paradigm based on functional composition, called "concatenative programming".


Commuting diagrams
---

The diagrams above, use colors to illustrate the fact that the green morphism is equivalent to the other two (and not just some unrelated morphism), but in practice this notation is a little redundant --- the only reason to draw diagrams in the first place is to represent paths that are equivalent to each other. All other paths would just belong in different diagrams. 

![Composition of morphisms - a commuting diagram](../02_category/composition_commuting_diagram.svg)

As we mentioned briefly in the last chapter, all diagrams that are like that (ones in which any two paths between two objects are equivalent to one another) are called *commutative diagrams* (or diagrams that *commute*). All diagrams in this book (except the wrong ones) commute.

More formally, a commuting diagram is a diagram in which given two objects $a$ and $b$ and two sequences of morphisms between those two objects, we can say that those sequences are equivalent. 

The diagram above is one of the simplest commuting diagrams.

A summary
---

For future reference, let's restate what a category is:

A category is a collection of *objects* (we can think of them as *points*) and *morphisms* ( or *arrows*) that go from one object to another, where:
1. Each object has to have the identity morphism.
2. There should be a way to compose two morphisms with an appropriate type signature into a third one, in a way that is *associative*.

This is it.

{% if site.distribution == 'print'%}

Addendum: Why are categories like that?
===


*Why* are categories defined by those two laws and not some other two (or one, three, four etc.). laws? From one standpoint, the answer to that seems obvious --- we study categories because they *work*, I mean, look at how many applications are there. 

But at the same time category theory is an abstract theory, so everything about it is kinda arbitrary: you can remove a law --- and you get another theory that looks similar to category theory (although it might actually turn out to be quite different in practice (due to a phenomenon called "emergence")). Or you add one more law and you get a yet another theory, so if this specific set of laws works better than any other, then this fact demands an explanation. Not a *mathematical* explanation (e.g. we cannot prove that this theory is better than some other one), but an explanation nevertheless. What follows is *my* attempt to provide such an explanation, regarding the laws of *identity* and *associativity*.

Identity and isomorphisms
===

The reason the identity law is required is by far the more obvious one. We need to have a morphism that does nothing? It's because morphisms are the basic building blocks of our language, we need the identity morphism to be able to speak properly. For example, once we have the concept of identity morphism defined, we can have a category-theoretic definition of an *isomorphism* (which is important, because the concept of an isomorphism is very important for category theory): 

Like we said in the previous chapter, an isomorphism between two objects ($A$ and $B$) consists of two morphisms --- ($A → B$.  and $B → A$) such that their compositions are equivalent to the identity functions of the respective objects. Formally, objects $A$ and $B$ are isomorphic if there exist morphisms $f: A → B$ and $g: B → A$ such that $f \circ g = ID_{B}$ and $g \circ f = ID_{A}$. 

And here is the same thing expressed with a commuting diagram.

![Isomorphism](../02_category/isomorphism.svg)

Like the previous one, the diagram expresses the same (simple) fact as the formula, namely that going from the one of objects ($A$ and $B$) to the other one and then back again is the same as applying the identity morphism i.e. doing nothing. 


Associativity and reductionism
===

> If, in some cataclysm, all of scientific knowledge were to be destroyed, and only one sentence passed on to the next generations of creatures, what statement would contain the most information in the fewest words? I believe it is the atomic hypothesis (or the atomic fact, or whatever you wish to call it) that all things are made of atoms—little particles that move around in perpetual motion, attracting each other when they are a little distance apart, but repelling upon being squeezed into one another. In that one sentence, you will see, there is an enormous amount of information about the world, if just a little imagination and thinking are applied. --- Richard Feynman


Associativity --- what does it mean and why is it there? In order to tackle this question, we must first talk about another concept --- the concept of *reductionism*: 

Reductionism is the idea that the behaviour of some more complex phenomenon can be understood in terms of a number of *simpler* and more fundamental phenomena, or in other words, the idea that things keep getting simpler and simpler as they get "smaller" (or when they are viewed at a lower level), like for example, the behavior of matter can be understood through the understanding the behaviours of its constituents i.e. atoms. Whether the reductionist view is *universally valid*, i.e. whether it is possible to explain everything with a simpler things (and devise a *theory of everything* that reduces the whole universe to a few very simple laws) is a question that we can argue about until that universe's inevitable collapse. But, what is certain is that reductionism underpins all our understanding, especially when it comes to science and mathematics --- each scientific discipline has a set of fundaments using which it tries to explain a given set of more complex phenomena, e.g. particle physics tries to explain the behaviour of atoms in terms of a given set of elementary particles, chemistry tries to explain the behaviour of various chemical substances in terms of a the chemical elements that they are composed of etc. A behaviour that cannot be reduced to the fundamentals of a given scientific discipline is simply outside of the scope of this discipline (and so a new discipline has to be created to tackle it). So, if this principle is so important, it would be beneficial to be able to formalize it, and this is what we will try to do now.

Commutativity
---

One way to state the principle of reductionism is to say that *each thing is nothing but a sum of its parts*. Let's try to formalize that. It would mean that a set of objects when combined in whichever way, will always result in the same object. 

So, if we have

$A \circ B \circ C = D$

We also have 

$B \circ A \circ C = X$

$C \circ A \circ B = X$

etc

Or simply

$A \circ B = B \circ  A$

Incidentally this is the definition of a mathematical law called *commutativity*.

**Task:** if our objects are sets, which set operation can represents the sum?

Associativity
---

Commutativity law is abided only in contexts where the order is irrelevant i.e. in which an object can be represented as the sum of its parts *when combined in whichever way*. But there are many cases in which an object is to be represented by the sum of its parts, but only when *combined in one specific way*.

In such contexts, commutativity would not hold, because the fact that A can be combined with B to get C would not automatically mean that B can be combined with A to get the same result (in the case of functions, they may not be able to be combined at all).

But a weaker version of the law of reductionism would still hold in this case, namely that if we take a bunch of objects, combined in a certain order, it would be true that *any pair of those objects could, at any time, be replaced by the object we get by combining them*, i.e. if we have.

$A \circ  B = D$

and 

$B \circ  C = X$

we would also have

$(A \circ B \circ C) = D C = A X$

or simply 

$(A\circ  B)\circ  C = A \circ (B \circ C)$

And this, I think, is the essence of associativity --- the ability to study complex phenomenon by zooming in into a part that you want to examine in a given moment, and looking at it in isolation.

Note that associativity only allows for combining things in one dimension. Later we will learn about extensions of category theory that allow for working in 2 dimensions.

{%endif%}
