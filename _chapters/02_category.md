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

![Product parts](product_parts.svg)

It is denoted $B \times Y$ and it comes equipped with two functions for retrieving the $b$ and the $y$ from each $(b, y)$.

![Product](product.svg)

**Question**: Why is this called a product? Hint: How many elements does it have?

{% if site.distribution == 'print'%}

Interlude - coordinate systems
---

The concept of the Cartesian product was first defined by the mathematician and philosopher René Descartes as a basis for the *Cartesian coordinate system*. Although it does not look like it, both concepts are named after him (or after the Latinized version of his name.)

You probably know how the Cartesian coordinate system works, but an equally interesting question, of which you probably haven't thought about, is how we can define it using sets and functions. 

An Cartesian coordinate system consists of two perpendicular lines, situated on an *Euclidian plane* and some kind of mapping that resembles a function, connecting any point in these two lines to a number, representing the distance between the point that is being mapped and the lines' point of overlap (which is mapped to the number $0$).

![Cartesian coordinates](coordinates_x_y.svg)

Using this construct (as well as the concept of a Cartesian product), we can describe not only the points on the lines, but any point on the Euclidian plane. We do that by measuring the distance between the point and those two lines.

![Cartesian coordinates](coordinates.svg)

And since the point is the main primitive of Euclidian geometry, the coordinate system allows us to also describe all kinds of geometric figures such as this triangle (which is described using products of products.)

![Cartesian coordinates](coordinates_triangle.svg)

