---
layout: default
title: categories
---

from sets to categories
===

in this chapter we will see some more set-theoretic constructs, but we will also introduce their category-theoretic counterparts in an effort to gently introduce the concept of a category itself.

when we are finished with that, we will try, (and almost succeed) to define categories from scratch, without actually relying on set theory.

products
===

in the previous chapter there were several places where needed a way to construct a set whose elements are *composite* of the elements of some other sets: when we discussed mathematical functions, we couldn't define $+$ and $-$ because we could only formulate functions that take one argument. then, when we introduced the primitive types in programming languages, like `char` and `number`, we mentioned that most of the types that we actually use are *composite* types. so how do we construct those?

the simplest composite type, of the sets $b$, that contains $b$'s and the set $y$, that contains $y$'s is the *cartesian product* of $b$ and $y$, that is the set of *ordered pairs* that contain one element of the set $y$ and one element of the set $b$. or formally speaking: $y \times b = \{ (y, b) \}$ where $y ∈ y, b ∈ b$ ($∈$ means "is an element of").

![product parts](../02_category/product_parts.svg)

it is denoted $b \times y$ and it comes equipped with two functions for retrieving the $b$ and the $y$ from each $(b, y)$.

![product](../02_category/product.svg)

**question**: why is this called a product? hint: how many elements does it have?

{% if site.distribution == 'print'%}

interlude --- coordinate systems
---

the concept of *cartesian product* was first defined by the mathematician and philosopher rené descartes as a basis for the *cartesian coordinate system*, which is why both concepts are named after him (although it does not look like it, as they use the latinized version of his name). 

most people know how cartesian coordinate systems works, but an equally interesting question, on which few people think about, is how we can define it using sets and functions. 

a cartesian coordinate system consists of two perpendicular lines, situated on an *euclidean plane* and some kind of mapping that resembles a function, connecting any point in these two lines to a number, representing the distance between the point that is being mapped and the lines' point of overlap (which is mapped to the number $0$).

![cartesian coordinates](../02_category/coordinates_x_y.svg)

using this construct (as well as the concept of a cartesian product), we can describe not only the points on the lines, but any point on the euclidean plane. we do that by measuring the distance between the point and those two lines.

![cartesian coordinates](../02_category/coordinates.svg)

and since the point is the main primitive of euclidean geometry, the coordinate system allows us to also describe all kinds of geometric figures such as this triangle (which is described using products of products).

![cartesian coordinates](../02_category/coordinates_triangle.svg)

