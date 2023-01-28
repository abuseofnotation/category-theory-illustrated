
Adjunctions
===

In this chapter we will continue with this *leit motif* that we developed in the previous two chapters - to begin each of them by introducing a new concept of equality between categories (and furthermore, for each new type of equality to be more relaxed than the previous one.)

We started the chapter about functors by reviewing *categorical isomorphisms*, which are invertable functions between categories.

Then in the chapter on *natural transformations* we saw categories that are equivalent up to an isomorphism.

And now we will relax the condition even more and will review a relationship that is not exactly an equality, , but it is not non-equality either. It is not two-way, but at the same time it is not exactly one-way as well. A relationship called *adjunction*. 

As you can see, I am not very good at explaining, so I got some examples alligned. But before we proceed with them, we will go through something else.


The category of small categories
===

Ha, I got you this time (or at least I hope I did) - you probably thought that I won't introduce another category in this chapter. But this is exactly what I am going to do. And (surprise again) the new category won't be the category of functors (don't worry, we will introduce that in the next chapter.) Instead, we will examine the category of (small) categories, that has all the categories that we saw so far as objects and functors as its morphisms, like $Set$ - the category of sets, $Mon,$ the category of monoids, $Ord,$ the category of orders etc.

![The category of categories](category_of_categories.svg)

**Task:** Go through the functor definition and see how you can make functors compose. 

**Question:** What are the initial and terminal object of the category of small categories.

Categories all the way down
---

The recursive nature of category theory might leave some of you confused: we started by saying that categories are *composed of objects and morphisms*, but now we are saying that there are *morphisms between categories* (functors). And on top of that, there is a category where *the objects are categories themselves*. Does that mean that categories are an example of... categories? Sounds a bit weird on intuitive level (as for example biscuits don't contain other biscuits and houses don't use houses as building material) but it is actually the case.

Category theory does *categorize* everything, so from a category-theoretic standpoint all of maths is categories all the way down and whether you would threat a given category as a universe, or as a point depends solemnly on your viewpoint.

Like, for example, every monoid is a category with one just object, but at the same time, monoids can be seen as belonging to one category - the category of monoids - with monoid homomorphisms acting as objects.

At the same time we have the category of groups, for example, which contains the category of monoids as a subcategory, as all monoids are groups.

There may be many more levels of categories from categories. However that does not mean that we have to cover all of them and think about them at all - it is like the concept of a derivative in calculus - the first derivative of a position of the object gives its *speed*, which is useful, the derivative of speed is also useful - it is *velocity*, but the derivative of velocity and those after it leave us indifferent. We can use the same tactic with our little journey in category theory - stick on the level that make sense for us and not be obsessed with forming picture of the whole thing, because there is no *whole thing* - category theory is an *abstract* theory. That is, it does not seek to represent an actual state of affairs, but to provide a language that you can use to express many different ideas, actual or purely imaginary. So view the category of categories not as a structure, but as a space, where all these concepts live.

{% if site.distribution == 'print' %}

Free and forgetful functors
===

A lot of categories that are in $Cat$ are based on each other i.e. ones where one category is the same as the other plus some additional law - groups are monoids with added inversion, partial orders are antisymmetric preorders. And virtually all categories can be viewed as are sets with added morphisms. Between any two such categories there are two functors called the *forgetful* functor that goes from the richer category to the more plain one and the *free* functor, which goes the other way around.

![Free and forgetful functors](free_forgetful_functors.svg)


Forgetful functors
===

Forgetful functors map the objects from the more richer and featureful category to their corresponding objects in the simpler and more unstructured one. 

![Forgetful functors](forgetful_functors.svg)

They strip (forget) all the structure of the more complex category which is not present in the simpler one. i.e. 

Object mapping
---

The object mapping of the forgetful functor consists of picking the object in the simpler category that corresponds to the one from the richer one. It works by just removing the extra structure or properties of each object in the richer category which is not present in the simpler one.

Let's take the forgetful functor between the category of sets $Set$ and the category of monoids ($Mon$) as an example. A monoid is a set, combined with *a monoid operation*. The monoid operation is the extra structure. And if you do away with it, what is left from a monoid is its underlying set. This observation defines the object mapping of a forgetful functor that goes from the category of monoids to the category of sets - each monoid is mapped to it's underlying set.

![Forgetful functor - object mapping](forgetful_functor_objects.svg)

This same type of functor exists for any two categories that are based on each other. And two categories are based on each other only if such a functor exists.

Morphism mapping
---

In order for the forgetful functor to really be a functor it also must map morphisms between the two categories i.e. to map every *monoid homomorphism* between two monoids to a function between their underlying sets. 

This is not hard - we said that monoid homomorphisms are function between the monoids' underlying sets which preserves the group operation. Which means that they are *functions between the monoids' underlying sets*. So all we need to do is to forget about the extra conditions.

Functor laws
---

Since we basically copied the structure of one category into the other one, the functor laws are obviously followed.

Free functors
===

Now let's review the functor that has certain relation to the forgetful functor, but goes the other way around - from richer to simpler categories.

![Free functors](free_functors.svg)

Saying "going the other way around" is actually not entirely accurate, as we cannot literary reverse the mapping from the forgetful functor. This is so, simply due to the fact that given one simple structure (such as a set) there can be more than one richer structures that correspond to it (e.g. the set of natural numbers is the underlying set of both the monoid of natural numbers under addition and the monoid of natural numbers under mutliplication.)

But, although we cannot create a functor that is the reverse of the forgetful functor, there is one functor that still has some interesting connection to it - this functor is called the *free functor* for a given category. It works by connecting each object from the simpler category to the *free object* corresponding to it. In our case the case of monoids it is the free monoid generated by a given set.

Object mapping
---

The object mapping of the free functor is the procedure for generating *free objects*. For any given object $o$ from the simpler category the free object of $o$, $F(o)$ is an object of the more complex category that adds the minimum structure needed for the $o$ to become an object of the more complex category. 

This concept is complex, so let's take the free monoids as an example. When we reviewed them (in chapter 3) we said that the free monoid of a given set of is just the monoid that "does nothing" i.e. the one that has no laws. 

What does that mean? We said that each monoid can be represented by a set of basic elements, called generators, (such as the 60 degree rotation of a right triangle)

![Generator of the monoid of rotations](generator_rotations.svg)

And a bunch of rules or equations describing how sequences of these generators collapse to a single element (e.g. the fact that rotating the triangle three times gets you to its initial position.)

![Rule of the monoid of rotations](rule_rotations.svg)

Here the rules for a given set of generators can be arbitrary, so the free monoid is the monoid that has no such rules. As a result, the free monoid of a given set is the monoid of all possible (endless) sequences of elements of a that set (which is taken as the monoid's set of generators.

If you think about this definition we would realize that the free monoid is actually just the *list datatype* that we are familiar from programming. And the free functor converting sets to monoids is actually the list functor that we saw in one of the previous sections.

![Free functors](free_functor_objects.svg)

Formally the free monoid over a set $A$ is just the type $[A]$ and the free functor is the function $a \to [a]$ for all $a:A$.

Morphism mapping
---

Once we established that the free functor for set $A$ is just the list functor we already know how the the morphism mapping that converts function between sets to functions between lists of sets, and the way to construct this mapping is to apply the function to every element of that list.

Adjoint functors
===

If the concept of a free object and the corresponding free functor seemed somewhat arbitrary to you, don't worry, it will seem clearer once we pinpoint the relationship it has with the (arguably more straightforward) concept of forgetful functor.

The relationship is a little bit complex - explaining it involves three steps.

Step one: Given a free object, in our case a free monoid from a given set of generators, there exists a monoid homomorphism from it, to any other monoid that is composed of the same set of generators. The homomorphism consists of just applying the monoid laws and, by doing that, converting each elements of the free monoid to an element of the other one. 

So for example, by applying the color-mixing rule we can convert any element of the free monoid generated by the set of the red blue and yellow balls to an element of the color-mixing monoid.

![Adjunction](adjunction_1.svg)

Step two: there exist a morphism from any set to the underlying set of any monoid that is generated by the elements of that set as generators.

![Adjunction](adjunction_2.svg)

Finally, there is a isomorphism between these two sets of functions, which in turn translates to a relationship between the free and forgetful functor that looks like this (the free fuctor is in green and the forgetful one is in red).

![Adjunction](adjunction_3.svg)

You see that This relationship is called an *adjunction* and it defines what the free functor is in terms of the forgetful one, or vice versa.

Unit and counit
---


Another example
---

Let's take another example. The free monoid comprised of just one generator object (which for our purposes we identify with $1$) can be mapped to all cyclic monoids like $Z_{1}$, $Z_{2}$, $Z_{3}$ etc. as well as to the monoid of natural numbers under addition, pictured below

![Adjunction](adjunction_numbers_1.svg)

And in the category of sets, there exist a function between a singleton set and any other set that features its element. 

![Adjunction](adjunction_numbers_2.svg)

The equivalence of those two functions is actually another instance of the adjunction between monoids and sets, created by the free and forgetful functor.

![Adjunction](adjunction_numbers.svg)

There definitely is more to be said about free and forgetful functors, as well as for adjunctions, but as always, I will leave things at the most interesting moment in order to revisit them from a different perspective later.

{%endif%}










Like equivalence, adjunction is a relationship between two categories. Like equivalence, it is composed of two functors.

However, unlike equivalence, an adjunction is not symmetric i.e. although the two functors are two way and we 

$F \bullet G \cong  id_{D}$

$G \bullet F \cong  id_{C}$

$F \bullet G \to id_{D}$

$G \bullet F \to id_{C}$



Free-forgetful adjunctions
===

Formal concept analysis
===

Tensor-Hom adjunction
===

The tensor-hom adjunction is actually a codename for the curry-uncurry function that we saw earlier.




Adjunctions
===

https://github.com/adamnemecek/adjoint/

https://chrispenner.ca/posts/adjunction-battleship

-- Left adjoints preserve joins and right adjoints preserve meets. 

-- Free/forgetful adjunctions are ones where the unit is Id.

