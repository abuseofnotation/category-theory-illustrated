---
layout: default
title: Logic
---

# Logic

Now let's talk about one more *seemingly* unrelated topic just so we can "surprise" ourselves when we realize it's category theory. By the way, in this chapter there will be another surprise in addition to that, so don't fall asleep. 

Also, I will not merely transport you to a different branch of mathematics, but to an entirely different discipline --- *logic*. 

## What is logic

Logic is the science of the *possible*. As such, it is at the root of all other sciences, all of which are sciences of the *actual*, i.e. that which really exists. For example, if science explains how our universe works then logic is the part of the description which is also applicable to any other universe that is *possible to exist*. A scientific theory aims to be consistent with both itself and observations, while a logical theory only needs to be consistent with itself (and true regardless of observations).  

So, we may say:

{: .definition}

> Logic studies the *rules* by which knowing one thing leads you to conclude (or *prove*) that some other thing is also true, regardless of the things' domain (e.g. scientific discipline) and by only referring to the form of the proof ( i.e. "formally"). 
>
> On top of that, logic tries to organize those rules and arguments in *logical systems* (or *formal systems* as they are also called).

Seeing this description, we might think that the subject of logic is quite similar to the subject of set theory and category theory --- instead of the word "formal" we used another similar word, namely "abstract", and instead of "logical system" we said "theory". This observation would be quite correct --- today most people agree that every mathematical theory is actually logic plus some additional definitions added to it. For example, part of the reason why *set theory* is so popular as a theory for the foundations of mathematics is that it can be defined by adding just one single primitive to the standard axioms of logic which we will see shortly --- the binary relation that indicates *set membership*. Category theory is close to logic too, but in a quite different way, which we will understand later. So, let's begin.

### Primary propositions

A consequence of logic being the science of the possible is that in order to do anything at all in it, we should have an initial set of propositions that we accept as true or false. These are also called "premises", "primary propositions" or "atomic propositions" as Wittgenstein dubbed them. 

![Balls](../05_logic/balls.svg)

In the context of logic itself, these propositions are abstracted away (i.e. we are not concerned about them directly) and so they can be represented with the colorful balls that you are familiar with. 

### Composing propositions

At the heart of logic, as in category theory, is the concept of *composition* --- if we have two or more propositions that are somehow related to one another, we can combine them into one using a logical operators, like "and", "or" and "implies/entails".

The results will be new propositions, which we might call *composite propositions* (to emphasize the fact that they are not primary). 

![Composite propositions --- a ∧ b, a ∨ b, a -> b](../05_logic/logic_composite_propositions.svg)

Note that $∧$ is the symbol for *and* and $∨$ is the symbol for $or$ and $\to$ is the symbol for *follows*.

It is important to emphasize that propositions that are composed of several premises (symbolized by gray balls, containing some other balls) are not in any way different from "primary" propositions (single-color balls) and that they compose in the same way (although in the leftmost proposition the green ball is wrapped in a gray ball to make the diagram prettier).

![Balls as propositions](../05_logic/balls_propositions.svg)

### Modus ponens

As an example of a proposition that contains multiple levels of nesting (and also as a great introduction of the subject of logic in its own right), consider one of the oldest (it was already known by Stoics at 3rd century B.C.) and most famous propositions ever, namely the *modus ponens*. Usually it is presented like this:

{: .theorem}

> If Socrates is human, then Socrates is mortal.
>
> But Socrates is human.
>
> So, Socrates is mortal.

Or we also can say:

{: .theorem}

> If it rains, the ground gets wet.
> 
> It rains.
> 
> Therefore the ground gets wet.

You see the pattern: 

{: .definition}

> Modus ponens is a proposition, comprised of two other propositions, denoted $A$ and $B$, that states that if the proposition $A$ is true, and that if $A$ implies $B$ $(A \to B)$, then $B$ is true as well i.e. $(A \land (A \Rightarrow B) )\to B$.

In our first example, if we know that "Socrates is a human" ($A$) and that "humans are mortal"---or "being human implies being mortal" ($A \to B$), we also know that "Socrates is mortal" ($B$).

Here is how we can express the same thing with a diagram.

![Modus ponens](../05_logic/modus_ponens.svg)

