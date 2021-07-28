---
layout: default
title: Logic
---

Logic
===

Now let's talk about one more *seemingly* unrelated topic, just so we can surprise ourselves that it is all connected. This time I will not merely transport you to a different branch of mathematics, but an entirely different discipline, namely *logic*. Or, to be more precise, intuitionistic logic. This discipline may seem to you as detached from what we have been talking about as it possibly can, but it is actually very close.

What is logic
===

Logic is the science of the *possible*. As such, it is at the root of all other sciences, all of which are sciences of the *actual*, i.e. of that which really exists. For example, if the laws of physics show how particles behave in our universe (or multiverse), we might use logic to deduce how would they behave in any universe that is possible to exist (under a given set of postulates, real or made up). The key is that everything that is actual is also possible, and so all sciences are (or should be) be based on logic. But at the same time (and that's sometimes overlooked) nothing real is purely logical.

Logical proofs
---

OK, let's be more specific. Logic aims to study the *rules* by which knowing one thing leads you to conclude or (*prove*) that some other thing is also true, regardless of the things's domain (e.g. scientific discipline) i.e. by only referring to their form.

On top of that, it (logic) tries to organize those rules in what are called *logical systems* (or formal systems as they are also called) - these are collections of rules for manipulating proposition that have give you the maximum expressive ability without adding anything extra.

What does "prove" mean in this context? Simple - when we are able, using the rules of a given logical system, to transform one set of *propositions* (AKA "things we know") **A** to another set of proposition **B** (AKA things that we *want* to know) we say that we have proven that **A → B** in that system that we are using. Note that the word "prove" is a little misleading here, especially when used with the combination of the word *true* (which is misleading even by itself) - you don't prove anything using logic, you merely verify that it follows from a given set of propositions *AND* rules for manipulating those propositions (logical system). We use that word (prove) because verifying that something follows from a set of axioms and rules is the closest that we have to an actual proof.

Logic and mathematics 
---

All of the concepts that we studied here are formal concepts, so we can say that we have been doing logic throughout this book. And we would be quite correct - every mathematical theory is logic plus some additional definitions added to it. For example, part of the reason why *set theory* is so popular as a theory for the foundations of mathematics is that set theory (the Zermelo–Fraenkel flavor, for example) adds just one single primitive to the standard axioms of logic which we will see shortly - the binary relation that indicates *set membership*. So set theory is very close to logic. Exactly how they relate is probably outside the scope of that book. Category theory is close to logic too, but in a quite different way (this is not outside our scope, so we will examine the connection later.)

The elements of logic
===

Primary propositions
---

A consequence of the above (logic being the science of the possible) is that in order to do anything at all in it, we should have an initial set of propositions (or "values" as Russell calls them) that we accept as true, or false. These are also called "premises", "primary propositions" or "atomic propositions" as Wittgenstein dubbed them. 

![Balls](balls.svg)

In the real-world usages, these propositions would be facts about the world, in most cases scientific facts. When in the context of logic itself, which as we said is the science of the possible, these propositions are abstracted away (i.e. we are not concerned about them directly) and so they can be represented with the colorful balls that you are familiar with. 

Composing propositions
---

If we have two or more propositions that are somehow related to one another, we can combine them into one using a logical operator, like "and", "or" "follows" etc. The result would be a new proposition, not unlike the way in which monoid objects are combined into a new monoid object using the monoid operation. 

Actually, some logical operations do form monoids, like the operation **and** with the proposition **true** serving as the identity element.

![Logical operations that form monoids](logic_monoid.svg)

However, unlike group theory, logic has not one but *many* logical operations and studies *the ways in which they relate*, for example, in logic we might be interested in the law of distributivity of the **and** and **or** operations and what it entails.

![The distributivity operation of "and" and "or"](logic_distributivity.svg)

Important to note that **∧** is the symbol for **and** and **∨** is the symbol for **or** (although the law above is actually valid even if **and** and **or** are flipped).

The equivalence of primary and composite propositions
---

Do note that in the leftmost proposition, the green ball is wrapped in a gray ball just to make the diagram prettier - propositions that are composed of several premises (symbolized by gray balls, containing some other balls) are not in any way different from "primary" propositions (single-color balls). 

As a result of this is that we can compose propositions with multiple levels of nesting (*recursively* as the computer science people say). 

![Balls as propositions](balls_propositions.svg)

Modus ponens
---

As an example of a proposition that contains multiple levels of nesting (and a great introduction of the subject in its own right), consider one of the most famous propositions ever, namely *modus ponens*. 

Modus ponens is a proposition that states that if **A** is true and if also **A → B** is true (if **A** implies **B**), then **B** is true as well. For example, if we know that "Socrates is a human" and that "Being human implies being mortal", we also know that "Socrates is mortal". 

![Modus ponens](modus_ponens.svg)

Let's dive a little deeper. The proposition is composed of two other propositions in a **follows** relation where the proposition that follows (**B**) is primary (or at least could be, again, pretty diagrams before all), but the proposition from which **B** follows is not. Let's call that one **C** - so the whole proposition becomes **C → B**. 

Going one more level down, we notice that the **C** propositions is itself composed of two propositions in an **and**, relationship - **A** and let's call the other one **D** (so **A ∧ D**), where **D** is itself composed of two propositions, this time in a **follows** relationship - **A → B**.

Tautologies
---

Because the content of our propositions is abstracted away, we often cannot tell whether a given proposition is true or false. However, with propositions such as *modus ponens* we can: modus ponens is *always true*, regardless of whether the propositions which form it are true. If we want to be fancy, we can also say that it is *true in all models of the system* (a model being a set of real-world premises are taken to be signified by our propositions). For example, our previous example would not stop being true if we substitute "Socrates" with any other name, nor if we substitute "mortal" for any other quality that humans possess.

![Variation of modus ponens](modus_ponens_variations.svg)

Propositions that are always true are called *tautologies*. And their more-famous false counterparts are the *contradictions* (you can turn each tautology into contradiction by adding a "not"). 

The simplest tautology, is the one which states that a proposition implies itself (e.g. "All bachelors are unmarried"). It may remind you of something.

![Identity tautology](tautology_identity.svg)

Here are some more complex (less boring) tautologies (the symbol **¬** means "not"/negation.

![Tautologies](tautology_list.svg)

We will learn how to determine which propositions are a tautologies, but first let's see why is this important at all i.e. what are tautologies good for.

Logical systems
===

Tautologies are useful because they are the basis of *axiom schemas* or *rules of inference* (which is almost the same thing): they can serve as starting point from which we can generate other true logical statements by means of substitution. And axiom schemas/rules of inference form logical systems, but let's not get ahead of ourselves.

Axiom schemas
---

Realizing that the colors of the balls in modus ponens are superficial, we may want to represent the general structure that all of its variations have.

![Modus ponens](modus_ponens_schema.svg)

This structure (the one that looks like a coloring book in our example) is called *axiom schema*. And the propositions that are produced by it are *axioms*. 

Note that the propositions that we plug into the schema don't have to be primary. For example, having the proposition **a** (that is symbolized below by the orange ball) and the proposition stating that **a** implies **a or b** (which is one of the tautologies that we saw above), we can plug those propositions into the *modus ponens* and realize that **a or b** is true. 

![Using modus ponens for rule of inference](modus_ponens_composite.svg)


Rules of inference
---

Most axiom schemas can be easily applied as rules of inference i.e. as procedures for declaring propositions that follow from true propositions as also true e.g. in the case above, we can use modus ponens as a rule of inference to proves that **a or b** is true.

Completeness of logical systems
---

OK, we started talking about logical systems again, so let's explain what they are: Knowing that we can use axiom schemas/rules of inference to generate new propositions, we might ask whether it is possible to have a small collection of such schemas/rules that is curated in such a way that it enables us to generating *all* other tautologies. You would be happy (although a little annoyed, I imagine) to learn that there exist not only one, many such collections. And yes, collections such as the one above are what we call *logical systems*. 

For example, a complete logical system is the collection of the following five axiom schemes **in addition to the inference rule modus ponens** (These are axiom schemes, even though we use colors).

![A minimal collection of Hilbert axioms](min_hilbert.svg)

Technically they should be called *complete* logical systems and a collections that are not capable of generating all other propositions would be *incomplete logical systems*, but who has time for incomplete logical systems? 

Proving that this and other similar logical systems are complete is due to Godel and is known as "Godel's completeness theorem".


Classical logic
===

We now have an idea about how do some of the main logical constructs (axioms, rules of inference) work. But in order to prove that they are really true, and to understand *what they are*, we need to go deeper. And thus we are reaching the level of depth that is in the realm of philosophy.

> Beyond the world that we inhabit and perceive every day there exist the *world of forms* where all ideas and concepts that manifest themselves in the objects that we perceive reside e.g. beyond all the people that have ever lived, there lies the prototypical person, and we are people only insofar as we resemble that person, beyond all the things in the world that are strong, lies the ultimate concepts of strength, from which all of them borrow etc. And although, as mere mortals, we live in the world of appearances and cannot perceive the world of forms, we can, through philosophy, "recollect" with it and know some of its features.

The above is my summary of a worldview that is due to the Greek philosopher Plato and is sometimes called Plato's "theory of forms". Originally, the discipline of logic represents an effort to think and structure our thoughts in a way that they apply to this world of forms i.e. in a "formal" way. Today, this original paradigm of logic is known as "classical logic". Although, it all started with Plato, most of it is due to the 20th century mathematician David Hilbert.


Truth-functional interpretation
===

The existence of the world of forms implies that even if there are many things that we, people, don't know, at least *somewhere out there* there exists answer to every question i.e. that ultimately *each proposition is either true or false* (this is known as *the principle of bivalence*). Due to it, propositions in classical logic can be aptly expressed as functions which output boolean values.

![The set of boolean values](boolean_set.svg)

We can view *primary propositions* as simple functions that return a boolean value and don't take any arguments.

We can view *logical operators* as functions that take a bunch of boolean values and return another boolean value.

*Composite propositions* are, in this case, just the results of the invocation of these functions.

The *negation* operation
---

Let's begin with the negation operation. Negation is a unary operation, which means that it is a function that takes just *one* argument.

![negation](negation.svg)

The same function can also be expressed in a slightly less-fancy way by this table.

| p | ¬p |
|---| --- | 
| True  | True  | 
| False  | False |

Such tables are called *truth tables* and they are ubiquitous in classical logic, not only for defining operators, but for proving results as well.

Interlude: Proving results by truth tables
---

Having defined the negation operator, as we did above, we are in position to prove the first of the axioms of the logical system we saw, namely the *double negation elimination*. In natural language, this axiom is equivalent to the observation that saying "I am *not unable* to do X" is the same as saying  "I am *able* to do it".

![Double negation elimination formula](double_negation_formula.svg)

If we view logical operators as functions, from and to the set of boolean values, than proving axioms involves composing several of those functions into one function and observing its outputs. More specifically, the proof of the formula above involves just composing the negation function with itself and verifying that it leaves us in the same place from which we started.

![Double negation elimination](double_negation_proof.svg)

If we want to be formal about it, we might say that applying negation two times is equivalent to the identity function.

![The identity function for boolean values](boolean_identity.svg)

If we are tired of diagrams, we can represent the composition diagram above as table. This kinds of tables are called *truth-tables* and they are the usual more of representation used. Each proposition in classical logic can be proved by means of truth tables alone.

| p | ¬p | ¬¬p |
|---| --- | --- |
| True  | False  | True |
| False  | True | False |

Despite its triviality, the double negation axiom is probably the most controversial result in logic, we will see why later.

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

The *implies* operation
---

Let's now look into something less trivial: the "implies" operation, (also known as "entailment"). This operation binds two propositions in a way that the truth of the first one implies the truth of the second one. You can read **p → q** as "if **p** is true, then **q** must also be true. The entailment is a binary one, it is represented by a function from an ordered pair of boolean values, to a boolean value.

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

It might help you to remember that **p → q** (**p** implies **q**) is true when **-p ∨ q** (either **p** is false or **q** is true.) Because the arguments that truth functions take have just two possible values (**true** and **false**).

| p |	q | p → q | ¬p  | q   |  ¬p ∨ q |
|---| --- | ---   | --- | --- | --- |
| True  | True  | **True**  | False | True | **True** |
| True  | False | **False** | False | False | **False** |
| False | True  | **True**  | True  | True | **True** |
| False | False | **True**  | True  | False | **True** |

You can see that truth tables don't scale well for longer problems. 

p → q

if p is true

   p ∨ -q

if p is false

  -p ∨ q


Intuinistic logic
===

In the 20th century some people tried to really put the postulates of classical logic and set theory to the test by trying to base all mathematics on them. Doing so exposed some issues with classical logic, such as Godel's incompleteness theorem, which lead some of them to the conclusion that logic deals just with subjective ideas that exist only in our minds. This lead to the development of a new kind of logic, known as *intuinistic logic*.

If *classical logic* is based on Plato's theory of forms, then intuinism began with a philosophical idea originating from Kant and Schopenhauer: the idea that the world as we experience it is largely predetermined of out perceptions of it. Or in the words of the mathematician who founded this school, L.E.J. Brouwer:

> [...] logic is life in the human brain; it may accompany life outside the brain but it can never guide it by virtue of its own power.

But if logic deals with *constructing* rather than *discovering* then we have no basis to claim that each statements is necessarily *either true or false*. For example, there might be a statements that might not be provable (the twin-prime conjecture is often given as an example), simply because they fall outside of the domain of the system that we are working with, but that does not make them false. This wouldn't be such a big deal if the fact that each statement is either true or false weren't the *basis of truth-tables*, which is how all logical operators are defined. 

The BHK Interpretation 
===

So, due to the reasons outlined above, intuinistic logic is not bivalent, we cannot have all propositions reduced to a value of the boolean set (to true and false). 

![The True/False dichotomy](true_false.svg)

But one thing that we still do have propositions that are "true" in the sense that a proof for them is given - the primary propositions. 

So with some caveats (which we will see later) the dichotomy between the existence or non-existence of a proof for a given proposition may be taken as similar to the proposition being true or false - there either is a proof of a given proposition or there isn't.

![The proved/unproved dichotomy](proved_unproved.svg)

This is known as the as the Brouwer–Heyting–Kolmogorov (BHK) interpretations of intuinistic logic 

The **and** and **or** operations
---

If the existence of a proof of a proposition is taken to mean that the proposition is true, then the definitions of **and** is rather simple - the proof of **A ∧ B** is just *a pair* containing a proof of **A**, and a proof of **B** e.g. *a set-theoretic product* of the two (see chapter 2). The principle is similar - if you can construct the pair of **A** and **B** i.e. if both proofs do exists, then **A ∧ B** is provable too.

![And in the BHK interpretation](bhk_and.svg)

**Question:** what would be the **or** operation in this case?

The *implies* operation
---

In this case, saying that **A** implies **B** (**A → B**) would just mean that there exist a function which can convert a proof of **A** to a proof of **B**. 

![Implies in the BHK interpretation](bhk_implies.svg)

And the *modus ponens* rule of inference is just the fact that if we have a proof of **A** we can call this function (**A → B**) to obtain a proof of **B**.

**Task:** In order for this to work, you need to define the function in terms of sets. Like with *and* you can do this by using the concept of a pair, work out the details.

The *negation* operation
---

So according to BHK interpretation saying that **A** is true, means that that we possess a proof of **A** - simple enough. But it's a bit harder to express the fact that **A** is false: it is not enough to say that we *don't have a proof* of **A** (the fact that don't have it, doesn't mean it doesn't exist). Instead, we must show that claiming that it is true *leads to contradiction*.

To express this, intuinistic logic defines the constant "false" (**⊥**) defined as the proof of a formula that does not have any proofs (also known as "absurdity" or "bottom value"). And this allows for us to label false propositions as ones that imply the bottom value. So in intuinistic logic **¬A** as just a shorthand for **A → ⊥**. In set theory, this constant can be expressed by the empty set.

![False in the BHK interpretation](bhk_false.svg)

And the observation that false propositions are connected to the bottom value is expressed by the fact that if a proposition is true, i.e. there exists a proof of it, there can be no function from it to the empty set.

![False in the BHK interpretation](bhk_false_function.svg)

The only way for there to be such function is if the set of proof of the proposition is empty as well.

![False in the BHK interpretation](bhk_false_function_2.svg)

**Task:** Look up the definition of function and verify that there cannot exist a function from any set *to the empty set* 

**Task** Look up the definition of function and verify that there does exist a function *from the empty set* to itself (in fact there exist a function from the empty set to any other set.

Classical VS Intuinistic logic
---

Although intuinistic logic seems to differ a lot from classical logic, it actually isn't - if we try to outline the schemas/rules of inference that correspond to the definition of the structures outlined above, we would see that they are virtually the same as the ones that define classical logic. With one exception - the of *double negation elimination* that we saw earlier, which is also known (in a slightly different form as the *law of excluded middle*. 

![The formula of the principle of the excluded middle](excluded_middle_formula.svg)

This law is valid in classical logic and is true when we look at it in terms of truth tables, but there is no justification for it in intuinistic logic - a fact that spawned a heated debate between the inventor of classical logic David Hilbert and the inventor of intuinistic logic L.E.J. Brouwer, known as *the Brouwer–Hilbert controversy*.

Logics as categories
===

Leaving the differences between intuinistic and classical logics aside, the BHK interpretation is interesting because it provides a bit of the higher-level view of logic, that we need in order to define it in terms of category theory. And this is just what we will attempt here.

The Curry-Howard correspondence
---

Programmers might find the definition of the BHK interpretation very similar to a definition of a programming language, and it indeed is - this similarity is known as the *Curry-Howard correspondence* - propositions are *types*, the **implies** operations are *functions*, **and** operations are composite types (objects) and **or** operations are *sum types* (which are not supported in most programming languages). Finally a proof of a given proposition is represented by a value of the corresponding type. 

![Logic as a programming language](logic_curry.svg)

**Task:** The Curry-Howard correspondence is also the basis of special types of programming languages called "proof assistants" which help you verify logical proofs. Install a proof assistant and try to see how it works (I recommend Mike Nahas's Coq Tutorial).

Cartesian closed categories
---

Having the Curry-Howard correspondence and knowing that programming languages can be described by category theory and this indeed is the case (this is why the Curry-Howard-*Lambek* correspondence attaching the name of the person who discovered the categorical side).

On one hand, it is not hard to see that logical systems, viewed through the set-theoretic lens of the BHK interpretation can be viewed as a categories.

![Logic as a category](logic_category.svg)

**Task:** See whether you can prove that logic propositions and entailments forms a category. What is missing?

Defining logic in a categorical language, however, is a more complex question. 

![Logic as a category](logic_curry_category.svg)

In order to answer it, we have to ennumerate the criteria that a given category has to adhere to in order for it to be "logical". These criteria have to guarantee that the category has objects that correspond to all valid logical propositions and no objects that correspond to invalid ones. We won't describe these categories directly (by the way, they are called *Cartesian closed* categories). Instead we would start with a simpler structures that we already examined - orders.

Logics as orders
---

Once you know that logics form categories, you might think you've seen it all. You might think that can already skip the rest of the chapter, or throw the whole book away, while putting on your sunglasses and jumping in your convertible car. But you would be missing out, as there is an even simple structure that captures all of the concepts that we saw, while providing some interesting insights on what logic is.

If we assume that there is only one way to go from proposition **A**, to proposition **B** (or there are many ways, but they are equivalent), then logic is not only a category, but a *preorder* (a category that has just one morphism between any two objects).

![Logic as a preorder](logic_preorder.svg)

Furthermore, if we count propositions that follow from each other (or sets of propositions that have the same truth value and can be proven by the same proof) as equivalent, then logic is a *partial order*.

![Logic as an order](logic_order.svg)

And so it can be represented by a Hasse diagram, yey. 

![Logic as an order](logic_hasse.svg)

By the way, this representation of logic is sometimes called an *algebraic* representation.

Now back to the question we asked before: exactly which orders represent logic and what laws does an order have to obey so it is isomorphic to a logic? We will answer this question as we examine the main logical constructs again, this time in the context of logic. 

The **and** and **or** operations
---



The *implies* operation
---


The *negation* operation
---
