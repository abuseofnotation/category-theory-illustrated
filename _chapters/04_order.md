---
layout: default
title: Orders
---

Orders
===

Given a set of objects, there can be numerous criteria, based on which to order them, and which depend on the objects themselves - size, weight, age, alphabetical order etc.

![Balls](balls.svg)

Howevever, as mathematicians we are not interested in the *criteria* that we can use to order objects, but in the *nature of the relationship* that defines the order, of which there can be several types as well. 

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

It also means that no ties are permitted - either I am better than my grandmother at socker or she is better at it than me.

Totality
---

The last law is called totality or connexity and it mandates that all elements that belong to the order should be comparable - **a ≤ b or b ≤ a**. That is, for any two elements, one would always be "bigger" than the other. 

**NB:** By the way this law makes the reflexivity law redundant, as it is just a special case of reflexivity when **a** and **b** are one and the same object. 

![connexity](connexity.svg)

You might say that this law is not as self-evident as the rest of them - if you think about different types of real-life objects that we typically order by various criteria you would probably think of some instances where it is not valid. For example, if we aim to order all people based on soccer skills there are many ways in which we can rank a person compared to their friends their friend's friends etc. but there isn't a way to order groups of people who never played with one another.

Orders like the order of people based on their soccer skills that don't follow the totality law are called **partial orders** and they are actually much more interesting than linear orders (which are also called **total orders**, by the way). 

**Task:** Think about other orders and think about whether they are partial or total.

But before we dive into the world of partial orders, let's say a few things about the numbers.

The order of natural numbers
---

Natural numbers form a linear order under the operation **bigger or equal to** (the symbol of which we have been using in our formulas).

![numbers](numbers.svg)

In many ways they are the quintesential order - every finite order of objects is isomorphic to a subset of them - we can map the first element of that order to the number **1**, the second one to the number **2** etc (and we can do the opposite operation as well) and if we think about it, this isomorphism is actually closer to the everyday notion of order, than the one proper definition that we gave (the one defined by the laws) - when most people say that they want to order a given set of objects, they aren't thinking of establishing a *transitive, antisymmetric* and *total* relationship between them, but are rather thinking of criteria of which object comes first, which comes second etc.

![Linear order isomorphisms](linear_order_isomorphism.svg)

From the fact that any finite order of objects is isomorphic to the natural numbers, it follows that all linear orders of the same magnitude are isomorphic to one another.

**Question:** If all orders are isomorphic with one another, why do we say that numbers are the quintessential order?

