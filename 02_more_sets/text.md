From Sets to Categories
===

In this chapter we will continue with set theory and at the same time, we will start exploring categories.

Products
===

At several times, during the previous chapter, we needed a way to make a set that is a composite of other sets that we already have. For example when we discussed mathematical functions, we couldn't define **+** and **-** functions, because we only knew about functions that take one argument. When we talked about programming, we talked about the primitive types, `Char` and `Number`, and we mentioned that most of the types are composite types. So how do we deal with those?

The simplest composite, or a *product*, of the sets **B**, which contains **b**'s and the set**Y**, which contains **y**'s...

![Product parts](product_parts.svg)

... is just the set of **b**'s and **y**'s.

![Product](product.svg)

The product is denoted **B x Y** and it comes equipped with two functions for retrieving the **b** and the **y** from each **(b, y)**.

Question: Why is this called a product? Hint: How many elements does it have?

Products as Objects
---

We established that in programming sets resemble types and functions resemble functions. Products, in this case, are like stripped-out *classes* (also called *records* or *structs*). The composite sets (the ones which form the product) are just the class's fields (also called *members*). The functions for accessing them are like what programmers call *getter methods*.

For example the famous OOP example of `Person` class with `name` and `age` fields is nothing more than a product of the set of strings, and the sets of numbers (we still haven't defined strings and lists in terms of set theory but we will get to that). Objects with more than two values can be expressed as products the composites of which are themselves products.

Using Products to Define Numeric Operations
---

Products can also be used for expressing functions which take more than one argument. For example, "plus" and "minus", are functions from set of the product of two numbers to the set of numbers. (so **+: R x R → R**). Of course, we cannot draw the function itself, even partly, because it has too much arrows and it would look messy.

Joking, here it is.

![The plus function](plus.svg)

Note that there are languages where the *pair* datastructure (also called a *tuple*) is a first-level construct, and multi-argument functions are really implemented in this way. 

Defining products in Terms of Sets 
---

Now we will define the abstract concept of a product of two sets sets in terms of sets themselves. It is not hard: the product of two sets **Y** and **B** is just the set of all possible *ordered pairs*, which contain one element of the set **Y** and one element of the set **B**. Or formally speaking **Y x B = { (y, b) }** where **y ∈ Y, b ∈ B** (**∈** means "is an element of").


The real challenge is defining what a pair means in terms of sets. 

![A pair](pair.svg)

Note that the pair have to be *ordered*, so it cannot be just a set of two elements (formally speaking **A x B ≠ B x A for all A and B **). Some mathematical operations such as addition and multiplication don't care about order, but others, such as subtraction, do. And in programming we have the ability to assign names to each member of an object, which accomplishes the same purpose as the ordering does in pairs.


So the pair must be ordered, and sets aren't. Turns out that that hasn't stopped mathematicians from coming up with multiple ingenious ways to represent an ordered pair using sets. Here is the first one, which was discovered by Norbert Wiener in 1914. The definition is notable for its smart use of the uniqueness of the empty set. 

![A pair, represented by sets](pair_as_set_2.svg)

The next one was discovered in the same year by Felix Hausdorff. In order to use that one, we just have to define "1", and "2" first.

![A pair, represented by sets](pair_as_set_3.svg)

Discovered in 1921 Kazimierz Kuratowski, this one uses just the component of the pair.

![A pair, represented by sets](pair_as_set_1.svg)


Defining products in Terms of Functions 
---

In the previous chapter we provided a definition of a product by *zooming in* the individual elements of the sets and seeing what they are made of. This gave us a *low-level* view of products. This time we will try to do the opposite, and be as oblivious to the contents of our sets as possible. Instead of zooming in we will zoom out, and try define the product in terms of functions and functional composition. Effectively we will be working at a higher level of abstraction.

So let's begin with an external diagram, showing the definition of the product. Disclaimer: I know that this is a somewhat weird notation, but don't worry, we will not be using it for very long.

![Product, external diagram](product_external.svg)

This diagram already contains the first piece of the puzzle - if the product of sets **Y** and **B**, is a set **G**, there has to be one function **G → Y** and one function **G → B** which give back the elements. However, the product of **G** and **B** is not the only set which for which such functions can be defined. For example a set of triples of **Y x B x R** for some random element **R** also does. If there is a function from **G** to **B** then the set **G** itself meets our condition for being the product, because it is connected to **B** and to itself. And depending on our specific case there can be many other other such objects.

![Product, external diagram](product_candidates.svg)

So what do all these "imposter" sets have in common with the "true" product? Simple - they should all be converted to it, using a functions. 

In order for a set **I** to serve as an impostor for the product of **B** and **Y** and there should be a functions **I → B** and **I → Y**. And because the product of **B** an **Y**  is nothing more than the sum of its pairs, there should also be a function **I → B x Y**.

![Product, external diagram](product_morphisms.svg)