So we can say that the Cartesian coordinate system is some kind of function-like mapping between all kinds of sets of (products of) *products of numbers* and *geometric figures* that correspond to these numbers, using which we can derive some properties of the figures using the numbers (for example, using the products in the example below, we can compute that the triangle that they represent has base of $6$ units and height of $5$ units. 

![Cartesian coordinates](coordinates_isomorphism.svg)

What's even more interesting is that this mapping is one-to-one, which makes the two realms *isomorphic* (traditionally we say that the point is *completely* described by the coordinates, which is the same thing.)

Our effort to represent Cartesian coordinates with sets is satisfactory, but incomplete, as we still don't know what these function-like things that connect points to numbers are - they make intuitive sense as functions, and that they exhibit all relevant properties (many-to-one mapping, or one-to-one in this case), however, we have only covered functions as mappings between sets and in this case, even if we can think of the coordinate system as a set (of points and figures), geometrical figures are definitely not a set, as it has a lot of additional things going on (or additional *structure*, as a category theorist would say.)

So defining this mapping formally, would require us to also formalize both geometry and algebra, and moreover to do so in a way in which they are compatible with one another. This is some of the ambitions of category theory and this is what we will attempt to do later in this book (even if not for this exact example.) 

But before we continue with that, let's see some other neat uses of products.

{%endif%}

Products as Objects
---

In the previous chapter we established the correspondence of various concepts in programming languages and set theory sets resemble types, functions resemble methods/subroutines. This picture is made complete with products, that are like stripped-down *classes* (also called *records* or *structs*) - the sets that form the product correspond to the class's *properties*  (also called *members*) and the functions for accessing them are like what programmers call *getter methods*.

The famous example of object-oriented programming of a `Person` class with `name` and `age` fields is nothing more than a product of the set of strings, and the sets of numbers. Objects with more than two values can be expressed as products the composites of which are themselves products.

Using Products to Define Numeric Operations
---

Products can also be used for expressing functions that take more than one argument. For example, "plus" and "minus", are functions from the set of products of two numbers to the set of numbers. (So, $+: \mathbb{Z} \times \mathbb{Z} → \mathbb{Z}$.) Of course, we cannot draw the function itself, even partly, because it has too much arrows and would look messy.

Actually, here it is.

![The plus function](plus.svg)

Note that there are languages, such as the ones from the ML family, where the *pair* data structure (also called a *tuple*) is a first-level construct, and multi-argument functions are really implemented in this way. 

<!--TODO: there are also languages (Haskell) where multi argument functions are implemented using currying -->

Defining products in terms of sets 
---

When we said that the product is a set of *ordered* pairs (formally speaking $A \times B ≠ B \times A$). But we didn't define how ordered pairs formally. Note that the criteria for order prevents us from symbolizing the pair with just a set containing the two elements, as while some mathematical operations (such as addition) indeed don't care about order, others (such as subtraction) do. And in programming, we have the ability to assign names to each member of an object, which accomplishes the same purpose as ordering does for pairs.

![A pair](pair.svg)

So does that mean that we have to define ordered pair as a "primitive" type, like we defined sets in order to use them? That's possible, but there is another approach if we can define a construct that is *isomorphic* to the ordered pair, using only sets, we can use that construct instead of them. And mathematicians had come up with multiple ingenious ways to do that. Here is the first one, which was discovered by Norbert Wiener in 1914. Note the smart use of the fact that the empty set is unique. 

![A pair, represented by sets](pair_as_set_2.svg)

The next one was discovered in the same year by Felix Hausdorff. In order to use that one, we just have to define $1$, and $2$ first.

![A pair, represented by sets](pair_as_set_3.svg)

Discovered in 1921 Kazimierz Kuratowski, this one uses just the component of the pair.

![A pair, represented by sets](pair_as_set_1.svg)

Defining products in terms of functions 
---

In the product definitions presented in the previous section worked by *zooming in* into the individual elements of the product and seeing what they can be made of. I call this the *low-level* approach. This time we will try to do the opposite - be as oblivious to the contents of our sets as possible i.e. instead of zooming in we will *zoom out*, and try to define the product in terms of functions and functional composition. Effectively we will be working at a *higher level* of abstraction.

How can we define products in terms of functions? Let's begin with an external diagram, showing the definition of the product.

![Product, external diagram](product_external.svg)

This diagram already contains the first piece of the puzzle: if we have a set $G$ which is the product of sets $Y$ and $B$, then we should also have functions which give us back the elements of the product, so $G → Y$ and $G → B$. 

This definition is not complete, however, because the product of $G$ and $B$ is not the only set for which such functions can be defined. For example, a set of triples of $Y \times B \times R$ for any random element $R$ also qualifies. And if there is a function from $G$ to $B$ then the set $G$ itself meets our condition for being the product, because it is connected to $B$ and to itself. And there can be many other such objects.

![Product, external diagram](product_candidates.svg)

So how do we set apart the true product from all those "impostor" products? Simple - by using the observation that *they all can be converted to it*, This observation is true, because. The pair is nothing more than the sum of its elements. And you can always have a function that converts a more complex structure, to a simpler one (we saw an example of this when we covered the functions that convert subsets to their supersets). 

More formally, if we suppose that there is a set $I$ that can serve as an impostor product of sets $B$ and $Y$ i.e. that $I$ is such that there exist two functions, which we will call $b: I → B$ and $y: I → Y$ that allow us to derive elements $B$ and $Y$ from it, then there must also exist a function with the type signature $I → B \times Y$ that converts the impostor from the true product. We can be sure that this function exists because $I$ (being an impostor) would contain some extra information other than the information contained in the true pair. So given we have functions $b: I → B$ and $y: I → Y$ that function would be $(i) → b(i) \times y(i)$ for each element $i:I$.

Therefore, we can define the product of $B$ and $Y$ as a set that has functions for deriving $B$ and $Y$, but, more importantly, all other sets that have such functions can be converted to it. The second requirement would mean that 

![Product, external diagram](products_morphisms.svg)

In category theory, this type of property that a given object might possess (participating in a structure such that all similar objects can be converted to/from it) is called a *universal property*. I don't want to go into more detail, as it is a bit early for that now (after all we haven't even defined what category theory is). One thing that I like to point out is that this definition (as, by the way, all the previous ones) does not rule out the sets which are isomorphic to the product - when we represents things using universal properties, an isomorphism is the same as equality.

Sums
===

We will now study a construct that is pretty similar to the product but at the same time is very different. Similar because, like the product, it is a relation between two sets which allows you to unite them into one, without erasing their structure. But different as it encodes a quite different type of relation - a product encodes an *and*  relation between two sets, while the sum encodes an *or* relation. 

A sum of two sets $B$ and $Y$, denoted $B + Y$ is a set that contains *all elements from the first set combined with all elements from the second one*. 

![Sum or coproduct](coproduct.svg)

We can immediately see the connection with the *or* logical structure: For example, because a parent is either a mother or a father of a child, the set of all parents is the sum of the set of mothers and the set of fathers, or $P = M + F$.


