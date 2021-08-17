---
layout: default
title: Logic
---

Logic
===

Now let's talk about one more *seemingly* unrelated structure, just so we can "surprise" ourselves at the end (this time there will be another surprise in addition to logic being a category, so don't fall asleep). Also, in this chapter I will not merely transport you to a different branch of mathematics, but an entirely different discipline - *logic*. 

What is logic
===

Logic is the science of the *possible*. As such, it is at the root of all other sciences, all of which are sciences of the *actual*, i.e. of that which really exists. For example, if science explains how our universe works, logic is the part of the description which is also applicable to any other universe that is possible to exist.

It does this by studying the *rules* by which knowing one thing leads you to conclude or (*prove*) that some other thing is also true, regardless of the things's domain (e.g. scientific discipline) i.e. by only referring to it's form i.e. *in a formal way*.

On top of that, it (logic) tries to organize those rules in what are called *logical systems* (or *formal systems* as they are also called) - these are collections of rules for manipulating proposition that are *complete* in their description of those propositions (we will see what that means shortly). 

Logic and mathematics 
---

Seeing this description, we might think think that the subject of logic is quite similar to the subject of set theory and category theory, as we described it in the first chapter. Only, there instead of the word "formal" we used another similar word, namely "abstract" and instead of "formal system" we said "theory". This observation would be quite correct - today most people agree that every mathematical theory is actually logic plus some additional definitions added to it. For example, part of the reason why *set theory* is so popular as a theory for the foundations of mathematics is that set theory adds just a single primitive to the standard axioms of logic which we will see shortly - the binary relation that indicates *set membership*. 

So set theory is very close to logic, although exactly how they relate is probably outside the scope of this book. And category theory is close to logic too, but in a quite different way (we will examine the connection later.)

Primary propositions
---

A consequence of logic being the science of the possible is that in order to do anything at all in it, we should have an initial set of propositions that we accept as true, or false. These are also called "premises", "primary propositions" or "atomic propositions" as Wittgenstein dubbed them. 

![Balls](balls.svg)

In the context of logic itself, these propositions are abstracted away (i.e. we are not concerned about them directly) and so they can be represented with the colorful balls that you are familiar with. 

Composing propositions
---

At the heart of logic, as in category theory is the concept of *composition* - if we have two or more propositions that are somehow related to one another, we can combine them into one using a logical operator, like "and", "or" "follows" etc. The result would be a new proposition, not unlike the way in which monoid objects are combined into a new monoid object using the monoid operation. And actually, some logical operations do form monoids, like the operation **and** with the proposition **true** serving as the identity element.

![Logical operations that form monoids](logic_monoid.svg)

However, unlike monoids/groups, logics have not one but *many* logical operations and logic studies *the ways in which they relate*, for example, in logic we might be interested in the law of distributivity of the **and** and **or** operations and what it entails.

![The distributivity operation of "and" and "or"](logic_distributivity.svg)

Important to note that **∧** is the symbol for **and** and **∨** is the symbol for **or** (although the law above is actually valid even if **and** and **or** are flipped).

The equivalence of primary and composite propositions
---

Important to stress that although in the leftmost proposition the green ball is wrapped in a gray ball to make the diagram prettier propositions that are composed of several premises (symbolized by gray balls, containing some other balls) are not in any way different from "primary" propositions (single-color balls). 

As a result, (again similar to what we saw with category theory) we can compose propositions with multiple levels of nesting (*recursively* as the computer science people say.)

![Balls as propositions](balls_propositions.svg)

Modus ponens
---

As an example of a proposition that contains multiple levels of nesting (and a great introduction of the subject in its own right), consider one of the oldest (it was alredy known by Stoics at 3rd century B.C.) and most famous propositions ever, namely the *modus ponens*. 

Modus ponens is a proposition that states that if **A** is true and if also **A → B** is true (that is, if **A** implies **B**), then **B** is true as well. For example, if we know that "Socrates is a human" and that "humans are mortal" (or "being human implies being mortal"), we also know that "Socrates is mortal". 

![Modus ponens](modus_ponens.svg)

