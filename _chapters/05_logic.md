---
layout: default
title: Logic
---

Logic
===

Now let's talk about one more *seemingly* unrelated topic, just so we can surprise ourselves that it is all connected. This time I will not merely transport you to a different branch of mathematics, but an entirely different discipline, namely *logic*. Or, to be more precise, intuitionistic logic. This discipline may seem to you as detached from what we have been talking about as it possibly can, but it is actually very close.

What is logic
===

Logic, has a very peculiar role, so in order to understand it well it's important to understand where it stands in the grand schema of things: logic is the science of the *possible*. As such it is at the root of all other sciences, all of which are sciences of the *actual*, i.e. of that which really exists. For example, if the laws of physics show how particles behave in our universe (or multiverse), we might use logic to deduce how would they behave in any universe that is possible to exist (under a given set of postulates, real or made up). The key is that everything that is actual is also possible, and so all sciences are (or should be) be based on logic.

Logical "proofs"
---

OK, let's be more specific. Logic aims to study the *rules* by which knowing one thing leads you to conclude or (*prove*) that some other thing is also true, regardless of the things's domain (or scientific discipline) i.e. by only refering to their form.

On top of that, it (logic) tries to organize those rules in what are called *logical systems* (or formal systems as they are also called) - these are collections of rules for manipulating proposition that have give you the maximum expressive ability without adding anything extra.

What does "prove" mean in this context? Simple - when we are able, using the rules of a given logical system, to transform one set of *propositions* (AKA "things we know") **A** to another set of proposition **B** (AKA things that we *want* to know) we say that we have proven that **A → B** in that system that we are using. Note that the word "prove" is a little misleading here, especially when used with the combination of the word *true* (which is misleading even by itself) - you don't prove anything using logic, you merely verify that it follows from a given set of propositions *AND* rules for manipulating those propositions (logical system). We use that word (prove) because verifying that something follows from a set of axioms and rules is the closest that we have to an actual proof.

Logic and mathematics 
---

All of the concepts that we studied here are formal concepts, so we can say that we have been doing logic throughout this book. And we would be quite correct - every mathematical theory is logic plus some additional definitions added to it. For example, part of the reason why *set theory* is so popular as a theory for the foundations of mathematics is that set theory (in particular the Zermelo–Fraenkel flavour of it) adds just one single primitive to the standard axioms of logic which we will see shortly - the binary relation that indicates *set membership*. So set theory is very very close to logic exacly how they relate is probably outside the scope of that book. Category theory is close to logic too, but in a quite different way (this is not outside our scope, so we will examine the connection later.)

Here I will quote Bertrand Russell, and the way he explains logic and maths, using geometry as an example:

> But since the growth of non-Euclidean Geometry, it has appeared that pure mathematics has no concern with the question whether the axioms and propositions of Euclid hold of actual space or not: this is a question for applied mathematics, to be decided, so far as any decision is possible, by experiment and observation. What pure mathematics asserts is merely that the Euclidean propositions follow from the Euclidean axioms--i.e. it asserts an implication: any space which has such and such properties has also such and such other properties. Thus, as dealt with in pure mathematics, the Euclidean and non-Euclidean Geometries are equally true: in each nothing is affirmed except implications. All propositions as to what actually exists, like the space we live in, belong to experimental or empirical science, not to mathematics; when they belong to applied mathematics, they arise from giving to one or more variables in a proposition of pure mathematics some constant value satisfying the hypothesis, and thus enabling us, for that value of the variable, actually to assert both hypothesis and consequent instead of asserting merely the implication.
> Bertrand Russell, from The Principles of Mathematics (1903)

The elements of logic
===

Primary propositions
---

A consequence of the above (logic being the science of the possible) is that in order to do anything at all in it, we should have an initial set of propositions (or "values" as Russell calls them) that we accept as true. These are also called called "premises", "primary propositions" or "atomic propositions" as Wittgenstein dubbed them. 

![Balls](balls.svg)

In the real-world usages, these propositions would be facts about the world, in most cases scientific facts. When in the context of logic itself, which as we said is the science of the possible, these propositions are abstracted away (i.e. we are not concerned about them directly) and so they can be represented with the colorful balls that you are familiar with. 

Composing propositions
---

If we have two or more propositions that are somehow related to one another, we can combine them into one using a logical operator, like "and", "or" "follows" etc. The result would be a new proposition, not unlike the way in which monoid objects are combined into a new monoid object using the monoid operation. 

Moreover, some logical operations do form monoids, like the operation **and** with the proposition **true** serving as the identity element.