We can see that the modus ponens proposition is composed of two other propositions in a $implies$ relation, where the proposition $B$ is primary, but the proposition which implies $B$ is not primary (let's call that one $C$ --- so the whole proposition becomes $C → B$.)

Going one more level down, we notice that the $C$ propositions is itself composed of two propositions in an *and*, relationship --- $A$ and let's call the other one $D$ (so $A ∧ D$), where $D$ is itself composed of two propositions, this time in a $implies$ relationship --- $A → B$. But all of this is better visualized in the diagram.

### Relations between logical operators 

You might think that composition of logical propositions resembles the way in which two monoid objects are combined into one using the monoid operation and, as we saw, some logical operations do form monoids.

However, unlike monoid/group theory, logic studies combinations of not just with one but with *many* logical operations and *the ways in which they relate to one another*, for example, in logic we are interested in the way "and" and "implies" operators relate to each other in "modus ponens". Or in the law of distributivity of *and* and $or$ operations, which is represented by the following *tautology* (we will explain what that means later).

![The distributivity operation of "and" and "or"](../05_logic/logic_distributivity.svg)

OK, we mentioned tautologies, now let's explain what they are.

### Tautologies

In most cases, we cannot tell whether a given composite proposition is true or false without knowing the values of the propositions that it is made of e.g. we cannot say if "A and B" or "A or B" is true, without knowing if A or B are true.

![Composite propositions --- a ∧ b, a ∨ b, a -> b](../05_logic/logic_composite_propositions.svg)

However, with propositions such as *modus ponens* we can: modus ponens is *always true*, regardless of whether the propositions that form it are true or false. If we want to be fancy, we can also say that it is *true in all models of the logical system*, a model being a set of real-world premises are taken to be signified by our propositions.

For example, our previous example will not stop being true if we *substitute* "Socrates" with any other name, nor if we substitute "mortal" for any other quality that humans possess.

![Variation of modus ponens](../05_logic/modus_ponens_variations.svg)

We call such propositions tautologies.

{: .definition}

> Propositions that are always true, regardless of are the value of the propositions that form them are called *tautologies*. 

And their more-famous counterparts that are always false are called *contradictions*. You can turn each tautology into contradiction, or the other way around, by adding a "not". 

The other statements, ones which may be true or false depending on the values of some other propositions are called "contingent statements". In logic, we don't care about contingent statements --- after all, those are studied in all other sciences (and we are not like other sciences).

The simplest tautology is the so called law of identity, the statement that each proposition implies itself (e.g. "All bachelors are unmarried"). It may remind you of something.

![Identity tautology](../05_logic/tautology_identity.svg)

Here are some more complex (less boring) tautologies (the symbol $¬$ means "not"/negation.

![Tautologies](../05_logic/tautology_list.svg)

We will learn how to determine which propositions are a tautologies shortly, but first let's see why are tautologies important in the first place.

### Axiom schemas/Rules of inference

Tautologies are useful because they are the basis of *axiom schemas*/*rules of inference*. And *axiom schemas* and *rules of inference* serve as starting point from which we can generate other true logical statements by means of substitution.

Realizing that the colors of the balls in modus ponens are superficial, we may want to represent the general structure (schema) of modus ponens that all of its variations share.

![The general structure of modus ponens: a black-and white configuration of balls, symbolizing modus ponens](../05_logic/modus_ponens_schema.svg)

From then on, we can get to any modus-ponens proposition composed of primary proposition by just applying coloring.

![Variations of the general structure of modus ponens: copies of the general schema in which the balls are painted in different colors](../05_logic/modus_ponens_variations.svg)

This structure (the coloring book in our example) is called *axiom schema*. And the propositions that are produced by it are *axioms*. 

{: .definition}

> An axiom schema is a formula (containing placeholders), from which we can derive propositions (by replacing those placeholders with propositions). 

Note that the propositions that we plug into the schema don't have to be primary. For example, having the proposition $a$ (that is symbolized below by the orange ball) and the proposition stating that $a$ implies $a \lor b$ (which is one of the tautologies that we saw above), we can plug those propositions into the *modus ponens* and prove that $a \lor b$ is true. 

![Using modus ponens for rule of inference](../05_logic/modus_ponens_composite.svg)

And *rules of inference* are almost the same thing as axiom schemas e.g. axiom schemas can be easily applied as rules of inference and the other way around. 

Final note, in the previous chapter we repurposed one tautology (modus ponens) as an axiom schema. It is obvious that we can do the same thing for all other tautologies as well.

{: .theorem}

> Every tautology can be used as an axiom schema.

### Logical systems

Knowing that we can use axiom schemas/rules of inference to generate new propositions, we might ask whether it is possible to create a small collection of such schemas/rules that is curated in such a way that it enables us to generate *all* possible propositions. You would be happy (although a little annoyed, I imagine) to learn that there exist not only one, but many such collections. And yes, collections of this sort are what we call *logical systems*.

{: .definition}

> A logical system (known also as formal system) is a collection of axiom schemas/rules of inference such that by applying them we can produce all possible propositions.

Here is one such collection which consists of the following five axiom schemes *in addition to the inference rule modus ponens* (These are axiom schemes, even though we use colors).

![A minimal collection of Hilbert axioms](../05_logic/min_hilbert.svg)

Proving that this and other similar logical systems are complete (can really generate all other propositions) is due to Gödel and is known as "Gödel's completeness theorem" (Gödel is so important that I specifically searched for the "ö" letter so I can spell his name right).

### Interpretations of logic

We now have an idea about how do some of the main logical constructs (axioms, rules of inference) work. But in order to prove that they indeed work, and to understand *what they are*, we need to do so through a specific *interpretation* of those constructs. 

We will look into two interpretations --- one very old and the other, relatively recent. This would be a slight detour from our usual subject matter of points and arrows, but I assure you that it would be worth it. So let's start.

## Classical logic. The truth-functional interpretation 

> Beyond the world that we inhabit and perceive every day, there exist the *world of forms* where reside all ideas and concepts that manifest themselves in the objects that we perceive e.g. beyond all the people that have ever lived, there lies the prototypical person, and we are people only insofar as we resemble that person, beyond all the things in the world that are strong, lies the ultimate concepts of strength, from which all of them borrow and this is true for every single category, e.g. if there is a cup, there is also "cupness". And although, as mere mortals, we live in the world of appearances and cannot perceive the world of forms, we can, through philosophy, "recollect" with it and know some of its features.

The above is a summary of a worldview that is due to the Greek philosopher Plato and is sometimes called Plato's *theory of forms*. Originally, the discipline of logic represents an effort to think and structure our thoughts in a way that they apply to this world of forms i.e. in a "formal" way. Today, this original paradigm of logic is known as "classical logic". Although it all started with Plato, most of it is due to the 20th century mathematician David Hilbert.

The existence of the world of forms implies that, even if there are many things that we, people, don't know and would not ever know, at least *somewhere out there* there exists an answer to every question. In logic, this translates to *the principle of bivalence* that states that *each proposition is either true or false*. 

![The boolean values --- True and False](../05_logic/true_false.svg)

Due to this principle, propositions in classical logic can be aptly represented in set theory by the boolean set, which contains those two values.

![The set of boolean values --- Contains the values True and False](../05_logic/boolean_set.svg)

Logical operators, then, are just our all-too-familiar functions.

{: .definition}

> According to the classical interpretation of logic: 
>
> 1. A *primary proposition* is something that is either true or false (a boolean value. 
> 2. A *logical operator* is a *function* that takes a one or several boolean values and return another boolean value.
> 3. A *composite proposition* is something that results of the application of logical operators to other propositions.

Let's review all logical operators in this semantic context.

### The *negation* operation

Let's begin with the negation operation. Negation is a unary operation, which means that it is a function that takes just *one* argument and (like all other logical operators) returns one value, where both the arguments and the return type are boolean values.

![negation](../05_logic/negation.svg)

The same function can also be expressed in a slightly less-fancy way by this table.

| p | ¬p |
|---| --- | 
| True  | False  | 
| False  | True |

Tables like this one are called *truth tables* and they are ubiquitous in classical logic. They can be used not only for defining operators but for proving results as well.

### Interlude: Proving results by truth tables

Having defined the negation operator, we are in position to prove the first of the axioms of the logical system we saw, namely the *double negation elimination*. In natural language, this axiom is equivalent to the observation that saying "I am *not unable* to do X" is the same as saying  "I am *able* to do it". 

![Double negation elimination formula](../05_logic/double_negation_formula.svg)

(despite its triviality, the double negation axiom is probably the most controversial result in logic, we will see why later.)

If we view logical operators as functions from and to the set of boolean values, than proving axioms involves composing several of those functions into one function and observing its output. More specifically, the proof of the formula above involves just composing the negation function with itself and verifying that it leaves us in the same place from which we started.

![Double negation elimination](../05_logic/double_negation_proof.svg)

If we want to be formal about it, we might say that applying negation two times is equivalent to applying the *identity* function.

![The identity function for boolean values](../05_logic/boolean_identity.svg)

If we are tired of diagrams, we can represent the composition diagram above as table as well. 

| p | ¬p | ¬¬p |
|---| --- | --- |
| True  | False  | True |
| False  | True | False |

Each proposition in classical logic can be proved with such diagrams/tables.

### The And and Or operations

OK, *you* know what *and* means and *I* know what it means, but what about those annoying people that want everything to be formally specified (nudge, nudge). Well we already know how we can satisfy them --- we just have to construct the boolean function that represents *and*. 

Because *and* is a *binary* operator, instead of a single value the function would accept a *pair* of boolean values.

![And](../05_logic/and.svg)

Here is the equivalent truth-table (in which $∧$ is the symbol for *and*.)

| p |	q | p ∧ q |
|---| --- | ---   |
| True  | True  | True  |
| True  | False | False |
| False | True  | False |
| False | False | False |

We can do the same for $or$, here is the table.

| p |	q | p ∨ q |
|---| --- | ---   |
| True  | True  | True  |
| True  | False | True  |
| False | True  | True  |
| False | False | False |

**Task 1:** Draw the diagram for *or*.

Using those tables, we can also prove some axiom schemas we can use later:

- For *And*: $p ∧ q → p$ and $p ∧ q → q$ "If I am tired and hungry, this means that I am hungry".
- For *Or*:  $p → p ∨ q$ and $q → p ∨ q$ "If I have a pen this means that I am either have a pen or a ruler".

### The Implies operation

Let's now look into something less trivial: the *implies* operation, (also known as *material condition*). This operation binds two propositions in a way that the truth of the first one implies the truth of the second one (or that the first proposition is a *necessary condition* for the second.) You can read $p → q$ as "if $p$ is true, then $q$ must also be true. 

Implies is also a binary function --- it is represented by a function from an ordered pair of boolean values, to a boolean value.

| p |	q | p → q |
|---| --- | ---   |
| True  | True  | True  |
| True  | False | False |
| False | True  | True  |
| False | False | True  |

Now there are some aspects of this which are non-obvious so let's go through every case.

1. If $p$ is true and $q$ is also true, then $p$ does imply $q$ --- obviously.
2. If $p$ is true but $q$ is false then $q$ does not follow from $p$ --- cause $q$ would have been true if it did.
3. If $p$ is false but $q$ is true, then $p$ still does imply $q$. What the hell? Consider that by saying that $p$ implies $q$ we don't say that the two are 100% interdependent e.g. the claim that "drinking alcohol causes headache" does not mean that drinking is the only source of headaches.
4. And finally if $p$ is false but $q$ is false too, then $p$ still does imply $q$ (just some other day).

It might help you to remember that in classical logic $p → q$ ($p$ implies $q$) is true when $\neg p ∨ q$ (either $p$ is false or $q$ is true.) 


### The If and only if operation

Now, let's review the operation that indicates that two propositions are equivalent (or, when one proposition is *a necessary and sufficient condition* for the other (which by itself implies that the reverse is also true.)) This operation yields true when the propositions have the same value.

| p |	q | p ↔ q |
|---| --- | ---   |
| True  | True  | True  |
| True  | False | False |
| False | True  | False |
| False | False | True  |

But what's more interesting about this operation is that it can be constructed using the *implies* operation --- it is equivalent to each of the propositions implying the other one (so $p \leftrightarrow q$ is the same as $p \to q \land q \to p$) --- something which we can easily prove by comparing some truth tables.

| p |	q | p → q | q → p | p → q ∧ q → p|  
|---| --- | ---   | --- | --- | --- |
| True  | True  | True  | True | True | 
| True  | False | False | True | False | 
| False | True  | True  | False  | False | 
| False | False | True  | True | True | 

Because of this, the equivalence operation is called "if and only if", or "iff" for short.

### Proving results by axioms/rules of inference

Let's examine the above formula, stating that $p → q$ is the same as $¬p ∨ q$. 

![Hilbert formula](../05_logic/hilbert_formula.svg)

We can easily prove this by using truth tables.

| p |	q | p → q | ¬p  | q   |  ¬p ∨ q |
|---| --- | ---   | --- | --- | --- |
| True  | True  | **True**  | False | True | **True** |
| True  | False | **False** | False | False | **False** |
| False | True  | **True**  | True  | True | **True** |
| False | False | **True**  | True  | False | **True** |

But it would be much more intuitive if we do it using axioms and rules of inference. To do so, we start with the formula we have ($p → q$) plus the axiom schemas, and arrive at the formula we want to prove ($¬p ∨ q$). 

Here is one way to do it. The formulas that are used at each step are specified at the right-hand side, the rule of inference is modus ponens.

![Hilbert proof](../05_logic/hilbert_proof.svg)

Note that to really prove that the two formulas are equivalent we have to also do it the other way around (start with ($¬p ∨ q$) and ($p → q$)).

## Intuitionistic logic. The BHK interpretation 


> [...] logic is life in the human brain; it may accompany life outside the brain but it can never guide it by virtue of its own power. --- L.E.J. Brouwer

I don't know about you, but I feel that the classical truth-functional interpretation of logic (although it works and is correct in its own right) doesn't fit well the categorical framework that we are using here: It is too "low-level", it relies on manipulating the values of the propositions. According to it, the operations *and* and *or* are just 2 of the 16 possible binary logical operations and they are not really connected to each other (but we know that they actually are.)

For these and other reasons, in the 20th century a whole new school of logic was founded, called *intuitionistic logic*. If we view classical logic as based on *set theory*, then intuitionistic logic would be based on *category theory* and its related theories. If *classical logic* is based on Plato's theory of forms, then intuitionism began with a philosophical idea originating from Kant and Schopenhauer: the idea that the world as we experience it is largely predetermined of out perceptions of it. Thus without absolute standards for truth, a proof of a proposition becomes something that you *construct*, rather than something you discover.

Classical and intuitionistic logic diverge from one another right from the start: because according to intuitionistic logic we are *constructing* proofs rather than *discovering* them as some universal truth, we are *off with the principle of bivalence*. That is, in intuitionistic logic we have no basis to claim that each statements is necessarily *true or false*. For example, there might be a statements that might not be provable not because they are false, but simply because they fall outside of the domain of a given logical system (the twin-prime conjecture is often given as an example for this.) 

Anyway, intuitionistic logic is not bivalent, i.e. we cannot have all propositions reduced to true and false. 

![The True/False dichotomy](../05_logic/true_false.svg)

But there is one thing that we still *do* have --- there are still propositions that are "true" in the sense that a proof for them is given --- the primary propositions. So with some caveats (which we will see later) the bivalence between true and false proposition might be thought out as similar to the bivalence between the existence or absence of a proof for a given proposition --- there either is a proof of it or there isn't.

![The proved/unproved dichotomy](../05_logic/proved_unproved.svg)

This bivalence is at the heart of what is called the Brouwer–Heyting–Kolmogorov (BHK) interpretation of logic, something that we will look into next.

Here is a definition of the BHK interpretation (note that the BHK interpretation the main concept is not that of proposition, but that of proof).

{: .definition}

> According to the BHK interpretation of logic: 
>
> 1. A *primary proposition* is something for which a proof is given.
> 2. A *logical operator* is a construction that unites several proofs into another proof.
> 3. A *composite proposition* is something for which a proof can be constructed, by combining primary propositions using logical operators.

The original formulation of the BHK interpretation is not based on any particular mathematical theory.  Here, we will first illustrate it using the language of set theory (just so we can abandon it a little later).

### The And and Or operations

As the existence of a proof of a proposition is taken to mean that the proposition is true, the definitions of *and* is rather simple --- the proof of $A ∧ B$ 

![And in the classical interpretation](../05_logic/classical_and.svg)

...is just *a pair* containing a proof of $A$, and a proof of $B$ i.e. *a set-theoretic product* of the two (see chapter 2). 

![And in the BHK interpretation](../05_logic/bhk_and.svg)

{: .theorem}
> According to the BHK interpretation, a proof of $A \land B$ is a product of a proofs of $A$ and $B$ ($A \times B$).

The principle for determining whether the proposition is true or false is similar to that of primary propositions --- if the pair of proofs of $A$ and  $B$ exist (i.e. if both proofs exist) then the proof of $A \land B$ can be constructed (and so $A \land B$ is "true").


**Task 2:** What would be the **or** operation in this case?

### The Implies operation

Now for the punchline: in the BHK interpretation, the *implies* operation is just a *function* between proofs. 


![Implies in the BHK interpretation](../05_logic/bhk_implies.svg)


{: .theorem}
> According to the BHK interpretation, saying that $A$ implies $B$ ($A \to B$), would just mean that there exist an arrow (function) that can convert a proof of $A$ to a proof of $B$. 

But in order to reason about proofs , we need to also have an implies *set*, or a *homomorphism set* as it is called in set theory), that is, a set containing all arrows between given two objects, with one element for each arrow.

![Implies object in the BHK interpretation](../05_logic/bhk_implies_object.svg)

Then, *modus ponens* is nothing more than the process of *functional application*. i.e. if we have a pair, containing a proof of $A$ and a function $A \to B$ we can call this function to obtain a proof of $B$.

### The If and only if operation

In the section on classical logic, we proved that two propositions $A$ and $B$ are equivalent if $A$ implies $B$ and $B$ implies $A$. But if the *implies* operation is just a function, then proposition are equivalent precisely when there are two functions, converting each of them to the other i.e. when the sets containing the propositions are *isomorphic*.

![Implies in the BHK interpretation](../05_logic/bhk_iff.svg)

(Perhaps we should note that *not all set-theoretic functions are proofs*, only a designated set of them (which we call *canonical* functions) i.e. in set theory you can construct functions and isomorphisms between any pair of singleton sets, but that won't mean that all proofs are equivalent.)

### The Negation operation

So according to BHK interpretation saying that $A$ is true, means that that we possess a proof of $A$ --- simple enough. But it's a bit harder to express the fact that $A$ is false: it is not enough to say that we *don't have a proof* of $A$ (the fact that don't have it, doesn't mean it doesn't exist). Instead, we must show that claiming that $A$ is true leads to a *contradiction*.

To express this, intuitionistic logic defines the constant $⊥$ which plays the role of *False* (also known as the "bottom value"). $⊥$ is defined as the proof of a formula that does not have any proofs. And the equivalent of false propositions are the ones that imply that the bottom value is provable (which is a contradiction). So instead of...

![Negation in the classical interpretation: Not A](../05_logic/classical_negation.svg)

...we can write:

![Negation in the BHK interpretation: A implies Bottom](../05_logic/bhk_negation.svg)

{: .theorem}

> According to the BHK interpretation, $\lnot A$ can be read as $A \to \bot$

In set theory, the $⊥$ constant is expressed by the empty set.

![False in the BHK interpretation](../05_logic/bhk_false.svg)

And the observation that propositions that are connected to the bottom value are false is expressed by the fact that if a proposition is true, i.e. there exists a proof of it, then there can be no function from it to the empty set.

![False in the BHK interpretation](../05_logic/bhk_false_function.svg)

The only way for there to be such function is if the set of proofs of the proposition is empty as well.

![False in the BHK interpretation](../05_logic/bhk_false_function_2.svg)

**Task 3:** Look up the definition of function and verify that there cannot exist a function from any set *to the empty set* 

**Task 4:** Look up the definition of function and verify that there does exist a function *from the empty set* to itself (in fact there exist a function from the empty set to any other set.


<!--
{% if site.distribution == 'print' %}
-->
### Interlude: The law of excluded middle

Although intuitionistic logic differs a lot from classical logic when it comes to its *semantics*, i.e. in the way the whole system is built (which we described above), it actually doesn't differ so much in terms of *syntax*, i.e. if we try to deduce the axiom schemas/rules of inference that correspond to the definitions of the structures outlined above, we would see that they are virtually the same as the ones that define classical logic. There is, however, one exception concerning the *double negation elimination axiom* that we saw earlier, a version of which is known as *the law of excluded middle*.

![The formula of the principle of the excluded middle](../05_logic/excluded_middle_formula.svg)

{: .theorem}

> The law of excluded middle is valid in classical logic and is true when we look at its truth tables, but there is no justification for it terms of the BHK interpretation. 

Why? in intuitionistic logic saying that something is false amounts to *constructing a proof* that it is false (that it implies the bottom value) and there is no method/function/algorithm that can either prove that a given proposition is either true and false.


The question of whether you can use the law of excluded middle spawned a heated debate between the classical logic proponent David Hilbert and the intuitionistic logic proponent L.E.J. Brouwer, known as *the Brouwer–Hilbert controversy*.

<!--
{%endif%}
-->

## Logics as categories

Aside from being an alternative to classical logic, the BHK interpretation is interesting because it provides that higher-level view of logic, that we need in order to construct a interpretation of it based on category theory. 

Such higher-level interpretations of logic are sometimes called *algebraic* interpretations, *algebraic* being an umbrella term describing all structures that can be represented using category theory, like groups and orders.

So, you might suspect already: objects are propositions and morphisms are proofs. And a logical system can be seen as a category.

But as usual there is a caveat --- not all categories can be converted to logical systems, only some of them. So, to conclude our theorem, we will enumerate the criteria that a given category has to adhere to, in order for it to be "logical". These criteria have to guarantee that the category has an object that corresponds to every valid logical propositions and that no objects corresponds to an invalid ones. 

![Logic as a category](../05_logic/logic_curry_category.svg)

Categories that adhere to these criteria are called *bicartesian closed categories*.  But before describing them them directly, we would start with a similar but simpler structures that we already examined --- orders.

**Task 5:** There is a special types of programming languages called "proof assistants" that help you verify logical proofs. Install a proof assistant and try to see how it works. I recommend the Coq Tutorial by Mike Nahas for Coq/Roql, the Natural Numbers Game for Lean or the HoTT Game for Agda.

**Task 6:** We will concentrate on proving that some categories form logics. But meanwhile, you can prove that all logics form categories, using the definition of a category that we used in the previous chapter. 

### Logics as orders

So, we already saw that a logical system along with a set of primary propositions forms a category.

![Logic as a preorder](../05_logic/logic_category.svg)

If we assume that there is only one way to go from proposition $A$, to proposition $B$ (or there are many ways, but we are not interested in the difference between them), then logic is not only a category, but a *preorder* in which the relationship "bigger than" is taken to mean "implies", so ($A \to B$ is $A ≤ B$).

![Logic as a preorder](../05_logic/logic_preorder.svg)

Furthermore, if we count propositions that follow from each other (or sets of propositions that are proven by the same proof) as equivalent, then logic is a proper *partial order*.

![Logic as an order](../05_logic/logic_order.svg)

And so it can be represented by a Hasse diagram, in which $A \to B$ only if $A$ is below $B$ in the diagram.

![Logic as an order](../05_logic/logic_hasse.svg)

This is something quite characteristic of category theory --- examining a concept in a more limited version of a category (in this case orders), in order to make things simpler for ourselves. 

Now let's examine the question that we asked before --- exactly which ~~categories~~ orders represent logic and what laws does an order have to obey so it is isomorphic to a logical system? We will attempt to answer this question as we examine the elements of logic again, this time in the context of orders.

### the And and Or operations

By now you probably realized that the *and* and *or* operations are the bread and butter of logic (although it's not clear which is which). As we saw, in the BHK interpretation those are represented by set *products* and *sums*. The equivalent constructs in the realm of order theory are *meets* and *joins* (in category-theoretic terms *products* and *coproducts*.)

![Order meet and joing](../05_logic/lattice_meet_join.svg)

Logic allows you to combine any two propositions in and *and* or *or* relationship, so, in order for an order to be "logical" (to be a correct representation for a logical system,) *it has to have $meet$ and $join$ operations for all elements*. Incidentally we already know how such orders are called --- they are called *lattices*.

{: .definition}

> An order which has meets and joins for all elements is called a lattice.

And there is one important law of the  *and* and *or* operations, that is not always present in all lattices. It concerns the connection between the two, i.e. way that they distribute, over one another.

{: .definition}

> A lattice is distributive, if for every three objects $A$, $B$ and $C$, we have $A ∧ (B ∨ C) \cong (A ∧ B) ∨ (A ∧ C)$.

Wait, where have we heard about distributive lattices before? In the previous chapter we said that they are isomorphic to *inclusion orders* i.e. orders of sets, that contain a given collection of elements, and that contain *all combinations* of a given set of elements. The fact that they popped up again is not coincidental --- "logical" orders are isomorphic to inclusion orders. To understand why, you only need to think about the BHK interpretation --- the elements which participate in the inclusion are our prime propositions. And the inclusions are all combinations of these elements, in an *or* relationship (for simplicity's sake, we are ignoring the *and* operation.)

![A color mixing poset, ordered by inclusion](../05_logic/logic_poset_inclusion.svg)

The *or* and *and* operations (or, more generally, the *coproduct* and the *product*) are, of course, categorically dual, which would explain why the symbols that represent them $\lor$ and $\land$ are the one and the same symbol, but flipped vertically. And even the symbol itself looks like a representation of the way the arrows converge (although it is probably not the case, as this symbol is used way before Hasse diagrams were a thing).

### The *negation* operation

In order for a distributive lattice to represent a logical system, it has to also have objects that correspond to the values *True* and *False* (which are written $\top$ and $\bot$). But, to mandate that these objects exist, we must first find a way to specify what they are in order/category-theoretic terms.

A well-known result in logic, called *the principle of explosion*, states that if we have a proof of *False* (which we write as $\bot$) i.e. if we have a statement "*False* is true" if we use the terminology of classical logic, then any and every other statement can be proven. And we also know that no true statement implies *False* (in fact in intuitionistic logic this is the definition of a true statement). Based on these criteria we know that the *False* object would look like this when compared to other objects:

![False, represented as a Hasse diagram](../05_logic/lattice_false.svg)

Circling back to the BHK interpretation, we see that the empty set fits both of these conditions.

![False, represented as a Hasse diagram](../05_logic/lattice_false_bhk.svg)

Conversely, the proof of *True* which we write as $\top$, expressing the statement that "*True* is true", is trivial and doesn't say anything, so *nothing follows from it*, but at the same time it follows from every other statement.

![True, represented as a Hasse diagram](../05_logic/lattice_true.svg)

So *True* and *False* are just the *greatest* and *least* objects of our order (in category-theoretic terms *terminal* and *initial* object). This is another example of the categorical concept of duality --- $\top$ and $\bot$ are dual to each other, which makes a lot of sense if you think about it, and also helps us remember their symbols (although if you are like me, you'll spent a year before you stop wondering which one is which, every time I see them). 
![The whole logical system, represented as a Hasse diagram](../05_logic/lattice_true_false.svg)

{: .definition}
> A lattice that has a least and greatest elements is called a *bounded lattice*.

So, to summarize, not only should our distributive lattice be *distributive*, but it also has to be *bounded* i.e. it has to have greatest and least elements (which play the roles of *True* and *False*).

### The *implies* operation

There is one final condition for our logic-representing lattice. 

As we said, every lattice has representations of propositions implying one another (i.e. it has arrows).

![An arrow (implication): A -> B](../05_logic/implies.svg)

...but to really represents a logical system, a lattice it also has to have *implication objects* i.e. there needs to be a unique "implies object" $A \Rightarrow B$ for each pair of objects $A$ and $B$, which represents the proposition $A$ implies $B$.

![An arrow object: an object representing A -> B](../05_logic/implies_objects.svg)

In set theory, this object is just the "homomorphism set", the set of arrows, but here we are doing category theory, so we will describe this object in the categorical way: by defining a structure consisting of a of objects and arrows in which $A \Rightarrow B$ plays a part. 

And this structure is actually a categorical reincarnation our favorite rule of inference, the *modus ponens*.

![Implies operation](../05_logic/implies_modus_ponens.svg)

Modus ponens is the essence of the *implies* operation, and, because we already know how the operations that it contains (*and* and *implies*) are represented in our lattice, we can directly use it as a definition by saying that the object $A → B$ is the one for which modus ponens rule holds.

{: .definition}

> The implication object $A \Rightarrow B$ is an object which is related to objects $A$ and $B$ in such a way that such that $A ∧ (A \Rightarrow B) → B$.

This definition is not complete, however, because (as usual) $A \Rightarrow B$ is *not the only object* that fits in this formula. For example, the set $A \Rightarrow B ∧ C$ is also one such object, as is $A \Rightarrow B ∧ C ∧ D$ 
![Implies operation with universal property](../05_logic/implies_modus_ponens_impostors.svg)

So how do we set apart the real object from all those "imposter" objects? If you remember the definitions of the *categorical product* (or of its equivalent for orders, the *meet* operation) you would already know where this is going: we recognize that $A \Rightarrow B$ is the upper *limit* of $A \Rightarrow B ∧ C$. So, $A \Rightarrow B ∧ C ∧ D$ and all other imposter formulas that can be in the place of $X$ in $A ∧ X → B$ are below it. 

![Implies operation with universal property](../05_logic/implies_universal_property.svg)

The relationship can be described in a variety of ways.

When we think of *orders*, we can say:

{: .definition}

> For any two elements in an order $A$ and $B$, the *exponential element* $A \Rightarrow B$ (called also a *relative pseudo-complement* of $A$ in respect to $B$) is the *biggest/topmost* object $X$ such that the meet of $X$ and $A$ is smaller than $B$, so $(A ∧ X) → B$  (i.e. $A ∧ (A \Rightarrow B) → B$).



Logically, we say this:

{: .definition}

> For any propositions $A$ and $B$, the *implication proposition* $A \Rightarrow B$ (called also *entailment*) is the most *trivial* proposition $X$ for which the formula $A ∧ X → B$ (i.e. $A ∧ (A \Rightarrow B) → B$) is satisfied.


Finally, here is a general *categorical* definition:

{: .definition}

> For any objects $A$ and $B$ in a categoruy, the *exponential object* (called also *internal homomorphism object*) $A \Rightarrow B$ is object $X$ such that: 
> 1. The product of $X$ and $A$ is connected to $B$ with a morphism, so $(A \times X) → B$  (i.e. $A \times (A \Rightarrow B) → B$).
> 2. For any impostor exponential object$I$, that also has such morphism, there must also exist a unique function (called universal morphism) with the type signature $g: I \to A \to B$, that converts the impostor exponential to the real exponential, such that the morphism connecting the impostor to $B$ would be a result of the composition of $g$.

The existence of this implication object is the final condition for an order/lattice to be a representation of logic.

Note that this definition of implication object is valid specifically for intuitionistic logic. For classical logic, the definition of is simpler: because of the law of excluded middle there $A \Rightarrow B$ is just another way to spell $\lnot A ∨ B$.  

Note that, as usual, we treat isomorphic objects as equal: there might be several objects that play the role of $A \Rightarrow B$, for some $A$ and $B$, but they would be isomorphic to each other i.e. like meets and joins, implication object is defined *up to a (unique) isomorphism*.

### Formal definition for orders

So, we talked about a lot of stuff, now it's time to lay the definitions. We saw that intuitionistic logic consists of the values *True* and *False* and the operations *and* *or* and *implies*.

![A Heyting algebra](../05_logic/logic_operations.svg)

As we said, the "logical" orders (those who account for all those conditions) have special names. They are called *Heyting algebras*.

{: .definition}

> An order that has joins/meets, greatest/least objects and a implication object is called a Heyting algebra.

And then we say...

{: .definition}

> The logical system of intuitionistic logic can be seen as a Heyting algebra---the "and" and "or" operations are the joins/meets, the values "True" and "False" are the greatest and least objects and the implication operation is the exponential object.

### Formal definition for categories

We phrased the above definition in terms of *thin* categories (orders), but if we adjust the terminology, they will also be valid for all other categories as well.

{: .definition}

> A category that has products/coproducts, initial/terminal objects and an exponential objects is Bicartesian closed.

And then

{: .theorem}

> The logical system of intuitionistic logic can be seen as a Bicartesian Closed Category---the "and" and "or" operations are the product/coproducts, the values "True" and "False" are the initial/terminal objects and the implication operation is the exponential object.

By the way, a lattice can follow the laws of *classical logic*, as well. it has to be *bounded* and *distributive* and in addition to that it has to be *complemented* which is to say that each proposition $A$, there exist an a unique proposition $\neg A$ (such that $A ∨ \neg A = 1$ and $A ∧ \neg A = 0$). These lattices are called *boolean algebras*.


## A taste of categorical logic

In the previous section we saw some definitions, here we will convince ourselves that they really capture the concept of logic correctly, by proving some results using categorical logic.

### True and False

The join (or least upper bound) of the *topmost* object $\top$ (which plays the role of the value *True*) and any other object that you can think of...

![The join of True and X: Three Balls, True and X and their join, with arrows pointing from True and X to the join](../05_logic/join_true.svg)

...is the $\top$ itself (or something isomorphic to it, which, as we said, is the same thing). 

![The join of True and X: Three Balls, True and X and their join, with arrows pointing from True and X to the join, and one arrow pointing from the join to True](../05_logic/join_true_answer.svg)

This follows trivially from the fact that the join of two objects must be bigger or equal than both of these objects, and by definition the only object that is bigger or equal to the $\top$ is $\top$ itself (this is because $\top$ (as any other object) is equal to itself).

This diagram corresponds to the following logical statement $A \lor \top \cong \top$. So, in order to test if we worked properly, we have to check if this statement is a tautology (and hence a theorem). And indeed it is:

{: .theorem}

> For any object $A$, $A \lor \top = \top$.

**Task 7**: Think of the dual situation, with False. What does it imply, logically?

### And and Or

Let's try something else, take two objects $A$ and $B$ such that there is an arrow between them $A \to B$ and find their join.

![Objects A and B, and their join, with an arrow connecting A and B and to arrows from A and B to the join](../05_logic/join_bigger.svg)

When we are looking for the join of two object, we are looking for the *least* upper bound i.e. the *lowest* object that is equal or bigger than both of them. So, any time we have two objects and one is higher than the other, their join would be (isomorphic to) the higher object.

![Objects A and B, and their join, with an arrow connecting A and B and to arrows and a second arrow from the join to B: B is isomorphic to the join.](../05_logic/join_bigger_answer.svg)

In other words we have a new theorem (which can also be confirmed with truth tables and/or other axioms).

{: .theorem}

> If $A \to B$, then $A \lor B = B$

Note that this is actually a generalization of the previous result, which says that join between any random object and the $\top$ object is  $\top$ itself (since for any object $A$, we always have $A \to \top$).

![Objects A and True, and their join, with an arrow connecting A and True and a second arrow from the join to True: True is isomorphic to the join.](../05_logic/join_bigger_true.svg)

### Implies

For our first example with implies, let's take the formula $A \Rightarrow B$ (note that we use a double arrow $\Rightarrow$ so as not to confuse $A \Rightarrow B$ (the object) with $A \to B$ (the statement that $A$ implies $B$). And examine the case when $A$ and $B$ are the same object. 

We said that, $A \Rightarrow B$ ($A \Rightarrow A$ in our case) is the topmost object $X$ for which the criteria given by the formula $A ∧ X → B$ is satisfied. But in this case, the formula is satisfied for any $X$, (because it evaluates to $A ∧ X → A$, which is always true), i.e. the topmost object that satisfies it is... the topmost object there is i.e. (an object isomorphic to) $True$. 

![Implies identity](../05_logic/implies_identity.svg)

Does this make sense? Of course it does: in fact, we just proved one of the most famous laws in logic (called the law of identity, as per Aristotle):

{: .theorem}

> For any $A$, $A → A$ is always true, i.e. everything implies itself (everything follows from itself).

And what happens if $A$ implies $B$ in any model, i.e. if $A \models B$ (semantic consequence)? In this case, $A$ would be below $B$ in our Hasse diagram (e.g. $A$ is the blue ball and $B$ is the orange one). Then the situation is somewhat similar to the previous case: $A ∧ X → B$ will be true, no matter what $X$ is (simply because $A$ already implies $B$, by itself). And so $A → B$ will again correspond to the $\top$ object.

![Implies when A follows from B](../05_logic/implies_b_follows.svg)

This is again a well-known result in logic:

{: .theorem}

> (sometimes called deduction theorem) $A$ implies $B$ in any model, then ($A \models B$), then the statement $(A \Rightarrow B)$ will always be true.

## Interlude: Free Heyting algebras -- making ourselves a logic

Once we know all this, doing logic is easy: first, we pick the primary propositions that we want to work with, those are the statements that depend on our problem domain (or, in this case, just our color preferences). 

![Logic as an order](../05_logic/algebra_balls.svg)

Then, depending of the flavor of logic that we selected, in this case intuitionistic logic, we start graphing the *composite propositions*, we have to have $A \land B$,  $A \lor B$ for all $A$s and $B$s.

![Heyting algebra](../05_logic/heyting_algebra.svg)

(By the way, we can just as well model Boolean algebra algebraically)

![Boolean algebra](../05_logic/boolean_algebra.svg)

Then we are able to determine which propositions follow from any proposition by just following the path of the arrows coming from it. 

![Logic as an order](../05_logic/heyting_algebra_path.svg)

Note that we also have to graph the compostite of the composite propositions, which will make our list infinite (drawing such diagrams is very hard and I can never be quite sure which is the correct place for each proposition, so please report me any errors you might see: I can send you a 100$ check, like Donald Knuth, but only if you promise not to cash it, as I am broke).

![Logic as an order](../05_logic/heyting_algebra_full.svg)

In general, doing logic is this --- we start by the things that we already know and then we find the path that leads us to the things that we are interested in proving (or, depending on the viewpoint, we construct the proof by manipulating the proofs that we already have). 

The only thing we are not generally able to do (in intuitionistic logic, specifically) is to prove that a given fact *cannot be reached* from on our path, i.e. that it cannot be proved from the axioms ("you cannot prove a negative").

<!--
{% if site.distribution == 'print' %}
-->

## Answers

---

**Task 1**: Draw the diagram for *or*

The *or* operation can be represented as a function that takes a pair of boolean values and returns `True` if at least one of them is `True`.

| p | q | p ∨ q |
|---|---|-------|
| True | True | True |
| True | False | True |
| False | True | True |
| False | False | False |

---

**Task 2**: What would be the *or* operation in the BHK interpretation?

In the BHK interpretation, the proof of $A ∨ B$ the well-known disjoint union/coproduct/meet --- a structure, containing either a proof of A or a proof of B, along with information about which one it is.

---

**Task 3**: Verify there cannot exist a function from any set to the empty set.

For any non-empty set $A$, there cannot be a function $f: A → ∅$ because:
A function must assign to each element of $A$ exactly one element of $∅$ but ∅ has no elements, so there's nothing to assign.

The only exception is when $A$ is also empty (see next question).

---

**Task 4**: Verify there exists a function from the empty set to any set

There is exactly one function from $∅$ to any set B, called the *empty function*:

A function must assign to each element of the domain exactly one element of the codomain, so if $∅$ has no elements this condition is satisfied

And we mentioned the corresponding logical principle of explosion, that says that everything follows from $False$.

---

**Task 5**: Install a proof assistant

Here you are on your own, sorry :)

---

**Task 6:** Try to prove that logics indeed form categories, using the definition of a category that we used in the previous chapter. 

We want to prove that there is a category with logical propositions as object and implication as morphism.
Let's check the axioms:

- *Identity* is covered --- as we said, for every proposition $A$, we have $A → A$ 
- *Composition* too, because $A → B$ and $B → C$, then $A → C$, this easily follows from modus ponens (this can be your first proof with the proof assistant).
- *Associativity* also checks out as $(A → B) → ((B → C) → (A → C))$.

And, if we want to consider all proofs from $A \to B$ as equivalent, we get an order, else, a normal category.

---

**Task 7**: Think of the dual situation with False

The dual situation concerns the meet operation ($∧$) and the bottom element $⊥$ (False):

$$⊥: A ∧ ⊥ = ⊥$$ 

That is, if we unite any statement with a false statement, the result would be always be false e.g. the statement "The grass is green *and* pigs can fly" is false (and changing the part where we say "The grass is green" to something else won't change that).

This is, of course dual to the one we mentioned:

$$A ∨ ⊤ = ⊤$$

<!--
{%endif%}
-->

<!--
The Rieger–Nishimura lattice
---
I forgot to mention that a Heytung algebra that is generated from a given set of axioms is called the Free Heytung algebra of these axioms (just like the free monoids, if you remember those). Above, you saw my (dubious) attempt at drawing the free Heytung algebra of 3 generators, and the result was really messy, but if we attempt to draw the free Heytung algrebra of just 1 generator, then it is actually becomes pretty neat (yes, the free )
-->


<!--
### Proving a negative

If classical logic is based on the belief that everything is either true or false, intuitionistic logic gives precedence to the famous common-sense principle that *you cannot prove a negative*.

which means that while you can given a true statement and follow the arrows to reach other true statements, false statements would remain unreachable.

Given a logical system, consisting of axioms and rules of inference, I define positive statements as statements of the type "X follows from the axioms" and negative statements as statements of type  "X does not follow from the axioms".

Given those definitions, a positive statement is proven by just applying the rules of inference to the axioms until you reach the statement you want to prove, while there is no general way to prove a negative statement.

![Path from truth](../05_logic/paths_truth.svg)


https://personal.math.ubc.ca/~cytryn/teaching/scienceOneF10W11/handouts/OS.proof.4methods.html

https://en.wikibooks.org/wiki/Mathematical_Proof/Methods_of_Proof#Direct_proof

-->