so we can say that the cartesian coordinate system is some kind of function-like mapping between all kinds of sets of (products of) *products of numbers* and *geometric figures* that correspond to these numbers, using which we can derive some properties of the figures using the numbers (for example, using the products in the example below, we can compute that the triangle that they represent has base of $6$ units and height of $5$ units. 

![cartesian coordinates](../02_category/coordinates_isomorphism.svg)

what's even more interesting is that this mapping is one-to-one, which makes the two realms *isomorphic* (traditionally we say that the point is *completely* described by the coordinates, which is the same thing).

with that, our effort to represent cartesian coordinates with sets is complete, except we haven't described what these function-like things that connect points to numbers are --- they make intuitive sense as functions, and that they exhibit all relevant properties (many-to-one mapping (or one-to-one in this case)), however, we have only covered functions as mappings between *sets* and in this case, even if we can think of the coordinate system as a set (of points and figures), geometrical figures are definitely not a set, as it has a lot of additional things going on (or additional *structure*, as a category theorist would say). so defining this mapping formally, would require us to also formalize both geometry and algebra, and moreover to do so in a way in which they are compatible with one another. this is some of the ambitions of category theory and this is what we will attempt to do later in this book.

but before we continue with that, let's see some other neat uses of products.

{%endif%}

products as objects
---

in the previous chapter, we established the correspondence of various concepts in programming languages and set theory --- sets resemble types, functions resemble methods/subroutines. this picture is made complete with products, that are like stripped-down *classes* (also called *records* or *structs*) --- the sets that form the product correspond to the class's *properties*  (also called *members*) and the functions for accessing them are like what programmers call *getter methods* e.g. the famous example of object-oriented programming of a `person` class with `name` and `age` fields is nothing more than a product of the set of strings, and the sets of numbers. and objects with more than two values can be expressed as products the composites of which are themselves products.

using products to define numeric operations
---

products can also be used for expressing functions that take more than one argument (and this is indeed how multi-param functions are implemented in languages who actually have tuples, like the ones from the ml family ). for example, "plus" is a function from the set of products of two numbers to the set of numbers, so, $+: \mathbb{z} \times \mathbb{z} → \mathbb{z}$. 

![the plus function](../02_category/plus.svg)

by the way, such functions (ones that take two objects of one type and return a third object of the same type) are called *operations*.

defining products in terms of sets 
---

a product is, as we said, a set of *ordered* pairs (formally speaking $a \times b ≠ b \times a$). so, to define a product we must define the concept of an ordered pair. so how can we do that? 

![a pair](../02_category/pair.svg)

note that an ordered pair of elements is not just a set containing the two elements ---  that would just be a *pair*, but not an *ordered* one, as an ordered pair also contains information about which of those objects is the first and which one is second in the pair. in programming, we have the ability to assign names to each member of an object, which accomplishes the same purpose. 

the order of elements in the pair is important as, while some mathematical operations (such as addition) don't care about order, others (such as subtraction) do. in programming, when we manipulate an object we obviously want to access a specific property of the object, not just any random property.


so does that mean that we have to define ordered pair as a "primitive" type, like we defined sets in order to use them? that's possible, but there is another approach if we can define a construct that is *isomorphic* to the ordered pair, using only sets, we can use that construct instead of them. and mathematicians had come up with multiple ingenious ways to do that. here is the first one, which was suggested by norbert wiener in 1914. note the smart use of the fact that the empty set is unique. 

![a pair, represented by sets](../02_category/pair_as_set_2.svg)

the next one was suggested in the same year by felix hausdorff. in order to use that one, we just have to define $1$, and $2$ first.

![a pair, represented by sets](../02_category/pair_as_set_3.svg)

suggested in 1921 kazimierz kuratowski, this one uses just the component of the pair.

![a pair, represented by sets](../02_category/pair_as_set_1.svg)

defining products in terms of functions 
---

in the product definitions presented in the previous section worked by *zooming in* into the individual elements of the product and seeing what they can be made of --- we may think of this as a *low-level* approach to the definition. this time we will try to do the opposite --- we will try to be as oblivious to the contents of our sets as possible i.e. instead of zooming in we will *zoom out*, we will attempt to fly over the difficulties that we met in the previous section and provide a definition of a product in terms of functions and *external* diagrams.

to define products in terms of external diagrams, we must, given two sets, devise a way to pinpoint the set that is their product, so to achieve that, we must first think about *what functions* are there for a given product. we have two of those --- the functions for retrieving the two elements of the pair (the "getters", so to say). 

![product](../02_category/product.svg)

formally, if we have a set $g$ which is the product of sets $y$ and $b$, then we should also have functions which give us back the elements of the product, so $g → y$ and $g → b$. now let's switch to the external view.

![product, external diagram](../02_category/product_external.svg)

this diagram already provides a definition, but not a complete one, as the product of $y$ and $b$ is not the only set for which such functions can be defined. for example, a set of triples of $y \times b \times r$ for any element $r$ also qualifies. and if there is a function from $g$ to $b$ then the set $g$ itself meets our condition for being the product, because it is connected to $b$ and to itself. and there can be many other objects that qualify as well.

![product, external diagram](../02_category/product_candidates.svg)

however, the set of triples  $y \times b \times r$ is connected to $y$ and $b$ only because it can be converted to $y \times b$: the arrow $y \times b \times r \to b$ is just the composition of the arrow $y \times b \times r \to y \times b$ and the arrow  $y \times b \to b$. the same reasoning applies to all other objects.

![product, external diagram](../02_category/products_morphisms.svg)

(intuitively, all such objects would be *more complex* than the pair objects and you can always have a function that converts a more complex structure, to a simpler one (we saw an example of this when we covered the functions that convert subsets to their supersets).)

more formally, if we suppose that there is a set $i$ that can serve as an impostor product of sets $b$ and $y$ i.e. that $i$ is such that there exist two functions, which we will call $ib: i → b$ and $iy: i → y$ that allow us to derive elements $b$ and $y$ from it, then there must also exist a unique function with the type signature $i → b \times y$ that converts the impostor from the true product, and $ib$ and $iy$ are just results of composing that function with the usual "getter" functions that go from the pair to the elements (i.e. whichever object we pick for $i$, this digram would commute).

![product, universal property](../02_category/product_universal_property.svg)


in category theory, this type of property that a given object might possess (participating in a structure such that all similar objects can be converted to/from it) is called a *universal property*. we won't go into more detail about this, as it is a bit early for that now (after all we haven't even yet said what category theory is). 

one thing that we need to point out is that this definition (as, by the way, all the previous ones) does not rule out the sets which are isomorphic to the product --- when we represents things using universal properties, an isomorphism is the same as equality. this is the same viewpoint that we must adopt in programming, especially when we work on the higher level --- there might be many different implementations of pair (e.g. ones provided by different libraries), but as long as they work in the same way (i.e. we can convert one to the other and vice versa) they are all the same for us).

sums
===

we will now study a construct that is pretty similar to the product but at the same time is very different. similar because, like the product, it is a relation between two sets which allows you to unite them into one, without erasing their structure. but different as it encodes a quite different type of relation --- a product encodes an *and*  relation between two sets, while the sum encodes an *or* relation. 

the sum of two sets $b$ and $y$, denoted $b + y$ is a set that contains *all elements from the first set combined with all elements from the second one*. 