Defining Sums in Terms of Sets
---

As with the product, representing sums in terms of sets is not so straightforward. This time the complication comes from the fact that when a given object is an element of both sets, then it appears in the sum twice. This is why this type of sum of two sets is also called a *disjoint union*. Because of this, if two sets can have the same element as a member, then their sum will have that element twice which is not permitted, because a set cannot contain the same element twice. As with the product, the solution is to put some extra structure.

![A member of a coproduct](coproduct_member.svg)

And as with the product, there is a low-level way to express a sum using sets alone. Incidentally, we can use pairs.

![A member of a coproduct, examined](coproduct_member_set.svg)

But again, this distinction is only relevant only when the two sets have common elements. If they don't then just uniting the two sets is sufficient to represent their sum.

Defining sums in terms of functions
---

As you might already suspect, the interesting part is expressing the sum of two sets using functions. To do that we have to go back to the conceptual part of the definition. We said that sums express an *or* relation between two things. 

A property of every *or* relation is that if something is an $A$ that something is also an $A \vee B$ , and same for $B$ (The $\vee$ symbol means *or* by the way). For example, if my hair is *brown*, then my hair is also *either blond or brown*. This is what *or* means, right? This property can be expressed as a function, two functions actually - one for each set that takes part in the sum relation (for example, if parents are either mothers or fathers, then there surely exist functions $mothers → parents$ and $fathers → parents$.)

![Coproduct, external diagram](coproduct_external.svg)

As you might have already noticed, this definition is pretty similar to the definition of the product from the previous section. And the similarities don't end here. As with products, we have sets that can be thought of as *impostor* sums - ones for which these functions exist, but which also contain additional information.

![Coproduct, external diagram](coproduct_candidates.svg)

All these sets express relationships which are more vague than the simple sum, and therefore given such a set (an "impostor" set as we called it earlier), there would exist a function that would distinguish it from the true sum. The only difference is that, unlike with the products, this time this function goes *from the sum* to the impostor.

![Coproduct, external diagram](coproduct_morphisms.svg)


Categorical Duality 
===

The concepts of product and sum might already look similar in a way when we view them through their internal diagrams, but once we zoom out to the external view, and we draw the two concepts external diagrams, this similarity is quickly made precise.

I use "diagrams" in plural, but actually the two concepts are captured *by one and the same diagram*, the only difference between the two being that their arrows are flipped - many-to-one relationships become one-to-many and the other way around.

![Coproduct and product](coproduct_product_duality.svg)

The universal properties that define the two construct are the same as well - if we have a sum $Y + B$, for each impostor sum, such as $Y + B + R$, there exist a trivial function $Y + B  \to Y + B + R$.

And, if you remember, with product the arrows go the other way around - the equivalent example for product would be the function $Y \times B \times R \to Y \times B $ 

This fact uncovers a deep connection between the concepts of the *product* and *sum*, which is not otherwise apparent - they are each other's opposites - *product* is the opposite of *sum* and *sum* is the opposite of *product*.

In category theory, concepts that have such a relationship are said to be *dual* to each other. So the  the concepts of *product* and *sum* are dual. This is why sum is known in a category-theoretic setting as *converse product*, or *coproduct* for short. This naming convention is used for all dual constructs in category theory.

{% if site.distribution == 'print'%}

Interlude - De Morgan duality
===

Now let's look at how the concepts of product and sum from the viewpoint of *logic*. We mentioned that:

- The *product* of two sets contains an element of the first one *and* one element of the second one.
- A *sum* of two sets contains an element of the first one *or* one element of the second one.

When we view those sets as propositions, we discover the concept of the *product* ($\times$) corresponds exactly to the *and* relation in logic (denoted $\land$.) From this viewpoint, the function $Y \times B \to Y$  can be viewed as instance of a logical rule of inference called *conjunction elimination* (also called *simplification*) stating that, $Y  \land B \to Y$, for example, if your hair is partly blond and partly brown, then it is partly blond.

By the same token, the concept of a *sum* ($+$) corresponds the *or* relation in logic (denoted $\lor$.) From this viewpoint, the function $Y  \to Y + B$  can be viewed as instance of a logical rule of inference called *disjunction introduction*, stating that, $Y  \to Y \lor B$ for example, if your hair is blond, it is either blond or brown.