Let's dive a little deeper. The proposition is composed of two other propositions in a **follows** relation where the proposition that follows (**B**) is primary (or at least could be, again, pretty diagrams before all), but the proposition from which **B** follows is not. Let's call that one **C** - so the whole proposition becomes **C → B**. 

Going one more level down, we notice that the **C** propositions is itself composed of two propositions in an **and**, relationship - **A** and let's call the other one **D** (so **A ∧ D**), where **D** is itself composed of two propositions, this time in a **follows** relationship - **A → B**.

Tautologies
---

Because the content of propositions in logic is abstracted away, we often cannot tell whether a given proposition is true or false. However, with propositions such as *modus ponens* we can: modus ponens is *always true*, regardless of whether the propositions which form it are true. If we want to be fancy, we can also say that it is *true in all models of the system* (a model being a set of real-world premises are taken to be signified by our propositions). 

For example, our previous example would not stop being true if we substitute "Socrates" with any other name, nor if we substitute "mortal" for any other quality that humans possess.

![Variation of modus ponens](modus_ponens_variations.svg)

Propositions that are always true are called *tautologies*. And their more-famous counterparts that are always false are the *contradictions*. You can turn each tautology into contradiction or the other way around by adding a "not". 

The simplest tautology, is the one which states that a proposition implies itself (e.g. "All bachelors are unmarried"). It may remind you of something.

![Identity tautology](tautology_identity.svg)

