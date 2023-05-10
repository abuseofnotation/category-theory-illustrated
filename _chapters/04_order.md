---
layout: default
title: Orders
---

Orders
===

Given a set of objects, there can be numerous criteria, based on which to order them (depending on the objects themselves) --- size, weight, age, alphabetical order etc.

However, currently we are not interested in the *criteria* that we can use to order objects, but in the *nature of the relationships* that define order. Of which there can be several types as well. 

Mathematically, the order as a construct is represented (much like a monoid) by two two components. 

One is a *set of things* (e.g. colorful balls) which we sometimes call the order's *underlying set*.

![Balls](../04_order/balls.svg)

And the other is a *binary relation* between these things, which are often represented as arrows.

![Binary relation](../04_order/binary_relation.svg)

Not all binary relationships are orders --- only ones that fit certain criteria that we are going to examine as we review the different types of order.

Linear order
===

Let's start with an example --- the most straightforward type of order that you think og is *linear order* i.e. one in which every object has its place depending on every other object. In this case the ordering criteria is completely deterministic and leaves no room for ambiguity in terms of which element comes before which. For example, order of colors, sorted by the length of their light-waves (or by how they appear in the rainbow).

![Linear order](../04_order/linear_order.svg)

Using set theory, we can represent this order, as well as any other order, as a cartesian products of the order's underlying set with itself.

![Binary relation as a product](../04_order/binary_relation_product.svg)

And in programming, orders are defined by providing a function which, given two objects, tells us which one of them is "bigger" (comes first) and which one is "smaller". It isn't hard to see that this function is actually a definition of a cartesian product.

```
[1, 3, 2].sort((a, b) => { 
  if (a > b) {
    return true 
  } else {
    return false
  } 
})
```

However (this is where it gets interesting) not all such functions (and not all cartesian products) define orders. To really define an order (e.g. give the same output every time, independent of how the objects were shuffled initially), functions have to obey several rules. 

Incidentally, (or rather not incidentally at all), these rules are nearly equivalent to the mathematical laws that define the criteria of the order relationship i.e. those are the rules that define which element can point to which. Let's review them.

Reflexivity 
---

Let's get the most boring law out of the way --- each object has to be bigger or equal to itself, or $a ≤ a$ for all $a$ (the relationship between elements in an order is commonly denoted as $≤$ in formulas, but it can also be represented with an arrow from first object to the second.)

![Reflexivity](../04_order/reflexivity.svg)

Thre is no special reason for this law to exist, except that the "base case" should be covered somehow. 

We can formulate it the opposite way too and say that each object should *not* have the relationship to itself, in which case we would have a relation than resembles *bigger than*, as opposed to *bigger or equal to* and a slightly different type of order, sometimes called a *strict* order.

Transitivity
---

The second law is maybe the least obvious, (but probably the most essential) --- it states that if object $a$ is bigger than object $b$, it is automatically bigger than all objects that are smaller than $b$ or $a ≤ b \land b ≤ c \to a ≤ c$. 

![Transitivity](../04_order/transitivity.svg)

This is the law that to a large extend defines what an order is: if I am better at playing soccer than my grandmother, then I would also be better at it than my grandmother's friend, whom she beats, otherwise I wouldn't really be better than her.

Antisymmetry
---

The third law is called antisymmetry. It states that the function that defines the order should not give contradictory results (or in other words you have $x ≤ y$ and $y ≤ x$ only if $x = y$). 

![antisymmetry](../04_order/antisymmetry.svg)

It also means that no ties are permitted --- either I am better than my grandmother at soccer or she is better at it than me.

Totality
---

The last law is called *totality* (or *connexity*) and it mandates that all elements that belong to the order should be *comparable* ($a ≤ b \lor b ≤ a$). That is, for any two elements, one would always be "bigger" than the other. 

By the way, this law makes the reflexivity law redundant, as reflexivity is just a special case of totality when $a$ and $b$ are one and the same object, but I still want to present it for reasons that will become apparent soon.

![connexity](../04_order/connexity.svg)

Actually, here are the reasons: this law does not look so "set in stone" as the rest of them i.e. we can probably think of some situations in which it does not apply. For example, if we aim to order all people based on soccer skills there are many ways in which we can rank a person compared to their friends their friend's friends etc. but there isn't a way to order groups of people who never played with one another.