This means, among other things, that the concepts of *and* and *or* are also dual - an idea which was put forward in the 19th century by the mathematician Augustus De Morgan and is henceforth known as *De Morgan duality*, and which is a predecessor to the modern idea of duality in category theory, that we examined before. 

This duality is subtly encoded in the logical symbols for *and* and *or* ($\land$ and $\lor$) - they are nothing but stylized-versions of the diagrams of products and coproducts.

![Coproduct and product](demorgan_duality.svg)

To understand, the connection, consider the two formulas which are most often associated with De Morgan which are known as De Morgan laws, although De Morgan didn't actually discover those (they were previously formulated, by William of Ockham (of "Ockham's razor" fame) among other people.

$\neg(A \wedge B) = \neg{A} \vee \neg{B}$

$\neg(A \vee B) = \neg{A} \wedge \neg{B}$

You can read the second formula as, for example, if my hair is not blond *or* brown, this means that my hair is not blond *and* my hair is not brown, and vice versa (the connection work both ways)

Now we will go through the formulas and we would try to show that they are actually a simple corollary of the duality between *and* and *or* 

Let's say we want to find the statement that is opposite of "blond *or* brown".

$A \vee B$ 

The first thing we want to do is, to replace the statements that constitute it with their opposites, which would make the statement "not blond *or* not brown"

$\neg{A} \vee \neg{B}$ 