Here are some more complex (less boring) tautologies (the symbol **¬** means "not"/negation.

![Tautologies](tautology_list.svg)

We will learn how to determine which propositions are a tautologies, but first let's see why is this important at all i.e. what are tautologies good for.

Logical systems
===

Tautologies are useful because they are the basis of *axiom schemas* or *rules of inference* (which is almost the same thing). And *axiom schemas* or *rules of inference* serve as starting point from which we can generate other true logical statements by means of substitution. 

Axiom schemas
---

Realizing that the colors of the balls in modus ponens are superficial, we may want to represent the general structure of modus ponnes that all of its variations have.

![Modus ponens](modus_ponens_schema.svg)

This structure (the one that looks like a coloring book in our example) is called *axiom schema*. And the propositions that are produced by it are *axioms*. 

Note that the propositions that we plug into the schema don't have to be primary. For example, having the proposition **a** (that is symbolized below by the orange ball) and the proposition stating that **a** implies **a or b** (which is one of the tautologies that we saw above), we can plug those propositions into the *modus ponens* and realize that **a or b** is true. 

![Using modus ponens for rule of inference](modus_ponens_composite.svg)

Rules of inference
---

Rules of inference are procedures for declaring that propositions that follow from true propositions as also true. Axiom schemas can be easily applied as rules of inference (and the other way around) e.g. in the case above, we can use modus ponens as a rule of inference to proves that **a or b** is true.

Completeness of logical systems
---

Knowing that we can use axiom schemas/rules of inference to generate new propositions, we might ask whether it is possible to create a small collection of such schemas/rules that is curated in such a way that it enables us to generating *all* other propositions. You would be happy (although a little annoyed, I imagine) to learn that there exist not only one, many such collections. And yes, collections such as the one above are what we call *logical systems* (technically, they should be called *complete* logical systems and a collections that are not capable of generating all other propositions would be *incomplete logical systems*, but who has time for incomplete logical systems?) 

Here is one such collection, which consists of the following five axiom schemes **in addition to the inference rule modus ponens** (These are axiom schemes, even though we use colors).

![A minimal collection of Hilbert axioms](min_hilbert.svg)

Proving that this and other similar logical systems can really generate all other propositions are complete is due to Godel and is known as "Godel's completeness theorem".

Conclusion
---

We now have an idea about how do some of the main logical constructs (axioms, rules of inference) work. But in order to prove that they are true, and to understand *what they are*, we need to do so through a specific *interpretation* of those constructs. We will now look into two interpretations - one very old and the other, relatively recent. This would be a slight detour from our usual subject matter of points and arrows, but it would be worth it. So let's start.

Classical logic. The truth-functional interpretation 
===

> Beyond the world that we inhabit and perceive every day there exist the *world of forms* where all ideas and concepts that manifest themselves in the objects that we perceive reside e.g. beyond all the people that have ever lived, there lies the prototypical person, and we are people only insofar as we resemble that person, beyond all the things in the world that are strong, lies the ultimate concepts of strength, from which all of them borrow etc. And although, as mere mortals, we live in the world of appearances and cannot perceive the world of forms, we can, through philosophy, "recollect" with it and know some of its features.

The above is a summary of a worldview that is due to the Greek philosopher Plato and is sometimes called Plato's *theory of forms*. Originally, the discipline of logic represents an effort to think and structure our thoughts in a way that they apply to this world of forms i.e. in a "formal" way. Today, this original paradigm of logic is known as "classical logic". Although, it all started with Plato, most of it is due to the 20th century mathematician David Hilbert.

The existence of the world of forms implies that even if there are many things that we, people, don't know, at least *somewhere out there* there exists answer to every question. In logic, this translates to *the principle of bivalence*  that states that *each proposition is either true or false*. 

Due to it, propositions in classical logic can be aptly expressed using set theory as functions that return a value from the boolean set (so either true or false).

![The set of boolean values](boolean_set.svg)

We can view *primary propositions* as simple functions that return a boolean value and don't take any arguments.

We can view *logical operators* as functions that take a one or a pair of boolean values and return another boolean value.

*Composite propositions* are, in this case, just the results of the invocation of these functions.

Let's review all logical operators in this context.

The *negation* operation
---

Let's begin with the negation operation. Negation is a unary operation, which means that it is a function that takes just *one* argument of type boolean and (like all other logical operators) returns a value of type boolean. 

![negation](negation.svg)

The same function can also be expressed in a slightly less-fancy way by this table.

| p | ¬p |
|---| --- | 
| True  | False  | 
| False  | True |

Such tables are called *truth tables* and they are ubiquitous in classical logic not only for defining operators but for proving results as well.

Interlude: Proving results by truth tables
---

Having defined the negation operator, as we did above, we are in position to prove the first of the axioms of the logical system we saw, namely the *double negation elimination*. In natural language, this axiom is equivalent to the observation that saying "I am *not unable* to do X" is the same as saying  "I am *able* to do it". 


![Double negation elimination formula](double_negation_formula.svg)

(despite its triviality, the double negation axiom is probably the most controversial result in logic, we will see why later.)

If we view logical operators as functions, from and to the set of boolean values, than proving axioms involves composing several of those functions into one function and observing its output. More specifically, the proof of the formula above involves just composing the negation function with itself and verifying that it leaves us in the same place from which we started.

![Double negation elimination](double_negation_proof.svg)

If we want to be formal about it, we might say that applying negation two times is equivalent to the identity function.

![The identity function for boolean values](boolean_identity.svg)

If we are tired of diagrams, we can represent the composition diagram above as table as well. 

| p | ¬p | ¬¬p |
|---| --- | --- |
| True  | False  | True |
| False  | True | False |

Each proposition in classical logic can be proved with these diagrams (or by truth tables.)


The **and** and **or** operations
---

OK, you know what **and** means and I know what it means, but what about those annoying people that want everything to be formally specified (nudge, nudge). Well we already know how we can satisfy them - we just have to construct the boolean function that represents **and**. And is a *binary* operator so instead of a single value it accepts a *pair* of boolean values.

![And](and.svg)

And the equivalent truth-table (in which **∧** is the symbol for **and**.)

| p |	q | p ∧ q |
|---| --- | ---   |
| True  | True  | True  |
| True  | False | False |
| False | True  | False |
| False | False | False |

We can do the same for **or**, just the table.

| p |	q | p ∨ q |
|---| --- | ---   |
| True  | True  | True  |
| True  | False | True  |
| False | True  | True  |
| False | False | False |

**Task:** Draw the diagram for **or**.

Using those we can also prove some axiom schemas we can later use:

- For **and**: **p ∧ q → p** and **p ∧ q → q** "If I am tired and hungry, this means that I am hungry".
- For **or**:  **p → p ∨ q** and **p → p ∨ q** "If I have a pen this means that I am either have a pen or a ruler".

The *implies* operation
---

Let's now look into something less trivial: the *implies* operation, (also known as *entailment*). This operation binds two propositions in a way that the truth of the first one implies the truth of the second one. You can read **p → q** as "if **p** is true, then **q** must also be true. The entailment is a binary one, it is represented by a function from an ordered pair of boolean values, to a boolean value.

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

It might help you to remember that **p → q** (**p** implies **q**) is true when **-p ∨ q** (either **p** is false or **q** is true.) 

Proving results by axioms/rules of inference
---

Let's examine the above formula, stating that **p → q** is the same as **-p ∨ q**. 

![Hilbert formula](hilbert_formula.svg)

We can prove this by using truth tables.

| p |	q | p → q | ¬p  | q   |  ¬p ∨ q |
|---| --- | ---   | --- | --- | --- |
| True  | True  | **True**  | False | True | **True** |
| True  | False | **False** | False | False | **False** |
| False | True  | **True**  | True  | True | **True** |
| False | False | **True**  | True  | False | **True** |

But we can also prove it using axioms and rules of inference (axiom schemas that are used at each step are specified at the right-hand side, the rule of inference is modus ponens.

![Hilbert proof](hilbert_proof.svg)

Intuinistic logic. The BHK interpretation 
===

Althought the classical truth-functional interpretation of logic is correct in its own right, it doesn't fit well the categorical framework that we have created: It is too "low-level", it relies on manipulating the values of the propositions, it doesn't in any way show the connection between **and** and **or** that we already saw. For these and other reasons (mostly other, probably), in the 20th century a whole new school of logic was founded, called *intuinistic logic*. 

If classical logic is based on *set theory*, intuinistic logic is based on *category theory* and related formalisms.

If *classical logic* is based on Plato's theory of forms, then intuinism began with a philosophical idea originating from Kant and Schopenhauer: the idea that the world as we experience it is largely predetermined of out perceptions of it. As the mathematician L.E.J. Brouwer puts it.

> [...] logic is life in the human brain; it may accompany life outside the brain but it can never guide it by virtue of its own power.

There is a strong connection between category theory and the philosophy of Kant (from whom the term "category" was borrowed (although it has been used by Aristotle before that)), but I won't go into detail about it here.

Classical and intuinistic logic diverge from one another right from the start, when the philosophical foundations are concerned - because intuinistic logic deals with *constructing* a proof rather than *discovering* or unveiling a universal truth we have to be *off with bivalence*, that is, we have no basis to claim that each statements is necessarily *true or false*. For example, there might be a statements that might not be provable not because they are false, but simply because they fall outside of the domain of a given logical system (the twin-prime conjecture is often given as an example.)

Due to the reasons outlined above, intuinistic logic is not bivalent, we cannot have all propositions reduced to true and false. 

![The True/False dichotomy](true_false.svg)

But one thing that we still do have are propositions that are "true" in the sense that a proof for them is given - the primary propositions. So with some caveats (which we will see later) we can think of the bivalence between true and false proposition might be thought out as similar to the bivalence between the existence or non-existence of a proof (there either is a proof of a given proposition or there isn't). 

![The proved/unproved dichotomy](proved_unproved.svg)

This is known as the as the Brouwer–Heyting–Kolmogorov (BHK) interpretations of intuinistic logic.

The original formulation of the BHK interpretation does not depend on any particular mathematical theory. Here we illustrate it using the language of set theory (just so we can abandon it a little later).

The **and** and **or** operations
---

As the existence of a proof of a proposition is taken to mean that the proposition is true, the definitions of **and** is rather simple - the proof of **A ∧ B** is just *a pair* containing a proof of **A**, and a proof of **B** e.g. *a set-theoretic product* of the two (see chapter 2). The principle is similar as with primary proposition - if the pair of proofs of **A** and  **B** exist (i.e. if both proofs exist) then the proof of **A ∧ B** can be constructed.

![And in the BHK interpretation](bhk_and.svg)

**Question:** what would be the **or** operation in this case?

The *implies* operation
---

Saying that **A** implies **B** (**A → B**) would just mean that there exist a function which can convert a proof of **A** to a proof of **B**. 

![Implies in the BHK interpretation](bhk_implies.svg)

And the *modus ponens* rule of inference is just the fact that if we have a proof of **A** we can call this function (**A → B**) to obtain a proof of **B**.

(Note that in order for this to work, we also need to define the functions in terms of sets i.e. we need to have a set representing **A → B** for each **A** and **B**, which is possible, but we will not describe how here.)

The *negation* operation
---

So according to BHK interpretation saying that **A** is true, means that that we possess a proof of **A** - simple enough. But it's a bit harder to express the fact that **A** is false: it is not enough to say that we *don't have a proof* of **A** (the fact that don't have it, doesn't mean it doesn't exist). Instead, we must show that claiming that it is true *leads to contradiction*.

To express this, intuinistic logic defines the constant **⊥** which plays the role of *False* (and is also known as "absurdity" or "bottom value"). **⊥** is defined as the proof of a formula that does not have any proofs. And the equivalent of false propositions are the ones that imply that the bottom value is provable (which is a contradiction). So **¬A** is **A → ⊥**. 

In set theory, the **⊥** constant is expressed by the empty set.

![False in the BHK interpretation](bhk_false.svg)

And the observation that propositions that are connected to the bottom value are false is expressed by the fact that if a proposition is true, i.e. there exists a proof of it, there can be no function from it to the empty set.

![False in the BHK interpretation](bhk_false_function.svg)

The only way for there to be such function is if the set of proof of the proposition is empty as well.

![False in the BHK interpretation](bhk_false_function_2.svg)

**Task:** Look up the definition of function and verify that there cannot exist a function from any set *to the empty set* 

**Task** Look up the definition of function and verify that there does exist a function *from the empty set* to itself (in fact there exist a function from the empty set to any other set.

Classical VS Intuinistic logic
---

Although intuinistic logic seems to differ a lot from classical logic, it actually doesn't - if we try to deduce the axiom schemas/rules of inference that correspond to the definition of the structures outlined above, we would see that they are virtually the same as the ones that define classical logic. With one exception concerning the *double negation elimination axiom* that we saw earlier, a version of which is known as *the law of excluded middle*.

![The formula of the principle of the excluded middle](excluded_middle_formula.svg)

This law is valid in classical logic and is true when we look at it in terms of truth tables, but there is no justification for it in the BHK interpretation - a fact that spawned a heated debate between the inventor of classical logic David Hilbert and the inventor of intuinistic logic L.E.J. Brouwer, known as *the Brouwer–Hilbert controversy*.

Logics as categories
===

Leaving the differences between intuinistic and classical logics aside, the BHK interpretation is interesting because it provides that higher-level view of logic, that we need in order to represent it in terms of category theory. 

Such higher-level interpretations of logic are sometimes called an *algebraic* interpretations, *algebraic* being an umbrella term describing all structures that can be represented using category theory, like groups and orders.

The Curry-Howard isomorphism
---

Programmers might find the definition of the BHK interpretation interesting for other reason - it is very similar to a definition of a programming language: propositions are *types*, the **implies** operations are *functions*, **and** operations are composite types (objects) and **or** operations are *sum types* (which are currently not supported in most programming languages, but that's a separate topic.) Finally a proof of a given proposition is represented by a value of the corresponding type. 

![Logic as a programming language](logic_curry.svg)

This similarity is known as the *Curry-Howard isomorphism*.

**Task:** The Curry-Howard isomorphism is also the basis of special types of programming languages called "proof assistants" which help you verify logical proofs. Install a proof assistant and try to see how it works (I recommend Mike Nahas's Coq Tutorial).

Cartesian closed categories
---

Knowing about the Curry-Howard isomorphism and knowing also that programming languages can be described by category theory may lead us to think that *category theory is part of this isomorphism as well*. And we would be quite correct, this is why it's sometimes called the Curry-Howard-*Lambek* isomorphism, Lambek being the person who discovered the the categorical side.

Let's examine this isomorphism (without being too formal about it). As all other isomorphisms, it comes in two parts. 

The first part is finding a way to convert a logical system into a category - this would not be hard for us, as sets form a category and the flavour of the BHK interpretation that we saw is based on sets.

![Logic as a category](category_curry_logic.svg)

**Task:** See whether you can prove that logic propositions and entailments forms a category. What is missing?

The second part involves converting a category into a logical system - this is much harder, as in order to do it, we have to enumerate the criteria that a given category has to adhere to in order for it to be "logical".

![Logic as a category](logic_curry_category.svg)

These criteria have to guarantee that a category has objects that correspond to all valid logical propositions and no objects that correspond to invalid ones. 

Categories that adhere to these criteria are called *cartesian closed categories*. We won't describe them here directly, but instead we would start with a similar but simpler structures that are instance of them and that we already examined - orders.

Logics as orders
---

We will now do something that is quite characteristic of category theory - examininig a concept in a more limited version of the theory, in order to make things simpler for ourselves. 

So we already saw that a logical system, along with the set of primary propositions forms a category.

![Logic as a preorder](logic_category.svg)

If we assume that there is only one way to go from proposition **A**, to proposition **B** (or there are many ways, but we are not interested in the difference between them), then logic is not only a category, but a *preorder* in which  the relationship "bigger than" is taken to mean "implies".

![Logic as a preorder](logic_preorder.svg)

Furthermore, if we count propositions that follow from each other (or sets of propositions that have the same truth value and can be proven by the same proof) as equivalent, then logic is a proper *partial order*.

![Logic as an order](logic_order.svg)

And so it can be represented by a Hasse diagram, yey. 

![Logic as an order](logic_hasse.svg)

Now let's examine the question that we asked before - exactly which ~~categories~~ orders represent logic and what laws does an order have to obey so it is isomorphic to a logic? We will attempt to answer this question as we examine the elements of logic again, this time in the context of orders.

The **and** and **or** operations
---

By now you probably realized that the **and** and **or** operations are the bread and butter of logic (although it's not clear which is which). As we saw, in the BHK interpretation those were represented by set *products* and *sums*. And the equivalent constructs in the realm of order theory are *meets* and *joins* (in category-theorethic terms *products* and *coproducts*.)

Here comes the first criteria for an order to represent logic accurately - it has to have **meet** and **join** operations for all elements. Having two elements without a meet would mean that you would have a logical system where there are propositions for which you cannot say that one or the other is true. And this not how logic works, so our order has to have meets and joins for all elements. Incidentally we already know how such orders are called - they are called *lattices*.

One more important law concerning the  **and** and **or** operations  that is not always present in the **meet**-s and **join**-s concerns the connection between the two, i.e. way that the **and** and **or** operations distribute, over one another.

![The distributivity operation of "and" and "or"](logic_distributivity.svg)

Lattices that obey this law are called *distributive lattices*.

Wait, where have we heard about distributive lattices before? In the previous chapter we said that they are isomorphic to *inclusion orders* i.e. orders which contain all combinations of sets of a given number of elements. 

And if you think about the BHK interpretation you'll see why: "logical" orders are isomorphic to inclusion orders. The elements which participate in the inclusion are our prime propositions. And the inclusions are all combinations of these elements, in an **or** relationship (for simplicity's sake, we are ignoring the **and** operation.)

![A color mixing poset, ordered by inclusion](logic_poset_inclusion.svg)

So in order for our distributive lattice to represent logic accurately, it has to have a minimum and maximum objects.

**NB: For historical reasons, the symbols for *and* and *or* logical operations are flipped when compared to arrows in the diagrams ∧ is *and* and ∨ is *or*.**

The *negation* operation
---

In order for a distributive lattice to represent logic, it has to also have objects that correspond to the values **True** and **False**. But in order for us to mandate that these objects exist, we must first find a way to specify what they are in order/category-theoretic terms.

A well-known result in logic, called *the principle of explosion*, states that if we have a proof of **False** (or if "**False** is true" if we use the terminology of classical logic), than any and every statement can be proven. And it is also obvious that no true statement implies False. So here is it.

![False, represented as a Hasse diagram](lattice_false.svg)

Circling back to the set-theoretic BHK interpretation, we see that the empty set fits both conditions.

![False, represented as a Hasse diagram](lattice_false_bhk.svg)

Conversely, the proof of **True** (or the statement that "**True** is true") is trivial and doesn't say anything, so *nothing follows from it*, but at the same time it follows from every other statement.

![True, represented as a Hasse diagram](lattice_true.svg)

So **True** and **False** are just the *greatest* and *least* objects of our order (in category-theorethic terms *terminal* and *initial* object.) This is another example of the categorical concept of duality - **True** and **False** are dual to each other, just like **and** and **or**. 

![The whole logical system, represented as a Hasse diagram](lattice_true_false.svg)

So in order to represent logic, our distributive lattice has to also be *bounded* i.e. it has to have greatest and least elements.

The *implies* operation
---

Finally, if a lattice really is isomorphic to a set of propositions, we it also has to have *function objects* i.e. there needs to be a rule that identifies a unique object **A → B** for each pair of objects **A** and **B**, such that all axioms of intuinistic logic are followed. 

How would this object be described? You guessed it, using categorical language i.e. by recognizing a structure that consists of set of relations between objects in which (A → B) plays a part.

![Implies operation](implies.svg)

This structure is actually a categorical reincarnation our favourite rule of inference, the *modus ponens* (**A ∧ (A → B) → B**). This rule is the essence of the **implies** operation and, because we already know how the operations that it contains (**and** and **implies**) are represented in our lattice, we can directly "categorize" it and use it as a definition, saying that **(A → B)** is the object which is related to objects **A** and **B** in such a way that such that **A ∧ (A → B) → B**.

![Implies operation with impostors](implies_modus_ponens.svg)

This definition is not complete, however, because  **(A → B)** is *not the only object* that fits in this formula. For example, the set **A → B ∧ C** is also one such object, as is **A → B ∧ C ∧ D**. So how do we set apart the real formula from all those "imposter" formulas? If you remember the definitions of the *categorical product* (or of it's equivalent for orders, the *meet* operation) you would already know where this is going: we define the function object using a *universal property*, by recognizing that all other formulas that can be in the place of **X** in **A ∧ X → B** point to **(A → B)** i.e. they are below **(A → B)** in a Hasse diagram.

![Implies operation with universal property](implies_universal_property.svg)

Or, using the logic terminology, we say that **A → B ∧ C** and **A → B ∧ C ∧ D** etc. are all "stronger" results than (**A → B**) and so (**A → B**) is the weakest result that fits the criteria (stronger results lay lower in the diagram). 

Without being too formal, let's try to test if this definition captures the concept correctly by examining a few special cases.

For example, let's take **A** and **B** to be the same object. In this case, (**A → B**) (or  (**A → A**) if you want to be pedantic) would be the topmost object **X** for which the criteria given by the formula **A ∧ X → A** is satisfied. But in this case the formula is *always satisfied* as the *meet* of **A** and any other object would always be below **A**. So this formula is always for all **X**. The topmost object that fits it is, then, the topmost object out there i.e. **True**.

![Implies identity](implies_identity.svg)

This corresponds to the identity axiom in logic, that states that everything follows from itself.

And by the similar logic we can see easily that if we take **A** to be any object that is below **B**, then **(A → B)** will also correspond to the **True** object.

![Implies when A follows from B](implies_b_follows.svg)

So if we have **A → B** if **A** implies **B**, then **(A → B)** is always true.

And what if **B** is lower than **A**. In this case the topmost object that fits the formula **A ∧ X → B** is **B** itself: **B** fits the formula because the meet of two objects is always below those same objects, so **A ∧ B → B** for all **A** and **B**. And **B** is definitely the topmost object that can possibly fit it, as it literary sets its upper bound.

![Implies when B follows from A](implies_a_follows.svg)

Translated to logical language, says that if **B → A**, then the proof of **(A → B)** is just the proof of **B**.

So this is the final condition for an order to be a representation of logic - for each pair **A** and **B**, it has to have a unique object **X** which obey the formula **A ∧ X → B** and the universal property. In category theory this object is called the *exponential object*. 

By the way, distributivity follows from this criteria, so we are left with just the following two points: Logic is represented by an order that has with *meet and joins* and a *functional object*. Which is, I think, the neatest definition of logic there is.
