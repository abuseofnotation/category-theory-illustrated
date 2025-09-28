---
layout: default
title: Categories
---

# From Sets to Categories

In this chapter, we will see some more set-theoretic constructs, but we will also introduce their category-theoretic counterparts in an effort to gently introduce the concept of a category itself.

When we are finished with that, we will try (and almost succeed) to define categories from scratch, without actually relying on set theory.

# Products

In the previous chapter, we needed a way to construct a set whose elements are _composite_ of the elements of some other sets e.g. when we discussed mathematical functions, we couldn't define $+$ and $-$ because we could only formulate functions that take one argument. Similarly, when we introduced the primitive types in programming languages, like `Char` and `Number`, we mentioned that most of the types that we actually use are _composite_ types. So how do we construct those?

So, consider the set $A$ (containing $a$'s) and the set $B$ (containing $B$'s) 
![Product parts](../02_category/product_parts.svg)

The _Cartesian product_ (or _tuple_) of sets $A$ and $B$ (denoted $A \times B$) is the set of _ordered pairs_ that contain one element of the set $A$ and one element of the set $B$. Or formally speaking: $A \times B = \{ (a, b) \}$ where $a ∈ A, b ∈ B$ ($∈$ means "is an element of").

![Product](../02_category/product.svg)

**Task 1**: Why is this called a product? Hint: How many elements does it have?

Naturally, the product comes equipped with two functions, one for each property, which take a pair and extracts the value of the property, so $C \to A$ and $C \to B$, called the product's *projections* (in programming terms, we would dub these the "getters") --- the functions for retrieving back it's constituent values).

![Product](../02_category/product_functions.svg)

## Triple product