However, this statement is clearly not the opposite of "blond *or* brown"(saying that my hair is not blond *or* not brown does in fact allow it to be blond and also allows for it to be brown, it just doesn't allow it to be both of these things.)

So what have we missed? Simple - although we replaced the propositions that constitute our proposition with their opposites, we didn't replace the operator that connects them - it is still *or* for both propositions. So we must replace it with *or* converse. As we said earlier, and as you can see by analyzing this example, this operator is *and* So the formula becomes "not blond *and* not brown".

$\neg{A} \wedge \neg{B}$ 

Saying that this formula is the opposite or "blond and brown" - is the same thing as saying that it is equivalent to it's negation, which is precisely what the second De Morgan formula says.

$\neg(A \vee B) = \neg{A} \wedge \neg{B}$

And if we "flip" this whole formula (we can do that without changing the signs of the individual propositions, as it is valid for all propositions) we get the first formula.

$\neg(A \wedge B) = \neg{A} \vee \neg{B}$

This probably provokes a lot of questions, but I won't get into more detail here, as we have a whole chapter on logic. But before we get to it, we have to see what categories are.

{% endif %}

Category Theory - brief definition
===

Maybe it is about time to see what a category is. We will start with a short definition - a category consists of objects (an example of which are sets) and morphisms that go from one object to another (which can be viewed as functions) and that should be composable. We can say a lot more about categories, and even present a formal definition, but for now it is sufficient for you to remember that sets are one example of a category and that categorical objects are like sets, except that we don't *see* their elements. Or to put it another way, category-theoretic notions are captured by the external diagrams, while strictly set-theoretic notions can be captured by internal ones.

![Category theory and set theory compared](set_category.svg)

When we are at the realm of sets we can view the set as a collection of individual elements. In category theory we don't have such notion, but we saw how taking this notion away allows us to define concepts such as the sum and product sets in a whole different and more general way. 

Still why would we want to restrict ourselves from looking at the individual elements? It is because, in this way we can relate this viewpoint to objects other than sets. We already discussed one such object - types in programming languages. Remember that we said that programming types (classes) are somewhat similar to sets, and programming methods are somewhat similar to functions between sets, but they are not exactly identical? A formal connection between the two can be made via category theory. 

| Category Theory | Set theory | Programming Languages |
| ---             | ---        | ---                   |
| Category        | N/A        | N/A                   |
| Objects and  Morphisms        | Sets and Functions   | Classes and methods |
| N/A             | Element    | Object                |

Category theory allows us to see the big picture when it comes to sets and similar structures - looking at the table, we cannot help but notice the somehow weird, (but actually completely logical) symmetry (or perhaps "reverse symmetry") between the world as viewed through the lenses of set theory, and the way it is viewed through the lens of category theory:

| Category Theory | Set theory | 
| ---             | ---        |
| Category        | **N/A**        | 
| Objects and  Morphisms        | Sets and functions |
| **N/A**             | Element    | 

By switching to external diagrams, we lose sight of the particular (the elements of our sets), but we have gained the ability to see the whole universe that we have been previously trapped in. Just as the whole realm of sets can be thought as one category, a programming language can also be thought as a category. The concept of a category allows us to find and analyze similarities between these and other structures.

**NB:** The word "Object" is used in both programming languages and in category theory, but for completely different things. The equivalent a categorical object is equivalent to a *type* or a *class* in programming language theory.

Sets VS Categories
---

One remark before we go: in the last paragraphs I sound as if I'm *comparing* categories and sets (and rooting for categories, in order to get more copies of my book sold) and I don't want you to get the wrong impression that the two concepts are somehow competing with one another. Perhaps that notion would be somewhat correct if category and set theory were meant to describe *concrete* phenomena, in the way that the theory of relativity and the theory of quantum mechanics in physics. Concrete theories are conceived mainly as *descriptions* of the world, and as such it makes sense for them to be connected to one another in some sort of hierarchy. Abstract theories, like category theory and set theory, on the other hand, are more like languages for expressing such descriptions - they still can be connected, and are connected in more than one way, but there is no inherent hierarchy between the two and therefore arguing over which of the two is more basic, or more general, is just a chicken-and-egg problem, as you would see in the next chapter.

Defining Categories (again)
===

> "...deal with all elements of a set by ignoring them and working with the set's definition." - Dijkstra

All category theory books (including this one) starts by talking about set theory. However looking back I really don't know why that is the case - most books that focus around a given subject don't usually start off by introducing an *entirely different subject* before even starting to talk about the main one, even if the two subjects are so related. 

Perhaps the set-first approach *is* the best way to introduce people to categories. Or perhaps using sets to introduce categories is just one of those things that people do because everyone else does it. But one thing is for certain - we don't need to study sets in order to understand categories. So now I would like to start over and talk about categories as a first concept. So pretend like it's a new book (I wonder if I can dedicate this to a different person.)

So. A category is a collection of objects (things) where the "things" can be anything you want. Consider, for example, these ~~colorful~~ gray balls:

![Balls](elements.svg)

A category consists of a collection of objects as well as some arrows connecting some of them to one another. We call the arrows, *morphisms*.

![A category](category.svg)

Wait a minute - we said that all sets form a category, but at the same time any one set can be seen as a category on its own right (just one which has no morphisms). This is true and an example of a phenomenon that is very characteristic of category theory - one structure can be examined from many different angles and may play many different roles, often in a recursive fashion.

This particular analogy (a set as a category with no morphisms) is, however, not very useful. Not because it's in any way incorrect, but because category theory is *all about the morphisms*. If in set theory arrows are nothing but a connection between a source and a destination, in category theory it's the *objects* that are nothing but a source and destination for the arrows that connect them to other objects. This is why, in the diagram above, the arrows, and not the objects, are colored: if you ask me, the category of sets should really be called *the category of functions*.

Speaking of which, note that objects in a category can be connected by multiple arrows and that arrows having the same source and target sets does not in any way make them equivalent (it does not actually mean that they would produce the same value).

![Two objects connected with multiple arrows](arrows.svg)

Why that is true is pretty obvious if we go back to set theory for a second.  (OK, maybe we really *have* to do it from time to time.) There are, for example, an infinite number of functions that go from number to boolean, and the fact that they have the same input type and the same output type (or the same *type signature*, as we like to say) does not in any way make them equivalent to one another.

![Two sets connected with multiple functions](set_arrows.svg)

There are some types of categories in which only one morphism between two objects is allowed (or one in each direction), but we will talk about them later.

Composition
---

One of the few or maybe even the only requirement for a structure to be called a category is that *two morphisms can make a third*, or in other words, that morphisms are *composable* - given two successive arrows with appropriate type signature, we can draw a third one that is equivalent to the consecutive application of the other two.

![Composition of morphisms](composition.svg)

Formally, this requirement says that there should exist an operation (denoted with the symbol $•$) such that for each two functions $g: A → B$ and $f: B → C$, there exists exactly one function $(f • g): A → C$. Again, note that this criteria is not met by just *any* morphism with this type signature. There is *exactly one* morphism that fits these criteria, and there may be some which don't.

![Composition of morphisms in the context of additional morphism](composition_arrows.svg)

**NB:** Note (if you haven't already) that functional composition is written from right to left. e.g. applying $g$ and then applying $f$ is written $f • g$ and not the other way around. (You can think of it as a shortcut to $f(g(a))$.)


Commuting diagrams
---

The diagram above, uses colors to illustrate the fact that the green morphism is equivalent to the other two (and not just some unrelated morphism), but in practice this notation is a little redundant - the only reason to draw diagrams in the first place is to represent paths that are equivalent to each other - all other paths just belong in different diagrams. 

![Composition of morphisms - a commuting diagram](composition_commuting_diagram.svg)

Diagrams that are like that (ones in which any two paths between two objects are equivalent to one another) are called *commutative diagrams* (or diagrams that *commute*). All diagrams in this book (except the wrong ones) commute.

The law of associativity
---

Functional composition is special not only because you can take any two morphisms with appropriate signatures and make a third, but because you can do so indefinitely, i.e. given $n$ successive arrows, each of which starts from the object that the other one finishes, we can draw one (exactly one) arrow that is equivalent to the consecutive application of all $n$ arrows.

![Composition of morphisms with many objects](composition_n_objects.svg)

But let's get back to the math. If we carefully review the definition above, we can see that it can be reduced to multiple applications of the following formula: given 3 objects and 2 morphisms between them $f$ $g$ $h$, combining $h$ and $g$ and then combining the end result with $f$ should be the same as combining $h$ to the result of $g$ and $f$ (or simply $(h • g) • f = h • (g • f)$). 

This formula can be expressed using the following diagram, which would only commute if the formula is true (given that all our category-theoretic diagrams commute, we can say, in such cases, that the formula and the diagram are equivalent.)

![Composition of morphisms with many objects](composition_associativity.svg)

This formula (and the diagram) is the definition of a property called $associativity$. Being associative is required for functional composition to really be called functional composition (and for a category to really be called category). It is also required for our diagrams to work, as diagrams can only represent associative structures (imagine if the diagram above does not commute - it would be super weird.)

Associativity is not just about diagrams. For example, when we express relations using formulas, associativity just means that brackets don't matter in our formulas (as evidenced by the definition $(h • g) • f = h • (g • f)$). 

And it is not only about categories either, it is a property of many other operations on other types of objects as well e.g. if we look at numbers, we can see that the multiplication operation is associative e.g. $(1 \times 2) \times 3 = 1 \times (2 \times 3)$. While division is not $(1 / 2) / 3 = 1 / (2 / 3)$.

This approach (composing indefinitely many things) for building stuff is often used in programming. To see some examples, you don't need to look further than the way the pipe operator in Unix (`|`), which feeds the standard output of a program with the standard input of another program, is (ab)used. If you *want* to look further, note that there is a whole programming paradigm based on functional composition, called "concatenative programming".

Identity
---

Before the standard Arabic numerals that we use today, there were Roman numbers. Roman numerals weren't any good, because they lacked the concept of *zero* - a number that indicated the absence of quantity and any number system that lacks this simple concept is bound to remain extremely limited. It is the same in programming, where we have multiple values that indicate the absence of a value. 

In order to be able to define more stuff using morphisms in category theory, we too would want to define zero, or what we call the "identity morphism" for each object. In short, this is a morphism, that doesn't do anything.

![The identity morphism (but can also be any other morphism)](identity.svg)

It's important to mark this morphism, because there can be (let's add the very important (and also very boring) reminder) many morphisms that go from one object to the same object, many of which actually do stuff. For example, mathematics deals with a multitude of functions that have the set of numbers as source and target, such as $negate$, $square$, $add one$, and are not at all the identity morphism.

**Question:** What is the identity morphism in the category of sets?

A summary
---

For future reference, let's restate what a category is.

A category is a collection of *objects* (we can think of them as *points*) and *morphisms* ( or *arrows*) that go from one object to another, where:
1. Each object has to have the identity morphism.
2. There should be a way to compose two morphisms with an appropriate type signature into a third one in a way that is *associative*.

This is it.


Addendum: Why are categories like that?
===

All texts on category theory explain *what* categories are, but few make an attempt to explain *why* are they like that. From one standpoint, the answer to that seems obvious - we study categories because they *work*, I mean, look at how many applications are there. But if we take a deeper view, it (the answer) is far from obvious: category theory is an abstract theory, so everything about it is kinda arbitrary: you can remove a law - and you get another theory that is similar to category theory you add one more law and you get a yet another one. So if these specific laws and this specific theory i.e. this specific set of laws works better than any other, then this fact demands an explanation. Not a *mathematical* explanation (e.g. we cannot prove that this theory is better than some other one), but an explanation nevertheless. What follows is *my attempt* to provide such an explanation, regarding the laws of *identity* and *associativity*.

Identity and isomorphisms
===

The reason the identity law is required is by far the more obvious one. We need to have a morphism that does nothing? It's because morphisms are the basic building blocks of our language, and we need this one to be able to speak properly. For example, once we have the concept of identity morphism defined, we can have a category-theoretic definition of an *isomorphism* (which is important, because the concept of an isomorphism is very important for category theory). Like we said in the previous chapter, an isomorphism between two objects ($A$ and $B$) consists of two morphisms - ($A → B$.  and $B → A$) such that their compositions are equivalent to the identity functions of the respective objects. Formally, objects $A$ and $B$ are isomorphic if there exist morphisms $f: A → B$ and $g: B → A$ such that $f \bullet g = id_{B}$ and $g \bullet f = id_{A}$. 

And here is the same thing expressed with a commuting diagram.

![Isomorphism](isomorphism.svg)

Like the previous one, the diagram expresses the same (simple) fact as the formula, namely that going from the one of objects ($A$ and $B$) to the other one and then back again is the same as applying the identity morphism i.e. doing nothing. 

Associativity and reductionism
===

Associativity - what it means and why is it there? In order to tackle this question, we must first talk about another concept - the concept of *reductionism*: 

Reductionism is a name for the idea that the behaviour of some more complex phenomenon can be explained in terms of a number of simpler and more fundamental phenomena. Whether the reductionist view is *universally valid*, i.e. whether it is possible to expain everything with a simpler things (and devise a *theory of everything* that reduces the whole universe to a few very simple laws), is a question that we can argue about until the that universe's inevitable collapse. But what is certain is that reductionism underpins all our understanding, especially when it comes to science and mathematics - each scientific discipline has a set of fundaments using which it tries to explain a given set of more complex phenomena, e.g. particle physics tries to explain the behaviour of atoms in terms of a given set of elementary particles, chemistry tries to explain the behaviour of various chemical substances in terms of a the chemical elements that they are composed of etc. A behaviour that cannot be reduced to the fundamentals of a given scientific discipline is simply outside of the scope of this discipline (and so a new discipline has to be created to tackle it.)

Commutativity
---

One way to state the principle of reductionism is to say that *each thing is nothing but a sum of its parts*. Let's try to formalize that: the *things* that we are thinking about would be colorful balls and let's dub the *sum* with a circle operator. Then, it would mean that a set of objects when combined in whichever way, will always result in the same object. 

![Commutativity](commutativity_long.svg)

And because of the wonders of maths we can get all these equalities if we specify the law for just two objects.

![Commutativity](commutativity.svg)

Incidentally this is the definition of a mathematicall law called *commutativity*.

**Task:** if our objects are sets, which set operation is our sum?

Associativity
---

Commutativity is the law abided in contexts in which any object can be represented as the sum of its parts *when combined in whichever order*. But there are also many cases in which an object is to be represented by the sum of it's parts, but when *combined in one specific way*.

In such contexts, commutativity would not hold, because the fact that A can be combined with B to get C would not automatically mean that B can be combined with A to get the same result (in the case of functions, they may not be able to be combined at all.)

But a weaker version of the law of reductionism would hold, namely that if we take a bunch of objects, combined in a certain order, it would be true that *any pair of those objects could, at any time, be replaced by the object we get by combining them*, i.e. if we have.

(A, B) = D

(B, C) = X

(A, B, C) = D C = A X

or simply 

(A B) C = A (B C) 

The essence of associativity (and of reductionism) is this ability to study complex phenomenon by zooming in into a part that you want to examine in a given moment, and looking at it in isolation.