Orders, like the order people based on their soccer skills, that don't follow the totality law are called *partial orders*, (and linear orders are also called *total orders*.)

**Question:**  Previously, we covered a relation that is pretty similar to this. Do you remember it? What is the difference?

**Task:** Think about some orders that you know about and figure out whether they are partial or total.

Partial orders are actually much more interesting than linear/total orders. But before we dive into them, let's say a few things about numbers.

The order of natural numbers
---

Natural numbers form a linear order under the operation *bigger or equal to* (the symbol of which we have been using in our formulas.)

![numbers](../04_order/numbers.svg)

In many ways, numbers are the quintessential order --- every finite order of objects is isomorphic to a subset of the order of numbers, as we can map the first element of any order to the number $1$, the second one to the number $2$ etc (and we can do the opposite operation as well).

If we think about it, this isomorphism is actually closer to the everyday notion of a linear order, than the one defined by the laws --- when most people think of order, they aren't thinking of a *transitive, antisymmetric* and *total* relation, but are rather thinking about criteria based on which they can decide which object comes first, which comes second etc. So it's important to notice that the two are equivalent.

![Linear order isomorphisms](../04_order/linear_order_isomorphism.svg)

From the fact that any finite order of objects is isomorphic to the natural numbers, it also follows that all linear orders of the same magnitude are isomorphic to one another.

So, the linear order is simple, but it is also (and I think that this isomorphism proves it) the most *boring* order ever, especially when looked from a category-theoretic viewpoint --- all finite linear orders (and most infinite ones) are just isomorphic to the natural numbers and so all of their diagrams look the same way.

![Linear order (general)](../04_order/general_linear_order.svg)

However, this is not the case with partial orders that we will look into next.

<!--TODO Cantor's theorem -->

Partial order 
===

Like a linear order, a partial order consists of a set plus a relation, with the only difference that, although it still obeys the *reflexive, transitive* and the *antisymmetric* laws, the relation does not obey the law of *totality*, that is, not all of the sets elements are necessarily ordered. I say "necessarily" because even if all elements are ordered, it is still a partial order (just as a group is still a monoid) --- all linear orders are also partial orders, but not the other way around. We can even create an *order of orders*, based on which is more general.

Partial orders are also related to the concept of an *equivalence relations* that we covered in chapter 1, except that *symmetry* law is replaced with *antisymmetry*.

If we revisit the example of the soccer players rank list, we can see that the first version that includes just **m**yself, my **g**randmother and her **f**riend is a linear order.

![Linear soccer player order](../04_order/player_order_linear.svg)

However, including this **o**ther person whom none of us played yet, makes the hierarchy non-linear i.e. a partial order.

![Soccer player order - leftover element](../04_order/player_order_leftover.svg)

This is the main difference between partial and total orders --- partial orders cannot provide us with a definite answer of the question who is better than who. But sometimes this is what we need --- in sports, as well as in other domains, there isn't always an appropriate way to rate people linearly. 

Chains
---

Before, we said that all linear orders can be represented by the same chain-like diagram, we can reverse this statement and say that all diagrams that look something different than the said diagram represent partial orders. An example of this is a partial order that contains a bunch of linearly-ordered subsets, e.g. in our soccer example we can have separate groups of friends who play together and are ranked with each other, but not with anyone from other groups.

![Soccer order - two hierarchies](../04_order/player_order_two.svg)

The different linear orders that make up the partial order are called *chains*. There are two chains in this diagram $m \to g \to f$ and $d \to o$.

The chains in an order don't have to be completely disconnected from each other in order for it to be partial. They can be connected as long as the connections are not all *one-to-one* i.e. ones when the last element from one chain is connected to the first element of the other one (this would effectively unite them into one chain.) 

![Soccer order - two hierarchies and a join](../04_order/player_order_two_join.svg)

The above set is not linearly-ordered. This is because, although we know that $d ≤ g$ and that $f ≤ g$, the relationship between $d$ and $f$ is *not* known --- any element can be bigger than the other one.

Greatest and least objects
---

Although partial orders don't give us a definitive answer to "Who is better than who?", some of them still can give us an answer to the more important question (in sports, as well as in other domains), namely "Who is number one?" i.e. who is the champion, the player who is better than anyone else. Or, more generally, the element that is bigger than all other elements. 

