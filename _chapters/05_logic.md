---
layout: default
title: Logic
---

Logic
==

Now let's talk about one more *seemingly* unrelated topic, just so we can surprise ourselves that it is all connected. This time I will not merely transport you to a different branch of mathematics, but an entirely different discipline, namely *logic*. Or, to be more precise, intuitionistic logic. This discipline may seem to you as detached from what we have been talking about as it possibly can, but it is actually very close.

What is logic
===

Logic aims to study the *rules* by which knowing one thing leads you to conclude or (*prove*) that some other thing is also true without any regard of what these things are specifically, i.e. by only refering to their form.

On top of that, it (logic) tries to organize those rules in what are called *formal systems*  - these are collections of rules that have give you the maximum expressive ability without adding anything extra.

What does "prove" mean in this context? Simple - when we are able, using the rules of a given logical system, to transform one set of *propositions* (or "things we know") **A** to another set of proposition **B** (things that we *want* to know) we say that we have proven that **A → B** in that logical system. Note that the word "prove" is a little misleading here, especially when used with the combination of the word *true* (which is misleading even by itself) - you don't prove anything using logic, you merely verify that it follows from a given set of propositions *AND* rules for manipulating those propositions. I think that we are only using this word (prove) because verifying that something follows from a set of axioms and rules is the closest that we have to an actual proof.

Here I will have to quote Bertrand Russell, and the way he explains this concept, using geometry as an example:

> But since the growth of non-Euclidean Geometry, it has appeared that pure mathematics has no concern with the question whether the axioms and propositions of Euclid hold of actual space or not: this is a question for applied mathematics, to be decided, so far as any decision is possible, by experiment and observation. What pure mathematics asserts is merely that the Euclidean propositions follow from the Euclidean axioms--i.e. it asserts an implication: any space which has such and such properties has also such and such other properties. Thus, as dealt with in pure mathematics, the Euclidean and non-Euclidean Geometries are equally true: in each nothing is affirmed except implications. All propositions as to what actually exists, like the space we live in, belong to experimental or empirical science, not to mathematics; when they belong to applied mathematics, they arise from giving to one or more variables in a proposition of pure mathematics some constant value satisfying the hypothesis, and thus enabling us, for that value of the variable, actually to assert both hypothesis and consequent instead of asserting merely the implication.
> Bertrand Russell, from The Principles of Mathematics (1903)

Logic and mathematics 
---

All of the concepts that we studied here are formal concepts, so we can say that we have been doing logic throughout this book. And we would be quite correct - every mathematical theory is logic plus some additional definitions added to it. Part of the reason why *set theory* is so popular as a theory for the foundations of mathematics is that set theory (in particular the Zermelo–Fraenkel flavour of it) adds just one single primitive to the standard axioms of logic which we will see shortly - the binary relation that indicates *set membership* i.e. set theory is very very close to logic. Category theory is close to logic too, but in a quite different way (we will see how later.)

Primary propositions
---

A consequence of the above is that in order to do anything at all in logic, we should have an initial set of propositions (or "values" as Russell calls them) that we accept as true. These are also called called "premises", "primary propositions" and "atomic propositions" as Wittgenstein dubbed them. 

![Balls](balls.svg)

In the real-world usages, these propositions would be facts about the world, probably scientific or mathematical facts. When talking about logic itself, these propositions are usually represented by letters (**A**, **B** etc.) or in this case, the colorful balls that you are familiar with. 

Composing propositions
---

If we have two or more propositions that are somehow related to one another, we can combine them into one using a logical operator, like "and", "or" "follows". The result would be a new proposition, not unlike the way in which monoid objects are combined into a new monoid object using the monoid operation. 

Moreover, some logical operations do form monoids, like the operation **and** with **true** serving as the identity element.

![Logical operations that form monoids](logic_monoid.svg)

However logic is not *just* a monoid, as logic studies not one but many logical operations and they ways in which they relate, for example a in logic we might be interested in the distributivity of the **and** and **or** operations. 

![The distributivity operation of "and" and "or"](logic_distributivity.svg)

Important to note that **∧** is the symbol for **and** and **∨** is the symbol for **or** (although the law is actually valid even if **and** and **or** are flipped).

The equivalence of primary and composite propositions
---

