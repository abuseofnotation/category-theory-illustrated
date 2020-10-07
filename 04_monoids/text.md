Monoids etc.

===

Since we are done with categories, let's look at some other structures that are also interesting - monoids. Like categories, monoids/groups are also abstract systems consisting of objects and rules for manipulating these objects. 

What are monoids
===

Monoids are simpler than categories. A monoid is defined by a collection (set) of objects and an operation that allows us to combine two objects and produce a third one of the same kind.

The monoid operation
---

Let's take our familiar colourful balls.

[Balls](balls.svg)

In this case a monoid would be a rule (operation) for "combining" two balls into one where the rule should (like functional composition) be "associative" i.e. applying it on the same number of elements in a different order should make no difference.

An example of such rule would be blending the colors of the balls, as if we are mixing paint.

[A rule for combining balls](balls_rule.svg)

You can probably think of other ways to define such a rule. This will help you realize that there can be many ways to create a monoid from the same set of items. The monoid is not the set itself, it is the set *together with the rule*.

The identity element
---

Actually, not any (associative) rule for combining elements makes them form a monoid (it makes them form a "semigroup", which is also a thing, but I won't go into that). In order to be a monoid, a collection must feature what is called an "identity element" of a given rule (or a zero element, if you prefer) - one that dissapears when combined with other element. So the identity element **i** is such that when you combine any element with the identity element, the result would be that element (not the identity but the other one). Or simply **x • i = x and i • x = x for any x**. In the case of our color-mixing monoid the identity element is the white ball.

[The identity element of the color-mixing monoid](balls_identity.svg) 

If you remember from the last chapter that functional composition is also associative and that it also contains an identity element, you might start suspecting that it forms a monoid in some way, and that is really the case (if this book were a whodunit pulp fiction, it would be a really bad one) We will go into more details later.

Some basic examples
===

Monoids from numbers
---

Mathematics is not all about numbers, but you can numbers do pop in in most areas of mathematics and monoids are no exception. The set of natural numbers *N* form a monoid, when combined with the all to familiar operation of addition.

[The monoid of numbers under addition](numbers_addition.svg)

The natural numbers also form a monoid under multiplication (this is another way of saying it).

[The monoid of numbers under multiplication](numbers_multiplication.svg)

To get the correct intuition about monoids, it's best to think of numbers not as quantities, but as operations, e.g. **+ 1** ** x 1** etc.

**Task:** Which are the identity elements of those monoids?

**Task:** Go through other mathematical operations and figure out why don't they are not monoidal.

Monoids from boolean operations
---

Thinking about other operations that we have covered (operation being a function which takes a pair of element of a given type and returns one element of the same type), we may remember the boolean operations **AND** and **OR**. which operate on the set, consisting of just two values **{ True, False }**. Those operations form monoids too.

Do those operations form monoids? Proving that they do is easy enough by just ennumerating all cases. 

We can prove that **AND** is associative by expanding the formula **(A AND B) AND C = A AND (B AND C)** in all possible ways:

**(TRUE AND FALSE) AND TRUE = TRUE AND (FALSE AND TRUE)**
**(TRUE AND FALSE) AND FALSE = TRUE AND (FALSE AND FALSE)**
**(FALSE AND FALSE) AND TRUE = FALSE AND (FALSE AND TRUE)**
...

And we can prove that **TRUE** is the identity element by expanding the other formulas that state that for all elements **A** **I AND A = A**

**FALSE AND TRUE = FALSE**
**TRUE AND TRUE = TRUE**

...and then do the same for **A AND I = A**.

In general, we can use monoids and related structures as a way to model how a set of (associative) actions that are performed on a given object (or objects) alter it's state. We can do that provided that the object's state is determined solemnly by the actions that are performed on it - this allows us to leave the object out of the equation and concentrate on how the actions are combined. 

As per usual in the abstract algebra, the actions (and objects) can be anything, from mixing colors in paint, or adding a quantities to a given set of things.

Other related structures
===

Monoid actions obey only one rule - they are associative (two if you count the existance of the identity element). In some cases we come across actions that obey other rules that are also interesting. Imposing more (or less) rules to the way in which actions are combinded results in the definition of other monoid-like structures.

Commutative monoids 
---

Monoids reflect the fact that sometimes the order in which the actions are performed might change the outcome. But sometimes action order does not matter i.e. combining a given set of actions yields the same result no matter which one is first and which one is second. Those operation are called commutative operations. A nice example of this is the addition of quantities - it does not matter whether if I have given you 1 apple and then 2 more, or if I have given you 2 first and then 1 more i.e. **x + y = y + x**.

Monoids with operations that are commutative are called *commutative monoids*. All monoids that we examined so far are also *commutative*. 

[Commutative monoid operation](monoid_commutative.svg)

s we discussed, not all monoids are commutative, and we will see some non-commutative ones later.

Groups
---

Monoids don't have any rules related to when (and if) a given set of action would result in the object going back in a previous step, i.e. monoid actions are onse that cannot be undone.

 A group is just a monoid in which each element has what is called an "inverse" element where the element and its inverse cancel each other out when applied one after the other, in other words , **forall x, there must exist x' such that x • x' = i** ( where **i** is the identity element).

An nice example of a group can be found in the realm of numbers (really, numbers are a nice example of almost all properties) - it is the set of integers under addition, where the inverse of each number is its opposite number. The above formula, then, becomes **x + (-x) = 0**

The study of groups is a field that is much bigger than the theory of monoids (and perhaps bigger than category theory itself).

Categories
---
A 

Some more advanced examples
===

The trivial monoid
---
Peano arithmetic

Symmetry monoids
---

An interesting set of groups/monoids (which doesn't look like one at first is) are the groups of symmetries of some object

Monoids as categories 
===

The free monoid.
===