We call such element the *greatest element*. Some (not all) partial orders do have such element --- in our last diagram $m$ is the greatest element, in this diagram, the green element is the biggest one.

![Join diagram with one more element](../04_order/join_additional_element.svg)

Sometimes we have more than one elements that are bigger than all other elements, in this case none of them is the greatest.

![A diagram with no greatest element](../04_order/non_maximal_element.svg)

In addition to the greatest element, a partial order may also have a least (smallest) element, which is defined in the same way.

Joins
---

The *least upper bound* of two elements that are connected as part of an order is called the *join* of these elements, e.g. the green element is a join of the other two. 

![Join](../04_order/join.svg)

There can be multiple elements bigger than $a$ and $b$ (all elements that are bigger than $c$ are also bigger than $a$ and $b$), but only one of them is a join. Formally, the join of $a$ and $b$ is defined as the smallest element that is bigger than both $a$ and $b$ (i.e. smallest $c$ for which $a ≤ c$, and $b ≤ c$.)

![Join with other elements](../04_order/join_other_elements.svg)

Given any two elements in which one is bigger than the other (e.g. $a ≤ b$), the join is the bigger element (in this case $b$). 

In a linear orders, the *join* of any two elements is just the bigger element.

Like with the greatest element, if two elements have several upper bounds that are equally big, then none of them is a *join* (a join must be unique).

![A non-join diagram](../04_order/non_join.svg)

If, however, one of those elements is established as smaller than the rest of them, it immediately qualifies.

![A join diagram](../04_order/non_join_fix.svg)

**Question:** Which concept in category theory reminds you of joins?

Meets
---

Given two elements, the biggest element that is smaller than both of them is called the *meet* of these elements.

![Meet](../04_order/meet.svg)

The same rules as for the joins apply. 

Hasse diagrams
---

The diagrams that we use in this section are called "Hasse diagrams" and they work much like our usual diagrams, however they have an additional rule that is followed --- "bigger" elements are always positioned above smaller ones. 

In terms of arrows, the rule means that if you add an arrow to a point, the point *to* which the arrow points must always be above the one *from* which it points.

![A join diagram](../04_order/hasse.svg)

This arrangement allows us to compare any two points by just seeing which one is above the other e.g. we can determine the *join* of two elements, by just identifying the elements that they connect to and see which one is lowest.


Color order
---

We all know many examples of total orders (any form of chart or ranking is a total order), but there are probably not so many obvious examples of partial orders that we can think of off the top of our head. So let's see some. This will gives us some context, and will help us understand what joins are.

To stay true to our form, let's revisit our color-mixing monoid and create a *color-mixing partial order* in which all colors point to colors that contain them.

![A color mixing poset](../04_order/color_mixing_poset.svg)

If you go through it, you will notice that the join of any two colors is the color that they make up when mixed. Nice, right?

![Join in a color mixing poset](../04_order/color_mixing_poset_join.svg)

Numbers by division
---

We saw that when we order numbers by "bigger or equal to", they form a linear order (*the* linear order even.) But numbers can also form a partial order, for example they form a partial order if we order them by which divides which, i.e. if $a$ divides $b$, then $a$ is before $b$ e.g. because $2 \times 5 = 10$, $2$ and $5$ come before $10$ (but $3$, for example, does not come before $10$.)

![Divides poset](../04_order/divides_poset.svg)

And it so happens (actually for very good reason) that the join operation again corresponds to an operation that is relevant in the context of the objects --- the join of two numbers in this partial order is their *least common multiple*. 

And the *meet* (the opposite of join) of two numbers is their *greatest common divisor*.

![Divides poset](../04_order/divides_poset_meet.svg)

Inclusion order
---

Given a collection of all possible sets containing a combination of a given set of elements...

![A color mixing poset, ordered by inclusion](../04_order/color_mixing_poset_inclusion_subsets.svg)

...we can define what is called the *inclusion order* of those sets, in which $a$ comes before $b$ if $a$ *includes* $b$, or in other words if $b$ is a *subset* of $a$.

![A color mixing poset, ordered by inclusion](../04_order/color_mixing_poset_inclusion.svg)

In this case the *join* operation of two sets is their *union*, and the *meet* operation is their set *intersection*.

This diagram might remind you of something --- if we take the colors that are contained in each set and mix them into one color, we get the color-blending partial order that we saw earlier.