![Logical operations that form monoids](logic_monoid.svg)

However logic is not *just* a monoid, as logic studies not one but many logical operations and they ways in which they relate, for example, in logic we might be interested in the distributivity of the **and** and **or** operations. 

![The distributivity operation of "and" and "or"](logic_distributivity.svg)

Important to note that **∧** is the symbol for **and** and **∨** is the symbol for **or** (although the law above is actually valid even if **and** and **or** are flipped).

The equivalence of primary and composite propositions
---

Do note that in the leftmost proposition, the green ball is wrapped in a grey ball just to make the diagram prettier - propositions that are composed of several premises (symbolized by grey balls, containing some other balls) are not in any way different from "primary" propositions (single-color balls). 

As a result of this is that we can compose propositions with multiple levels of nesting (*recursively* as the computer science people say). 

![Balls as propositions](balls_propositions.svg)

Modus ponens
---

As an example of a proposition that contains multiple levels of nesting, consider one of the most famous propositions ever, namely *modus ponens*. 

Modus ponens states that if **A** is true and if also **A → B** is true (if **A** implies **B**), then **B** is true as well. 

![Modus ponens](modus_ponens.svg)

Let's dive a little deeper. The proposition is composed of two other propositions in a **follows** relation where the proposition that follows (**B**) is primary (or at least could be, again, pretty diagrams before all), but the proposition from which **B** follows is not. Let's call that one **C** - so the whole proposition becomes **C → B**. 

Going deeper, we have to mention that of course the **C** propositions is itself composed of two propositions in an **and**, relationship - **A** and let's call the other one **D** (so **A ∧ D**), where **D** is itself composed of two propositions, this time in a **follows** relationship - **A → B**.

Tautologies
---

Because the content of our propositions is abstracted away, we often cannot tell whether a given proposition is true or false. However, with propositions such as *modus ponens* we can: modus ponens is *always true*, regardless of whether the propositions it is composed of are true, or we can also say that it is *true in all models of the system*, which is the same thing (a model being a set of real-world premises are taken to be signified by our propositions). 

![Variation of modus ponens](modus_ponens_variations.svg)

Such always-true propositions are called *tautologies* (their more famous counterparts are the *contradictions*). The simplest tautology (which might remind you of something), is the one which states that a proposition implies itself (e.g. "All bachelors are unmarried").


![Identity tautology](tautology_identity.svg)

Here are some more complex (less boring) tautologies, where the connection between the left and the right part not so apparent (the symbol **¬** means "not"/negation.

![Tautologies](tautology_list.svg)

We will learn how to prove that a given proposition is a tautology, but first let's see what are tautologies good for.

Logical systems
===


Tautologies are the basis of *axiom schemas* and of *rules of inference* which is almost the same thing. That is, they can serve as starting point from which we can generate all true logical statements by means of substitution. And axiom schemas/rules of inference form logical systems, as we mentioned before. But let's not get ahead of ourselves.

Axiom schemas
---

Realizing that the colors of the balls in modus ponens are superficial, we may want to represent the general structure that all of its versions share.

![Modus ponens](modus_ponens_schema.svg)

This structure, the one that looks like a coloring book in our example, is called *axiom schema*. And the propositions produced by it are *axioms*.

Rules of inference
---

All axiom schemas can be easily used as procedures for creating new propositions out of existing ones (*rule of inference*). For example, having the proposition **a** (that is symbolized below by the orange ball) and the proposition stating that **a** implies **a or b** (which is one of the tautologies that we saw above), we can plug those propositions into the *modus ponens* axiom schema and use it as a rule of inference to proves that **a or b** is true.

![Using modus ponens for rule of inference](modus_ponens_composite.svg)

Every *axiom schema* can also be potentially a rule of inference, although in practice, having one rule of inferences is enough to construct a logical system.

Completeness of logical systems
---

OK, we started talking about logical systems again, without first explaining what they are. Apologies. Anyways, knowing that we can use axiom schemas/rules of inference to generate new propositions, we might ask whether it is possible to have a small collection of such schemas/rules that is curated in such a way that it enables us to generating *all* other tautologies, as well as all propositions that are true given a set of premises. You would be happy (although a little annoyed, I imagine) to learn that there exist not only one, many such collections. 

I think that the first one is due to Gottlob Frege and it is composed by the *modus ponens* rule of inference, that we already saw and five axiom schemes that all follow the structure **A → B** (these are axiom schemes, not axioms, eventhough we use colors).

![A minimal collection of Hilbert axioms](min_hilbert.svg)

And yes, collections such as the one above are what we call logical systems. Technically they would be *complete* logical systems and a collection that is not capable of generating all other propositions would be *incomplete logical systems*, but who has time for incomplete logical systems?)