When looking at the diagram above, and especially the way the green ball is wrapped, we may be inclined to think that propositions that are composed of several premises (symbolized by grey balls, containing some other balls) are somehow different from "primary" propositions (single-color balls). However, there really is no difference e.g. **A** is a proposition in the same way as **A ∧ B** or **((A ∧ B) ∨ C)** - wherever one goes, the others might go as well. As a result of this is that we can compose propositions with multiple levels of nesting (*recursively* as the computer science people say). 

![Balls as propositions](balls_propositions.svg)


Modus ponens
---

As an example of a proposition with multiple levels of nesting, consider one of the most famous propositions ever - *modus ponens*, which states that if **A** is true and if also **A → B** is true (if **A** implies **B**), then **B** is true as well. On a basic level, it is expressed by two propositions in a "follows" relation in which the proposition that follows **B** atomic, but the proposition from which **B** follows is not - let's call that one **C** and so the proposition becomes **C → B**. But if we go deeper we have to mention that the **C** propositions is itself composed of two propositions in an "and", relationship **A** and let's call it **D** (so **A ∨ D**), where **D** is itself composed of two propositions, this time in a "follows" relationship **A → B**.

![Modus ponens](modus_ponens.svg)

Tautologies
---

As the implicit aim of logic is the search for truth, a very interesting type of propositions are those that are *always true*, regardless of the premises (or *in all models of the system*, if we want to be fancy with the terminology). Ludwig Wittgenstein called such propositions *tautologies* as in "something that repeats itself" and that is a pretty appropriate name - most of them state that something follows from something else where the something and the something else are actually the same thing. The the simplest tautology, is one which states that a proposition implies itself (e.g. "All bachelors are unmarried").

![Identity tautology](tautology_identity.svg)

