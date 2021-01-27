---
layout: default
title: Monoids 
---

Monoids etc
===

Since we are done with categories, let's look at some other structures that are also interesting - monoids. Like categories, monoids/groups are also abstract systems consisting of objects and rules for manipulating these objects. 

What are monoids
===

Monoids are simpler than categories. A monoid is defined by a collection (set) of elements and an operation that allows us to combine two element and produce a third one of the same kind.

Let's take our familiar colourful balls.

![Balls](balls.svg)

In this case a monoid would be a rule (operation) for "combining" two balls into one. 

An example of such rule would be blending the colors of the balls, as if we are mixing paint.

![A rule for combining balls](balls_rule.svg)

You can probably think of other ways to define such a rule. This will help you realize that there can be many ways to create a monoid from a given set of items. The monoid is not the set itself, it is the set *together with the rule*.

Associativity
---

The monoid rule should, like functional composition, be "associative" i.e. applying it on the same number of elements in a different order should make no difference.

![Associativity in the color mixing operation](balls_associativity.svg)

When a rule is associative, this means we can use all kinds of algebraic operations to any sequence of terms (or in other words to apply equation reasoning), like for example we can replace any element with a set of elements from which it is composed of, or add a term that is present at both sides of an equation and retaining the equality of the existing terms.

![Associativity in the color mixing operation](balls_arithmetic.svg)

The identity element
---