The proving that this and other similar logical systems are complete is due to Godel and is known as "Godel's completeness theorem".

Classical logic
===

We now have an idea about how do some of the main logical constructs (axioms, rules of inference) work. But in order to prove that they are really true, and to understand *what they are*, we need to go deeper. And thus we are reaching the level of depth that is in the realm of philosophy.

> Beyond the world that we inhabit and perceive every day there exist the *world of forms* where all ideas and concepts that manifest themselves in the objects that we perceive reside e.g. beyond all the people that have ever lived, there lies the prototypical person, and we are people only insofar as we resemble that person, beyond all the things in the world that are strong, lies the ultimate concepts of strength, from which all of them borrow etc. And although, as mere mortals, we live in the world of appearances and cannot perceive the world of forms, we can, through philosophy, "recollect" with it and know some of its features.

The above is my summary of a worldview that is due to the Greek philosopher Plato and is sometimes called Plato's "theory of forms". Originally, the discipline of logic represents an effort to think and structure our thoughts in a way that they apply to this world of forms i.e. in a "formal" way. Today this original paradigm of logic is known as classical logic. And this is what we will be looking at in this chapter.

Either true or false
---

The existence of the world of forms implies that even if there are many things that we, people, don't know, at least *somewhere out there* there exists answer to every question, whether it would be affirmitive or negative i.e. that ultimately *each proposition is either true or false*. For this reason, propositions in classical logic can be aptly expressed as functions which output boolean values.

![The set of boolean values](boolean_set.svg)

- We can view primary propositions as simple functions that return a boolean value and don't take any arguments.

- We can view logical operators as functions that take a bunch of boolean values and return another boolean value.

- Composite propositions are, in this case, just the results of the invocation of these functions.

We will see why this simple and *seemingly* self-evident observation (that propositions can be either true or false) is so important and how it vastly simplifies both the definition of both propositions and logical operators and the solving of some problems - all you need to do is to ennumerate all (two) possibilities.

The *negation* operation
---

Let's begin with the the negation operation, because it is the simplest one, as it is an unary operation, which means it takes just one argument. It can be represented by this function.

![negation](negation.svg)

It can also be expressed in a sligtly less-fancy way by this table.

| p | ¬p |
|---| --- | 
| True  | True  | 
| False  | False |

Such tables are called *truth tables* and they are ubiquitos in classical logic, not only for defining operators, but for proving results as well.

Proving results by truth tables
---

All axioms and rules of inference aside, each proposition in classical logic can be proved by means of truth tables alone. Actually, proving a proposition by means of axioms and rules means nothing other than the fact that it can be also proven by truth tables. This is so, because axioms are themselves are proven by means of truth tables. 

Having defined the negation operator, as we did above, we are in position to prove the first of the axioms of the logical system we saw, namely the *double negation elimination*. In natural language, this axiom is equivalen to the observation that saying "I am *not unable* to do X" is the same as saying  "I am *able* to do it".

![Double negation elimination formula](double_negation_formula.svg)

If we view logical operators as functions, from and to the set of boolean values, than proving axioms involves composing several of those functions into one function and observing its outputs. More specifically, the proof of the formula above involves just composing the negation function with itself and verifying that it leaves us in the same place from which we started.

![Double negation elimination](double_negation_proof.svg)

If we want to be formal about it, we might say that applying negation two times is equivalent to the identity function.

![The identity function for boolean values](boolean_identity.svg)

If we are tired of diagrams, we can represent the composition diagram above as table. This kinds of tables are called *truth-tables* and they are the usual more of representation used.

| p | ¬p | ¬¬p |
|---| --- | --- |
| True  | False  | True |
| False  | True | False |

Despite its triviality, the double negation axiom is probably the most controversial result in logic, we will see why later.

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

The foundations of classical logic (which was the topic of the last chapter) remained undisputed from its inception untill the 20th century when people tried to really put them to the test by using it as a basis of all mathematics. It was then when came some disturbing results came out. Resultss like Godel's *other* famous theorem - his *in*completeness theorem was published, stating that systems that are able to represent arithmetics, contain some statements that are undecidable, so they cannot be proven to be true, nor false (note that this does not contradict Godel's completeness theorem, as it speaks about arithmetics in particular, while the completeness theorem is about general logic).

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