![sum or coproduct](../02_category/coproduct.svg)

we can immediately see the connection with the *or* logical structure: for example, because a parent is either a mother or a father of a child, the set of all parents is the sum of the set of mothers and the set of fathers, or $p = m + f$.


defining sums in terms of sets
---

as with the product, representing sums in terms of sets is not so straightforward e.g. when a given object is an element of both sets, then it appears in the sum twice which is not permitted, because a set cannot contain the same element twice. 

as with the product, the solution is to put some extra structure.

![a member of a coproduct](../02_category/coproduct_member.svg)

and, as with the product, there is a low-level way to express a sum using sets alone. incidentally, we can use pairs.

![a member of a coproduct, examined](../02_category/coproduct_member_set.svg)

defining sums in terms of functions
---

as you might already suspect, the interesting part is expressing the sum of two sets using functions. to do that we have to go back to the conceptual part of the definition. we said that sums express an *or* relation between two things. 

a property of every *or* relation is that if something is an $a$ that something is also an $a \vee b$ , and same for $b$ (the $\vee$ symbol means *or* by the way). for example, if my hair is *brown*, then my hair is also *either blond or brown*. this is what *or* means, right? this property can be expressed as a function, two functions actually --- one for each set that takes part in the sum relation (for example, if parents are either mothers or fathers, then there surely exist functions $mothers → parents$ and $fathers → parents$).

![coproduct, external diagram](../02_category/coproduct_external.svg)

as you might have already noticed, this definition is pretty similar to the definition of the product from the previous section. and the similarities don't end here. as with products, we have sets that can be thought of as *impostor* sums --- ones for which these functions exist, but which also contain additional information.

![coproduct, external diagram](../02_category/coproduct_candidates.svg)

all these sets express relationships which are more vague than the simple sum, and therefore given such a set (an "impostor" set as we called it earlier), there would exist a unique function that would distinguish it from the true sum. the only difference is that, unlike with the products, this time this function goes *from the sum* to the impostor.

![coproduct, external diagram](../02_category/coproduct_morphisms.svg)


interlude: categorical duality 
===

the concepts of product and sum might already look similar in a way when we view them through their internal diagrams, but once we zoom out to the external view, and we draw the two concepts external diagrams, this similarity is quickly made precise.

i use "diagrams" in plural, but actually the two concepts are captured *by one and the same diagram*, the only difference between the two being that their arrows are flipped --- many-to-one relationships become one-to-many and the other way around.

![coproduct and product](../02_category/coproduct_product_duality.svg)

the universal properties that define the two construct are the same as well --- if we have a sum $y + b$, for each impostor sum, such as $y + b + r$, there exist a trivial function $y + b  \to y + b + r$.

and, if you remember, with product the arrows go the other way around --- the equivalent example for product would be the function $y \times b \times r \to y \times b $ 

this fact uncovers a deep connection between the concepts of the *product* and *sum*, which is not otherwise apparent --- they are each other's opposites. *product* is the opposite of *sum* and *sum* is the opposite of *product*.

in category theory, concepts that have such a relationship are said to be *dual* to each other. so the  the concepts of *product* and *sum* are dual. this is why sum is known in a category-theoretic setting as *converse product*, or *coproduct* for short. this naming convention is used for all dual constructs in category theory.

{% if site.distribution == 'print'%}

de morgan duality
---

now let's look at how the concepts of product and sum from the viewpoint of *logic*. we mentioned that:

- the *product* of two sets contains an element of the first one *and* one element of the second one.
- a *sum* of two sets contains an element of the first one *or* one element of the second one.

when we view those sets as propositions, we discover the concept of the *product* ($\times$) corresponds exactly to the *and* relation in logic (denoted $\land$). from this viewpoint, the function $y \times b \to y$  can be viewed as instance of a logical rule of inference called *conjunction elimination* (also called *simplification*) stating that, $y  \land b \to y$, for example, if your hair is partly blond and partly brown, then it is partly blond.

by the same token, the concept of a *sum* ($+$) corresponds the *or* relation in logic (denoted $\lor$). from this viewpoint, the function $y  \to y + b$  can be viewed as instance of a logical rule of inference called *disjunction introduction*, stating that, $y  \to y \lor b$ for example, if your hair is blond, it is either blond or brown.

this means, among other things, that the concepts of *and* and *or* are also dual --- an idea which was put forward in the 19th century by the mathematician augustus de morgan and is henceforth known as *de morgan duality*, and which is a predecessor to the modern idea of duality in category theory, that we examined before. 

this duality is subtly encoded in the logical symbols for *and* and *or* ($\land$ and $\lor$) --- they are nothing but stylized-versions of the diagrams of products and coproducts (yes, i know they are reversed, but still)...

![coproduct and product](../02_category/demorgan_duality.svg)