Actually, not any (associative) rule for combining elements makes the balls form a monoid (it makes them form a "semigroup", which is also a thing, but that's a separate topic). In order to be a monoid, a set must feature what is called an "identity element" of a given rule (or a *zero* element, if you prefer) - one that, when combined with any other element gives back that same element not the identity but the other one. Or simply **x • i = x and i • x = x for any x**. In the case of our color-mixing monoid the identity element is the white  ball (or perhaps a transparent one, if we have one).

![The identity element of the color-mixing monoid](balls_identity.svg) 

As you probably remember from the last chapter, functional composition is also associative and it also contains an identity element, so you might start suspecting that it forms a monoid in some way. And it is really the case with one little caveat. 

To keep the suspense alive, let's see some simpler monoids before we dwelve into that:

Basic monoids 
===

Monoids from numbers
---

Mathematics is not all about numbers, however numbers do tend to pop up in most of its areas and monoids are no exception. The set of natural numbers *N* form a monoid when combined with the all too familiar operation of addition (or to use the official terminology *N* *form* a monoid *under* addition).

![The monoid of numbers under addition](numbers_addition.svg)

(if you see a **1 + 1 = 2** in your textbook you know you are working on math foundations (or you are in kindergarten)).

The natural numbers also form a monoid under multiplication as well:

![The monoid of numbers under multiplication](numbers_multiplication.svg)

**Task:** Which are the identity elements of those monoids?

**Task:** Go through other mathematical operations and figure out why they are not monoidal.

Monoids from boolean algebra
---

Thinking about other operations that we covered (operation being a function which takes a pair of element of a given type and returns one element of the same type), we may remember the boolean operations **AND** and **OR**. which operate on the set, consisting of just two values **{ True, False }**. Those operations form monoids too. Proving that they do is easy enough by just enumerating all cases. 

We can prove that **AND** is associative by expanding the formula **(A AND B) AND C = A AND (B AND C)** in all possible ways:

**(TRUE AND FALSE) AND TRUE = TRUE AND (FALSE AND TRUE)**

**(TRUE AND FALSE) AND FALSE = TRUE AND (FALSE AND FALSE)**

**(FALSE AND FALSE) AND TRUE = FALSE AND (FALSE AND TRUE)**

...

And we can prove that **TRUE** is the identity element by expanding the other formulas that state that for all elements **A** **I AND A = A**

**FALSE AND TRUE = FALSE**

**TRUE AND TRUE = TRUE**

...and then do the same for **A AND I = A**.

Intuitions
---

In order to form the correct intuition about monoids, try to avoid thinking of the elements in the set as objects, but instead think of them as *actions*. For example, when thinking about numbers don't think of them as *quantities* (as in two apples, two oranges etc.), but as *operations*, (e.g. as the action of adding one to a given quantity). In other words, don't think of the element by itself, but only think of it together with the operation (in this case addition).

This touches a programming concept which is very popular in category-theory inspired languages - currying - that is based on the idea that a function that accepts two arguments together with one of those arguments already supplied can be viewed as a function which takes one argument. e.g. the function `add(number, number)` together with the element `2` is equivalent to the `addTwo(number)` function.

In general, we use monoids and related structures as a way to model how a set of (associative) actions that are performed on a given object (or objects) alter it's state. We can do that, provided that the object's state is determined solely by the actions that are performed on it, this allows us to leave the object out of the equation and concentrate on how the actions are combined. And as per usual, the actions (and objects) can be anything, from mixing colors in paint, or adding a quantities to a given set of things etc.

Other monoid-like objects
===

Monoid operations obey two laws - they are associative and there is an identity element. In some cases we come across operations that also obey other laws that are also interesting. Imposing more (or less) rules to the way in which actions are combinded results in the definition of other monoid-like structures.

Commutative (abelian) monoids
---

Looking at the monoid laws and the examples we gave so far, we observe that all of them obey one more rule (law) which we didn't specify - the order in which the operations are applied is irrelevant to the end result.

![Commutative monoid operation](monoid_commutative.svg)

Such operations (ones for which combining a given set of objects yields the same result no matter which one is first and which one is second) are called *commutative* operations. Monoids with operations that are commutative are called *commutative monoids*. 

As we said, addition is commutative as well - it does not matter whether if I have given you 1 apple and then 2 more, or if I have given you 2 first and then 1 more.

![Commutative monoid operation](addition_commutative.svg)

All monoids that we examined so far are also *commutative*, but we will see some non-commutative ones later. 

Groups
---

 A group is a monoid in which each element has what is called an "inverse" element where the element and its inverse cancel each other out when applied one after the other, in other words , **forall x, there must exist x' such that x • x' = i** ( where **i** is the identity element).

If we view *monoids* as a means of modelling the effect of applying a set of (associative) actions, we use *groups* to model the effects of actions are also *reversible*.

An nice example of a group can be found in the realm of numbers (really, numbers are a nice example of almost all laws) - it is the set of integers under addition, where the inverse of each number is its opposite number (positive numbers' inverse are negatives and vice versa). The above formula, then, becomes **x + (-x) = 0**

The study of groups is a field that is much bigger than the theory of monoids (and perhaps bigger than category theory itself). 

And it all started with the what are now called the "symmetry groups" which we will look into in more detail.

Summary
---

The algebraic structures that we saw can be summarized based on the laws that define them in this table.

| | Semigroups | Monoids | Groups |
|---| ---             | ---        |
|Associativity| X | X | X |
|Identity| | X | X |
|Invertability | |  | X |

Symmetry groups
===

An interesting kinds of groups/monoids are the groups of *symmetries* of geometric figures. Given some geometric figure, a symmetry is an action after which the figure is not displaced (e.g. it can fit into the same mold that it fit before the action was applied).

We won't use the balls this time, as they have just one position just one action - the identity action (which is it's own reverse by the way). So let's take this triangle (which for our purposes, is the same as any other triangle).

![A triangle](symmetry_group.svg)

Groups of rotations
---

Let's first review the group of ways in which we can rotate our triangle i.e. its *rotation group*. A geometric figure can be rotated without displacement in positions equal to the number of its sides, so for our triangle there are 3 positions.

![The group of rotations in a triangle](symmetry_rotation.svg)

Connecting the dots (or the triangles in this case) shows us that there are just two possible actions that get us from any state to any other one - a *120-degree rotation* (i.e. flipping the triangle one time) and a *240-degree rotation* (i.e. flipping it two times (or equivalently, flipping it once, but in the opposite direction)). Adding the identity action of 0-degree rotation makes up for 3 actions in total.

![The group of rotations in a triangle](symmetry_rotation_actions.svg)

Cyclic groups/monoids
---

Ennumerating all the rotations of a more complex geometrical figure looks quite messy at first.

![The group of rotations in a more complex figure](symmetry_rotation_square.svg)

But it's much simpler to grasp if we notice the following: although our group has many actions, and there are more still for figures with more sides (if I am not mistaken, the number of actions is equal to the number of the sides), all of those actions can be reduced to the repetitive application of just the simplest action, (the 120-degree rotation for triangles and the 45-degree rotation for octagons). Let's make up a symbol for this rotation.

![The group of rotations in a triangle](symmetry_rotation_cyclic.svg)

Groups and monoids that have this "main" action (called a "generator") that, when applied enough times, can get you to any state are called *cyclic groups*. All rotation groups are cyclic groups. Another example of a cyclic groups is, yes, the integers under addition. Here we can use **+1** or **-1** as generators.

![The group of numbers under addition](numbers_cyclic.svg)

Wait, how can this be a cyclic group when there are no cycles? This is because the integers are an *infinite* cyclic group. 

An example of a finite number-based cycle group are the integers in *modular arithmetic* (sometimes called "clock arithmetic"). Modular arithmetic's operation is based on a number called the modulus of an arithmetic (let's take **12** for example). In it, each number is mapped to the *remainder of the integer addition of that number and the modulus*.

For example: **1 modulo 12 = 1** (because 1/12 = 0 with 1 remainder) **2 modulo 12 = 2** etc. 

but **13 modulo 12 = 1** (13/12 = 1 with 1 remainder) **14 modulo 12 = 2**, **15 modulo 12 = 3** etc. 

In effect numbers "wrap around" upon reaching the modulus.

Here is a group representation of modular arithmetic with modulus 3.

![The group of numbers under addition](numbers_modular.svg)

Here are a couple of interesting facts about cyclic groups.

1 All cyclic groups that have the same number of elements (or of the *same order*) are isomorphic to each other i.e. they are the same group. For example, the group of rotations of the triangle is isomorphic to the integers under the addition with modulo 3. This group is called **Z3**.

![The group of numbers under addition](symmetry_modular.svg)

2 All cyclic groups are *commutative* (or "abelian" as they are also called). There are, however abelian groups that are not cyclic, but, as we shall see below, the concepts of cyclic groups and of abelian groups are deeply related.