![A color mixing poset, ordered by inclusion](../04_order/color_mixing_poset_blend.svg)

The order example with the number dividers is also isomorphic to an inclusion order, namely the inclusion order of all possible sets of *prime* numbers, including repeating ones (or alternatively the set of all *prime powers*). This is confirmed by the fundamental theory of arithmetic, which states that every number can be written as a product of primes in exactly one way.

![Divides poset](../04_order/divides_poset_inclusion.svg)

Order isomorphisms
---

We mentioned order isomorphisms several times already so this is about time to elaborate on what they are. Take the isomorphism between the number partial order and the prime inclusion order as an example. Like an isomorphism between any two sets, it is comprised of two functions: 

- One function from the prime inclusion order, to the number order (which in this case is just the *multiplication* of all the elements in the set) 
- One function from the number order to the prime inclusion order (which is an operation called *prime factorization* of a number, consisting of finding the set of prime numbers that result in that number when multiplied with one another). 

![Divides poset](../04_order/divides_poset_isomorphism.svg)

When we talk about sets, an isomorphism means just a reversible function. But as orders, besides having their underlying sets, have the arrows that connect them, there is an additional requirement for a pair of functions to form an isomorphism --- to be an isomorphism, a function has to *respect those arrows*, in other words it should be *order preserving*. More specifically, applying the function (let's call it F) to any two elements in one set ($a$ and $b$) should result in two elements that have the same corresponding order in the other set (so $a ≤ b$ only if $F(a) ≤ F(b)$). 

Birkhoff's representation theorem
---

So far, we saw two different partial orders, one based on color mixing, and one based on number division, that can be represented by the inclusion orders of all possible combinations of sets of some *basic elements* (the primary colors in the first case, and the prime numbers (or prime powers) in the second one.) Many other partial orders can be defined in this way. Which ones exactly, is a question that is answered by an amazing result called *Birkhoff's representation theorem*. They are the *finite* partial orders that meet the following two criteria: 

1. All elements have *joins* and *meets*.
2. Those *meet* and *join* operations *distribute* over one another, that is if we denote joins as meets as  $∨$ or $∧$, then $x ∨ (y ∧ z) = (x ∨ y) ∧ (x ∨ z)$.


The partial orders that meet the first criteria are called *lattices*. The ones that meet the second one are called distributive lattices.

And the "prime" elements which we use to construct the inclusion order are the elements that are not the *join* of any other elements. They are also called *join-irreducible* elements.

By the way, the partial orders that are *not* distributive lattices are also isomorphic to inclusion orders, it is just that they are isomorphic to inclusion orders that *do not contain all possible combinations* of elements.

Lattices
===

We will now review the orders for which Birkhoff's theorem applies i.e. the *lattices*. Lattices are partial orders, in which every two elements have a *join* and a *meet*. So every lattice is also partial order, but not every partial order is a lattice (we will see even more members of this hierarchy). 

Most partial orders that are created based on some sort of rule are distributive lattices, like for example the partial orders from the previous section are also distributive lattices when they are drawn in full, for example the color-mixing order.

![A color mixing lattice](../04_order/color_mixing_lattice.svg)

Notice that we added the black ball at the top and the white one at the bottom. We did that because otherwise the top three elements wouldn't have a *join* element, and the bottom three wouldn't have a *meet*.

Bounded lattices
---

Our color-mixing lattice, has a *greatest element* (the black ball) and a *least element* (the white one). Lattices that have a least and greatest elements are called *bounded lattices*. It isn't hard to see that all finite lattices are also bounded.

**Task:** Prove that all finite lattices are bounded.

{% if site.distribution == 'print' %}

Interlude --- semilattices and trees
---

Lattices are partial orders that have both *join* *and* *meet* for each pair of elements. Partial orders that just have *join* (and no *meet*), or just have *meet* and no *join* are called *semilattices*. More specifically, partial orders that have *meet* for every pair of elements are called *meet-semilattices*.

![Semilattice](../04_order/semilattice.svg)

A structure that is similar to a semilattice (and probably more famous than it) is the *tree*.

![Tree](../04_order/tree.svg)

The difference between the two is small but crucial:  in a tree, each element can only be connected to just one other element (although it can have multiple elements connected *to* it). If we represent a tree as an inclusion order, each set would "belong" in only one superset, whereas with semilattices there would be no such restrictions.

![Tree and semilattice compared](../04_order/semilattice_tree.svg)

<!-- TODO add a similar diagram for posets and total orders -->

A good intuition for the difference between the two is that a semilattice is capable of representing much more general relations, so for example, the mother-child relation forms a tree (a mother can have multiple children, but a child can have *only one* mother), but the "older sibling" relation forms a lattice, as a child can have multiple older siblings and vise versa.

Why am I speaking about trees? It's because people tend to use them for modelling all kinds of phenomena and to imagine everything a a tree. The tree is the structure that all of us undestand, that comes at us naturally, without even realizing that we are using a structure --- most human-made hierarchies are modelled as trees. A typical organization of people are modelled as trees - you have one person at the top, a couple of people who report to them, then even more people that report to this couple of people.

![Tree](../04_order/tree-organization.svg)

(Contrast this with informal social groups, in which more or less everyone is connected to everyone else.)
 
And, cities (ones that are designed rather than left to evolve naturally) are also modelled as trees: you have several neighbourhoods each of which has a school, a department store etc., connected with to each other and (in bigger cities) organized into bigger living units.

The implications of the tendency to use trees, as opposed to lattices, to model are examined in the ground-breaking essay “A City is Not a Tree” by Christopher Alexander.

> In simplicity of structure the tree is comparable to the compulsive desire for neatness and order that insists the candlesticks on a mantelpiece be perfectly straight and perfectly symmetrical about the center. The semilattice, by comparison, is the structure of a complex fabric; it is the structure of living things, of great paintings and symphonies. 

In general, it seems that hierachies that are specifically designed by *people*, such as cities tend to come up as trees, whereas hierarchies that are natural, such as the hierarchy of colors, tend to come be lattices.

{%endif%}

Interlude: Formal concept analysis
===

In the previous section we (along with Christopher Alexander) argued that lattice-based hierarchies are "natural", that is, they arize in nature. Now we will see a way to uncover such hierarchies given a set of objects that share some attributes. This is an overview of a mathematical method, called *formal context analysis*.

The datastructure that we will be analysing, called *formal context* consists of 3 sets. Firstly, the set containing all *objects* that we will be analysing (denoted as $G$).

![Formal concept analysis - function](../04_order/concept-objects.svg)

Secondly, a set of some *attributes* that these objects might have (denoted as $M$). Here we will be using the the 3 base colors.

![Formal concept analysis - function](../04_order/concept-attributes.svg)

And finally a set of relation (called *incidence*) that expresses which objects have which attributes, expressed by a set of pairs $G × M$. So, having a pair containing the color yellow, for example, indicate that the color of the ball contains the color yellow.

![Formal concept analysis - function](../04_order/concept-incidense.svg)

Now let's use these sets to build a lattice. First step: because functions are relations, the set of pairs is isomorphic to a function, connecting each attributes with the set of objects that share this attribute.

![Formal concept analysis - function](../04_order/concept-function.svg)

Now, if we look at the target of this function, we see some sets that might share some common elements. Is there some way to order those sets? Of course - we can order them by inclusion, and, if we add top and bottom values, we get a lattice.

![Formal concept analysis - function](../04_order/concept-lattice.svg)

Ordering the concept as a lattice might help us see connections between the concepts, in the context e.g. we see that *all balls that contain the color yellow also contain the color red.*

**Task:** Take a set of object and one containing attributes and create your own concept lattice. Example: the objects can be lifeforms: fish, frog, dog, water weed, corn etc. and attributes can be their characteristics: "lives in water", "lives in land", "can move", "is a plant", "is an animal" etc. 

Preorder
===

In the previous section, we saw how removing the law of *totality* from the laws of (linear) order produces a different (and somewhat more interesting) structure, called *partial order*. Now let's see what will happen if we remove another one of the laws, namely the *antisymmetry* law. If you recall, the antisymmetry law mandated that you cannot have an object that is at the same time smaller and bigger than another one. (or that $a ≤ b ⟺ b ≰ a$).

| | Linear order | Partial order | Preorder |
| | $a ≤ b$ or $b ≤ a$ | $a ≤ b$ or $b ≤ a$ or neither |  $a ≤ b$ or $b ≤ a$ or neither or both | 
|---| ---             | ---        |
|Reflexivity| X | X | X |
|Transitivity| X | X | X |
|Antisymmetry | X | X  |  |
|Totality | X | | |

The result is a structure called a *preorder* which is not exactly an order --- it can have arrows coming from any point to any other: if a partial order can be used to model who is better than who at soccer, then a preorder can be used to model who has beaten who, either directly (by playing him) or indirectly.

![preorder](../04_order/preorder.svg)

Preorders have just one law --- *transitivity* $a ≤ b \land b ≤ c \to a ≤ c$ (two, if we count *reflexivity*). The part about the indirect wins is a result of this law. Due to it, all indirect wins (ones that are wins not against the player directly, but against someone who had beat them) are added as a direct result of its application, as seen here (we show indirect wins in lighter tone). 

![preorder in sport](../04_order/preorder_sports.svg)

And as a result of that, all "circle" relationships (e.g. where you have a weaker player beating a stronger one) result in just a bunch of objects that are all connected to one another. 

All of that structure arises naturally from the simple law of transitivity.

Preorders and equivalence relations
---

Preorders may be viewed as a middle-ground between *partial orders* and *equivalence relations*. As the missing exactly the property on which those two structures differ --- (anti)symmetry. Because of that, if we have a bunch of objects in a preorder that follow the law of *symmetry*, those objects form an equivalence relation. And if they follow the reverse law of *antisymmetry*, they form an partial order.

| Equivalence relation | Preorder | Partial order |
| ---          | --- | --- |
| Reflexivity | Reflexivity | Reflexivity |
| Transitivity | Transitivity | Transitivity | 
| Symmetry | - |Antisymmetry |

In particular, any subset of objects that are connected with one another both ways (like in the example above) follows the *symmetry* requirement. So if we group all elements that have such connection, we would get a bunch of sets, all of which define different *equivalence relations* based on the preorder, called the preorder's *equivalence classes*.

![preorder](../04_order/preorder_equivalence.svg)

And, even more interestingly, if we transfer the preorder connections between the elements of thesese sets to connections between the sets themselves, these connections would follow the *antisymmetry* requirement, which means that they would form a *partial order.*

![preorder](../04_order/preorder_partial_order.svg)

In short, for every preorder, we can define the *partial order of the equivalence classes of this preorder*.

{% if site.distribution == 'print' %}

Maps as preorders
---

We use maps to get around all the time, often without thinking about the fact that that they are actually diagrams. More specifically, some of them are preorders --- the objects represent cities or intercections, and the relations represent the roads. 

![A map as a preorder](../04_order/preorder_map.svg)

Reflexivity reflects the fact that if you have a route allowing you to get from point $a$ to point $b$ and one that allows you to go from $b$ to $c$, then you can go from $a$ to $c$ as well. Two-way roads may be represented by two arrows that form an isomorphism between objects. Objects that are such that you can always get from one object to the other form equivalence classes (ideally all intercections would be in one equivalence class).

![preorder](../04_order/preorder_map_equivalence.svg)

However, maps that contain more than one road (and even more than one *route*) connecting two intercections, cannot be represented using preorders. For that we would need categories (don't worry, we are almost there.)

State machines as preorders 
---

Let's now reformat the preorder that we used in the previous two examples, as Hasse diagram that goes from left to right. Now, it (hopefully) doesn't look so much like a hierarchy, nor like map, but like a description of a process (which, if you think about it, is also a map just one that is temporal rather than spatial.) This is actually a very good way to describe a computation model known as *finite state machine*. 

![A state machine as a preorder](../04_order/preorder_state_machine.svg)

A specification of a finite state machine consists of a set of states that the machine can have, which, as the name suggest, must be finite, and a bunch of transition functions that specify which state do we transition to (often expressed as tables.)

But as we saw, a finite state machine is similar to a preorder with a greatest and least object, in which the relations between the objects are represented by functions.

Finite state machines are used in organization planning e.g. imagine a process where a given item gets manifactured, gets checked by a quality control person, who, if they find some defficiencies, pass it to the necessary repairing departments and then they check it again and send it for shipping. This process can be modelled by the above diagram. 

{%endif%}

<!--


https://www.cs.rochester.edu/u/nelson/courses/csc_173/fa/fa.html


|Current State | Input | Next State | 
|---   | ---   | ---        |
|| X | X | X |
|Identity| X | X | X |
|Invertability  | |  | X |
|Closure  | | X | X |

Or imagine a computational alghorithm for parsing input which iterates a string of characters and converts them to some other objects until all of the input is parsed.

TODO
Turing machines
https://www.i2cell.science/how-a-turing-machine-works/
---
State machines are, however not Turing-complete, that is, they cannot encode any alghorithm.

|Current State | Input | Next State | Write | Move |
|---   | ---   | ---        |
-->

Orders as categories
===

We saw that preorders are a powerful concept, so let's take a deeper look at the law that governs them --- the transitivity law. What this law tells us that if we have two pairs of relationship $a ≤ b$ and $b ≤ c$, then we automatically have a third one $a ≤ c$. 

![Transitivity](../04_order/transitivity.svg)

In other words, the transitivity law tells us that the $≤$ relationship composes i.e. if we view the "bigger than" relationship as a morphism we would see that the law of transitivity is actually the categorical definition of *composition*. 

![Transitivity as functional composition](../04_order/transitivity_composition.svg)

(we have to also verify that the relation is associative, but that's easy)

So let's review the definition of a category again.

> A category is a collection of *objects* (we can think of them as points) and *morphisms* (arrows) that go from one object to another, where:
> 1. Each object has to have the identity morphism.
> 2. There should be a way to compose two morphisms with an appropriate type signature into a third one in a way that is associative.

Looks like we have law number 2 covered. What about that other one --- the identity law? We have it too, under the name *reflexivity*.

![Reflexivity](../04_order/reflexivity.svg)

So it's official --- preorders are categories (sounds kinda obvious, especially after we also saw that orders can be reduced to sets and functions using the inclusion order, and sets and functions form a category in their own right.)

And since partial orders and total orders are preorders too, they are categories as well. 

When we compare the categories of orders to other categories, like the quintessential category of sets, we see one thing that immediately sets them apart: in other categories there can be *many different morphisms (arrows)* between two objects and in orders can have *at most one morphism*, that is, we either have $a ≤ b$ or we do not. 

![Orders compared to other categories](../04_order/arrows_one_arrow.svg)

In the contrast, in the category of sets where there are potentially infinite amount of functions from, say, the set of integers and the set of boolean values, as well as a lot of functions that go the other way around, and the existence of either of these functions does not imply that one set is "bigger" than the other one.

![Orders compared to other categories](../04_order/order_category.svg)

Note that although two objects in an order might be directly connected by just one arrow, they might still be be *indirectly* connected by more than one arrow. So when we define an order in categorical way it's crucial to specify that *these ways are equivalent* i.e. that all diagrams that show orders commute.

Products and sums
---

While we are rehashing diagrams from the previous chapters, let's look at the diagram defining the *coproduct* of two objects in a category, from chapter 2. 

![Joins as coproduct](../04_order/coproduct_join.svg)

If you recall, this is an operation that corresponds to *set inclusion* in the category of sets.

![Joins as coproduct](../04_order/coproduct_inclusion.svg)

But wait, wasn't there something else that corresponded to set inclusion --- oh yes, the *join* operation in orders. And not merely that, but orders are defined in the exact same way as the categorical coproducts.

In category theory, an object $G$ is the coproduct of objects $Y$ and $B$ if the following two conditions are met:

1. We have a morphism from any of the elements of the coproduct to the coproduct, so $Y → G$ and $B → G$.
2. For any other object $P$ that also has those morphisms (so $Y → P$ and $B → P$) we would have morphism $G → P$.

![Joins as coproduct](../04_order/coproduct_morphisms.svg)

In the realm of orders, we say that $G$ is the *join* of objects $Y$ and $B$ if:

1. It is bigger than both of these objects, so $Y ≤ G$ and $B ≤ G$.

2. It is smaller than any other object that is bigger than them, so for any other object $P$ such that $P ≤ G$ and $P ≤ B$ then we should also have $G ≤ P$.

![Joins as coproduct](../04_order/coproduct_join_morphisms.svg)

We can see that the two definitions and their diagrams are the same. So, speaking in category theoretic terms, we can say that the *categorical coproduct* in the category of orders is the *join* operation. Which of course means that *products* correspond to *meets*.

Overall, orders are sometimes called "thin categories" as they have equivalents for most categorical concepts, and are often used for modelling structures that are simpler than the ones that require full-fledged categories. We will see an example of that in the next chapter.
