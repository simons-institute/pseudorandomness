Learning to Models of Mathematical Objects (Feb 21--23)
=======================================================

- Tuesday (Feb 21), 2--3:30 p.m.
- Thursday (Feb 23), 2--3:30 p.m.


A theme that cuts across many domains of computer science and mathematics is to
find simple representations of complex mathematical objects such as graphs,
functions, or distributions on data.   These representations need to capture
how the  object interacts with a class of tests, and to approximately determine
the outcome of these tests.   

For example, in machine learning, the object might be a distribution on data
points, high dimensional real vectors, and the tests might be half-spaces.  The
goal would be to learn a simple representation of the data that determines the
probability of any half-space or possibly intersections of half spaces.  In
computational complexity, the object might be a Boolean function or
distribution on strings, and the tests are functions of low circuit complexity.
In graph theory, the object is a large graph, and the tests are the cuts In the
graph; the representation should determine approximately the size of any cut.
In additive combinatorics, the object might be a function or distribution over
an Abelian group, and the tests might be correlations with linear functions or
polynomials.

The focus of the working group is to understand the common elements that
underlie results in all of these areas, to use the connections between them to
make existential results algorithmic, and to then use algorithmic versions of
these results for new purposes.   For example, can we use boosting, a technique
from supervised learning, in an unsupervised context? Can we characterize the
pseudo-entropy of distributions, a concept arising in cryptography?   Do the
properties of dense graphs "relativize" to sub-graphs of expanders?  

In particular, we'll start from boosting, a technique in machine learning to go
from weak learning to strong learning, i.e., taking an algorithm that learns a
function only with a small correlation and making one that learns the function
on almost all inputs.   We'll show how boosting implies a general Hardcore
Distribution Lemma, showing that any  function that cannot be $1 - \delta$
approximated by simple functions has a sub-distribution of size $\delta$ where
it has almost no correlation with simple functions.  By starting from boosting,
we will be able to show a constructive version of this lemma.  From the
Hardcore Distribution lemma, we'll derive the Dense Model Theorem used by Green
and Tao to show arbitrarily long arithmetic progressions in the primes.  Again,
by starting with boosting, we get a general algorithmic version of DMT.  This
algorithmic version can then be used to derive a general Weak Regularity
Theorem, with that of Frieze and Kannan  and analogs for sparse graphs  as a
special case.  

Hopefully, at this point, the working group will segue from known connections
to new connections, e.g., is there a strong boosting that implies strong
regularity?  Can algorithmic regularity lemmas be used in ML?   

We won't assume any background and will develop everything from first
principles using only simple calculations.  Here's an optional reading list,
and some papers we might refer to.  

Papers with results we'll cover:

Klivans and Servedio, Boosting and Hard-core Sets, FOCS 99.

Omer Reingold, Luca Trevisan, Madhur Tulsiani, Salil P. Vadhan:
Dense Subsets of Pseudorandom Sets. FOCS 2008: 76-85

Luca Trevisan, Madhur Tulsiani, Salil P. Vadhan:
Regularity, Boosting, and Efficiently Simulating Every High-Entropy Distribution. IEEE Conference on Computational Complexity 2009: 126-136

Russell Impagliazzo, Algorithmic Dense Model Theorems and Weak Regularity (unpublished, attached) 


Sita Gakkhar Russell Impagliazzo Valentine Kabanets 

Hardcore Measures, Dense Models and Low Complexity Approximations (unpublished, attached)


Bibliography

We won't go through these papers explicitly, but they provide the context.   



Robert E. Schapire:
The Strength of Weak Learnability (Extended Abstract). FOCS 1989: 28-33

: 01 June 2005
A desicion-theoretic generalization of on-line learning and an application to boosting
Yoav Freund, Robert E. Schapire

Yoav Freund, Robert E. Schapire:
Game Theory, On-Line Prediction and Boosting. COLT 1996: 325-332

Russell Impagliazzo:
Hard-Core Distributions for Somewhat Hard Problems. FOCS 1995: 538-545

Thomas Holenstein:
Key agreement from weak bit agreement. STOC 2005: 664-673

Boaz Barak, Ronen Shaltiel, Avi Wigderson:
Computational Analogues of Entropy. RANDOM-APPROX 2003: 200-215

Alan M. Frieze, Ravi Kannan:
The Regularity Lemma and Approximation Schemes for Dense Problems. FOCS 1996: 12-20

Noga Alon, Amin Coja-Oghlan, Hiêp Hàn, Mihyun Kang, Vojtech Rödl, Mathias Schacht:
Quasi-Randomness and Algorithmic Regularity for Graphs with General Degree Distributions. SIAM J. Comput. 39(6): 2336-2362(2010)

Noga Alon, Assaf Naor:
Approximating the Cut-Norm via Grothendieck's Inequality. SIAM J. Comput. 35(4): 787-803 (2006)

Green, Ben; Tao, Terence (2008). "The primes contain arbitrarily long arithmetic progressions". Annals of Mathematics. 167 (2): 481–547.

Tao, Terence; Ziegler, Tamar (2008). "The primes contain arbitrarily long polynomial progressions". Acta Mathematica. 201 (2): 213–305