So the linear order is a perfect order (it admits no ambiguities), but it is also, I think that this theorems prove it, the most *boring* order ever, when looked from a category-theoretic viewpoint - all finite linear orders are just isomorphic to the natural numbers (by the way, most infinite orders are isomorphic to the natural numbers as well, with the exception of the ones for which Cantor's diagonal argument applies) and so all their diagrams look the same.

![Linear order (general)](general_linear_order.svg)

However, this is not the case with partial orders that we will look into next.

Partial order 
===

Like linear orders, a partial orders consists of a set plus a relationship, with the only difference is that although the relationship obeys the reflexive, transitive and the antisymmetric laws, it does not obey the law of totality, that is, not all elements are necessarily ordered. I say "necessarily" because even if all elements are ordered, the partial order is still a partial order (just as a group is still a monoid) - all linear orders are also partial orders, but not the other way around (we can create an *order of orders*, based on which is more general, but we can do it later).

Partial orders
---

So let's revisit the example of the soccer players ranglist. The first version that includes just **m**yself, my **g**randmother and her **f**riend is a linear order.

![Linear soccer player order](player_order_linear.svg)

However, including this **o**ther person whom none of us played yet, makes the hierarchy non-linear.

![Soccer player order - leftover element](player_order_leftover.svg)

Before we said that all linear orders' can be represented by the same chain-like diagram. We can reverse this statement and say that all diagrams that look something different than the said diagram represent partial orders (or preorders). Let's see some examples.

Chains
---

A partial order can contain different linearly-ordered subsets, e.g. separate groups of friends who play together and are ranked based on each other, but are not ranked with anyone from other groups.

![Soccer order - two hierarchies](player_order_two.svg)

The different linear orders that make up the partial order are called *chains*. There are two chains in this diagram **M ➞ G ➞ F** and **D ➞ O**.

The chains in an order don't have to be completely disconnected from each other in order for the order to be a partial order, it is just that the connections between them shouldn't be *one-to-one* i.e. when the last element from one chain should not be connected to the first element of the other one (because this would effectively unite them into one chain). But there are other types of connections - *one-to-many* and *many-to-one*.

For example, this set is not linearly ordered. 

![Soccer order - two hierarchies and a join](player_order_two_join.svg)

Although the connection establishes the relationship between **D** and **G** (**D ≤ G**) and although the relationship between **F** and **G** is known as well (**F ≤ G**), the relationship between **D** and **F** is *not* known. Any element can be bigger than the other one.

Maximum and minimum 
---

So partial orders do not provide us with a definite answer of the question who is better at who at soccer, but in sports (as well as in other domains) people often don't care who is better than, *who is number one* i.e. the champion, the player who is better than anyone else, or more generally, the element that is bigger than any other element, which is called the *maximum element*.

In our last diagram **M** is the maximum element. In this diagram, the green element is the biggest one.

![Join diagram with one more element](join_additional_element.svg)

Sometimes we have more than one elements that are bigger than all other elements, in this case none of them are maximum.

![A diagram with no maximum element](non_maximal_element.svg)

We also may have a minimum (smallest) element, which is defined in the same way.

Joins
---

Give two elements, the smallest element that is bigger than both of them (i.e. their *least upper bound*) is called the *join* of these elements, e.g. the green element is a join of the other two. Formally the join of **A** and **B** is defined as the smallest element **C** for which **A ≤ C**, and **B ≤ C**.

![Join](join.svg)

Given any two elements in which one is bigger than the other (e.g. **A ≤ B**), the join is the bigger element (in this case **B**). In a totally ordered set, the *join* of any subset of elements is just their the *maximum* element. And, like with the maxumum element, if two elements have several upper bounds that are equally big, then none of them is a *join* (a join must be unique).

![A non-join diagram](non_join.svg)

If, however one is established as bigger than another, it immediately qualifies.

![A join diagram](non_join_fix.svg)

**Question:** Which concept in category theory reminds you of joins?

Meets
---

Given two elements, the biggest element that is smaller than both of them is called the *meet* of these elements.

![Meet](meet.svg)

The same rules as for the joins apply. 

**Question:** What is the relationship of join and meet in terms of category theory?

Interlude: Hasse diagrams
---

In this section we use what are called "Hasse diagrams", they are much like our usual diagrams, however they have an additional rule that is followed - "bigger" elements are always positioned above smaller ones. 

In terms of arrows, the rule means that if you add an arrow to a point, you the point *to* which the arrow points must always be above the one *from* which it points.

![A join diagram](hasse.svg)

This allows us to compare any two points by just seeing which one is above the other e.g. to spot the *join* of two elements, you just have to identify the ones they connect to and see which one is lowest.

Preorder
===

In the last chapter, we saw how removing the law of totality from the laws of *(linear) order* produces a different (and somewhat more interesting) structure, called *partial order*. Now let's see what will happen if we remove another one of the laws, namely the *antisymmetry* law. If you recall, the antisymmetry law mandated that you cannot have an object that is at the same time smaller and bigger than another one. (or that **a ≤ b ⟺ b ≰ a**).


| **Total order**   | reflexive | transitive | antisymmetric | total | Either **a ≤ b** or **b ≤ a**
| **Partial order** | reflexive | transitive | antisymmetric | ~~total~~ | Either **a ≤ b** or **b ≤ a** or they are unrelated.
| **Preorder** | reflexive | transitive | ~~antisymmetric~~ | ~~total~~ | Both **a ≤ b** and **b ≤ a** are possible.

This results in something called a preorder which is not exactly an order, as it can have arrows coming from any point to any other: if a partial order can be used to model who is better at who in soccer, then a preorder can be used to model who has beaten who, either directly (by playing him) or indirectly.

![preorder](preorder.svg)

Preorders have just one law - transitivity **a ≤ b and b ≤ c ➞ a ≤ c** (two, if we count reflexivity). The part about the indirect wins is a result of this law. Due to it, all indirect wins (ones that are wins not against the player directly, but against someone who had beat them) are added as a direct result of its application, as seen here (we show indirect wins in lighter tone). 

![preorder in sport](preorder_sports.svg)

And as a result of that, all "circle" relationships (e.g. where you have a weaker player beating a stronger one) result in just a bunch of objects that are all connected to one another, due to which, we can convert the preorder into partial order, by grouping all objects that have arrows to one another in sets and then create an order from those sets (they are called *equivalence classes*, by the way).

![preorder](preorder_equivalence.svg)

All of that structure arizes naturally from the simple law of transitivity.

![Transitivity](transitivity.svg)


Orders as categories
===

Now let's look at transitivity law again, but from a different perspective. What it tells us that if we have two pairs of relationship **a ≤ b** and **b ≤ c**, then we automatically have a third one **a ≤ c**. In other words, it tells us that the **≤** relationship composes i.e. if we view the "bigger than" relationship as a morphism we would see that it fits the categorical definition of composition. 

![Transitivity as functional composition](transitivity_composition.svg)

(we have to also verify that the relation is associative, but that's easy)

What about that other law that was required in order to be a category - the identity law? We have it too, under the name *reflexivity*.

![Reflexivity](reflexivity.svg)

So it's official - preoders are categories. And since partial orders and total orders are preorders too (as they obey those two laws), they are categories as well.

Starting to compare the categories of preorders, and partial and linear orders to other categories, like the (quintessential) category of sets, immediately sets them apart. In other categories there can be *many different morphisms (arrows)* between two objects and in orders can have *at most one morphism*. That is, for two objects **a** **b** we either we have **a ≤ b** or we do not. 

![Orders compared to other categories](arrows_one_arrow.svg)

That is in the contrast with the category of sets where there are potentially inifinite amount of functions from, say, the set of integers and the set of boolean values, as well as a lot of functions that go the other way around, and the existence of either of these functions does not imply that one set is "bigger" than the other one.

![Orders compared to other categories](order_category.svg)

Products and sums
---

While we are rehashing diagrams from the previous chapters, let's look at the diagram defining the *sum* of two objects in a category

![Joins as coproduct](coproduct_morphisms.svg)


The set inclusion order
===

Do some sets form some kind of order as established by the functions between them? 


Let's revisit our color-mixing monoid and create a color-mixing poset

![A color mixing poset](color_mixing_poset.svg)

Lattices
---

The poset N+ under the divisibility ordering is a lattice!
Indeed, it turns out that the meet operation corresponds
to greatest common divisor and the join operation corresponds to least common multiple.


Logic
===
