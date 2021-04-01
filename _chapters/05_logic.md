---
layout: default
title: Logic
---

Logic
===

Here we go with this little *leit motif* of mine where I begin talking about something completely different and then it turns out that it is all connected. This time I will not merely transport you to a different branch of mathematics, but an entirely different discipline, namely *logic*. Or, to be more precise, intuitionistic logic. This discipline may seem to you as detached from what we have been talking about as it possibly can, but it is actually very close.

Logic aims to study the *rules* by which knowing one thing leads you to conclude that some other thing is also true, and (most importantly) to do this in a formal way i.e. without regard of what these things are, or how you learned them. And on top of that it tries to organize those rules in what are called *systems*, or *formal systems* - containing selections of rules that have the expressive ability to prove everything that you can see by intuition.

What does "prove" mean in this context? Simple, when we are able, using the rules of a given logical system, to transform one set of *propositions* (or "things we know") **A** to another set of proposition **B** (things that we *want* to know) we say that we have proven that **A → B** in that logical system. 

Note that the word "prove" is a little misleading here, especially when used with the combination of the world *true* (which is misleading even by itself) - you don't prove anything using logic, you merely verify that it follows from a given set of propositions *AND* a given set of rules of inference for manipulating those propositions. I think that we are only using this word because verifying that something follows from a set of axioms and rules is the closest that we have to an actual proof.

What this means is that in order to do anything at all in logic, we should have an initial set of propositions that we accept as true. In the real-world usages, those propositions would be facts about the world, probably scientific facts. When talking about logic itself, these propositions are usually represented by letters (**A**, **B** etc.), here I will use the colorful balls that you are familiar with to represent the "atomic" propositions or the axioms that is the things that you start with.

![Balls](balls.svg)

But here balls do not represent objects "things", but facts about the world or "propositions", as they are called (you can think of them as functions, which is a very similar concept) and logical proposition can be combined with one another, and relate to one another, unlike the monoid operation, in *multiple ways*. But, like with the monoid operation, the result from combining two propositions would always be another (more complex) proposition, so **A** is a proposition then **A ∧ B** (**A and B** is also a proposition, as is **((A ∧ B) ∨ C)**. 

![Balls as propositions](balls_propositions.svg)

Let's take an example with one of the most famous argument ever - *modus ponens*, which states that if **A** is true and if also **A → B** is true (if **A** implies **B**), then **B** is true as well. So, if being a person it implies being mortal and if Socrates is a person, then Socrates is mortal. On a basic level, it is expressed by two propositions in a "follows" relation in which the proposition that follows **B** atomic, but the proposition from which **B** follows is not - let's call that one **C** and so the proposition becomes **C → B**. But if we go deeper we have to mention that the **C** propositions is itself composed of two propositions in an "and", relationship **A** and let's call it **D** (so **A ∨ D**), where **D** is itself composed of two propositions, this time in a "follows" relationship **A → B**.

![Modus ponens](modus_ponens.svg)

Let's now examine the relations that we saw in depth and see what they mean.

Logical relations
---

Logical relations are just functions that take a number of boolean values and return another boolean value. Most of them (like *and*, *or follows*) take two arguments. They are *binary relations* 

Once we have defined the relations, we can combine them into formulas, by applying them successively. This successive application is not exactly functional composition, because each operation accepts two arguments instead of one, but we still can do the same thing as in functional composition, namely to combine several relations into one.

Interlude: Truth tables
---

When combining different logical operations into formulas we often want to check what the output would be for different values and whether the formulas are *universally valid*, that is whether they are true for all possible inputs.

Because the arguments that logical relations have just two possible values (**true** and **false**), it is not hard to do that by enumerating all possible combinations of the arguments.

For example, here is how we use truth table to prove that **p → q** is the same as **-p ∨ q**.

| p |	q | p → q | -p  | q   |  -p ∨ q |
|---| --- | ---   | --- | --- | --- |
| True  | True  | **True**  | False | True | **True** |
| True  | False | **False** | False | False | **False** |
| False | True  | **True**  | True  | True | **True** |
| False | False | **True**  | True  | False | **True** |



Implies relation
---

The "implies" relation, also called ("if-then" relation), binds two propositions in a way that the truth of the first one implies the truth of the second one (but not the other way around). You can read **p → q** as "if **p** is true, then **q** must also be true (notice this says nothing about when **p** is false).

| p |	q | p → q |
|---| --- | ---   |
| True  | True  | True  |
| True  | False | False |
| False | True  | True  |
| False | False | True  |


Logic uses truth tables 

And and Or relations 
---


| p |	q | p ∧ q |
|---| --- | ---   |
| True  | True  | True  |
| True  | False | False |
| False | True  | False |
| False | False | False |

Or relation
---

| p |	q | p ∨ q |
|---| --- | ---   |
| True  | True  | True  |
| True  | False | True  |
| False | True  | True  |
| False | False | False |

False and true
---

Combining relations
---


Heyting algebra
===


Follows as an order
---
(you may remember that these kinds of relations are also called "operations"). 

Or and And as joins and meets
---

Not object
---