But there are some less boring ones, where the connection between the left and the right is not so apparent (the symbol **¬** means "not"/negation.

![Tautologies](tautology_list.svg)



Rules of inference and axioms
---

Tautologies can be used as *logical *axioms* or (a closely related concept) as *rules of inference*. Let's take an example with one important tautology that we saw earlier, namely *modus ponens*. It is easy to see that it is a tautology the *follows* relation in it will always hold, no matter what the green and blue propositions are, and whether they are true or false. 

![Modus ponens](modus_ponens.svg)

As a result for this, we can replace the blue and green propositions with any propositions that we want (primary *or* composite), and get many other true propositions. 

![Variation of modus ponens](modus_ponens_variations.svg)

Such propositions are called *axioms* and the "structure" that is used for producing them is an *axiom schema*. 

![Modus ponens](modus_ponens_schema.svg)

All logical axioms can easily be be adapted into a rule that we can use to create new propositions out of existing one (*rule of inference*), in the following very simple way:

1. Find a proposition that has the same structure of the first part of the axiom schema (the one before the "follows".
2. Generate an axiom that is the same as this proposition.
3. "Plug" the axiom into the proposition that you have.

This is how we transform axioms to rules of inference, that help you to build (prove) new propositions.

Logical systems
---

Knowing that we can take a tautology and use it by means of substitution to generate tautologies (as well as other propositions), you might ask whether it is possible to compile a small collection of such tautolkogies, selected in such a way that if we use them as axiom schemas we can generate all other tautologies. 

![A minimal collection of Hilbert axioms](min_hilbert.svg)

You would be happy (although a little annoyed, I imagine) to learn that there exist not only one, but an infinite number of such collections. Those collections are what we call "logical systems" (also "proof systems", or "proof calculi"). 

We will see an example of such system, but first let's take a step back and try to formalize the terms that we talked about so far.

Classical logic
===

Beyond the world that we inhabit and perceive every day there exist the world of *forms* that, although inaccessible to us, is the realization of all our ideas and concepts that manifest themselves in the objects that we perceive. e.g. beyond all the people that have ever lived, there lies the prototypical person, and we are people only insofar as we resemble that person, beyond all the things in the world that are strong, lies the ultimate concepts of strength, from which all of them borrow etc. Although, as mere mortals, we live in the world of appearances and cannot perceive the world of forms, we can, through philosophy, "recollect" with it and know some of its features. This is a worldview that is due to the Greek philosopher Plato and is sometimes called the theory of forms. The discipline of classical logic represents an effort to think and structure our thoughts in a way that they apply to this world of forms i.e. in a "formal" way. 


True and false
---

The existence of the world of forms is a comforting thought. It's existence implies that even if there are many things that we, people, don't know, the answers to many questions (and are not sure of anything) at least *somewhere out there* there the answer to every question (whether it be affirmitive or negative) exists i.e. that ultimately *each proposition is either true or false*. For this reason, propositions in classical logic can be aptly expressed as functions which output boolean values.

- We can view primary propositions as simple functions that return a boolean value and don't take any arguments.

- We can view logical operators as functions that take a bunch of boolean values and return another boolean value (composite propositions are just the results of the invocation of these functions.)

We will see why this simple and *seemingly* self-evident observation (that propositions can be either true or false) is so important and how it vastly simplifies both the definition of both propositions and logical operators and the solving of some problems - all you need to do is to ennumerate all (two) possibilities.

The *negation* operation
---

Let's begin with the the negation operation, because it is the simplest one, as it is an unary operation, which means it takes just one argument. It can be represented by this function.

![negation](negation.svg)

It can also be expressed in a sligtly less-fancy way by this table (the header of the second column is read "not p".)

| p | ¬p |
|---| --- | 
| True  | True  | 
| False  | False |

Such tables are called *truth tables* and they are ubiquitos in classical logic, not only for defining operators, but for proving results as well.

Proving results by truth tables
---

Eventhough axioms and rules of inference are important, each proposition in classical logic can be proved without them, by means of truth tables. Moreover, the fact that a proposition is proven by means of axioms and rules means nothing more than the fact that it can be also proven by truth tables (this is so, because axioms are themselves proven by means of truth tables). 

In fact, having the definition of the negation operator, we are in position to prove our first proposition/axiom, called *double negation elimination*. It says that a double negative of a given proposition is equivalent to the proposition itself.

![Double negation elimination formula](double_negation_formula.svg)

If we view logical operators as functions, from and to the set of boolean values, than proving axioms involves composing those functions (using *functional composition*) and observing that theit outputs match. This would mean that the propositions are *universally valid*, that is they are true for all possible inputs.

More specifically, the proof of the formula above is the observation that composing the negation function by itself is equivalent to applying the identity function.

![Double negation elimination](double_negation_proof.svg)

The equivalent of this in natural language is the fact that saying that I am *not unable* to do X is the same as saying that I am *able* to do it.

Here is the same thing as a truth-table.

| p | ¬p | ¬¬p |
|---| --- | --- |
| True  | False  | True |
| False  | True | False |

Despite its triviality, this proposition is probably the most controversial result in logic,  we will see why later.

The *implies* operation
---

Let's now look into something less trivial: the "implies" operation, (also known as "entailment"). This operation binds two propositions in a way that the truth of the first one implies the truth of the second one. You can read **p → q** as "if **p** is true, then **q** must also be true. The entailment is a binary one, it is represented by a function from an ordered pair of boolean values, to a boolean value.

![Entailment](entailment.svg)

Here is the truth table.

| p |	q | p → q |
|---| --- | ---   |
| True  | True  | True  |
| True  | False | False |
| False | True  | True  |
| False | False | True  |

Now there are some aspects of this which are non obvious so let's go through every case.

1. If *p* is true and *q* is also true, then **p** does imply **q** - obviously.
2. If *p* is true but *q* is false then **q** does not follow from **p**, cause it would have been true if it did.
3. If *p* is false but *q* is true, then **p** still does imply **q**. What the hell? Consider two factors:

- By saying that *p* implies *q* we don't say that the two are 100% interdependent e.g. the claim that "drinking causes headache" does not mean that drinking is the only source of headaches, and it won't be refuted the fact that you can get headache without drinking.

- The conclusion that *p* implies *q* is reached only if all four cases are satisfied, so this events means nothing by itself.

4. And finally if **p** is false but **q** is false too, then **p** still does imply **q** (just some other day).

It might help you to remember that **p → q** (**p** implies **q**) is true when **-p ∨ q** (either **p** is false or **q** is true.) Because the arguments that truth functions take have just two possible values (**true** and **false**), it is not hard to prove that by enumerating all possible combinations of the arguments.

| p |	q | p → q | ¬p  | q   |  ¬p ∨ q |
|---| --- | ---   | --- | --- | --- |
| True  | True  | **True**  | False | True | **True** |
| True  | False | **False** | False | False | **False** |
| False | True  | **True**  | True  | True | **True** |
| False | False | **True**  | True  | False | **True** |

You can see that truth tables don't scale well for longer problems. In a sec we will see how we can prove this result of this using some predefined set of axioms. But let's go through the **and** and **or** relations real quick.

The **and** and **or** operations
---

OK, you know what **and** means and I know what it means, but what about those annoying people that want everything to be formally specified (nudge, nudge). Well we already know how we can satisfy them: we just show them this truth-table (in which **∧** is the symbol for **and**.)

| p |	q | p ∧ q |
|---| --- | ---   |
| True  | True  | True  |
| True  | False | False |
| False | True  | False |
| False | False | False |

We can do the same for **or**.

| p |	q | p ∨ q |
|---| --- | ---   |
| True  | True  | True  |
| True  | False | True  |
| False | True  | True  |
| False | False | False |

And we can use as axioms a pair of pretty obvious propositions that we can prove with just looking at the definition of the operations.

- For **and**: **p ∧ q → p** and **p ∧ q → q** "If I am tired and hungry, this means that I am hungry".
- For **or**:  **p → p ∨ q** and **p → p ∨ q** "If I have a pen this means that I am either have a pen or a ruler".

Logical systems redux
---

After we defined the main logical operators and saw and proved some propositions (which we called tautologies) are universally valid, using truth tables, we are now in position to finish our talk about logical systems which prompted this chapter. If you recall, a logical system is a collection of tautologies and rules that allow us to deduce all other tautologies.

There are two main classes of such logical systems, the first one are the so-called *Hilbert-style* proof systems (also called *Frege-style*) and the other one are the systems of *natural deduction*, the main difference between the two being whether they rely on *axioms* or on *rules of inference* as a methods for proving propositions.

- *Natural deduction* systems consist only of *rules of inference* (they don't have axiom schemas).
- *Hilbert-style* systems, on the other hand rely mainly on *axiom schemas* as means of proving propositions. They do, however, contain one rule of inference, just because otherwise there would be no way to combine the generated propositions - usually that rule is the *modus ponens* rule, that we already saw.

With some variations Hilbert-style system consist of the following axioms.

![A minimal collection of Hilbert axioms](min_hilbert.svg)

And, as an example, we can use those axioms to prove the And let's see an example of a proof using these axioms

But wait, how can we be *sure* that a given system is really capable of deducing all tautologies that exist in the world? We can be sure, because it was proven by a guy called Godel, who is like the greated logician ever, a result known as Godel's completenes theorem. However we won't get into that result right now.

Intuinistic logic
===

<!--
> Now this is the story all about how
> Classical logic got flipped, turned upside down
> And I'd like to take a minute, just sit right there
> I'll tell you bout the ideas of a guy called Brouwer
-->

The foundations of classical logic (which was the topic of the last chapter) remained undisputed from its inception untill the 20th century when people tried to really put them to the test by using it as a basis of all mathematics. It was then when came some disturbing results came out. Resultss like Godel's *other* famous theorem - his *in*completeness theorem was published, stating that formal systems that in formal systems that are able to represent arithmetics, contain some statements that are undecidable, so they cannot be proven to be true, nor false (note that this does not contradict Godel's completeness theorem, as it speaks about arithmetics in particular, while the completeness theorem is about general logic).

In this times, a new philosophical mathematical and logical school of thought, known as *intuitionism* (also called *constructivism*) was born. If *classical logic* is based on Plato's theory of forms, then intuinism beginned with a philosophical idea originating from Kant and Schopenhauer, that is more or less the opposite - it is the notion that forms are not a thing in itself, but are just subjective ideas that exist only in our minds and the idea that the world as we experience it is largely predetermined of out perceptions of it. Or in the words of the mathematician who founded this school, L.E.J. Brouwer:

> [...] logic is life in the human brain; it may accompany life outside the brain but it can never guide it by virtue of its own power.


The BHK Interpretation.
---

Aside from bening much humbler regarding the validity of its results, the intuinistic school differed from the classical logic over one very important point - they thought that since mathematics is just an activity and truth is only in our heads, then it is necessarily subjective and incomplete, therefore we have no basis to claim that each statements is necessarily *either true or false*, (which if you remember is the basis of classical logic and truth-tables).

The *negation* operation
---

The *implies* operation
---

The **and** and **or** operations
---

Formalizing logic with *orders*
===
