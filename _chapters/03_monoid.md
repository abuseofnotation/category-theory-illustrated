---
layout: default
title: Monoids 
---

Monoids etc
===

Since we are done with categories, let's look at some other structures that are also interesting --- monoids. Like categories, monoids/groups are abstract systems consisting of set of elements and operations for manipulating these elements, however the operations look different than the operations we have for categories. Let's see them.

What are monoids
===

Monoids are simpler than categories. A monoid is defined by a collection/set of elements (called the monoid's *underlying set*, together with an *monoid operation* --- a rule for combining two elements that produces a third element one of the same kind.

Let's take our familiar colorful balls.

![Balls](../03_monoid/balls.svg)

We can define a monoid based on this set by defining an operation for "combining" two balls into one. An example of such operation would be blending the colors of the balls, as if we are mixing paint.

![An operation for combining balls](../03_monoid/balls_operation.svg)

You can probably think of other ways to define a similar operation. This will help you realize that there can be many ways to create a monoid from a given set of set elements i.e. the monoid is not the set itself, it is the set *together with the operation*.

Associativity
---

The monoid operation should, like functional composition, be *associative* i.e. the way in which elements are grouped when applying the operation does not make any difference.

![Associativity in the color mixing operation](../03_monoid/balls_associativity.svg)

When an operation is associative, it means we can use all kinds of algebraic operations to any sequence of terms (or in other words to apply equation reasoning), like for example we can replace any element with a set of elements from which it is composed, or add a term that is present at both sides of an equation and retain the equality of the existing terms.

![Associativity in the color mixing operation](../03_monoid/balls_arithmetic.svg)

The identity element
---

An associative operation is not the only requirement for a structure to be considered a monoid (as opposed to a *semigroup*, which only requires associativity, but that's a separate topic for later!). Additionally, a set must feature what is called an *identity element* of a given operation, the concept of which you are already familiar from both sets and categories --- it is an element that when combined with any other element gives back that same element. Or simply $x • i = x$ and $i • x = x$ for any $x$. 

In the case of our color-mixing monoid the identity element is the white ball (or perhaps a transparent one, if we have one).

![The identity element of the color-mixing monoid](../03_monoid/balls_identity.svg) 

As you probably remember from the last chapter, functional composition is also associative and it also contains an identity element, so you might start suspecting that it forms a monoid in some way. This is indeed the case, but with one caveat, for which we will talk about later.

Basic monoids 
===

To keep the suspense, before we discuss the relationship between monoids and categories, we are going through see some simple examples of monoids. 

Monoids from numbers
---

Mathematics is not only about numbers, however numbers do tend to pop up in most of its areas, and monoids are no exception. The set of natural numbers $\mathbb{N}$ forms a monoid when combined with the all too familiar operation of addition (or *under* addition as it is traditionally said). This group is denoted $\left< \mathbb{N},+ \right>$ (in general, all groups are denoted by specifying the set and the operation, enclosed in angle brackets).

![The monoid of numbers under addition](../03_monoid/numbers_addition.svg)

If you see a $1 + 1 = 2$ in your textbook you know you are either reading something very advanced, or very simple, although I am not really sure which of the two applies in the present case.

Anyways, the natural numbers also form a monoid under multiplication as well.

![The monoid of numbers under multiplication](../03_monoid/numbers_multiplication.svg)

**Question:** Which are the identity elements of those monoids?

**Task:** Go through other mathematical operations and verify that they are monoidal.

Monoids from boolean algebra
---

Thinking about operations that we covered, we may remember the boolean operations *and* and *or*. Both of them form monoids, which operate on the set, consisting of just two values $\{ True, False \}$. 

**Task:** Prove that $\land$ is associative by expanding the formula $(A \land B) \land C = A \land (B \land C)$ with all possible values. Do the same for *or*.

**Question:** Which are the identity elements of the *and* and *or* operations?

Monoid operations in terms of set theory
===

We now know what the monoid operation is, and we even saw some simple examples. However, we never defined the monoid rule/operation formally i.e. using the language of set theory with which we defined everything else. Can we do that? Of course we can --- everything can be defined in terms of sets. 

We said that a monoid consists of two things: a set (let's call it $A$), and a monoid operation that acts on that set. Since $A$ is already defined in set theory (because it is just a set), all we have to do is define the monoid operation.

Defining the operation is not hard at all. Actually, we have already done it for the operation $+$ --- in chapter 2, we said that *addition* can be represented in set theory as a function that accepts a product of two numbers and returns a number (formally $+: \mathbb{Z} \times \mathbb{Z} \to \mathbb{Z}$).

![The plus operation as a function](../03_monoid/plus_operation.svg)

Every other monoid operation can also be represented in the same way --- as a function that takes a pair of elements from the monoid's set and returns one other monoid element.

![The color-mixing operation as a function](../03_monoid/color_mixing_operation.svg)

Formally, we can define a monoid from any set $A$, by defining an (associative) function with type signature $A \times A \to A$. That's it. Or to be precise, that is *one way* to define the monoid operation. And there is another way, which we will see next. Before that, let's examine some more categories.

Other monoid-like objects
===

Monoid operations obey two laws --- they are *associative* and there is an *identity element*. In some cases we come across operations that also obey other laws that are also interesting. Imposing more rules to the way in which objects are combined results in the definition of other monoid-like structures.

Commutative (abelian) monoids
---

Looking at the monoid laws and the examples we gave so far, we observe that all of them obey one more rule (law) which we didn't specify --- the order in which the operations are applied is irrelevant to the end result.

![Commutative monoid operation](../03_monoid/monoid_commutative.svg)

Such operations (ones for which combining a given set of elements yields the same result no matter which one is first and which one is second) are called *commutative* operations. Monoids with operations that are commutative are called *commutative monoids*. 

As we said, addition is commutative as well --- it does not matter whether if I have given you 1 apple and then 2 more, or if I have given you 2 first and then 1 more.

![Commutative monoid operation](../03_monoid/addition_commutative.svg)

All monoids that we examined so far are also *commutative*. We will see some non-commutative ones later. 

Groups
---

A group is a monoid such that for each of its elements, there is another element which is the so called "inverse" of the first one  where the element and its inverse cancel each other out when applied one after the other. Plain-English definitions like this make you appreciate mathematical formulas more --- formally we say that for all elements $x$, there must exist $x'$ such that $x • x' = i$ (where $i$ is the identity element).

If we view *monoids* as a means of modeling the effect of applying a set of (associative) actions, we use *groups* to model the effects of actions which are also *reversible*.

A nice example of a monoid that we covered that is also a group is the set of integers under addition. The inverse of each number is its opposite number (positive numbers' inverse are negatives and vice versa). The above formula, then, becomes $x + (-x) = 0$

The study of groups is a field that is much bigger than the theory of monoids (and perhaps bigger than category theory itself). And one of its biggest branches is the study of "symmetry groups" which we will look into next.

Summary
---

Before we move on --- the algebraic structures that we saw above can be summarized based on the laws that define them in this table:

|               | Semigroups    | Monoids   | Groups    |
|---            | ---           | ---       | ---       |
|Associativity  | X             | X         | X         |
|Identity       |               | X         | X         |
|Invertability  |               |           | X         |

And now on to symmetry groups.

Symmetry groups and group classifications
===

An interesting collection of groups/monoids are the groups of *symmetries* of geometric figures. Given some geometric figure, a symmetry is an action after which the figure is not displaced (e.g. it can fit into the same mold that it fitted before the action was applied).

We won't use the balls this time, because in terms of symmetries they have just one position and hence just one action --- the identity action (which is its own reverse, by the way). So let's take this triangle, which, for our purposes, is the same as any other triangle (we are not interested in the triangle itself, but in its rotations).

![A triangle](../03_monoid/symmetry_group.svg)

Groups of rotations
---

Let's first review the group of ways in which we can rotate our triangle i.e. its *rotation group*. A geometric figure can be rotated without displacement in positions equal to the number of its sides, so for our triangle there are 3 positions.

![The group of rotations in a triangle](../03_monoid/symmetry_rotation.svg)

Connecting the dots (or the triangles in this case) shows us that there are just two possible rotations that get us from any state of the triangle to any other one --- a *120-degree rotation* (i.e. flipping the triangle one time) and a *240-degree rotation* (i.e. flipping it twice, or equivalently, flipping it once in the opposite direction). Adding the identity action of 0-degree rotation makes up for 3 rotations (objects) in total.

![The group of rotations in a triangle](../03_monoid/symmetry_rotation_actions.svg)

The rotations of a triangle form a monoid --- the *rotations are objects* (of which the zero-degree rotation is the identity) and the monoid operation which combines two rotations into one is just the operation of performing the first rotation and then performing the second one.

**NB:** Note once again that the elements in the group are the *rotations*, not the triangles themselves, actually the group has nothing to do with triangles, as we shall see later.

Cyclic groups/monoids
---

The diagram that enumerates all the rotations of a more complex geometrical figure looks quite messy at first.

![The group of rotations in a more complex figure](../03_monoid/symmetry_rotation_square.svg)

But it gets  much simpler to grasp if we notice the following: although our group has many rotations, and there are more still for figures with more sides (if I am not mistaken, the number of rotations is equal to the number of the sides), *all those rotations can be reduced to the repetitive application of just one rotation*, (for example, the 120-degree rotation for triangles and the 45-degree rotation for octagons). Let's make up a symbol for this rotation.

![The group of rotations in a triangle](../03_monoid/symmetry_rotation_cyclic.svg)

Symmetry groups that have this idea of a "main" rotation, and in general, groups and monoids that have an object that is capable of generating all other objects by its repeated application, are called *cyclic groups*. In these cases, the "main" rotation is called the group's *generator*.

All rotation groups are cyclic groups. Another example of a cyclic group is, indeed, the natural numbers under addition. Here we may use $+1$ or $-1$ as generators.

![The group of numbers under addition](../03_monoid/numbers_cyclic.svg)

Wait, how can this be a cyclic group when there are no cycles? This is because the integers are an *infinite* cyclic group. 

A number-based example of a finite cyclic group is the group of natural numbers under *modular arithmetic* (sometimes called "clock arithmetic"). Modular arithmetic's operation is based on a number called the modulus (let's take $12$ for example). In it, each number is mapped to the *remainder of the integer addition of that number and the modulus*.

For example: $1 \pmod{12} = 1$ (because $1/12 = 0$ with $1$ remainder) $2 \pmod{12} = 2$ etc. 

But $13 \pmod{12} = 1$ (as $13/12 = 1$ with $1$ remainder) $14 \pmod{12} = 2$, $15 \pmod{12} = 3$ etc. 

In effect, numbers "wrap around" forming a group with as many elements as the modulus number. For example a group representation of modular arithmetic with modulus $3$ has 3 elements.

![The group of numbers under addition](../03_monoid/numbers_modular.svg)

All cyclic groups that have the same number of elements (or that are of the *same order*) are isomorphic to each other (careful readers might notice that we haven't yet defined what a group isomorphism is, even more careful readers might already have an idea about what it is).

 For example, the group of rotations of the triangle is isomorphic to the natural numbers under the addition with modulo $3$. 

![The group of numbers under addition](../03_monoid/symmetry_modular.svg)

All cyclic groups are *commutative* (or "abelian" as they are also called). 

**Task:** Show that there are no other groups with 3 objects, other than $Z_3$.

There are abelian groups that are not cyclic, but, as we shall see below, the concepts of cyclic groups and of abelian groups are deeply related.

Group isomorphisms
---

We already mentioned group isomorphisms, but we didn't define what they are. Let's do that now --- an isomorphism between two groups is an isomorphism ($f$) between their respective sets of elements, such that for any $a$ and $b$ we have $f(a \circ b) = f(a) \circ f(b)$. Visually, the diagrams of isomorphic groups have the same structure.

![Group isomorphism between different representations of S3](../03_monoid/group_isomorphism.svg)

As in category theory, in group theory isomorphic groups are considered instances of one and the same group. For example the one above is called $Z_3$.

Finite groups
---

Like with sets, the concept of an isomorphism in group theory allows us to identify common finite groups.

The smallest group is just the trivial group $Z_1$ that has just one element.

![The smallest group](../03_monoid/trivial_group.svg)

The smallest non-trivial group is the group $Z_2$ that has two elements.

![The smallest non-trivial group](../03_monoid/smallest_group.svg)

$Z_2$ is also known as the *boolean group*, due to the fact that it is isomorphic to the ${ True, False }$ set under the operation that negates a given value.

Like $Z_3$, $Z_1$ and $Z_2$ are cyclic.

Group/monoid products
===

We already saw a lot of abelian groups that are also cyclic, but we didn't see any abelian groups that are not cyclic. So let's examine what these look like. This time, instead of looking into individual examples, we will present a general way for producing abelian non-cyclic groups from cyclic ones --- it is by uniting them by using *group product*.

Given any two groups, we can combine them to create a third group, comprised of all possible pairs of elements from the two groups and of the sum of all their actions. 

Let's see how the resulting group looks after taking the product of the following two groups (which, having just two elements and one operation and are both isomorphic to $Z2$). To make it easier to imagine them, we can think of the first one as based on the vertical reflection of a figure and the second, the horizontal reflection.

![Two trivial groups](../03_monoid/groups_product.svg)

We get the set of elements of the new group by taking *the Cartesian product* of the set of elements of the first group and the set of elements of the second.

![Two trivial groups](../03_monoid/groups_product_four.svg)

The *actions* of a product group are comprised of the actions of the first group, combined with the actions of the second, where each action is applied only on the element that is a member of its original group, leaving the other element unchanged.

![Klein four](../03_monoid/klein_four_as_product.svg)

The product of the two groups presented is called the *Klein four-group* and it is the simplest *non-cyclic abelian* group. 

Another way to present the Klein four-group is the *group of symmetries of a non-square rectangle*.

![Klein four](../03_monoid/klein_four.svg)

**Task:** Show that the two representations are isomorphic.

The Klein four-group is *non-cyclic* (because there are not one, but two generators) --- vertical and horizontal spin. It is, however, still *abelian*, because the ordering of the actions still does not matter for the end result. Actually, the Klein four-group is the *smallest non-cyclic group*.

Cyclic product groups
---

Product groups are *non-cyclic*, provided that the number of elements of the groups that comprise them (or their *orders*) aren't *relatively prime* (have some GCD other than 1).

If two groups have orders that aren't relatively prime, (like for example $2$ and $2$, (which are both divided by 2) as the groups that comprise Klein four-groups), then even if the two groups are cyclic and have just 1 generator each, their product would have 2 generators.

And if you combine two groups with orders that are relatively prime, (like $2$ and $3$) the resulting group would be isomorphic to a cyclic group of the same order, as the product of $Z_3$ and $Z_2$ is isomorphic to the group $Z_6$ ($Z_3 \times Z_2 \cong Z_6$)

![Chinese reminder theorem](../03_monoid/chinese_remainder_theorem.svg)

This is a consequence of an ancient result, known as the *Chinese Remainder theorem*.

Abelian product groups
---

Product groups are *abelian*, provided that the *groups that form them* are abelian. We can see that this is true by noticing that, although there is more than one generator, each acts only on its own part of the group, and so don't interfere with any others.

Fundamental theorem of Finite Abelian groups
---

Products provide one way to create non-cyclic abelian groups --- by creating a product of two or more cyclic groups. The fundamental theory of finite abelian groups is a result that tells us that *this is the only way* to produce non-cyclic abelian groups i.e. 

> All abelian groups are either cyclic or products of cyclic groups.

We can use this law to gain intuitive understanding of the what abelian groups are, but also to test whether a given group can be broken down to a product of more elementary groups.

<!--
{% if site.distribution == 'print'%}
-->

Color-mixing monoid as a product
---

To see how can we use this theorem, let's revisit our color mixing monoid that we saw earlier. 

![color-mixing group](../03_monoid/balls_rule.svg)

As there doesn't exist a color that, when mixed with itself, can produce all other colors, the color-mixing monoid is *not cyclic*. However, the color mixing monoid *is abelian*. So according to the theorem of finite abelian groups (which is valid for monoids as well), the color-mixing monoid must be (isomorphic to) a product. 

And it is not hard to find the monoids that form it --- although there isn't one color that can produce all other colors, there are three colors that can do that --- the prime colors. This observation leads us to the conclusion that the color-mixing monoid, can be represented as the product of three monoids, corresponding to the three primary colors.

![color-mixing group as a product](../03_monoid/color_mixing_product.svg)

You can think of each color monoid as a boolean monoid, having just two states (colored and not-colored).

![Cyclic groups, forming the color-mixing group](../03_monoid/color_mixing_cyclic.svg)

Or alternatively, you can view it as having multiple states, representing the different levels of shading.

![Color-shading cyclic group](../03_monoid/cyclic_shading.svg)

In both cases the monoid would be cyclic.

<!--
{%endif%}
-->

Dihedral groups
===

Now, let's finally examine a non-commutative group --- the group of rotations *and reflections* of a given geometrical figure. It is the same as the last one, but here besides the rotation action that we already saw (and its composite actions), we have the action of flipping the figure vertically, an operation which results in its mirror image:

![Reflection of a triangle](../03_monoid/reflection.svg)

Those two operations and their composite results in a group called $Dih3$ that is not abelian (and is furthermore the *smallest* non-abelian group).

![The group of rotations and reflections in a triangle](../03_monoid/symmetry_reflection.svg)

**Task:** Prove that this group is indeed not abelian.

**Question:** Besides having two main actions, what is the defining factor that makes this and any other group non-abelian?

Groups that represent the set of rotations and reflections of any 2D shape are called *dihedral groups*.

<!--
TODO: FSM as monoids
https://faculty.uml.edu/klevasseur/ads/s-monoid-of-fsm.html
-->

Groups/monoids categorically
===

We began by defining a monoid as a set of composable *elements*. Then we saw that for some groups, like the groups of symmetries and rotations, those elements can be viewed as *actions*. And this is actually true for all other groups as well, e.g. the *red ball* in our color-blending monoid can be seen as the action of *adding the color red* to the mix, the number $2$ in the monoid of addition can be seen as the operation $+2$ etc. This observation leads to a categorical view of the theory of groups and monoids.

Currying
---

When we defined monoids, we saw that their operations are two-argument functions. And we introduced a way for representing such functions using set theory --- by uniting the two arguments into one using products. i.e. we showed that a function that accepts two arguments (say $A$ and $B$) and maps them into some result ($C$), can be thought as a mapping from the product of the sets of two arguments to the result. So $A\times B\to C$.

However, this is not the only way to represent multi-argument function set-theoretically --- there is another, equally interesting way, that doesn't rely on any data structures, but only on functions: that way is to have a function that maps the first of the two arguments (i.e. from $A$) to *another function* that maps the second argument to the final result (i.e. $B \to C$). So $A\to B \to C$. 

![(A X B) -> C) = A -> B -> C](../03_monoid/curry.svg)

The practice of transforming a function that takes a pair of objects to a function that takes just one object and returns a function that takes another one is called *currying*. 

It is achieved by a higher-order function. Here is how such a function might be implemented.

```typescript
const curry = <A, B, C> (f:(a:A, b:B) => C) => (a:A) => (b:B) => f(a, b)
```
And equally important is the opposite function, which maps a curried function to a multi-argument one, which is known as *uncurry*.

```typescript
const uncurry = <A, B, C> (f:(a:A) => (b:B) => C) => (a:A, b:B) => f(a)(b)
```

There is a lot to say about these two functions, starting from the fact that its existence gives rise to an interesting relationship between the concept of a *product* and the concept of a *morphism* in category theory, called an *adjunction*. But we will cover this later. For now, we are interested in the fact the two function representations are isomorphic, formally $A\times B\to C\cong A\to B \to C$. 

By the way, this isomorphism can be represented in terms of programming as well. It is equivalent to the statement that the following function always returns `true` for any arguments, 

```typescript
(...args) => uncurry(curry(f(...args)) === f(...args)
```

This is one part of the isomorphism, the other part is the equivalent function for curried functions.

**Task:** Write the other part of the isomorphism.

Monoid elements as functions/permutations
---

Let's take a step back and examine the groups/monoids that we covered so far in light of what we have learned. We started off by representing group operation as a function from pairs. For example, the operation of a symmetric group, (taking $Z_3$ as an example) are actions that converts two rotations to another rotation. 

![The group of rotations in a triangle - group notation](../03_monoid/symmetry_rotation_actions.svg)

Using currying, we can represent the elements of a given group/monoid as functions by uniting them to the group operation, and the group operation itself --- as functional composition. For example, the 3 elements of $Z_3$ can be seen as 3 bijective (invertable) functions from a set of 3 elements to itself (in group-theoretic context, these kinds of functions are called *permutations*, by the way).

![The group of rotations in a triangle - set notation](../03_monoid/symmetry_rotation_functions.svg)

We can do the same for the addition monoid --- numbers can be seen not as *quantities* (as in two apples, two oranges etc.), but as *operations*, (e.g. as the action of adding two to a given quantity). 

Formally, the operation of the addition monoid, that we saw above has the following type signature. 

$+: \mathbb{Z} \times \mathbb{Z} \to \mathbb{Z}$

Because of the isomorphism we presented above, this function is equivalent to the following function.

$+: \mathbb{Z} \to (\mathbb{Z} \to \mathbb{Z})$

When we apply an element of the monoid to that function (say $2$), the result is the function $+2$ that adds 2 to a given number.

$+2: \mathbb{Z} \to \mathbb{Z}$

And because the monoid operation is always a given in the context of a given monoid, we can view the element $2$ and the function $+2$ as equivalent in the context of the monoid.

$2 \cong +2$

In other words, in addition to representing the monoid elements in the set as *objects* that are combined using a function, we can represent them as *functions* themselves.

Monoid operations as functional composition
---

The functions that represent the monoid elements have the same set as source and target, or same signature, as we say (formally, they are of the type $A \to A$ for some $A$). Because of that, they all can be composed with one another, using *functional composition*, resulting in functions that *also has the same signature*.

![The group of rotations in a triangle - set notation](../03_monoid/symmetry_rotation_cayley.svg)

And the same is valid for the addition monoid --- number functions can be combined using functional composition.

$+2 \circ +3 \cong +5$

So, basically the functions that represent the elements of a monoid also form a monoid, under the operation of functional composition (and the functions that represent the elements that form a group also form a group). 

**Question:** Which are the identity elements of function groups?

**Task:** Show that the functions representing inverse group elements are also inverse.

Cayley's theorem
---

Once we learn how to represent the elements of any monoid as permutations that also form a monoid, using currying, it isn't too surprising to learn that this constructed permutation monoid is isomorphic to the original one (the one from which it is constructed --- this is a result known as the Cayley's theorem:

> Any group is isomorphic to its corresponding permutation group. 

Formally, if we use $Perm$ to denote the permutation group then $Perm(A) \cong A$ for any $A$.

![The group of rotations in a triangle --- set notation and normal notation](../03_monoid/symmetry_rotation_comparison.svg)

Or in other words, representing the elements of a group as permutations actually yields a representation of the monoid itself (sometimes called its *standard representation*). 

Cayley's theorem may not seem very impressive, but that only shows how influential it has been as a result.

<!--
{% if site.distribution == 'print'%}
-->

Interlude: Symmetric groups
---

The first thing that you have to know about the symmetric groups is that they are *not the same thing as symmetry groups*. Once we have that out of the way, we can understand what they actually are: given a natural number $n$, the symmetric group of $n$, denoted $\mathrm{S}_n$ (symmetric group of degree $n$) is the group of all possible permutations of a set with $n$ elements. The number of the elements of such groups is equal to are $1\times 2\times 3...\times n$ or $n!$ (n-factorial). 

So, for example the group $\mathrm{S}_1$ of permutations of the one-element set has just 1 element (because a 1-element set has no other functions to itself other than the identity function.

![The S1 symmetric group](../03_monoid/s1.svg)

The group $\mathrm{S}_2$, has $1 \times 2 = 2$ elements (by the way, the colors are there to give you some intuition as to why the number of permutations of a $n$-element set is $n!$).

![The S2 symmetric group](../03_monoid/s2.svg)

And with $\mathrm{S}_3$ we are already feeling the power of exponential (and even faster than exponential!) growth of the factorial function --- it has $1\times 2\times 3=6$ elements.

![The S3 symmetric group](../03_monoid/s3.svg)

Each symmetric group $\mathrm{S}_n$ contains all groups of order $n$ --- this is so, because (as we saw in the prev section) every group with $n$ elements is isomorphic to a set of permutations on the set of $n$ elements and the group $\mathrm{S}_n$ contains *all such* permutations that exist. 

Here are some examples: 
- $\mathrm{S}_1$ is isomorphic to $Z_1$, the *trivial group*, and $\mathrm{S}_2$ is isomorphic to $Z_2$ , the *boolean group*, (but no other symmetric grops are isomorphic to cycle groups)
- The top three permutations of $\mathrm{S}_3$ are isomorphic to the group $Z_3$. 

![The S3 symmetric group](../03_monoid/s3_z3.svg)

- $\mathrm{S}_3$ is also isomorphic to $Dih3$ (but no other symmetric group is isomorphic to a dihedral group)

Based on this insight, can state Cayley's theorem in terms of symmetric groups in the following way: 

> All groups are isomorphic to subgroups of symmetric groups.

**Task:** Show how the two are equivalent.

Fun fact: the study of group theory actually started by examining symmetric groups, so this theorem was actually a prerequisite for the emergence of the normal definition of groups that we all know and love (OK, at least *I* love it) --- it provided a proof that the notion described by this definition is equivalent to the already existing notion of symmetric groups.

<!--
{%endif%}
-->

Monoids as categories
---

We saw that converting the monoid's elements to actions/functions yields an accurate representation of the monoid in terms of sets and functions. 

![The group of rotations in a triangle - set notation and normal notation](../03_monoid/symmetry_rotation_set.svg)

However, it seems that the set part of the structure in this representation is kinda redundant --- you have the same set everywhere --- so, it would do it good if we can simplify it. And we can do that by depicting it as an external (categorical) diagram.

![The group of rotations in a triangle - categorical notation](../03_monoid/symmetry_rotation_external.svg)

But wait, if the monoids' underlying *sets* correspond to *objects* in category theory, then the corresponding category would have just one object. And so the correct representation would involve just one point from which all arrows come and to which they go. 

![The group of rotations in a triangle - categorical notation](../03_monoid/symmetry_rotation_category.svg)

The only difference between different monoids would be the number of morphisms that they have and the relationship between them.

The intuition behind this representation from a category-theoretic standpoint is encompassed by the law of *closure* that monoid and group operations have and that categories lack --- it is the law stating that applying the operation (functional composition) on any two objects always yields the same object, e.g. no matter how you flip a triangle, you still get a triangle. 

|                   | Categories    | Monoids   | Groups    |
| ---               | ---           | ---       | ---       |
| Associativity     | X             | X         | X         |
| Identity          | X             | X         | X         |
| Invertibility     |               |           | X         |
| Closure           |               | X         | X         |

When we view a monoid as a category, this law says that all morphisms in the category should be from one object to itself - a monoid, any monoid, can be seen as a *category with one object*. The converse is also true: any category with one object can be seen as a monoid.

Let's elaborate on this thought by reviewing the definition of a category from chapter 2.

> A category is a collection of *objects* (we can think of them as points) and *morphisms* (arrows) that go from one object to another, where:
> 1. Each object has to have the identity morphism.
> 2. There should be a way to compose two morphisms with an appropriate type signature into a third one in a way that is associative.

Aside from the little-confusing fact that *monoid objects are morphisms* when viewed categorically, this describes exactly what monoids are. 

Categories have an identity morphism for each object, so for categories with just one object, there should also be exactly one identity morphism. And monoids do have an identity object, which when viewed categorically corresponds to that identity morphism.

Categories provide a way to compose two morphisms with an appropriate type signature, and for categories with one object this means that *all morphisms should be composable* with one another. And the monoid operation does exactly that --- given any two objects (or two morphisms, if we use the categorical terminology), it creates a third.

Philosophically, defining a monoid as a one-object category corresponds to the view of monoids as a model of how a set of (associative) actions that are performed on a given object alter its state. Provided that the object's state is determined solely by the actions that are performed on it, we can leave it out of the equation and concentrate on how the actions are combined. And as per usual, the actions (and elements) can be anything, from mixing colors in paint, or adding quantities to a given set of things etc.

Group/monoid presentations
---

When we view cyclic groups/monoids as categories, we would see that they correspond to categories that (besides having just one object) also have *just one morphism* (which, as we said, is called a *generator*) along with the morphisms that are created when this morphism is composed with itself. In fact the infinite cyclic monoid (which is isomorphic to the natural numbers), can be completely described by this simple definition.

![Presentation of an infinite cyclic monoid](../03_monoid/infinite_cyclic_presentation.svg)

This is so, because applying the generator again and again yields all elements of the infinite cyclic group. Specifically, if we view the generator as the action $+1$ then we get the natural numbers.

![Presentation of an infinite cyclic monoid](../03_monoid/infinite_cyclic_presentation_elements.svg)

Finite cyclic groups/monoids are the same, except that their definition contains an additional law, stating that that once you compose the generator with itself $n$ number of times, you get identity morphism. For the cyclic group $Z_3$ (which can be visualized as the group of triangle rotations) this law states that composing the generator with itself $3$ times yields the identity morphism.

![Presentation of a finite cyclic monoid](../03_monoid/finite_cyclic_presentation.svg)

Composing the group generator with itself, and then applying the law, yields the three morphisms of $Z_3$.

![Presentation of a finite cyclic monoid](../03_monoid/finite_cyclic_presentation_elements.svg)

We can represent product groups this way too. Let's take Klein four-group as an example, The Klein four-group has two generators that it inherits from the groups that form it (which we viewed like vertical and horizontal rotation of a non-square rectangle) each of which comes with one law.

![Presentation of Klein four](../03_monoid/klein_four_presentation.svg)

To make the representation complete, we add the law for combining the two generators.

![Presentation of Klein four - third law](../03_monoid/klein_four_presentation_third_law.svg)

And then, if we start applying the two generators and follow the laws, we get the four elements.

![The elements of Klein four](../03_monoid/klein_four_presentation_elements.svg)

The set of generators and laws that defines a given group is called the *presentation of a group*. Every group has a presentation.

Interlude: Free monoids
---

We saw how picking a different selection of laws gives rise to various types of monoids. But what monoids would we get if we picked no laws at all? These monoids (we get a different one depending on the set we picked) are called *free monoids*. The word "free" is used in the sense that once you have the set, you can upgrade it to a monoid for free (i.e. without having to define anything else).

If you revisit the previous section you will notice that we already saw one such monoid. The free monoid with just one generator is isomorphic to the monoid of integers.

![The free monoid with one generator](../03_monoid/infinite_cyclic_presentation_elements.svg)

We can make a free monoid from the set of colorful balls --- the monoid's elements would be sequences of all possible combinations of the balls.

![The free monoid with the set of balls as a generators](../03_monoid/balls_free.svg)

The free monoid is a special one --- each element of the free monoid over a given set, can be converted to a corresponding element in any any other monoid that uses the same set of generators by just applying the monoid's laws. For example, here is how the elements above would look like if we apply the laws of the color-mixing monoid.

![Converting the elements of the free monoid to the elements of the color-mixing monoid](../03_monoid/balls_free_color_mixing.svg)

**Task:** Write up the laws of the color-mixing monoid.

If we put on our programmers' hat, we will see that the type of the free monoid under the set of generators T (which we can denote as `FreeMonoid<T>`) is isomorphic to the type `List<T>` (or `Array<T>`, if you prefer) and that the intuition behind the special property that we described above is actually very simple: keeping objects in a list allows you to convert them to any other structure i.e. when we want to perform some manipulation on a bunch of objects, but we don't know exactly what this manipulation is, we just keep a list of those objects until it's time to do it.

While the intuition behind free monoids seems simple enough, the formal definition is not easily written... yet, simply because we have to cover more stuff.

We understand that, being the most general of all monoids for a given set of generators, a free monoid can be converted to all of them. i.e. there exists a function from it to all of them. But what kind of function would that be? Tune in after a few chapters to find out.