**Task:** Prove that there are no other groups with 3 objects, other than **Z3**.

The smallest groups
---

Like with sets, the concept of an isomorphism in group theory allows us to identify common groups, like the smallest groups.

The smallest group is just the trivial group **Z1** that has just one object and no morphisms.

![The smallest group](trivial_group.svg)

The smallest non-trivial group is the group **Z2** that has two objects and one morphism that goes between them.

![The smallest non-trivial group](smallest_group.svg)

**Z2** is also known as the *boolean group*, due to the fact that it is isomorphic to the **{ True, False }** set.

Group products
---

Given any two groups we can create a third group, called their *product group*, comprised of all possible pairs of elements from the two groups and of the sum of all their actions.

To demonstrate how, let's take the following two groups (which, having just two elements and one operation, are both isomorphic to **Z2**) - the first one is based on the vertical reflection of a figure and the second, just the horizontal reflection.

![Two trivial groups](groups_product.svg)

We get set of elements of the new group by making *the cartesian product* of the set of the elements of the first group and the set of the element of the second one.

![Two trivial groups](groups_product_four.svg)

The *actions* of the product group are comprised of the actions of the first group, combined with the actions of the second one, where each action is applied only on the element that is a member of its corresponding group leaving the other element unchanged.

![Klein four](klein_four_as_product.svg)

The result of our particular operation is called the **Klein four-group** and is the simplest *abelian non-cyclic* group. 

Another way to present the Klein-four group is the *group of symmetries of a non-square rectangle*.

![Klein four](klein_four.svg)

Task: prove that the two representations are isomorphic.

The Klein-four groups is *non-cyclic* because there are not one, but two main actions - vertical and horizontal spin. It is *abelian*, because the ordering of the actions still does not matter for the end results - this is because the actions do not interfere with one another.

Fundamental theory of Finite Abelian groups
---

We already saw one way to create non-cyclic abelian groups - by creating a product of two or more cyclic groups. All product groups (except the ones that feature the trivial group) would necessarily be non-cyclic, and they would also be abelian. The fundamental theory of finite abelian groups is a result that tells us that this is the only way to produce non-cyclic abelian groups.

> All abelian groups are either cyclic or products of cyclic groups.

And this is how the two concepts are related.

Groups of rotations and reflections
---

Now let's see a non-commutative group - the group of rotations *and reflections* of a given geometrical figure. It is the same as the last one, but here besides the rotation action that we already saw (and its composite actions), we have the action of flipping the figure vertically, an operation which results in its mirror image:

![Reflection of a triangle](reflection.svg)

Those two operations and their composite results in a group called **Dih3** that is not abelian (and is furthermore the *smallest* non-abelian group).

![The group of rotations and reflections in a triangle](symmetry_reflection.svg)

**Task:** Prove that this group is indeed not abelian.

**Question:** Besides having two main actions, what is the defining factor that makes this and any other group non-abelian?



Monoids as Categories
===

We began by defining a monoid as a set of composable objects, but, as we saw, those objects can be also seen as actions e.g. the **red ball** in our color-blending monoid can be seen as the action of **adding the color red** to the mix. By the same token, the number **2** in the monoid of addition can be seen as the function **+2**. Because actions are basically functions from a set to itself, there is a way to model monoids using set theory.
So let's consider the monoid/group **Z3** again.

![The group of rotations in a triangle - group notation](symmetry_rotation_actions.svg)

We can see that it is composed of a set of three elements and three functions between that set and itself, where we have a function to go from any element to any other one.

![The group of rotations in a triangle - set notation](symmetry_rotation_functions.svg)

And those functions obviously compose, as all functions do. Aaand we do have the *identity function* too, so monoids are totally categories. 

![The group of rotations in a triangle - set notation](symmetry_rotation_set.svg)

The diagram above is a good representation of the category **Z3** in terms of set theory, having all of it's objects and morphisms (except the identity one, but it goes without saying). 

So let's try to draw an external (categorical) diagram of the same category.

![The group of rotations in a triangle - categorical notation](symmetry_rotation_external.svg)

But wait, if *sets* in set theory correspond to *objects* in category theory and if a monoid is just one set, then the corresponding category would have just one object and therefore it is better represented as just one point from which all arrows come and to which they go (this representation would also show (correctly) that all morphisms in the category compose with one another).

![The group of rotations in a triangle - categorical notation](symmetry_rotation_category.svg)

All monoids' external diagrams would have just one object - the only difference would be the number of morphisms that the object has.

The intuition behind this representation is encompassed by the requirement of **closure** that monoid and group operations have - it is the law that applying the operation on any two elements of the set of elements that form the monoid always results in an element that is also a member of the set e.g. no matter how do you flip a triangle, you'd still get a triangle. 

| | Categories | Monoids | Groups 
|---| ---             | ---        |
|Associativity| X | X | X |
|Identity| X | X | X |
|Invertability  | |  | X |
|Closure  | | X | X |

When we view a monoid as a category, this law says that all morphisms in the category should be from one object to itself - a monoid, any monoid, can be seen as a category with one object.
