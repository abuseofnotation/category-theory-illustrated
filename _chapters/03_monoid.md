---
layout: default
title: Monoids 
---

# Monoids etc


Since we are done with categories, let's look at some other structures that are also interesting --- monoids. 

## What are monoids

Like categories, monoids/groups are abstract systems consisting of a set of elements and operations, however, the operations look different than the operations we have for categories. Here is the definition:

{: .definition}

>A monoid is defined by a collection/set of elements $A$ (called the monoid's *underlying set*), together with an associative *monoid operation* --- a rule for combining two elements that produces a third element of the same kind --- $A \circ A \to A$. 
> Also, there should be an identity element $I$, such that $I \circ A = A$ and $A \circ I = A$.

Let's take our familiar colorful balls.

![Balls](../03_monoid/balls.svg)

We can define a monoid based on this set by specifying an operation for "combining" two balls into one. An example of such an operation would be blending the colours of the balls as if we are mixing paint.

![An operation for combining balls](../03_monoid/balls_operation.svg)

You can probably think of other ways to define a similar operation. This will help you realize that there can be many ways to create a monoid from a given set of set elements i.e. the monoid is not the set itself, it is the set *together with the operation*.

### Associativity

The monoid operation should, like functional composition, be *associative* i.e. the way in which elements are grouped when applying the operation does not make any difference.

![Associativity in the color mixing operation](../03_monoid/balls_associativity.svg)

When an operation is associative, this means we can use all kinds of algebraic operations to any sequence of terms (or in other words to apply equation reasoning), like for example we can replace any element with a set of elements from which it is composed, or add a term that is present at both sides of an equation and retain the equality of the existing terms.

![Adding a term to both sides of an equation: the equation"red + yellow = orange" and then same equation with blue added on both sides red + yellow + blue = orange + blue"](../03_monoid/balls_arithmetic.svg)

### The identity element

Actually, not any (associative) operation for combining elements makes for a monoid (it makes for a *semigroup*, which is also a thing, but that's a separate topic). To be a monoid, a set must feature what is called an *identity element* of the operation, a concept of which you are already familiar from both sets and categories --- it is an element that when combined with any other element gives back that same element (not the identity but the other one). Or simply $x • i = x$ and $i • x = x$ for any $x$. 

In the case of our color-mixing monoid, the identity element is the white ball (or perhaps a transparent one, if we have one).

![The identity element of the color-mixing monoid](../03_monoid/balls_identity.svg) 

As you probably remember from the last chapter, functional composition is also associative and it also contains an identity element, so you might start suspecting that it forms a monoid in some way. This is indeed the case, but with one caveat, which we will talk about later.

## Basic monoids 


To keep the suspense, before we discuss the relationship between monoids and categories, we are going to see some simple examples of monoids. 

### Monoids and numbers

Mathematics is not only about numbers, however, numbers do tend to pop up in most of its areas, and monoids are no exception. The set of natural numbers $\mathbb{N}$ ($$\{ 0, 1, 2, 3 ...\}$$) forms a monoid when combined with the all too familiar operation of addition (or *under* addition as it is traditionally said). This monoid is denoted $\left< \mathbb{N},+ \right>$ (in general, all monoids are denoted by specifying the set and the operation, enclosed in angle brackets).

![The monoid of numbers under addition](../03_monoid/numbers_addition.svg)

If you see a $1 + 1 = 2$ in your textbook you know you are either reading something very advanced, or very simple, although I am not really sure which of the two applies in the present case.

Anyways, the natural numbers also form a monoid under multiplication as well.

![The monoid of numbers under multiplication](../03_monoid/numbers_multiplication.svg)

**Task 1:** Which are the identity elements of those monoids?

**Task 2:** Go through other mathematical operations and verify that they are monoidal.

**Task 3:** The natural numbers form a monoid under multiplication, but not a group. Find out why.

### Monoids and boolean algebra

Thinking about operations that we covered, we may remember the boolean operations *and* and *or*. The operation *and* forms a monoid on the set, consisting of just two values $\{ True, False \}$, in which $True$ is the identity element (the symbol $\land$ means *and*).

![Logical operations that form monoids](../03_monoid/logic_monoid.svg)

The operation *or* also forms a similar monoid.

**Task 4:** Prove that **and** $\land$ is associative by expanding the formula $(A \land B) \land C = A \land (B \land C)$ with all possible values. Do the same for *or*.
**Task 5:** Which are the identity elements of the *or* operations?

## Monoid operations in terms of sets


We now know what the monoid operation is, and we even saw some simple examples. However, we never defined the monoid rule/operation formally i.e. using the language of set theory with which we defined everything else. Can we do that? Of course we can --- everything can be defined in terms of sets. 

We said that a monoid consists of two things: a set (let's call it $A$), and a monoid operation that acts on that set. Since $A$ is already defined in set theory (because it is just a set), all we have to do is define the monoid operation.

Defining the operation is not hard at all. Actually, we have already done it for the operation $+$ --- in Chapter 2, we said that *addition* can be represented in set theory as a function that accepts a product of two numbers and returns a number (formally $+: \mathbb{Z} \times \mathbb{Z} \to \mathbb{Z}$).

![The plus operation as a function](../03_monoid/plus_operation.svg)

Every other monoid operation can also be represented in the same way --- as a function that takes a pair of elements from the monoid's set and returns one other monoid element.

![The color-mixing operation as a function](../03_monoid/color_mixing_operation.svg)

Formally, we can define a monoid from any set $A$, by defining an (associative) function with type signature $A \times A \to A$. That's it. Or to be precise, that is *one way* to define the monoid operation. And there is another way, which we will see next. Before that, let's examine some other types of structures.

## Other monoid-like objects


Monoid operations obey two laws --- they are *associative* and there exists an *identity element*. In some cases, we come across operations that also obey other laws that are also interesting. Imposing more (or less) rules to the way in which objects are combined results in the definition of other monoid-like structures.

### Commutative (abelian) monoids

Looking at the monoid laws and the examples we gave so far, we observe that all of them obey one more rule (law) which we didn't specify --- the order in which the operations are applied is irrelevant to the end result.

![Commutative monoid operation](../03_monoid/monoid_commutative.svg)

Such operations (ones for which combining a given set of elements yields the same result no matter which one is first and which one is second) are called *commutative* operations. Monoids with operations that are commutative are called *commutative monoids*. 

As we said, addition is commutative as well --- it does not matter whether I have given you 1 apple and then 2 more, or if I have given you 2 first and then 1 more.

![Commutative monoid operation](../03_monoid/addition_commutative.svg)

All monoids that we examined so far are also *commutative*. We will see some non-commutative ones later. 

### Groups

A group is a monoid such that for each of its elements, there is another element which is the so-called "inverse" of the first one, where the element and its inverse cancel each other out when applied one after the other. Plain-English definitions like this make you appreciate mathematical formulas more:

{: .definition}
> A group is a monoid in which every element $A$, has an inverse element, denoted usually as $-A$, such that $A \circ -A = I$ (where $I$ is the identity element).

If we view *monoids* as a means of modelling the effect of applying a set of (associative) actions, we use *groups* to model the effects of actions which are also *reversible*.

The existence of the inverse elements enables *even more* algebraic operations e.g. monoids support *adding* the same element to both sides of an equation, but groups also support *removing* an element from both sides.

![Removing a term to from sides of an equation: the equation "red + yellow + blue = orange + blue" and then same equation with blue removed from both sides red + yellow = orange"](../03_monoid/balls_arithmetic_group.svg)

(The operation of removing an element is equivalent to adding the inverse element and then cancelling out the inverses)

A nice example of a group, which is related to a monoid we covered, is the set of integers under addition --- the operation is again ($+$), but the objects are the *integers* $\mathbb{Z}$, not the natural numbers $\mathbb{N}$ (so it's not $$\{ 0, 1, 2, 3 ...\}$$, but $$\{... -3, -2 -1, 0, 1, 2, 3 ...\}$$). The negative numbers are included, as the natural numbers don't have inverses. The inverse of each number is its opposite number (positive numbers' inverses are negatives and vice versa). 

In this instance, the above formula becomes $x + (-x) = 0$

### Summary

Before we move on --- the algebraic structures that we saw above can be summarized based on the laws that define them in this table:

|               | Semigroups    | Monoids   | Groups    |
|---            | ---           | ---       | ---       |
|Associativity  | X             | X         | X         |
|Identity       |               | X         | X         |
|Invertability  |               |           | X         |

The study of groups is a field that is much bigger than the theory of monoids (and perhaps bigger than category theory itself). And one of its biggest branches is the study of "symmetry groups" which we will look into next.


## Symmetry groups and group classifications


An interesting kind of groups/monoids are the groups of *symmetries* of geometric figures. Given some geometric figure, a symmetry is an action after which the figure is not displaced (e.g. it can fit into the same mold that it fit before the action was applied).

We won't use the balls this time, because in terms of symmetries, they have just one position and hence just one action --- the identity action (which is its own reverse, by the way). 

Instead, let's take this triangle, which, for our purposes, is the same as any other triangle: we are not interested in the triangle itself, but on the actions which are performed on it.

![A triangle](../03_monoid/symmetry_group.svg)

The only thing we need to make ourselves believe is that this is an "unrotated" triangle i.e. the one which represents the identity rotation.

### Groups of rotations

Let's first review the group of ways in which we can rotate our triangle i.e. its *rotation group*. A geometric figure can be rotated without displacement in positions equal to the number of its sides, so, for our triangle, there are 3 positions.

![The group of rotations in a triangle](../03_monoid/symmetry_rotation.svg)

Connecting the dots (or the triangles in this case) shows us that there are just 3 possible rotations that get us from any state of the triangle to any other one --- a *120-degree rotation* (i.e. flipping the triangle one time) and a *240-degree rotation* (i.e. flipping it twice, or equivalently, flipping it once in the opposite direction) and the identity action of 0-degree rotation. 

![The group of rotations in a triangle](../03_monoid/symmetry_rotation_actions.svg)

The rotations of a triangle form a monoid --- again, the *rotations are objects*. The zero-degree rotation is the identity, and the monoid operation which combines two rotations into one is just the operation of performing the first rotation and then performing the second one.

Note once again that the elements in the group are the *rotations*, not the triangles themselves, actually the group has nothing to do with triangles, as we shall see later.

### Cyclic groups/monoids

The diagram that enumerates all the rotations of a more complex geometrical figure looks quite messy at first.

![The group of rotations in a more complex figure](../03_monoid/symmetry_rotation_square.svg)

But it gets much simpler to grasp if we notice the following: although our group has many rotations, and there are more still for figures with more sides, *all those rotations can be reduced to the repetitive application of just one rotation*, (for example, the 120-degree rotation for triangles and the 45-degree rotation for octagons). Let's make up a symbol for this rotation.

![The group of rotations in a triangle](../03_monoid/symmetry_rotation_cyclic.svg)

Symmetry groups that have such "main" rotation are called cyclic

{: .definition}

>Groups and monoids that have an object that is capable of generating all other objects by its repeated application, are called *cyclic groups*. The group's "main" object is called the *generator*.

All rotation groups/monoids are cyclic groups. Another example of a cyclic monoid is, yes, the natural numbers under addition, with $+1$ as the generator.

![The monoid of natural numbers under addition](../03_monoid/numbers_cyclic.svg)

The *group* of integers under addition is cyclic too --- here we can use $+1$ *or* $-1$ as the generator (as whichever of the two we choose, we would get the other one by applying the inverse law).

![The group of integers under addition](../03_monoid/integers_cyclic.svg)

Wait, how can this be a cyclic group when there are clearly no cycles? This is because the integers are an *infinite* cyclic group. 

A number-based example of a finite cyclic group is the group of integers under *modular arithmetic* (sometimes called "clock arithmetic"). Modular arithmetic's operation is based on a number called the modulus (let's take $12$ for example). In it, each number is mapped to the *remainder of the integer division of that number and the modulus*.

For example: $1 \pmod{12} = 1$ (because $1/12 = 0$ with $1$ remainder) $2 \pmod{12} = 2$ etc. 

But $13 \pmod{12} = 1$ (as $13/12 = 1$ with $1$ remainder) $14 \pmod{12} = 2$, $15 \pmod{12} = 3$ etc. 

In effect, numbers "wrap around" forming a group with as many elements as the modulus number. For example, a group representation of modular arithmetic with modulus $3$ has 3 elements.

![The group of numbers under addition](../03_monoid/numbers_modular.svg)

All cyclic groups that have the same number of elements (or that are of the *same order*) are isomorphic to each other (careful readers might notice that we haven't yet defined what a group isomorphism is, even more careful readers might already have an idea about what it is).

 For example, the group of rotations of the triangle is isomorphic to the group of integers under the addition with modulo $3$. 

![The group of rotations of a triangle next to the group numbers under addition modulo 3](../03_monoid/symmetry_modular.svg)

All cyclic groups are *commutative* (or "abelian" as they are also called). 

**Task 6:** Show that there are no other groups with 3 objects, other than $Z_3$.

There are commutative groups that are not cyclic, but, as we shall see below, the concepts of cyclic groups and commutative groups are deeply related.

### Group isomorphisms

We already mentioned group isomorphisms, but we didn't define what they are. Let's do that now: 

{: .definition}

> An isomorphism between two groups is an isomorphism ($f$) between their respective sets of elements, such that for any $a$ and $b$ we have $f(a \circ b) = f(a) \circ f(b)$.

Visually, the diagrams of isomorphic groups have the same structure.

![The group of rotations of a triangle is isomorphic to the group numbers under addition modulo 3](../03_monoid/group_isomorphism.svg)

As in category theory, in group theory isomorphic groups are considered instances of one and the same group. For example, the one above is called $Z_3$.

### Finite groups

Like with sets, the concept of an isomorphism in group theory allows us to identify common finite groups.

The smallest group is just the trivial group $Z_1$ that has just one element.

![The smallest group](../03_monoid/trivial_group.svg)

The smallest non-trivial group is the group $Z_2$ which has two elements.

![The smallest non-trivial group](../03_monoid/smallest_group.svg)

$Z_2$ is also known as the *boolean group*, due to the fact that it is isomorphic to the ${ True, False }$ set under the XOR (excluded or) operation.

Like $Z_3$, $Z_1$ and $Z_2$ are cyclic.

## Group/monoid products

We already saw a lot of commutative groups that are also cyclic, but we didn't see any commutative groups that are *not* cyclic. So, let's examine some of those. Here, instead of looking into individual examples, we will present the general way in which commutative non-cyclic groups are produced --- it is by uniting cyclic groups using the concept of *group product*.

{: .definition}

> Given two groups $A$ and $B$, we can combine them to create a third group, $A \times B$. The underlying set of the group is the product of the underlying sets of the groups $A \times B$ and the group operation is comprised of combination of the group operations of $A$ and $B$. 

Let's see how the resulting group looks after taking the product of the following two groups (which, having just two elements and one operation, are both isomorphic to $Z_2$). To make it easier to imagine them, we can think of the first one as based on the vertical reflection of a figure and the second, as the horizontal reflection.

![Two trivial groups, each with two elements](../03_monoid/groups_product.svg)

(again we have to pick an element of each group to represent the identity rotation, so, pretend that the left versions of the figures are the "unflipped" versions, while the right ones are flipped (although it can work the other way around too))

We get the set of elements of the new group by taking *the Cartesian product* of the set of elements of the first group and the set of elements of the second.

![Two trivial groups and their product group, containg all combinations of an element from the first with the ](../03_monoid/groups_product_four.svg)

And the *actions* of a product group are comprised of the actions of the first group, combined with the actions of the second, where each action is applied only to the element that is a member of its original group, leaving the other element unchanged.

![Klein four](../03_monoid/klein_four_as_product.svg)

The product of the two groups presented is called the *Klein four-group* and it is the smallest *non-cyclic commutative* group. 

Another way to present the Klein four-group is the *group of symmetries of a non-square rectangle*.

![Klein four](../03_monoid/klein_four.svg)

**Task 7:** Show that the two representations are isomorphic.

Here are some examples of how elements of the Klein four-group are combined.

![Klein four](../03_monoid/klein_four_examples.svg)

(i.e. horizontal/vertical rotations cancel each other out, while a horizontal rotation doesn't cancel out a vertical one.) 

The Klein four-group is *non-cyclic* (because there are not one, but two generators) --- vertical and horizontal spin. It is, however, still *commutative*, because the ordering of the actions still does not matter for the end result. Actually, the Klein four-group is the *smallest non-cyclic group*.

<!--
{% if site.distribution == 'print'%}
-->

### Interlude: Commutative product groups and the Fundamental theorem of Finite commutative groups

When are product groups commutative? The answer is simple.

{: .theorem}

Product groups are *commutative*, provided that the *groups that form them* are commutative. 

We can see that this is true by noticing that, although there are multiple generators, each generator acts only on its own part of the group, so the generators don't interfere with each other.

And the fundamental theorem of finite abelian groups (or of finite *commutative* groups as we call them here) is a result that tells us that group products are the only way to create non-cyclic commutative groups.

{: .theorem}

> All finite commutative groups are either cyclic or products of cyclic groups.

We can use this law to gain an intuitive understanding of what commutative groups are, but also to test whether a given group can be broken down to a product of more elementary groups.

<!--
{%endif%}
-->

### Classifying the color-mixing monoid 

Let's revisit our color mixing monoid that we saw earlier. 

![color-mixing group](../03_monoid/balls_rule.svg)

As there doesn't exist a color that, when mixed with itself, can produce all other colors, the color-mixing monoid is *not cyclic*. 

However, as we saw earlier, the color mixing monoid *is commutative*.

There is a result (fundamental theorem of finite commutative groups) that says such groups are necessarily *products* of some simpler groups.

And it is not hard to find those monoids --- although there isn't one color that can produce all other colors, there are three colors that can do that --- the prime colors. This observation leads us to the conclusion that the color-mixing monoid, can be represented as the product of three monoids corresponding to the three primary colors.

![color-mixing group as a product](../03_monoid/color_mixing_product.svg)

You can think of each color monoid as a boolean monoid, having just two states (colored and not-colored).

![Cyclic groups, forming the color-mixing group](../03_monoid/color_mixing_cyclic.svg)

Or alternatively, you can view it as having multiple states, representing the different levels of shading.

![Color-shading cyclic group](../03_monoid/cyclic_shading.svg)

In both cases it would be cyclic.

<!--
{% if site.distribution == 'print'%}
-->

### Interlude: Cyclic product groups and the Chinese remainder theorem

Most product groups (even the product of cyclic groups) would be non-cyclic, because it would have the generators of both groups that comprise it, i.e. even if the two original groups are cyclic and thus have 1 generator each, their product would still have 2 generators. But there is one exception where product group of two cyclic groups would still be cyclic.

{: .theorem}

The product group of two groups is cyclic if the groups that comprise it are cyclic, and if the number of elements of those groups (their *orders*) doesn't have a common divisor other than 1 (i.e. if they are *relatively prime numbers*). 

So, if you combine two groups with orders that have some common divisor (as $2$ and $2$, which are both divided by 2), then, their product would not be cyclic. But, if you combine two groups with orders that are relatively prime, (like $2$ and $3$) you would get a cyclic group.

But what would that group be? Actually we know:

{: .theorem}

The product group of two groups with relatively prime number of elements is isomorphic to a cyclic group of the same order, as the product of the orders of the groups that comprise it.

e.g. the product of $Z_2$ and $Z_3$ is isomorphic to the group $Z_6$ ($Z_2\times Z_3 \cong Z_6$)

![Chinese reminder theorem](../03_monoid/chinese_remainder_theorem.svg)

(the generator just adds 1 to each of the two groups)

This is a consequence of an ancient result, known as the *Chinese Remainder theorem*.

<!--
{%endif%}
-->

## Dihedral groups

Now, let's finally examine a non-commutative group --- the group of rotations *and reflections* of a given geometrical figure. It is the same as the last one, but here besides the rotation action that we already saw (and its composite actions), we have the action of flipping the figure vertically, an operation which results in its mirror image:

![Reflection of a triangle](../03_monoid/reflection.svg)

Those two operations and their composites result in a group called $Dih3$ that is not commutative i.e. it is *non-commutative* (and is furthermore the *smallest* non-commutative group).

![The group of rotations and reflections in a triangle](../03_monoid/symmetry_reflection.svg)

**Task 8:** Prove that this group is indeed not commutative.

**Task 9:** Besides having two main actions, what is the defining factor that makes this and any other group non-commutative?

Groups that represent the set of rotations and reflections of any 2D shape are called *dihedral groups*.

<!--
TODO: FSM as monoids
https://faculty.uml.edu/klevasseur/ads/s-monoid-of-fsm.html
-->

## Groups/monoids as categories

Now it's the place for the grand reveal --- *monoids are categories*. More precisely, monoids are a *specific type of categories*, (and groups too). 

This is not to say that the definition that we examined, where we describe them as sets and binary operations, is not true. It just says that there is an alternative, categorical definition, which is equivalent to it. Let's dive in.

### Monoid elements as objects 

When we defined monoids, we presented their elements as *elements of a set* and their operation --- as a function that takes a *pair* of elements from the set and return another element from the same set.

![The color-mixing operation as a function](../03_monoid/color_mixing_operation.svg)

Under this correspondence, this specific mixing in the color-mixing monoid...

![Monoid operation](../03_monoid/operation_group.svg)

...corresponds to this specific *point* in the above function (point, being a mapping of a specific element of the set).

![Monoid operations as functions from pair of objects to a third object: (A X B) -> C)](../03_monoid/operation_pairs.svg)

However, this is not the only way to represent multi-argument functions (and monoid operations) --- there is another, equally interesting way, that doesn't rely on any data structures, but only on functions.

### Monoid elements as morphisms

We saw that for some groups, like the group of integers, where the group objects are ...objects, and for others, like the groups of rotations, the group objects are understood as *actions*.

![The group of rotations of a triangle next to the group numbers under addition modulo 3](../03_monoid/symmetry_modular.svg)

But then we established an isomorphism between the different types of groups.

![The group of rotations of a triangle is isomorphic to the group numbers under addition modulo 3](../03_monoid/group_isomorphism.svg)

This means that both viewpoints are valid for *all* groups. And the second one is even more intuitive i.e. that all monoid objects can be seen as actions. For example, the number ($2$) in the monoid of addition can be seen as the operation of adding that number ($+2$) etc. 

The *green ball* in our color-blending monoid can be seen as an object that we can mix with other objects.

![Monoid operations as functions from pair of objects to a third object: (A X B) -> C)](../03_monoid/operation_pairs.svg)

But it also can be seen as the action of *adding the color green* to the mix etc.

![Monoid operations as functions (A X B) -> C) = A -> B -> C](../03_monoid/operation_functions.svg)

And the two viewpoints are isomorphic 

![The equivalence of curried and uncurried functions](../03_monoid/curry.svg)

i.e.  any function that takes a pair of objects, can be transformed to a function that takes one object and returns a *function* that takes the other one and returns the result.

{: .theorem}

> (Currying for monoids) For any monoid $A$, we have
> $$
> A \times A \to A \cong A \to A \to A
> $$.

Let's take a step back and examine the groups/monoids that we covered so far in light of this equivalence e.g. let's examine the symmetric group $Z_3$:

![The group of rotations in a triangle - group notation](../03_monoid/symmetry_rotation_actions.svg)

Currying tells us that the elements of this group are equivalent to functions which take a figure and rotate it a given amount of degrees.

![The group of rotations in a triangle - set notation](../03_monoid/symmetry_rotation_functions.svg)

Formally, the 3 elements of $Z_3$ can be seen as 3 bijective (invertible) functions from a set of 3 elements to itself (in group-theoretic context, these kinds of functions are called *permutations*, by the way).

Let's do the same thing for the addition monoid there, the isomorphism that we presented above looks as follows

{: .theorem}

> (Currying for addition monoids) For the monoid of natural numbers under addition, we have
> $$
> \mathbb{N} \times \mathbb{N} \to \mathbb{N} \cong \mathbb{N} \to (\mathbb{N} \to \mathbb{N})
> $$.

Here currying tells us that numbers can be seen not only as *quantities* (as in two apples, two oranges etc.), but as *operations*, (e.g. as the action of adding two to a given quantity): if we partially-apply the monoid operation ($+: \mathbb{N} \times \mathbb{N} \to \mathbb{N}$) to an element of the monoid (say $2$), the result is a function ($+2 : \mathbb{N} \to \mathbb{N}$) that adds 2 to a given number.

And because the monoid operation is always given in the context of a given monoid, we can view the element and the function as equivalent in the context of the monoid.

### Monoid operations as functional composition

As we said, the monoid object can be represented as functions. But what would happen to the monoid operation in this case? It corresponds to  *functional composition*. 

![The group of rotations in a triangle - set notation](../03_monoid/symmetry_rotation_set.svg)

Due to the fact that the functions that represent monoid objects have the same set as both source and target (e.g the function $+1 : \mathbb{N} \to \mathbb{N}$ has the set $\mathbb{N}$ as source and target), they all can be composed with one another. And the result of such compositions would also be composable.

This is true for all monoids, e.g. number-adding functions can also be combined using functional composition 

(we draw just one of the arrow per function, cause else the drawing would literally take forever).

![The group of integers - set notation](../03_monoid/integer_group_set.svg)

This means that the functions that represent the objects of a monoid also form a monoid, under the operation of functional composition (and the functions that represent the elements that form a group also form a group). 

**Task 10:** Which are the identity elements of function groups?

**Task 11:** Show that the functions representing inverse group elements are also inverse.


<!--
{% if site.distribution == 'print'%}
-->

### Interlude: Currying 

In mathematics, the transformation between those two viewpoints (monoid object as set elements and actions) is informally called *currying* in the name of Haskell Curry, although it was invented some years earlier by Moses Schönfinkel (*Schönfinkelisation* didn't stick for some reason). 

Anyway, Schönfinkel discovered that any function that accepts a pair of arguments of a given type (say $A$ and $B$) and maps them into some result of type $C$, so $A\times B\to C$  (in the case of monoids, the signature would be $A \times A \to A$, as all monoid objects are of the same type), there exists a function that maps the first of the two arguments (i.e. from $A$) to *another function* that maps the second argument to the final result (i.e. $B \to C$). So $A\to (B \to C)$, and vice versa. 

{: .theorem}

> (Currying)  for all types $A$, $B$, $C$, any function with signature $A\times B \to C$ can be converted to a function with signature $A \to (B \to C)$ and vice versa, so 
>$$
>A\times B \to C \cong A \to (B \to C)
>$$.

As we saw, monoid operations are functions that accept a pair, only they are functions such that both elements of the pair (as well as the result) are of the same type.

{: .theorem}

> (Currying for monoids) For any monoid $A$, we have
> $$
> A \times A \to A \cong A \to A \to A
> $$.

This isomorphism is given by a higher-order function, called `curry`. 

```typescript
const curry = <A, B, C> 
    (f:(a:A, b:B) => C) => 
        (a:A) => 
            (b:B) => 
                f(a, b)
```
And equally important is the opposite function, which maps a curried function to a multi-argument one, which is known as *uncurry*.

```typescript
const uncurry = <A, B, C> 
    (f:(a:A) => (b:B) => C) => 
        (a:A, b:B) => 
            f(a)(b)
```

There is a lot to say about these two functions, starting from the fact that their existence gives rise to an interesting relationship between the concept of a *product* and the concept of a *morphism* in category theory, called an *adjunction*. But we will cover this later. For now, we are interested in the fact the two function representations are isomorphic, formally $A\times B\to C\cong A\to B \to C$. 

By the way, this isomorphism can be represented in terms of programming as well. It is equivalent to the statement that the following function always returns `true` for any arguments, 

```typescript
(...args) => uncurry(curry(f))(...args) === f(...args)
```

This is one part of the isomorphism, the other part is the equivalent function for curried functions.

**Task 12:** Write the other part of the isomorphism.

<!--
{%endif%}
-->

### Cayley's theorem

Let's recap: in the previous section, we showed how the elements of every group/monoid correspond to functions from the monoid's underlying set to itself. Functions that have the same set as both source and target are called *permutations*.

We also said that those permutations make up a monoid of their own, under functional composition --- the monoid of permutations, let's call it. 

![The group of rotations in a triangle - set notation](../03_monoid/symmetry_rotation_cayley.svg)

One thing that we *didn't say* in the prev section, is that every such permutation group/monoid is isomorphic to the monoid from which it is constructed.

![The group of rotations in a triangle --- set notation and normal notation](../03_monoid/symmetry_rotation_comparison.svg)

This is a result known as the Cayley's theorem.

{: .theorem}

> (Cayley's theorem)  Any group is isomorphic to its corresponding permutation group: For any group $A$, $Perm(A) \cong A$ (we use $Perm$ to denote the permutation group).

Or in other words, representing the elements of a monoid/group as permutations actually yields a representation of the monoid itself (sometimes called its *standard representation*), so for example, for the numbers monoid we have:

$$
1 + 1 \cong (+1) \circ (+1) 
$$

And likewise for any other expression (or any other monoid).

Cayley's theorem is a very important result, so the fact that it does not look impressive in this context only shows the power of the categorical framework (and how much we learned).

<!--
{% if site.distribution == 'print'%}
-->

### Interlude: Symmetric groups

Before we dive, note that symmetric groups are not the same thing as *symmetry* groups. Once we have that out of the way, we can understand what they actually are: given a natural number $n$, the symmetric group of $n$, denoted $\mathrm{S}_n$ (symmetric group of degree $n$) is the group of all possible permutations of a set with $n$ elements. The number of the elements of such groups is equal to $1\times 2\times 3...\times n$ or $n!$ (n-factorial). 

So, for example, the group $\mathrm{S}_1$ of permutations of the one-element set has just 1 element (because a 1-element set has no other functions to itself other than the identity function).

![The S1 symmetric group](../03_monoid/s1.svg)

The group $\mathrm{S}_2$, has $1 \times 2 = 2$ elements, because there are two ways to arrange a set of two elements.

![The S2 symmetric group](../03_monoid/s2.svg)

(by the way, the colors are there to give you some intuition as to why the number of permutations of a $n$-element set is $n!$).

And with $\mathrm{S}_3$ we are already feeling the power of exponential (and even faster than exponential!) growth of the factorial function --- it has $1\times 2\times 3=6$ elements.

![The S3 symmetric group](../03_monoid/s3.svg)

Each symmetric group $\mathrm{S}_n$ contains all groups of order $n$ --- this is so because (as we saw in the prev section) every group with $n$ elements is isomorphic to a set of permutations on the set of $n$ elements and the group $\mathrm{S}_n$ contains *all such* permutations that exist. 

Here are some examples: 
- $\mathrm{S}_1$ is isomorphic to $Z_1$, the *trivial group*, and $\mathrm{S}_2$ is isomorphic to $Z_2$, the *boolean group*, (but no other symmetric groups are isomorphic to cycle groups)
- The top three permutations of $\mathrm{S}_3$ are isomorphic to the group $Z_3$. 

![The S3 symmetric group](../03_monoid/s3_z3.svg)

$\mathrm{S}_3$ is also isomorphic to $Dih3$ (but no other symmetric group is isomorphic to a dihedral group)

Based on this insight, we can state Cayley's theorem in terms of symmetric groups in the following way: 

> All groups are isomorphic to subgroups of symmetric groups.

**Task 13:** Show how the two are equivalent.

Fun fact: the study of group theory actually started by examining symmetric groups, so this theorem was actually a prerequisite for the emergence of the normal definition of groups that we all know and love (OK, at least *I* love it) --- it provided a proof that the notion described by this definition is equivalent to the already existing notion of symmetric groups.

<!--
{%endif%}
-->

### Monoids as categories

We saw that converting the monoid's elements to actions/functions yields an accurate representation of the monoid in terms of sets. 

![The group of rotations in a triangle - set notation](../03_monoid/symmetry_rotation_cayley.svg)

However, it is obvious that it is the *functions/morphisms* of the monoids, not their sets that are important (after all, a monoid is based on just one set), so we can try depicting it as a categorical (external) diagram.

![The group of rotations in a triangle - categorical notation](../03_monoid/symmetry_rotation_external.svg)

But wait, if the monoids' underlying *sets* correspond to *objects* in category theory, then the corresponding category would have just one object. And so the correct representation would involve just one point from which all arrows come and to which they go. 

![The group of rotations in a triangle - categorical notation](../03_monoid/symmetry_rotation_category.svg)

So a monoid, any monoid, can be seen as a *category with one object*.

### Formal definition

Let's check if that is really true, by reviewing the definition of a category:

{: .definition}

> A category is a collection of *objects* (we can think of them as points) and *morphisms* (arrows) that go from one object to another, where:
> 1. Each object has to have an identity morphism.
> 2. There should be a way to compose two morphisms with an appropriate type signature into a third one in a way that is associative.

Let's see what these laws imply for categories with one object:

> 1. Each object has to have an identity morphism.

For categories with just one object, there would also be one identity morphism. And monoids do have an identity *object*, which when viewed categorically corresponds to that identity morphism:

> 2. There should be a way to compose two morphisms with an appropriate type signature into a third one in a way that is associative.

But if the category has one object, all morphisms would have the same type signature (they would just be $A \to A$). So then *all morphisms would be composable with one another*. The monoid operation does exactly that --- given any two objects (or two morphisms, if we use the categorical terminology), it creates a third.

We see that aside from the slightly confusing fact that *monoid objects are morphisms* when viewed categorically, this describes exactly what monoids are. 

{: .definition}

> A monoid, any monoid, can be seen as a *category with one object*---the morphisms of the category are the monoid elements, the identity morphism is the identity element and the monoid operation is composition of morphisms. The converse is also true: any category with one object can be seen as a monoid 

Philosophically, defining a monoid as a one-object category corresponds to the view of monoids as a model of how a set of (associative) actions that are performed on a given object alter its state. Provided that the object's state is determined solely by the actions that are performed on it, we can leave it out of the equation and concentrate on how the actions are combined. And as per usual, the actions (and elements) can be anything, from mixing colors, to adding quantities to a given set of things etc.

## Group/monoid presentations

In the previous section, we proved that monoids are indeed equivalent to one-object categories. However, the implications of this statement still seem a bit baffling: Does this mean that all monoids (even ones with different underlying sets!) are kinda one and the same? The answer is that they are indeed similar, at least when we are viewing isomorphic monoids as one and the same monoid. The only differences between them can be traced in these two things:

1. The number of morphisms that they have.
2. The laws governing the composition of those morphisms. 

Formally, the set of generators and laws that defines a given monoid is called the *presentation of a monoid* and every monoid can be defined by specifying its presentation. And this observation leads to a whole new way of defining monoids. One that also reflects what we learned by products, generators etc.

### Cyclic monoids 

Let's imagine one specific set of categories: categories that, besides having one object, also have just one morphism (besides the identity).

![Presentation of an infinite cyclic monoid](../03_monoid/infinite_cyclic_presentation.svg)

This type of categories corresponds exactly to *cyclic monoids*: the morphism is the generator. And this one, in particular, is the monoid of natural numbers.

### Z3

Let's turn our attention to the second component of the presentation --- the laws describing the result of the *composition* of given morphisms (or, in our case with cyclic monoids, the result of composing the only morphism that forms the monoid with itself). 

In our previous presentation, we pictured $Z3$, the group of triangle rotations like this.

![The group of rotations in a triangle - categorical notation](../03_monoid/symmetry_rotation_category.svg)

However, this is not yet the simplest way to present it, as $Z3$ actually has just one generator and therefore just one morphism other than the identity.

![The group of rotations in a triangle - categorical notation](../03_monoid/symmetry_rotation_category_presentation.svg)

So, $Z3$ is like the monoid of natural numbers? It is, like the natural numbers, only \pmod{3}. In other words, there is a law that describes the result of composing morphisms:

> When you compose the generator with itself 3 times, you get identity morphism. 

We can denote it like this:

![Presentation of a finite cyclic monoid](../03_monoid/finite_cyclic_presentation.svg)

And when we start composing the monoid generator with itself, and applying the law, we get to the three elements as possible sequences of compositions.

![Presentation of a finite cyclic monoid](../03_monoid/finite_cyclic_presentation_elements.svg)

(because if we compose the morphism with itself one more time we will be back to the identity).

And what would happen if we reformulating the law so instead of 3 it says some other number $n$.

> When you compose the generator with itself $n$ times, you get identity morphism. 

This would yield all other cyclic monoids: $Z_1$ $Z_2$ $Z_3$ etc...

### Klein-four

We can represent product monoids this way too. Let's take Klein four-monoid as an example, The Klein four-monoid has two generators that it inherits from the monoids that form it (which we considered as vertical and horizontal rotation of a non-square rectangle) each of which comes with one law.

![Presentation of Klein four](../03_monoid/klein_four_presentation.svg)

To make the representation complete, we add the law for combining the two generators.

![Presentation of Klein four - third law](../03_monoid/klein_four_presentation_third_law.svg)

And then, if we start applying the two generators and applying the laws, we get the four elements of the monoid.

![The elements of Klein four](../03_monoid/klein_four_presentation_elements.svg)


### Free monoids

We saw how picking a different selection of laws gives rise to different types of monoids. But what would we get if we pick *no laws at all*? These monoids (we get a different one depending on the set of morphisms we pick) are called *free monoids*, as in "free from laws" (or as in, "you can upgrade the set of generators to a monoid for free").

{: .definition}

A monoid with a presentation that is presented only by a set of generators and has no laws for combining its generators i.e. one for which you can combine all morphisms indefinitely to get new ones, is called the *free monoid* of that set of generators.

We already saw one example: the free monoid with one generator i.e. the monoid of natural numbers.

{: .theorem}

The free monoid with just one generator is isomorphic to the monoid of natural numbers.

![The free monoid with one generator](../03_monoid/infinite_cyclic_presentation_elements.svg)

We can make a free monoid from the set of colorful balls --- the monoid's elements would be sequences of all possible combinations of the balls.

![The free monoid with the set of balls as a generators](../03_monoid/balls_free.svg)

### The universal property of free monoids

The free monoid of a given set of generators is a special one: you can define a special morphism that converts it to any other monoid which has the same set of generators.

So, how do we construct such a morphism? Simple, we just apply the other monoid's laws to each element of the free monoid.

For example, if we take the free monoid with just one generator, and apply to its elements the law of $Z_3$, we get... a function from it to $Z_3$.

![The free monoid with one generator](../03_monoid/infinite_cyclic_presentation_z3.svg)

Likewise, if we take the free monoid of balls, and we apply the laws of the color-mixing monoid, we would get a function from the free monoid of balls to the color-mixing monoid.

![Converting the elements of the free monoid to the elements of the color-mixing monoid](../03_monoid/balls_free_color_mixing.svg)

{: .theorem}

Any free monoid with a given set of generators, has a unique morphism that converts it to any other monoid with the same set of generators.

**Task 14:** Write up the laws of the color-mixing monoid.

If we put on our programmer's hat, we will see that the type of the free monoid under the set of generators T (which we can denote as `FreeMonoid<T>`) is just  the type `List<T>`, and that the intuition behind the special property that we described above is actually very simple: keeping objects in a list allows you to later apply to them to any kind of operation, to make any kind of structure. Indeed, that's why we keep lists in the first place.

What's even more important is that this property can be used to actually *define* what a free monoid is, in the same way in which projections can be used to define products. But we will get to that later.

<!--
{% if site.distribution == 'print' %}
-->

## Answers


---


**Task 1:** Which are the identity elements of those monoids?

For the monoid of natural numbers under addition, it is zero: $n + 0 = n$ and $0 + n = n$.

For the monoid of natural numbers under *multiplication* --- 1: $n × 1 = n$ and $1 × n = n$.

---

**Task 2:** Go through other mathematical operations and verify that they are monoidal.

Here are some monoids:

All (finite) strings under *string concatenation* (`+`), with the empty 
string as identity:
- Associative: `(a + b) + c === a + (b + c)`
- Identity: `s + "" === "" + s = s`

All natural numbers under the *maximum* function, with 0 as identity:
 - Associative: `max(max(a,b), c) === max(a, max(b,c))`
 - Identity: `max(a, 0) = a`

All n×n matrices, under *matrix multiplication*, with the identity matrix 
  - Associative: $(AB)C = A(BC)$
  - Identity: $AI = IA = A$

---

**Task 3:** The natural numbers form a monoid under multiplication, but not a group. Find out why.

Because they lack *inverses*. 

Numbers do have multiplicative inverses, but they are fractions, thus not natural e.g. the inverse of 2 is 1/2. 

Real numbers also don't have inverses for all numbers (which one is missing?).

---

**Task 4:** Prove that **AND** $∧$ is associative by expanding the formula $(A ∧ B) ∧ C = A ∧ (B ∧ C)$ with all possible values.

We can prove this by drawing what we call a *truth table* (more info in the next chapter).

| A | B | C | A ∧ B | (A ∧ B) ∧ C | B ∧ C | A ∧ (B ∧ C) |
|---|---|---|-------|-------------|-------|-------------|
| T | T | T | T     | T           | T     | T           |
| T | T | F | T     | F           | F     | F           |
| T | F | T | F     | F           | F     | F           |
| T | F | F | F     | F           | F     | F           |
| F | T | T | F     | F           | T     | F           |
| F | T | F | F     | F           | F     | F           |
| F | F | T | F     | F           | F     | F           |
| F | F | F | F     | F           | F     | F           |

---

**Task 5:** Which are the identity elements of the AND and OR operations?

For **AND** operation the identity element is $True$, for **OR**, it is $False$.

---

**Task 6:** Show that there are no other groups with 3 objects, other than $Z₃$.

Take any group with 3 elements $\{e, a, b\}$ where $e$ is identity.

In such a group, we necessarily have 

$$a \circ b = e$$

and

$$b \circ a = e$$

Why? $a \circ b$ cannot be equal to $a$, as that would make $b$ the identity element, $b = e$ (and the group would really be $\{e, a\}$), and it cannot be equal to $b$, as it would make $a$ identity.

In other words, $a$ and $b$ are each other's inverses.

Therefore, we must also have

$$a \circ a = b$$

and 

$$b \circ b = a$$

Why? $a \circ a$ cannot be equal to $e$ as that would mean $a = e$. And it cannot be equal to $a$, as that would mean $a$ is it's own inverse, and we established that it's inverse is $b$. Same for $b \circ b$.

So, we already established the result of applying the operation of any element of our group with any other, and we can conclude that our group is isomorphic to $Z_3$.

Furthermore, we did this without assuming anything about this group other than that it has three elements. So, every group with three elements, is (as our example group) isomorphic to $Z_3$.

---

**Task 7:** Show that the two representations [of Klein four-group] are isomorphic.

This is a nice exercise in relating spatial intuition to computation.

A non-square rectangle has two independent ways it can be rotated, while keeping the symmetry -- horizontal and vertical (let's annotate them $H$ and $V$).

For each of these two ways, there are two positions in which the figure can be, let's call them "normal" and "flipped". Let's annotate them $0$ and $1$. So, we have:

$$H = \{0, 1 \}$$

$$V = \{0, 1 \}$$

The position of the figure is composed of two pieces of information, whether it is flipped horizontally or not, or whether it is flipped vertically, i.e. its state is the cartesian product of $H$ and $V$.

$$H \times V = \{ (0, 0), (0, 1), (1, 0), (1, 1) \}$$

It's not hard to see that if we add the standard product group operation to this product set, we will get the Klein four-group.

---

**Task 8:** Prove that the group [Dih₃] is indeed not commutative.

The proof entails providing a counterexample, which is easy: if $r$ is the 120° rotation and $f$ is the reflection over a vertical axis, we have.
$$
f ∘ r ≠ r ∘ f
$$


---

**Task 9:** Besides having two main actions, what is the defining factor that makes this and any other group non-commutative?

The defining factor is that *the actions don't commute*. 
$$a ∘ b ≠ b ∘ a$$

i.e. the actions must be somehow interdependent with one another (one changes the state of the other) e.g. if we flip a figure horizontally, then rotating it would make it go in a different direction that if it wasn't flipped (as opposed to the figure in the Klein four-group, in which the horizontal and vertical reflections are independent of one another).

---

**Task 10:** Which are the identity elements of function groups?

No catch here, the identity element is the identity function.

---

**Task 11:** Show that the functions representing inverse group elements are also inverse.

Combining a group element with it's inverse would result in the identity element:

$$1  + (-1) = 0$$

This equation also holds for their corresponding functions:

$$+1 ∘ -1 = +0$$

---

**Task 12:** Write the other part of the [currying] isomorphism.

```typescript
// First part (given)
const curry = <A, B, C>(f: (a: A, b: B) => C) => 
  (a: A) => (b: B) => f(a, b)

// Second part (other direction)
const uncurry = <A, B, C>(f: (a: A) => (b: B) => C) => 
  (a: A, b: B) => f(a)(b)

// The isomorphism property:
// For all f: (a: A, b: B) => C, we have uncurry(curry(f)) = f
// For all g: (a: A) => (b: B) => C, we have curry(uncurry(g)) = g
```
---

**Task 13:** Show how the two [Cayley's theorem formulations] are equivalent.

The two formulations are:
1. "Any group is isomorphic to its corresponding permutation group"
2. "All groups are isomorphic to subgroups of symmetric groups"

They are equivalent, because the permutation group is a subgroup of a symmetric group:

1. The symmetric group with a given number of elements is the group of *all* permutations of that number of elements. 
2. A permutation group with a given number of elements is a group that contains *some* permutations of that number of elements.

So, we can get any permutation group of a given order if we remove some elements from the symmetric group of that order. e.g. the 3 permutations that form $Z_3$, the group of rotations of a triangle, can be found amongst the 6 permutations that form $S_3$ the symmetry group of order 3.

<!--
**Equivalence:**
- The "corresponding permutation group" in (1) is exactly the image of the group under the Cayley embedding
- This image is a subgroup of the symmetric group Sₙ where n is the group order
- Therefore, every group is isomorphic to a subgroup of some symmetric group
-->

---

**Task 14:** Write up the laws of the color-mixing monoid.

Our generators are the primary colors --- $Red$, $Yellow$ and $Blue$

And from the picture, we know that:

- $Blue ∘ Yellow = Green$

- $Yellow ∘ Red = Orange$   

- $Blue ∘ Yellow ∘ Red = Brown$   

etc.

<!--
{%endif%}
-->