the duality of $\land$ and $\lor$ can be seen in the two formulas that are most often associated with de morgan which are known as de morgan laws (although de morgan didn't actually discover those (they were previously formulated, by william of ockham (of "ockham's razor" fame, among other people)).

$\neg(a \wedge b) = \neg{a} \vee \neg{b}$

$\neg(a \vee b) = \neg{a} \wedge \neg{b}$

you can read the second formula as, for example, if my hair is not blond *or* brown, this means that my hair is not blond *and* my hair is not brown, and vice versa (the connection work both ways)

now we will go through the formulas and we would try to show that they are actually a simple corollary of the duality between *and* and *or* 

let's say we want to find the statement that is opposite of "blond *or* brown".

$a \vee b$ 

the first thing we want to do is, to replace the statements that constitute it with their opposites, which would make the statement "not blond *or* not brown"

$\neg{a} \vee \neg{b}$ 

however, this statement is clearly not the opposite of "blond *or* brown"(saying that my hair is not blond *or* not brown does in fact allow it to be blond and also allows for it to be brown, it just doesn't allow it to be both of these things).

so what have we missed? simple:  we replaced the propositions with their opposites, but we didn't replace the *operator* that connects them --- it is still *or* for both propositions. so we must replace it with *or* converse. as we said earlier, and as you can see by analyzing this example, this operator is *and* so the formula becomes "not blond *and* not brown".

$\neg{a} \wedge \neg{b}$ 

saying that this formula is the opposite or "blond and brown" --- is the same thing as saying that it is equivalent to its negation, which is precisely what the second de morgan law says.

$\neg(a \vee b) = \neg{a} \wedge \neg{b}$

and if we "flip" this whole formula (we can do that without changing the signs of the individual propositions, as it is valid for all propositions) we get the first law.

$\neg(a \wedge b) = \neg{a} \vee \neg{b}$

this probably provokes a lot of questions and we have a whole chapter about logic to address those. but before we get to it, we have to see what categories (and sets) are.

{% endif %}

defining the rest of set theory using functions
===

so far, we saw some amazing ways of defining set-theoretic constructs without looking at the set elements and by only using functions and external diagrams.

in the first chapter we defined functions and functional composition with this digram.

![functional composition](../02_category/functions_compose_sets.svg)

and now, we also defined products and sums.

![coproduct and product](../02_category/coproduct_product_duality.svg)

what's even more amazing, is that we can define *all of set-theory*, based just on the concept of functions, as discovered by the category theory pioneer francis william lawvere. 

defining set elements using functions
---

traditionally, everything in set theory is defined in terms of two things: *sets* and *elements*, so, if we want to define it using *sets* and *functions*, we must define the concept of a *set element* in terms of functions.

to do so, we will use the singleton set.

![the singleton set](../02_category/elements_singleton.svg)

ok, let's start by taking a random set which we want to describe.

![a set of three elements](../02_category/elements_set.svg)

and let's examine the functions from the singleton set, to that random set.

![functions from the singleton set](../02_category/elements_singleton_functions.svg)

it's easy to see that there would be exactly one function for each element of the set i.e. that each element of any set $x$ is isomorphic to a function $$1 \to x$$.

so, we can say that what we call "elements" of a set are the functions from the singleton set to it.

defining the singleton set using functions
---

now that we came up with a definition of a set *element*, using just functions, we can try to draw the elements of our set as an external diagram.

![functions from the singleton set](../02_category/elements_singleton_functions_partly_external.svg)

however, our diagram is not yet fully external, as it depends on the idea of the singleton set, i.e. the set with one *element*. furthermore, this makes the whole definition circular, as we have to already have the concept of an element defined, in order to define the concept of an one-element set.

to avoid these difficulties, we devise a way to define the singleton set, using just functions. we do it in the same way that we did for products and sums - by using a unique property that the singleton set has. in particular, there is exactly one function from any other set to the singleton set i.e. if $1$ is the singleton set, then we have $\forall  x  \exists!  x \to 1$.

![terminal object](../02_category/terminal_object_internal.svg)

it turns out that this property defines the singleton set uniquely i.e. there is no other set that has it, other than the sets that are isomorphic to the singleton set. this is simply because, if there are two sets that have it, those two sets would also have unique morphisms between *themselves* i.e. they would be isomorphic to one another. more formally, if we have two sets $x$ and $y$, such that $\exists!x \to 1 \land \exists!y \to 1$ then we also have $x \cong y$.

![terminal object](../02_category/terminal_object_internal_isomorphisms.svg)

and because there is no other set, other than the singleton set that has this property, we can use it as a definition of the singleton set and say that if we have $\forall  x  \exists!  x \to 1$, then $1$ is the singleton set.

![terminal object](../02_category/terminal_object.svg)

with this, we acquire a fully-external definition (up to an isomorphism) of the singleton set, and thus a definition of a set element - the elements of set are just the functions from the singleton set to that set.

![functions from the singleton set](../02_category/elements_external.svg)

note that from this property it follows that the singleton set has exactly one element.

![functions from the singleton set](../02_category/singleton_elements_external.svg)

**question:** why exactly (check the definition)? 

defining the empty set using functions
---

the empty set is the set that has no elements, but how would we say this without referring to elements?  

we said that there exists a unique function that goes *from* the empty set *to* any other set. but the reverse is also true: the empty set is the only set such that there exists a function from it to any other set.

![initial object](../02_category/initial_object.svg)

observant readers will notice the similarities between the diagrams depicting the initial and terminal object (yes the two concepts are, of course, duals of each other).

![initial terminal duality](../02_category/initial_terminal_duality.svg)


and some *even more* observant readers may also notice the similarities between the product/coproduct diagrams and the initial/terminal object diagrams.

![coproduct and product](../02_category/coproduct_product_duality.svg)

(folks, keep it down please, you are *too observant* --- we have, like, 4 chapters to go until we get to this.)

functional application
---

now, as amazed as we are after seeing the functional definition of a set element, we might be inclined to ask the following: if elements are represented by functions, then how do you *apply* a given function to an element of one set, to get an element of another set?

the answer is surprisingly simple --- in order to apply a function to a set, you must first select an element of the set and the act of *selecting* an element from a set is the same as constructing a function from the singleton set to this element. 

![functional application - internal diagram](../02_category/application_internal.svg)

and then *applying* a function to an element is the same as composing this function, with the function we want to apply. 

![functional application - external diagram](../02_category/application_external.svg)

the result is the function that represents the result of the application.

conclusion
---

in the future, we may cover the entirety of lawvere's elementary theory of the category of sets (or etcs for short), and list all concepts and axioms that are required to define a rigorous set theory using functions, but this is enough for you to get the main idea: that these axioms constitute a definition of set theory, which is based entirely on functions. this is a key idea, but there is an even bigger thing there: because it is more general than the traditional definition, this new definition also applies to objects that are not exactly sets, but are *like* sets in some respects.

you may say that they apply to an entirely different *categories of objects*.

category theory --- brief definition
===

maybe it is about time to see what a category is. we will start with a short definition --- a category consists of objects (an example of which are sets) and morphisms that go from one object to another (which behave as functions) and that are composable. we can say a lot more about categories, and even present a formal definition, but for now it is sufficient for you to remember that sets are one example of a category and that categorical objects are like sets, except that we don't *see* their elements. or to put it another way, category-theoretic notions are captured by the external diagrams, while strictly set-theoretic notions can be captured by internal ones.

![category theory and set theory compared](../02_category/set_category.svg)

when we are within the realm of sets, we can view each set as a collection of individual elements. in category theory, we don't have such a notion. however, taking this notion away allows us to define concepts such as the sum and product sets in a whole different and more general way. plus we always have a way to "go back" to set theory, using the tricks from the last section.


| category theory | set theory | programming languages |
| ---             | ---        | ---                   |
| category        | **n/a**    | **n/a**                   |
| objects and  morphisms        | sets and functions   | classes and methods |
| **n/a**           | element    | object                |

notice the somehow weird, (but actually completely logical) symmetry (or perhaps "reverse symmetry") between the world as viewed through the lenses of set theory, and the way it is viewed through the lens of category theory:

| category theory | set theory | 
| ---             | ---        |
| category        | **n/a**        | 
| objects and  morphisms        | sets and functions |
| **n/a**             | element    | 

by switching to external diagrams, we lose sight of the particular (the elements of our sets), but we gain the ability to zoom out and see the whole universe where we have been previously trapped in. in the same way that the whole realm of sets can be thought as one category, a programming language can also be thought of as a category. the concept of a category allows us to find and analyze similarities between these and other structures.

**nb:** the word "object" is used in both programming languages and in category theory, but has completely different meanings. a categorical object is equivalent to a *type* or a *class* in programming language theory.

sets vs categories
---

one remark before we continue: in the last section, would make it seem like category theory and set theory are somehow competing with each another. perhaps that notion would be somewhat correct if category and set theory were meant to describe *concrete* phenomena, in the way that the theory of relativity and the theory of quantum mechanics are both supposed to explain the physical world. concrete theories are conceived mainly as *descriptions* of the world, and as such it makes sense for them to be connected in some sort of hierarchy. 

in contrast, abstract theories, like category theory and set theory, are more like *languages* for expressing such descriptions --- they still can be connected, and *are* connected in more than one way, but there is no inherent hierarchical relationship between the two and therefore arguing over which of the two is more basic, or more general, is just a chicken-and-egg problem, as you will see in the next chapter.

defining categories (again)
===

> "...deal with all elements of a set by ignoring them and working with the set's definition." --- dijkstra (from "on the cruelty of really teaching computing science")

all category theory books, including this one, start by talking about set theory. however looking back i really don't know why this is the case --- most books that focus on a given subject usually don't start off by introducing an *entirely different subject*, (before even starting to talk about the main one). perhaps the set-first approach *is* the best way to introduce people to categories. or perhaps using sets to introduce categories is one of those things that people do just because everyone else does it. but, one thing is for certain --- we don't *need* to study sets in order to understand categories. so now i would like to start over and talk about categories as a foundational concept. so let's pretend like this is a new book (i wonder if i can dedicate this to a different person).

so. a category is a collection of objects (things) where the "things" can be anything you want. consider, for example, these ~~colorful~~ gray balls:

![balls](../02_category/elements.svg)

a category consists of a collection of objects as well as some arrows connecting objects to one another. we call the arrows *morphisms*.

![a category](../02_category/category.svg)

wait a minute, we said that all sets form a category, but at the same time any one set can be seen as a category in its own right (just one which has no morphisms). this is true and an example of a phenomenon that is very characteristic of category theory --- one structure can be examined from many different angles and may play many different roles, often in a recursive fashion.

this particular analogy (a set as a category with no morphisms) is, however, not very useful. not because it's incorrect in any way , but rather because category theory is *all about the morphisms*. if the *arrows* in set theory are nothing but a connection between their source and a destination, in category theory it's the *objects* that are nothing but a source and destination for the arrows that connect them to other objects. this is why, in the diagram above, the arrows, and not the objects, are colored: if you ask me, the category of sets should really be called *the category of functions*.

speaking of which, note that objects in a category can be connected together by multiple arrows, and that having the same source and target sets does not in any way make arrows equivalent.

![two objects connected with multiple arrows](../02_category/arrows.svg)

why that is true is pretty obvious if we go back to set theory for a second (ok, maybe we really *have* to do it from time to time). there are, for example, an infinite number of functions that go from number to boolean, and the fact that they have the same input type and the same output type (or the same *type signature*, as we like to say) does not in any way make them equivalent to one another.

![two sets connected with multiple functions](../02_category/set_arrows.svg)

there are some types of categories in which only one morphism between two objects is allowed (or one in each direction), but we will talk about them later.

composition
---

the most important requirement for a structure to be called a category is that *two morphisms can make a third*, or in other words, that morphisms are *composable* --- given two successive arrows with appropriate type signatures, we can draw a third one that is equivalent to the consecutive application of the first two functions.

![composition of morphisms](../02_category/composition.svg)

formally, this requirement says that there should exist an *operation*, denoted with the symbol $•$ such that for each two morphisms $g: a → b$ and $f: b → c$, there exists a morphism $(f • g): a → c$.

![composition of morphisms in the context of additional morphism](../02_category/composition_arrows.svg)

this is the most important part of the definition --- in set theory we picked functions (out of the other types of relations) because they are composable, here we just invent the concept of a morphism and define them to be composable. you will see where this definition would get us.

**nb:** note, that functional composition is read from right to left. e.g. applying $g$ and then applying $f$ is written $f • g$ and not the other way around. (you can think of it as a shortcut to $f(g(a))$).

the law of identity
---

in order to have numbers, you have to have a zero. the zero of category theory is what we call the "identity morphism" for each object. in short, this is a morphism that doesn't do anything.

![the identity morphism (but can also be any other morphism)](../02_category/identity.svg)


it's important to mark this morphism, because there can be (let's add the very important (and also very boring) reminder) many morphisms that go from one object to the same object, many of which actually do stuff. for example, in the category of sets, we deal with a multitude of functions that have the set of numbers as source and target, such as $negate$, $square$, $add one$, and are not at all the identity morphism.

a structure must have an identity morphism for each object in order for it to be called a category --- this is known as the *law of identity*.

**question:** what is the identity morphism in the category of sets?

the law of associativity
---

functional composition is special not only because you can take any two morphisms with appropriate signatures and make a third, but because you can do so indefinitely, i.e. for each $n$ successive arrows, each of which has as source object the target object of the previous, we can draw one (exactly one) arrow that is equivalent to the consecutive application of all $n$ arrows.

![composition of morphisms with many objects](../02_category/composition_n_objects.svg)

but let's get back to the math. if we carefully review the definition above, we can see that it can be reduced to multiple applications of the following formula: given 3 objects and 2 morphisms between them $f$ $g$ $h$, combining $h$ and $g$ and then combining the end result with $f$ should be the same as combining $h$ to the result of $g$ and $f$ (or simply $(h • g) • f = h • (g • f)$). 

this formula can be expressed using the following diagram, which would only commute if the formula is true (given that all our category-theoretic diagrams are commutative, we can say, in such cases, that the formula and the diagram are equivalent).

![composition of morphisms with many objects](../02_category/composition_associativity.svg)

this formula (and the diagram) is the definition of a property called $associativity$. being associative is required for functional composition to really be called functional composition (and for a category to really be called a category). it is also required for our diagrams to work, as diagrams can only represent associative structures (imagine if the diagram above would not commute, it would be super weird).

associativity is not just about diagrams. for example, when we express relations using formulas, associativity just means that brackets don't matter in our formulas (as evidenced by the definition $(h • g) • f = h • (g • f)$). 

and it is not only about categories either, it is a property of many other operations on other types of objects as well e.g. if we look at numbers, we can see that the multiplication operation is associative e.g. $(1 \times 2) \times 3 = 1 \times (2 \times 3)$. while division is not $(1 / 2) / 3 = 1 / (2 / 3)$.

this approach (composing indefinitely many things) for building stuff is often used in programming. to see some examples, you don't need to look further than the pipe operator in unix (`|`), which feeds the standard output of a program into the standard input of another program. if you *want* to look further, note that there is a whole programming paradigm based on functional composition, called "concatenative programming" utilized in languages like forth and factor.


commuting diagrams
---

the diagrams above use colors to illustrate the fact that the green morphism is equivalent to the other two (and not just some unrelated morphism), but in practice this notation is a little redundant --- the only reason to draw diagrams in the first place is to represent paths that are equivalent to each other. all other paths would just belong in different diagrams. 

![composition of morphisms - a commuting diagram](../02_category/composition_commuting_diagram.svg)

as we mentioned briefly in the last chapter, all diagrams that are like that (ones in which any two paths between two objects are equivalent to one another) are called *commutative diagrams* (or diagrams that *commute*). all diagrams in this book (except the incorrectly constructed ones) commute.

more formally, a commuting diagram is a diagram in which given two objects $a$ and $b$ and two sequences of morphisms between those two objects, we can say that those sequences are equivalent. 

the diagram above is one of the simplest commuting diagrams.

a summary
---

for future reference, let's restate what a category is:

a category is a collection of *objects* (we can think of them as *points*) and *morphisms* (or *arrows*) that go from one object to another, where:
1. each object has to have the identity morphism.
2. there should be a way to compose two morphisms with an appropriate type signature into a third one, in a way that is *associative*.

this is it.

{% if site.distribution == 'print'%}

addendum: why are categories like that?
===


*why* are categories defined by those two laws and not some other two (or one, three, four etc.). laws? from one standpoint, the answer to that seems obvious --- we study categories because they *work*, i mean, look at how many applications are there. 

but at the same time category theory is an abstract theory, so everything about it is kinda arbitrary: you can remove a law --- and you get another theory that looks similar to category theory (although it might actually turn out to be quite different in practice). or you can add one more law and get yet another theory (by the way, there are indeed such laws that refine the ones), so if this specific set of laws works better than any other, then this fact demands an explanation. not a *mathematical* explanation (e.g. we cannot prove that this theory is better than some other one), but an explanation nevertheless. what follows is *my* attempt to provide such an explanation, regarding the laws of *identity* and *associativity*.

identity and isomorphisms
===

the reason the identity law is required is by far the more obvious one. we need to have a morphism that does nothing? it's because morphisms are the basic building blocks of our language, we need the identity morphism to be able to speak properly. for example, once we have the concept of identity morphism defined, we can define a category-theoretic definition of an *isomorphism*, based on it (which is important, because the concept of an isomorphism is very important for category theory).

like we said in the previous chapter, an isomorphism between two objects ($a$ and $b$) consists of two morphisms --- ($a → b$.  and $b → a$) such that their compositions are equivalent to the identity functions of the respective objects. formally, objects $a$ and $b$ are isomorphic if there exist morphisms $f: a → b$ and $g: b → a$ such that $f \circ g = id_{b}$ and $g \circ f = id_{a}$. 

and here is the same thing expressed with a commuting diagram.

![isomorphism](../02_category/isomorphism.svg)

like the previous one, the diagram expresses the same (simple) fact as the formula, namely that going from the one of objects ($a$ and $b$) to the other one and then back again to the starting object is the same as applying the identity morphism i.e. doing nothing. 


associativity and reductionism
===

> if, in some cataclysm, all of scientific knowledge were to be destroyed, and only one sentence passed on to the next generations of creatures, what statement would contain the most information in the fewest words? i believe it is the atomic hypothesis (or the atomic fact, or whatever you wish to call it) that all things are made of atoms—little particles that move around in perpetual motion, attracting each other when they are a little distance apart, but repelling upon being squeezed into one another. in that one sentence, you will see, there is an enormous amount of information about the world, if just a little imagination and thinking are applied. --- richard feynman


associativity --- what does it mean and why is it there? in order to tackle this question, we must first talk about another concept --- the concept of *reductionism*: 

reductionism is the idea that the behaviour of complex phenomenon can be understood in terms of a number of *simpler* and more fundamental phenomena. in other words, that things keep getting simpler and simpler as they get "smaller" (or when they are viewed from a lower level). like for example, the behavior of matter can be understood completely by studying the behaviors of its constituents i.e. atoms (the word means "undividable"). 

whether the reductionist view is *universally valid*, i.e. whether it is possible to devise a *theory of everything* that describes the whole universe with a set of very simple laws, is a question over which we can argue until that universe's inevitable collapse. what is certain, though, is that *reductionism underpins all our understanding*, especially when it comes to science and mathematics --- each scientific discipline is based on a set of *fundaments* e.g. elementary particles in particle physics, chemical elements in chemistry etc. 

commutativity
---

so, if this principle is so important, it would be beneficial to be able to formalize it (i.e. to translate it to mathematical language), and this is what we will try to do now. one way to state the principle of reductionism is to say that *each thing is nothing but a sum of its parts* i.e. if we combine the same set of parts, we always get the same result. to formalize that, we get a set of objects (balls) and a way to combine them, (which we will denote with a dot). 

so, if we have, a given "recipe", for example

![commutativity](../02_category/commutativity_1.svg)

then, we would also have 

![commutativity](../02_category/commutativity_2.svg)

or quite simply

![commutativity](../02_category/commutativity_formula.svg)

incidentally this is the definition of a mathematical law called *commutativity*.

a simple context where this law applies --- the natural numbers are commutative under the operation of addiction, e.g. 1 + 2 = 2 + 1 (we will learn more about this in the chapter on groups).

**question:** if our objects are sets, what set operations can play the part of the dot in this example (i.e. which ones are commutative)?

associativity
---

sometimes we observe phenomena that still can be represented as a combination of a given set of fundaments, but only when they are combined in a *specific* way (as opposed to *any* combination, as in commutative contexts) e.g. as any mechanic can confirm, a bicycle is indeed just the combination of wheels, and frameset...

![bikes are not commutative](../02_category/commutativity_bike.svg)

...but that does not mean that every combination of the above parts constitutes a bicycle. for example, placing the front wheel of the bicycle on the rear end of the frame would result would not result in a working bicycle. and combining two wheels one with another is just not possible.

![bikes are not commutative](../02_category/commutativity_bike_2.svg)


and, to take a formal example, if function a can be combined with b to get c...

![functions are not commutative](../02_category/commutativity_functions.svg)

...would not automatically mean that b can be combined with a to get the same result 

![functions are not commutative - 2](../02_category/commutativity_functions_2.svg)

side note: composing any function with any other is only possible for functions that have the same set, both as source and target, but even then the end result would not always be the same.

![functions are sometimes commutative - 2](../02_category/commutativity_functions_3.svg)

anyway, we determined that functional composition (as well as bike building) does not obey the law of commutativity i.e. not all functions (or bike parts) compose with all other ones. but still, we know that *some* of them do, i.e. if you align the function signatures (or in case of the bicycle, if you use the proper parts in the proper places) they would come together seamlessly. so, the *order by which we combine the individual parts doesn't matter for the final outcome* e.g. when we are assembling a bicycle, it doesn't matter if we attach the front wheel to the frame first, or the back wheel, the result will be the same.

![bikes are associative](../02_category/associativity_bike.svg)

similarily, when combining functions, each two functions can, at any time, be replaced by the function that we get by combining them.

![a -> x . (x -> b . b -> c) = d,  (a -> x . x -> b) . b -> c = d](../02_category/associativity_function.svg)

this fact is captured by a more restrictive version of commutativity, that we call *associativity*, which for functions, is usually formulated like this.

![a -> x . (x -> b . b -> c) = (a -> x . x -> b) . b -> c](../02_category/associativity_formula_function.svg)

or more generally.

![a . (b . c) = d,  (a . b) . c = d](../02_category/associativity_formula.svg)

this is the essence of associativity --- the ability to study complex phenomenon by zooming in into a part that you want to examine in a given moment, and looking at it in isolation.


note that the operator we defined only allows for combining things in one dimension (you can attach a thing left and right, but not up or down). later we will learn about an extension of the concept of a category theory (called monoidal category) that "supports" working in 2 dimensions.

associativity and commutativity
---

we said that associativity is a more restricted version of commutativity. this is true in a formal way, as we show here. by now, you might realize that a composition operator for morphisms in a given category (the thing we denote by the dot) is itself a morphism, that accepts a pair of morphisms and returns yet another morphism (so $$a \times b \to c$$). 

given a composition operator for a category and one morphism from that same category (in this case the green ball), create two more morphisms (which we call the "curried" morphisms (more in the next chapter)) ($$a \to c$$ and $$b \to c$$) by just fixing the second or the first argument of the operator, correspondingly i.e. a morphism that attaches the green ball at the "front" of the function that we have as an argument (produces it's source) and one that attaches it at the "end" (accepting it's target as a source).

![(a x b) -> c) = a -> b -> c](../02_category/associativity_commutativity.svg)

now, take two such morphisms, with different directions and different objects and ask yourself: under what conditions would those two morphisms commute i.e. when would that formula be satisfied.

![(a x b) -> c) = a -> b -> c](../02_category/associativity_commutativity_2.svg)

expanding the formula gives us the answer: they commute when the original dot operator is associative.

![(a x b) -> c) = a -> b -> c](../02_category/associativity_commutativity_3.svg)

thus, we established a connection between associativity and commutativity.

{%endif%}
