<!--
---
layout: default
title: Orders
---
-->

Orders
===

This chapter is about order (not as "Law and order", but as "alphabetical ordered") and about its mathematical qualities. 

Given a set of objects, there can be numerous criteria, based on which to order them, and which depend on the objects themselves.

![Balls](balls.svg)

Howevever, as mathematicians we are not interested in the *criteria* that we can use to order objects, but in the *nature of the relationship* that defines the order, of which there can be several types.

Linear order
===

The most straightforward type of order that you think about is linear order, one in which every object has its place depending on every other object, i.e. the ordering criteria is completely deterministic and leaves no room for ambiguity. For example, ordering the colors by the length of their waves (or by how they appear in the rainbow).

![Linear order](linear_order.svg)

In most programming languages, we can order objects lineary by providing a function which, given two objects, outputs us which one of them is "bigger" (comes first) than the other.

```
[1, 3, 2].sort((a, b) => { 
  if (a > b) {
    return true 
  } else {
    return false
  } 
})
```

But in order for such function to really define an order (e.g. give the same output every time, independent of how were the objects shuffled initially), it has to obey several rules. Incidentally, (or rather not incidentally at all), these rules are nearly equivalent to the mathematical laws that define what an order is.

So let's define order formally - an order is defined by a *set*, any set and by a *relationship* between pairs of elements in that set, where the relationship has to obey the following laws.

Reflexivity 
---

Let's get the most boring law out of the way - each object has to be bigger or equal to itself, or **a ≤ a** (the relationship between elements in an order is commonly denoted as **≤** in formulas, but it can also be represented with a simple arrow from first object to the second). 

![Reflexivity](reflexivity.svg)

No special reason for this law to be so, except that the "base case" should be covered somehow. 

We can formulate it the opposite way too and say that each object should *not* have the relationship to itself, in which case we would have a relation than resembles *bigger than*, as opposed to *bigger or equal to* and also a different type of order (sometimes called a **strict** order).

Transitivity
---

The second law is maybe the least obvious, (but probably the most essential) - it states that if one object one bigger than object two, it is automatically bigger than all objects that are smaller than object two or **a ≤ b and b ≤ c ➞ a ≤ c**`. 

![Transitivity](transitivity.svg)

This is the law that to a large extend defines what an order is: if I am better at playing soccer than my grandmother, then I would also be better at it than my grandmother's friend, whom she beats, otherwise I wouldn't really be better at her.

Antisymmetry
---

The third law is called antisymmetry and it states that the function that defines the order should not give contradictory results (**a ≤ b ⟺ b ≰ a**). 

![antisymmetry](antisymmetry.svg)

Also it means that no ties are permitted - either I am better than my grandmother ot socker or she is better at it than me.

Connexity
---

The last law is called connexity, or totality and it mandates that all elements that belong to the order should be comparable - **a ≤ b or b ≤ a**. That is, for any two elements, one would always be "bigger" than the other. 

**NB:** By the way this law makes the reflexivity law redundant, as it is just a special case of reflexivity when **a** and **b** are one and the same object. 

![connexity](connexity.svg)

You might say that this law is not as self-evident as the rest of them - if you think about different types of real-life objects that we typically order by various criteria you would probably think of some instances where it is not valid. For example, if we aim to order all people based on soccer skills there are many ways in which we can rank a person compared to their friends their friend's friends etc. but there isn't a way to order groups of people who never played with one another.

Orders like the order of people based on their soccer skills that don't follow the connexity law are called **partial orders** and they are actually much more interesting than linear orders (which are also called **total orders**, by the way). 

**Task:** Think about other orders and think about whether they are partial or total.

But before we dive into the world of partial orders, let's say a few things about the numbers.

The order of natural numbers
---

Natural numbers form a linear order under the operation **bigger or equal to** (the symbol of which we have been using in our formulas).

![numbers](numbers.svg)

In many ways they are the quintisential order - every finite order of objects is isomorphic to a subset of them - we can map the first element of that order to the number **1**, the second one to the number **2** etc (and we can do the opposite operation as well) and if we think about it, this isomorphism is actually closer to the everyday notion of order, than the one proper definition that we gave (the one defined by the laws) - when most people say that they want to order a given set of objects, they aren't thinking of establishing a *transitive, antisymmetric* and *total* relationship between them, but are rather thinking of criteria of which object comes first, which comes second etc.

![Linear order isomorphisms](linear_order_isomorphism.svg)

From the fact that any finite order of objects is isomorphic to the natural numbers, it follows that all linear orders of the same magnitude are isomorphic to one another.

**Question:** If all orders are isomorphic with one another, why do we say that numbers are the quintissential order?

So the linear order is a perfect order (it admints no ambiguities), but it is also, I think that this theorems proove it, the most *boring* order ever, when looked from a category-theoretic viewpoint - all finite linear orders are just isomorphic to the natural numbers (by the way, most infinite orders are isomorphic to the natural numbers as well, with the exception of the ones for which Cantor's diagonal argument applies) and so all their diagrams look the same.

![Linear order (general)](general_linear_order.svg)

However, this is not the case with partial orders that we will look into next.

Partial order 
===

Like linear orders, a partial orders consists of a set plus a relationship, with the only difference is that although the relationship obeys the reflexive, transitive and the anti-symmetric laws, it does not obey the law of totality, that is, not all elements are necessarily ordered. I say "necessarily" because even if all elements are ordered, the partial order is still a partial order (just as a group is still a monoid) - all linear orders are also partial orders, but not the other way around (we can create an *order of orders*, based on which is more general, but we can do it later).

So let's revisit the example of the soccer players ranglist. The first version that includes just **m**yself, my **g**randmother and her **f**riend is a linear order.

![Linear soccer player order](player_order_linear.svg)

But suppose that I have a friend that I want to include in this hierarchy, then it becomes non-linear.

![Soccer order - leftover element](player_order_leftover.svg)

I can have a whole group of friends that play with each other and are ordered lineary, but as long as we haven't played with them, then the relationship remains non-linear (the different linear orders that make up the partial order are called *chains*, by the way).

![Soccer order - two hierarchies](player_order_two.svg)

The chains don't have to be completely disconnected in order for the order to be partial, as a matter of fact some of the most interesting orders feature elements that we call *meet* / *join*, that are are known to be biggger/smaller than two elements from two separate chains.

![Soccer order - two hierarchies and meet](player_order_two_meet.svg)

Order as sets
---

Preorder
===

Equivalence relation
===

Lattices
===

Logic
===