There are occasions where we want to combine not two, but three sets into a product (e.g. $A \times B \times C$). We can achieve that by combining the first and second one into a product and then combining their product with the third set, (so it will be $(A \times B) \times C$.

![Triple product](../02_category/triple_product.svg)

There is another way to make a triple product of three sets --- combining the second and the third one and then combining the result with the first one (so $A \times (B \times C)$, but it doesn't actually matter which one you use, as the end results would be isomorphic $(A \times B) \times C \cong A \times (B \times C)$.

![Triple product](../02_category/triple_product_associativity.svg)

You might recognize this isomorphism, from the definition of functional composition. It means that the cartesian product operation is (like functional composition), *associative*.

<!--
{% if site.distribution == 'print'%}
-->

## Interlude --- coordinate systems

The concept of _Cartesian product_ was first defined by the mathematician and philosopher René Descartes, as a basis for the _Cartesian coordinate system_, which is why both concepts are named after him (although it does not look like it, as they use the Latinized version of his name).

Most people know how a Cartesian coordinate system works, but an equally interesting question, which few people think about, is how we can define it using sets and functions.

A Cartesian coordinate system consists of two perpendicular lines, situated on a _Euclidean plane_ and some kind of mapping that resembles a function, connecting any point in these two lines to a number, representing the distance between the point that is being mapped and the lines' point of overlap (which is mapped to the number $0$).

![Cartesian coordinates](../02_category/coordinates_x_y.svg)

Using this construct (as well as the concept of a Cartesian product), we can describe not only the points on the lines but any point on the Euclidean plane. We do that by measuring the distance between the point and those two lines.

![Cartesian coordinates](../02_category/coordinates.svg)

And, since the point is the main primitive of Euclidean geometry, the coordinate system allows us to also describe all kinds of geometric figures such as this triangle (which is described using products of products).

![Cartesian coordinates](../02_category/coordinates_triangle.svg)

So we can say that the Cartesian coordinate system is some kind of function-like mapping between sets of _products of numbers_ and _geometric figures_ that correspond to these numbers, using which we can derive some properties of the figures using the numbers (for example, using the products in the example below, we can compute that the triangle that they represent has a base of $6$ units and height of $5$ units.

![Cartesian coordinates](../02_category/coordinates_isomorphism.svg)

What's even more interesting is that this mapping is one-to-one, which makes the two realms _isomorphic_ (traditionally we say that the point is _completely_ described by the coordinates, which is the same thing).

With that, our effort to represent Cartesian coordinates with sets is complete, except we haven't described the mapping that connects points and numbers. The mapping resembles a function and exhibits all relevant properties of a function (many-to-one mapping (or one-to-one in this case)), however, as we said, functions are mappings between _sets_ and in this case, even if we can think of the coordinate system as a set (of points and figures), geometrical figures are definitely not a set, as they have a lot of additional things going on (or additional _structure_, as a category theorist would say). So, defining this mapping formally would require us to also formalize both geometry and algebra, and moreover to do so in a way in which they would be compatible with one another. These are some of the ambitions of category theory and this is what we will attempt to do later in this book.

But before we continue with that, let's see some other neat uses of products.

<!--
{%endif%}
-->

## Products as Objects

In the previous chapter, we established the correspondence of various concepts in programming languages and set theory --- sets resemble types, and functions resemble methods/subroutines. This picture is made complete with products, that are like stripped-down _classes_ (also called _records_ or _structs_) --- the sets that form the product correspond to the class's _properties_ (also called _members_) and the functions for accessing them are like what programmers call _getter methods_ e.g. the famous example of object-oriented programming of a `Person` class with `name` and `age` fields is nothing more than a product of the set of strings, and the sets of numbers. And objects with more than two values can be expressed as compositions of nested products (e.g. a record with 3 members $a$, $b$ and $c$ could be expressed as nested tuples ($a$, ($b$, $c$)), or more formally $a \times b \times c$.

## Using Products to Define Numeric Operations

Products can also be used for expressing functions that take more than one argument (and this is indeed how multi-param functions are implemented in languages that actually have tuples, like the ones from the ML family). For example, "plus" is a function from the set of products of two numbers to the set of numbers, so, $+: \mathbb{Z} \times \mathbb{Z} → \mathbb{Z}$.

![The plus function](../02_category/plus.svg)

By the way, such functions (ones that take two objects of one type and return a third object of the same type) are called _operations_.

## Defining products in terms of sets

A product is, as we said, a set of _ordered_ pairs (formally speaking $A \times B ≠ B \times A$). So, to define a product we must define the concept of an ordered pair. So how can we do that?

![A pair](../02_category/pair.svg)

Note that an ordered pair of elements is not just a set containing the two elements (that would be an _ unordered pair_) but it also contains information about which of those objects comes first and which one goes second in the pair. In programming, we have the ability to assign names to each member of an object, which accomplishes the same purpose.

The order of elements in the pair is important. While some mathematical operations (such as addition) don't care about order, others (such as subtraction) do. In programming, when we manipulate an object we obviously want to access a specific property of the object, not just any random property.

So does that mean that we have to define ordered pairs as a "primitive" type like we defined sets if we want to use them? That's possible, but there is another approach if we can define a construct that is _isomorphic_ to the ordered pair, using only sets, we can use that construct instead of them. And mathematicians have come up with multiple ingenious ways to do that. Here is the first one, which was suggested by Norbert Wiener in 1914. Note the smart use of the fact that the empty set is unique.

![A pair, represented by sets](../02_category/pair_as_set_2.svg)

The next one was suggested by Felix Hausdorff in the same year. In order to use that one, we just have to define $1$, and $2$ first.

![A pair, represented by sets](../02_category/pair_as_set_3.svg)

Suggested in 1921 by Kazimierz Kuratowski, this one uses just the component of the pair.

![A pair, represented by sets](../02_category/pair_as_set_1.svg)

## Defining products in terms of functions

The product definitions presented in the previous section worked by _zooming in_ into the individual elements of the product and seeing what they are made of. We may think of this as a _low-level_ approach to the definition. This time (and throughout the most of this book) we will do the opposite --- we will try to be as oblivious to the contents of our sets as possible i.e. instead of zooming in we will _zoom out_ and attempt to fly over the difficulties that we met in the previous section by providing a definition of a product in terms of functions and _external_ diagrams.

To define products in terms of external diagrams, we must, given two sets, devise a way to pinpoint the set that is their product, by looking at the functions that come from/to them. 

And what are the functions are guaranteed to exist for all products. Of course that would be the projections, the functions for retrieving back the two elements of the product $C \to A$ and $A \times B \to B$. What would a product be without them?

![Product](../02_category/product_functions.svg)

Now if we switch to the (semi) external view, this diagram already provides some definition of what a product is: if we have an object $C$ for which there are functions $C \to A$ and $A \times B \to B$, then $C$ can potentially be the product of $A$ and $B$ ($A \times B$).

![Product, external diagram](../02_category/product_external.svg)

However, this definition is not complete, as the product $A$ and $B$, is not the *only* set for which such functions can be defined. For example, a set of triples (which is like a product, but has three elements) $A \times B \times X$ for any element $X$ also qualifies. Any other set that would happen to have some functions to $A$ and $B$, and would, by this definition, be "impostor products".

![Product, external diagram](../02_category/product_candidates.svg)

Upon further inspection we discover that there are ways to expose those impostors. Take the set of triples, $A \times B \times X$ as an example. Looking at the canonical function that converts a triple to a product $A \times B \times X \to A \times B$, we realize that $A \times B \times X$ *is only connected to $A$ and $B$ because of this function*. That is, if we dub it $g: A \times B \times X \to A \times B$ and let $f^{1}$ and $f^{2}$ be the arrows for retrieving elements of a product ($f^{1} : A \times B \to A$ and $f^{2} : A \times B \to B$), then, the arrow that connects the triple $A \times B \times X$ to $A$ and $B$ are just the compositions $f^{1} g$ and $f^{2}g$. 

![Product, external diagram](../02_category/product_triple.svg)

We claim that the same reasoning applies to all other objects that can take the place of our product --- they all are connected to the product, and their getters are just the result of this connection. Why? Intuitively, all such objects would be _more complex_ than the product and you can always have a function that converts a more complex structure to a simpler one by just throwing information away (in the same way in which we threw the third element of the triple).

![Product, external diagram](../02_category/product_morphisms.svg)

More formally, if we suppose that there is a set $I$ that can serve as an impostor of the product of sets $A$ and $B$ (i.e. that $I$ is such that there exists two functions $I \to A$ and $I \to B$, then there must also exist a unique function with the type signature $g: I /to A \times B$, that converts the impostor product to the real product, such that the above two functions would be just the composition of $g$ with the usual "getter" functions of the product ($f^{1} : A \times B \to A$ and $f^{2} : A \times B \to B$). In other words, whichever object we pick for $I$, this diagram would commute (oh no, not this diagram again).

![Product, universal property](../02_category/product_universal_property.svg)

You would see a lot of similar diagrams in this book. In category theory, we often (always) define properties that a given object might possess, by defining a structure such that all similar objects can be converted to it. This is what we call a *universal property*, but it is too early to go into more detail, (after all we haven't even yet said what category theory is).

## Isomorphism and equality

One thing that we should point out, is that this definition (as all the previous ones, by the way) does not rule out the sets which are *isomorphic* to the product. When we represent things using universal properties, an isomorphism is treated as equality. 
<!--TODO diagram-->

This is the same viewpoint that we adopt in programming, especially when we work on the higher level --- there might be many different implementations of pair, but as long as they work in the same way (i.e. we can convert one to the other and vice versa) they are all the same to us.

# Sums

We will now study a construct that is pretty similar to the product but at the same time is very different. Similar because, like the product, it is a relation between two sets which allows you to unite them into one, without erasing their structure. But different as it encodes a very different type of relation --- a product encodes an _and_ relation between two sets, while the sum encodes an _or_ relation.

The sum of two sets $B$ and $Y$, denoted $B + Y$ is a set that contains _all elements from the first set combined with all elements from the second one_.

![Sum or coproduct](../02_category/coproduct.svg)

We can immediately see the connection with the _or_ logical structure: For example, because a parent is either a mother or a father of a child, the set of all parents is the sum of the set of mothers and the set of fathers, or $P = M + F$.

## Defining Sums in Terms of Sets

As with the product, representing sums in terms of sets is not so straightforward e.g. when a given object is an element of both sets, then it appears in the sum twice which is not permitted, because a set cannot contain the same element twice.

As with the product, the solution is to put some extra structure.

![A member of a coproduct](../02_category/coproduct_member.svg)

And, as with the product, there is a low-level way to express a sum using sets alone. Incidentally, we can use pairs.

![A member of a coproduct, examined](../02_category/coproduct_member_set.svg)

## Defining sums in terms of functions

As you might already suspect, the interesting part is expressing the sum of two sets using functions. To do that, we have to go back to the conceptual part of the definition. We said that sums express an _or_ relation between two things.

A property of every _or_ relation is that if something is an $A$ that something is also an $A \vee B$ (The $\vee$ symbol means _or_ by the way). For example, if my hair is _brown_, then my hair is also _either blond or brown_. This is what _or_ means, right? This property can be expressed as a function, two functions actually --- one for each set that takes part in the sum relation (for example, if parents are either mothers or fathers, then there surely exist functions $mothers → parents$ and $fathers → parents$).

![Coproduct, external diagram](../02_category/coproduct_external.svg)

As you might have already noticed, this definition is pretty similar to the definition of the product from the previous section --- the difference being reversed arrows. And the similarities don't end here. As with products, we have sets that can be thought of as _impostor_ sums --- ones for which these functions exist, but which also contain additional information.

![Coproduct, external diagram](../02_category/coproduct_candidates.svg)

All these sets express relationships which are more vague than the simple sum, and therefore given such a set, there would exist a unique function that would distinguish it from the true sum. The only difference is that, unlike the functions that define products, this time this function goes _from the sum_ to the impostor.

![Coproduct, external diagram](../02_category/coproduct_morphisms.svg)

# Interlude: Categorical Duality

The concepts of product and sum might already look similar in a way when we view them through their internal diagrams. The _external_ view makes this similarity precise --- these two diagrams are one and the same diagram, only their arrows are flipped --- many-to-one relationships become one-to-many and the other way around.

![Coproduct and product](../02_category/coproduct_product_duality.svg)

The universal properties that define the two constructs are the same as well --- if we have a sum $A + B$, for each impostor sum, such as $A + B + X$, there exists a trivial function $A + B  \to A + B + R$.

And, if you remember, with products the arrows go the other way around --- the equivalent example for a product would be the function $A \times B \times R \to A \times B $

This fact uncovers a deep connection between the concepts of the _product_ and _sum_, which is not otherwise apparent --- they are each other's opposites. _Product_ is the opposite of _sum_ and _sum_ is the opposite of _product_.

In category theory, concepts that have such a relationship are said to be _dual_ to each other. So, the concepts of _product_ and _sum_ are dual. This is why sums are known in a category-theoretic setting as _converse product_, or _coproduct_ for short. This naming convention is used for all dual constructs in category theory.

<!--
{% if site.distribution == 'print'%}
-->

## De Morgan duality

Now let's look at how the concepts of product and sum from the viewpoint of _logic_. We mentioned that:

- The _product_ of two sets contains an element of the first one _and_ one element of the second one.
- A _sum_ of two sets contains an element of the first one _or_ one element of the second one.

When we view those sets as propositions, we discover the concept of the _product_ ($\times$) corresponds exactly to the _and_ relation in logic (denoted $\land$). From this viewpoint, the function $Y \times B \to Y$ can be viewed as an instance of a logical rule of inference called _conjunction elimination_ (also called _simplification_) stating that, $Y  \land B \to Y$, for example, if your hair is partly blond and partly brown, then it is partly blond.

By the same token, the concept of a _sum_ ($+$) corresponds to the _or_ relation in logic (denoted $\lor$). From this viewpoint, the function $Y  \to Y + B$ can be viewed as an instance of a logical rule of inference called _disjunction introduction_, stating that, $Y  \to Y \lor B$ for example, if your hair is blond, it is either blond or brown.

This means, among other things, that the concepts of _and_ and _or_ are also dual --- an idea which was put forward in the 19th century by the mathematician Augustus De Morgan and is henceforth known as _De Morgan duality_, and which is a predecessor to the modern idea of duality in category theory, that we examined before.

![Coproduct and product](../02_category/demorgan_duality.svg)

The duality of $\land$ and $\lor$ can be seen in the two formulas that are most often associated with De Morgan which are known as De Morgan laws (although De Morgan didn't actually discover those (they were previously formulated, by William of Ockham (of "Ockham's razor" fame, among other people)).

$\neg(A \wedge B) = \neg{A} \vee \neg{B}$

$\neg(A \vee B) = \neg{A} \wedge \neg{B}$

You can read the second formula as, for example, if my hair is not blond _or_ brown, this means that my hair is not blond _and_ my hair is not brown, and vice versa (the connection works both ways)

Now we will go through the formulas and we will try to show that they are actually a simple corollary of the duality between _and_ and _or_

Let's say we want to find the statement that is opposite of "blond _or_ brown".

$A \vee B$

The first thing we want to do is, to replace the statements that constitute it with their opposites, which would make the statement "not blond _or_ not brown"

$\neg{A} \vee \neg{B}$

However, this statement is clearly not the opposite of "blond _or_ brown"(saying that my hair is not blond _or_ not brown does in fact allow it to be blond and also allows for it to be brown, it just doesn't allow it to be both of these things).

So what have we missed? Simple: we replaced the propositions with their opposites, but we didn't replace the _operator_ that connects them --- it is still _or_ for both propositions. So we must replace it with _or_ converse. As we said earlier, and as you can see by analyzing this example, this operator is _and_ So the formula becomes "not blond _and_ not brown".

$\neg{A} \wedge \neg{B}$

Saying that this formula is the opposite of "blond and brown" --- is the same thing as saying that it is equivalent to its negation, which is precisely what the second De Morgan law says.

$\neg(A \vee B) = \neg{A} \wedge \neg{B}$

And if we "flip" this whole formula (we can do that without changing the signs of the individual propositions, as it is valid for all propositions) we get the first law.

$\neg(A \wedge B) = \neg{A} \vee \neg{B}$

This probably provokes a lot of questions and we have a whole chapter about logic to address those. But before we get to it, we have to see what categories (and sets) are.

<!--
{%endif%}
-->


# Defining the rest of set theory using functions

So far in the book, we saw some amazing ways of defining set-theoretic constructs without looking at the set elements and by only using functions and external diagrams.

In the first chapter, we defined functions and functional composition with this diagram.

![Functional composition](../02_category/functions_compose_sets.svg)

And now, we also defined products and sums.

![Coproduct and product](../02_category/coproduct_product_duality.svg)

What's even more amazing, is that we can define _all of set-theory_, based just on the concept of functions, as discovered by the category theory pioneer Francis William Lawvere.

## Defining set elements using functions

Traditionally, everything in set theory is defined in terms of two things: _sets_ and _elements_, so, if we want to define it using _sets_ and _functions_, we must define the concept of a _set element_ in terms of functions.

To do so, we will use the singleton set.

![The singleton set](../02_category/elements_singleton.svg)

OK, let's start by taking a random set which we want to describe.

![A set of three elements](../02_category/elements_set.svg)

And let's examine the functions from the singleton set, to that random set.

![Functions from the singleton set](../02_category/elements_singleton_functions.svg)

It's easy to see that there would be exactly one function for each element of the set i.e. that each element of any set $X$ is isomorphic to a function $$1 \to X$$ (where $$1$$ means the singleton set).

So, we can say that what we call "elements" of a set are the functions from the singleton set to it.

## Defining the singleton set using functions

Now, after coming up with a definition of a set _element_, based on functions, we can try to draw the elements of our set as an external diagram.

![Functions from the singleton set](../02_category/elements_singleton_functions_partly_external.svg)

However, our diagram is not yet fully external, as it depends on the idea of the singleton set, i.e. the set with one _element_. Furthermore, this makes the whole definition circular, as we cannot define the concept of a one-element set, without the concept of element.

To avoid these difficulties, we devise a way to define the singleton set, using just functions. We do it in the same way that we did for products and sums - by using a unique property that the singleton set has. In particular, there is exactly one function from any other set to the singleton set i.e. if $1$ is the singleton set, then we have exactly one function $X \to 1$ for all objects $$X$$ i.e. $\forall  X  \exists!  (X \to 1)$ (where $\exists!$ means "Exists unique").

![Terminal object](../02_category/terminal_object_internal.svg)

It turns out that this property defines the singleton set uniquely i.e. there is no other set that has it, other than the sets that are isomorphic to the singleton set. This is simply because, if there are two sets that have it, those two sets would also have unique functions between _themselves_ so they would be isomorphic to one another. More formally, if we have two sets $X$ and $Y$ such that $\exists!X \to 1 \land \exists!Y \to 1$ and they both hold this property ("exactly one function from any other set to this set") then we also have $X \cong Y$.

![Terminal object](../02_category/terminal_object_internal_isomorphisms.svg)

And because there is no other set, other than the singleton set that has this property, we can use it as a definition of the singleton set and say that if we have $\forall  X  \exists!  X \to 1$, then $1$ is the singleton set.

![Terminal object](../02_category/terminal_object.svg)

With this, we acquire a fully external definition (up to an isomorphism) of the singleton set, and thus a definition of a set element --- the elements of a given set are just the functions from the singleton set to that set.

![Functions from the singleton set](../02_category/elements_external.svg)

Note that from this property it follows that the singleton set has exactly one element, which confirms that our definition is correct.

![Functions from the singleton set](../02_category/singleton_elements_external.svg)

**Task 2:** Why exactly does it follow (check the definition)?

## Defining the empty set using functions

The empty set is, of course, the set that has no elements, but how would we say this without referring to elements?

In the previous chapter, we noted an interesting property of the empty set:

> there is a unique function from the empty set to any other set.

And, again, since the empty set is the only set that has this property, we can reverse the above statement and use it as a definition: 

> the empty set is the set such that there exists a function from it to any other set.

*Task 3:* why is the functions to the empty set unique?

![Initial object](../02_category/initial_object.svg)

Observant readers will notice the similarities between the diagrams depicting the initial and terminal object (yes the two concepts are, of course, dual of each other).

![Initial terminal duality](../02_category/initial_terminal_duality.svg)

Some _even more_ observant readers (folks, keep it down please, you are _too observant_) may also notice the similarities between the product/coproduct diagrams and the initial/terminal object diagrams.

![Coproduct and product](../02_category/coproduct_product_duality.svg)

The similarity of the diagrams, is due to a similar general approach of defining things --- in both cases we find the property that makes a given concept useful and then define the concept so it has this property*.

## Functional application

After seeing the functional definition of set elements, we might be inclined to ask the following: If elements are represented by functions, then how do you _apply_ a given function to an element of a set, (and retrieve an element of another set)?

The answer is surprisingly simple --- _selecting_ an element from a set is the same as constructing a function from the singleton set to that element.

![Functional application - internal diagram](../02_category/application_internal.svg)

And then _applying_ a function to an element is the same as _composing_ the element function, with the function we want to apply.

![Functional application - external diagram](../02_category/application_external.svg)

The result is the function that represents the element returned by the applied function.

## Conclusion

This was a taste of Lawvere's Elementary Theory of the Category of Sets (ETCS) which constitutes a rigorous definition of set theory (equivalent to ZFC set theory) using only the concept of a function. 

We can cover this theory in it's entirety, listing all axioms that are needed, but for now it is probably more important to understand why do we need in the first place? 

The short answer: because it is more general than the traditional definition, this new definition also applies to objects that are not exactly sets but are _like_ sets in some respects.

You may say that they apply to entirely different _categories of objects_ (nudge, nudge).

# Categories brierly

Maybe it is about time to see what a category is. Here is a short definition: a category consists of objects (an example of which are sets) and morphisms that go from one object to another (which behave as functions) and that are composable. We can say a lot more about categories, and even present a formal definition, but for now, it is sufficient for you to remember that sets are one example of a category and that categorical objects are like sets, except that we don't _see_ their elements i.e. category-theoretic notions are captured by the external diagrams, while strictly set-theoretic notions can be captured by internal ones.

![Category theory and set theory compared](../02_category/set_category.svg)

When we are within the realm of sets, we can view each set as a collection of individual elements. In category theory, we don't have such a notion. However, taking this notion away allows us to define concepts such as the sum and product sets in a whole different and more general way. Plus we always have a way to "go back" to set theory, using the tricks from the last section.

| Category Theory       | Set theory         | Programming Languages |
| --------------------- | ------------------ | --------------------- |
| Category              | **N/A**            | **N/A**               |
| Objects and Morphisms | Sets and Functions | Classes and methods   |
| **N/A**               | Element            | Object                |

Notice the somehow weird, (but actually completely logical) symmetry (or perhaps "reverse symmetry") between the world as viewed through the lenses of set theory, and the way it is viewed through the lens of category theory:

| Category Theory       | Set theory         |
| --------------------- | ------------------ |
| Category              | **N/A**            |
| Objects and Morphisms | Sets and functions |
| **N/A**               | Element            |

By switching to external diagrams, we lose sight of the particular (the elements of our sets), but we gain the ability to zoom out and see the whole universe where we have been previously trapped. In the same way that the whole realm of sets can be thought of as one category, a programming language can also be thought of as a category. The concept of a category allows us to find and analyze similarities between these and other structures.

**NB:** The word "Object" is used in both programming languages and in category theory, but has completely different meanings. A categorical object is equivalent to a _type_ or a _class_ in programming language theory.

## Sets VS Categories

One remark before we continue: in the last section, we may have made it seem like category theory and set theory are somehow competing with each other. Perhaps that notion would be somewhat correct if category and set theory were meant to describe _concrete_ phenomena, in the way that the theory of relativity and the theory of quantum mechanics are both supposed to explain the physical world. Concrete theories are conceived mainly as _descriptions_ of the world, and as such it makes sense for them to be connected in some sort of hierarchy.

In contrast, abstract theories, like category theory and set theory, are more like _languages_ for expressing such descriptions --- they still can be connected, and _are_ connected in more than one way, but there is no inherent hierarchical relationship between the two and therefore arguing over which of the two is more basic, or more general, is just a chicken-and-egg problem, as you will see in the next chapter.

# Categories (again)

> "...deal with all elements of a set by ignoring them and working with the set's definition." --- Dijkstra (from "On the cruelty of really teaching computing science")

All category theory books, including this one, start by talking about set theory. Looking back, I really don't know why this is the case --- books that focus on a given subject usually don't start off by introducing an _entirely different subject_, (before even starting to talk about the main one). Perhaps the set-first approach _is_ the best way to introduce people to categories. Or perhaps using sets to introduce categories is one of those things that people do just because everyone else does it. But, one thing is for certain --- we don't _need_ to study sets in order to understand categories. So now I would like to start over and talk about categories as a foundational concept. So let's pretend like this is a new book (I wonder if I can dedicate this to a different person).

A category is a collection of objects (things) where the "things" can be anything you want. Consider, for example, these ~~colorful~~ gray balls:

![Balls](../02_category/elements.svg)

A category consists of a collection of objects as well as some arrows connecting objects to one another. We call the arrows _morphisms_ (for now you can think of them as functions).

![A category](../02_category/category.svg)

Wait a minute, we said that all sets form a category, but at the same time, any one set can be seen as a category in its own right (just one which has no morphisms). This is true and very characteristic of category theory --- one structure can be examined from many different angles and may play many different roles, often in a recursive fashion.

This particular equivalence (a set as a category with no morphisms) is, however, rarely useful. Not because it's incorrect in any way, but rather because category theory is _all about the morphisms_ --- if the _arrows_ in set theory are nothing but a connection between the sets that serve as their source and a destination, in category theory it's the _objects_ that are nothing but a source and destination for the arrows that connect them to other objects. This is why, in the diagram above, the arrows, and not the objects, are colored: if you ask me, the category of sets should really be called _the category of functions_.

Speaking of which, note that objects in a category can be connected by multiple arrows and that having the same source and target sets does not in any way make arrows equivalent.

![Two objects connected with multiple arrows](../02_category/arrows.svg)

Why that is true is pretty obvious if we go back to set theory for a second (OK, maybe we really _have_ to do it from time to time). There are, for example, an infinite number of functions that go from number to boolean, and the fact that they have the same input type and the same output type (or the same _type signature_, as we like to say) does not in any way make them equivalent to one another.

![Two sets connected with multiple functions](../02_category/set_arrows.svg)

There are some types of categories that have only one morphism between two objects (in each direction), but we will talk about them later.

## Composition

The most important requirement for a structure to be called a category is that _two morphisms can make a third_, or in other words, that morphisms are _composable_. 

Given three objects and two successive arrows with between them, we can make a third arrow (in set theory, it is equivalent to the consecutive application of the first two).

![Composition of morphisms](../02_category/composition.svg)

Formally, this requirement says that there should exist an _operation_, usually denoted with the symbol $\circ$ such that for each pair of morphisms $g: A \to B$ and $f: B \to C$, there exists a morphism $(f \circ g): A \to C$.

![Composition of morphisms in the context of additional morphism](../02_category/composition_arrows.svg)

If you remember, in set theory, we picked functions, as opposed to the other types of relations because they are composable. Here we just invent the concept of a morphism and define it to be composable (in the same way as we invented the (co)products and later the empty and singleton set). Let's see where this definition gets us.

**NB:** Note, that functional composition is read from right to left. e.g. applying $g$ and then applying $f$ is written $f \circ g$ and not the other way around. (You can think of it as a shortcut to $f(g(a))$). Some may find it useful to pronounce "\circ" as "after", e.g. $f \;\text{after}\; $g.

## The law of identity

To have numbers, you have to have a zero. The zero of category theory is what we call the "identity morphism" for each object. In short, this is a morphism that doesn't do anything.

![The identity morphism (but can also be any other morphism)](../02_category/identity.svg)

It's important to mark this morphism because there can be (let's again add this very important, and by now probably also very boring, reminder) many morphisms that go from one object to the same object. For example, in the category of sets, we deal with a multitude of functions that have the set of numbers as source and target, such as $\operatorname{negate}$, $\operatorname{square}$, $\operatorname{add\ one}$, and are not at all the identity morphism.

A structure must have an identity morphism for each object in order for it to be called a category --- this is known as the _law of identity_.

**Task 4:** What is the identity morphism in the category of sets?

## The law of associativity

Composition is special not only because you can take any two morphisms with appropriate signatures and make a third, but because you can do so indefinitely, i.e. for each $n$ successive arrows, each of which has as a source object the target object of the previous, we can draw one (exactly one) arrow that is equivalent to the consecutive application of all $n$ arrows.

![Composition of morphisms with many objects](../02_category/composition_n_objects.svg)

If we carefully review the definition above, we can see that it can be reduced to multiple applications of the following formula: given 3 objects and 2 morphisms between them $f$ $g$ $h$, combining $h$ and $g$ and then combining the end result with $f$ should be the same as combining $h$ to the result of $g$ and $f$ (or simply $(h \circ g) \circ f = h \circ (g \circ f)$).

This formula can be expressed using the following diagram, which would only commute if the formula is true (given that all our category-theoretic diagrams are commutative, we can say, in such cases, that the formula and the diagram are equivalent).

![Composition of morphisms with many objects](../02_category/composition_associativity.svg)

This formula (and the diagram) is the definition of a property called *associativity*. Being associative is required for functional composition to really be called functional composition (and thus for a category to really be called a category). It is also required for our diagrams to work, as diagrams can only represent associative structures (imagine if the diagram above would not commute, that would be super weird).

Associativity is not just about diagrams. For example, when we express relations using formulas, associativity just means that brackets don't matter in our formulas (as evidenced by the definition $(h \circ g) \circ f = h \circ (g \circ f)$).

And it is not only about categories either, it is a property of many other operations on other types of objects as well e.g. if we look at numbers, we can see that the multiplication operation is associative e.g. $(1 \times 2) \times 3 = 1 \times (2 \times 3)$. While division is not $(1 / 2) / 3 \neq 1 / (2 / 3)$.

## Commuting diagrams

The diagrams above use colours to illustrate the fact that the green morphism is equivalent to the other two (and not just some unrelated morphism), but in practice this notation is a little redundant, as the *only* reason to draw diagrams in the first place is to represent paths that are equivalent to each other. All other paths would just belong in different diagrams.

![Composition of morphisms - a commuting diagram](../02_category/composition_commuting_diagram.svg)

As we mentioned briefly in the last chapter, all diagrams that are like that (ones in which any two paths between two objects are equivalent to one another) are called _commutative diagrams_ (or diagrams that _commute_). All diagrams in this book (except the incorrect ones, nudge nudge) commute.

More formally, a commuting diagram is a diagram in which given two objects $a$ and $b$ and two sequences of morphisms between those two objects, we can say that those sequences are equivalent.

The diagram above is one of the simplest commuting diagrams.

**NB:** Despite the fact that all diagrams in books commute, in general, **not all diagrams commute**. That is, there are many morphisms with the same type signature that are not equivalent to one another.

## Summary

For future reference, let's restate what a category is:

A category is a collection of _objects_ (we can think of them as _points_) and _morphisms_ (or _arrows_) that go from one object to another, where:
- Each object has to have the identity morphism.
- There should be a way to compose two morphisms with an appropriate type signature into a third one, in a way that is _associative_.

This is it.

# Addendum: Why are categories like that?

_Why_ are categories defined by those two laws and not some other two (or one, three, four etc.). laws? From one standpoint, the answer to that seems obvious --- we study categories because they _work_. I mean, look at how many applications there are... But at the same time, category theory is an abstract theory, so everything about it is kinda arbitrary: you can remove a law --- and you get another theory that looks similar to category theory (although it might actually turn out to be quite different in practice). Or you can add one more law and get yet another theory (there are indeed such laws and such theories, and we will cover them later). So if this specific set of laws works better than any other, then this fact demands an explanation. Not a _mathematical_ explanation (e.g. we cannot in any way _prove_ that this theory is better than some other one), but an explanation nevertheless. What follows is _my_ attempt to provide such an explanation, regarding the laws of _identity_ and _associativity_.

# Identity and isomorphisms

The reason the identity law is required is by far the more obvious one. Why do we need to have a morphism that does nothing? It's because morphisms are the basic building blocks of our language, we need the identity morphism to be able to speak properly. For example, once we have the concept of identity morphism defined, we can define a category-theoretic definition of an _isomorphism_, based on it (which is important, because the concept of an isomorphism is very important for category theory).

As we said in the previous chapter, an isomorphism between two objects ($A$ and $B$) consists of two morphisms --- ($A → B$ and $B → A$) such that their compositions are equivalent to the identity functions of the respective objects. Formally, objects $A$ and $B$ are isomorphic if there exist morphisms $f: A → B$ and $g: B → A$ such that $f \circ g = ID_{B}$ and $g \circ f = ID_{A}$.

And here is the same thing expressed with a commuting diagram.

![Isomorphism](../02_category/isomorphism.svg)

Like the previous one, the diagram expresses the same (simple) fact as the formula, namely that going from one object ($A$ or $B$) to the other and then back again to the starting object is the same as applying the identity morphism i.e. doing nothing.

# Associativity and reductionism

> If, in some cataclysm, all of scientific knowledge were to be destroyed, and only one sentence passed on to the next generations of creatures, what statement would contain the most information in the fewest words? I believe it is the atomic hypothesis (or the atomic fact, or whatever you wish to call it) that all things are made of atoms—little particles that move around in perpetual motion, attracting each other when they are a little distance apart, but repelling upon being squeezed into one another. In that one sentence, you will see, there is an enormous amount of information about the world, if just a little imagination and thinking are applied. --- Richard Feynman

Associativity --- what does it mean and why is it there? In order to tackle this question, we must first talk about another concept --- the concept of _reductionism_:

Reductionism is the idea that the behaviour of complex phenomena can be understood in terms of a number of _simpler_ and more fundamental phenomena. In other words, that things keep getting simpler and simpler as they get "smaller" (or when they are viewed from a lower level). An example of reductionism is the idea that the behaviour of matter can be understood completely by studying the behaviours of its constituents i.e. atoms (the word means "undividable").

Whether the reductionist view is _universally valid_, i.e. whether it is possible to devise a _theory of everything_ that describes the whole universe with a set of very simple laws, is a question over which we can argue until that universe's inevitable collapse. What is certain, though, is that _reductionism underpins all our understanding_, especially when it comes to science and mathematics --- each scientific discipline is based on a set of simple _fundaments_ (e.g. elementary particles in particle physics, chemical elements in chemistry etc.) on which it builds on its much more complex theories.

## Commutativity

So, if this principle is so important, it would be beneficial to be able to formalize it (i.e. to translate it into mathematical language), and this is what we will try to do now. One way to state the principle of reductionism is to say that _each thing is nothing but a sum of its parts_ i.e. if we combine the same set of parts, we always get the same result. To formalize that, we get a set of objects (balls) and a way to combine them (which we will denote with a dot).

So, if we have a given "recipe", for example

![Commutativity](../02_category/commutativity_1.svg)

Then, we would also have

![Commutativity](../02_category/commutativity_2.svg)

Or quite simply

![Commutativity](../02_category/commutativity_formula.svg)

Incidentally, this is the definition of a mathematical law called _commutativity_.

A simple context where this law applies --- the natural numbers are commutative under the operation of addiction, e.g. 1 + 2 = 2 + 1 (we will learn more about this in the chapter on groups).

**Task 5:** If our objects are sets, what set operations can play the part of the dot in this example (i.e. which ones are commutative)?

## Associativity

Sometimes we observe phenomena that still can be represented as a combination of a given set of fundaments, but only when they are combined in a _specific_ way (as opposed to _any_ combination, as in commutative contexts) e.g. as any mechanic can confirm, a bicycle is indeed just the combination of wheels and frameset...

![bikes are not commutative](../02_category/commutativity_bike.svg)

...but that does not mean that every combination of the above parts constitutes a bicycle. For example, placing the front wheel of the bicycle on the rear end of the frame would result would not result in a working bicycle. And combining two wheels one with another is just not possible.

![bikes are not commutative](../02_category/commutativity_bike_2.svg)

And, to take a formal example, if function A can be combined with B to get C...

![functions are not commutative](../02_category/commutativity_functions.svg)

...would not automatically mean that B can be combined with A to get the same result

![functions are not commutative - 2](../02_category/commutativity_functions_2.svg)

Side note: composing any function with any other is only possible for functions that have the same set, both as source and target, but even then the end result would not always be the same.

![functions are sometimes commutative - 2](../02_category/commutativity_functions_3.svg)

Anyway, we determined that functional composition (as well as bike building) does not obey the law of commutativity i.e. not all functions (or bike parts) compose with all other ones. But still, we know that _some_ of them do, i.e. if you align the function signatures (or in the case of the bicycle if you use the proper parts in the proper places) they would come together seamlessly. So, the _order by which we combine the individual parts doesn't matter for the final outcome_ e.g. when we are assembling a bicycle, it doesn't matter if we attach the front wheel to the frame first, or the back wheel, the result will be the same.

![bikes are associative](../02_category/associativity_bike.svg)

Similarly, when combining functions, each pair of functions can, at any time, be replaced by the function that we get by combining them.

![A -> X . (X -> B . B -> C) = D,  (A -> X . X -> B) . B -> C = D](../02_category/associativity_function.svg)

In other words, all different ways of combining a given set of functions at the end converge in into one and the same result.

![A . (B . C) = D,  (A . B) . C = D](../02_category/associativity_function_tree.svg)

This fact is captured by a more restrictive version of commutativity, that we call _associativity_, which for functions, is usually formulated like this.

![A -> X . (X -> B . B -> C) = (A -> X . X -> B) . B -> C](../02_category/associativity_formula_function.svg)

Or more generally (for any operation).

![A . (B . C) = D,  (A . B) . C = D](../02_category/associativity_formula.svg)

This is the essence of associativity --- it gives us the ability to study complex phenomenon by zooming in on a part that you want to examine in a given moment, and looking at it in isolation.

Note that the operator we defined only allows for combining things in one dimension (you can attach a thing left and right, but not up or down). Later we will learn about an extension of the concept of a category theory (called monoidal category) that "supports" working in 2 dimensions.

**Task 6:** Actually, in this chapter, we already defined a case of 2-dimentional composition, only we didn't *say* it is  2-dimentional composition. Did you see it?

<!--
{% if site.distribution == 'print'%}
-->

## Associativity and commutativity

We said that associativity is a more restricted version of commutativity. This is true in a formal way, as we show here. By now, you might realize that a composition operator for morphisms in a given category (the thing we denote by the dot) is itself a morphism, that accepts a pair of morphisms and returns yet another morphism (so $$A \times B \to C$$).

Given a composition operator for a category and one morphism from that same category (in this case the green ball), create two more morphisms (which we call the "curried" morphisms (more in the next chapter)) ($$A \to C$$ and $$B \to C$$) by just fixing the second or the first argument of the operator, correspondingly i.e. a morphism that attaches the green ball at the "front" of the function that we have as an argument (produces its source) and one that attaches it at the "end" (accepting its target as a source).

![(A X B) -> C) = A -> B -> C](../02_category/associativity_commutativity.svg)

Now, take two such morphisms, with different directions and different objects and ask yourself: under what conditions would those two morphisms commute i.e. when would that formula be satisfied?

![(A X B) -> C) = A -> B -> C](../02_category/associativity_commutativity_2.svg)

Expanding the formula gives us the answer: they commute when the original dot operator is associative.

![(A X B) -> C) = A -> B -> C](../02_category/associativity_commutativity_3.svg)

Thus, we established a connection between associativity and commutativity.

<!--
{%endif%}
-->


<!--
{% if site.distribution == 'print' %}
-->

Answers
===

---

**Task 1:** Why is this called a product? Hint: How many elements does it have?

**Solution:**
The Cartesian product is called a "product" because the number of elements in $A × B$ equals the **product** of the number of elements in $A$ and $B$ e.g. if $A$ has 2 elements and $B$ has 3 elements, then $A × B$ has 2 × 3 = 6 elements

---

**Task 2:** Why exactly does it follow [that the singleton set has exactly one element]?

There is exactly one function from any set to the singleton set, including the singleton set itself.

So, there is exactly one function from $1 \to 1$. But functions $1 \to X$ correspond to elements of $X$, 1 has exactly one element.

---

**Task 3** Why is the function to the empty set unique?

As we established, there is exactly one such function, the peculiar "empty function".

---

**Task 4:** What is the identity morphism in the category of sets?

In the category of sets, the identity morphism for a set A is the *identity function* $id_A: A → A$ which maps each element to itself. Check the laws!

---

**Task 5:** If our objects are sets, what set operations can play the part of the dot in this example (i.e. which ones are commutative)?

Commutative set operations: 

- *Set union*: the set of elements in $A$ or $B$ (or both): ${1,2} ∪ {2,3} = {1,2,3} = {2,3} ∪ {1,2}$

- *Set intersection* the set of elements in both $A$ and $B$: ${1,2} ∩ {2,3} = {2} = {2,3} ∩ {1,2}$

Non-commutative operations:
- Set difference ($A - B ≠ B - A$)

---

**Task 6**: Actually, in this chapter, we already defined a case of 2-dimensional composition, only we didn't *say* it is 2-dimensional composition. Did you see it?

Yes we did --- products.

a function $f: A \to B $, can be composed with a function $g : B \to C$, to to obtain $g \circ f : A \to C$ (functional composition).

But, $f: A \to B $ can also be compose with a function $f': A' \to B'$ (or any other signature, really), to obtain $f \times f': A\times A' \to B \times B'$$!

<!--
{%endif%}
-->

