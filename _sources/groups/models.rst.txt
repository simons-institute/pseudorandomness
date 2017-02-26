Notes from presentation by Russell Impagliazzo at the Simons Working Group on
Learning Models of Mathematical Objects.

Prepared by Holden Lee.

Background
----------

A theme that cuts across many domains of computer science and
mathematics is to find simple representations of complex mathematical
objects such as graphs, functions, or distributions on data. These
representations need to capture how the object interacts with a class of
tests, and to approximately determine the outcome of these tests.

For example, in machine learning, the object might be a distribution on
data points, high dimensional real vectors, and the tests might be
half-spaces. The goal would be to learn a simple representation of the
data that determines the probability of any half-space or possibly
intersections of half spaces. In computational complexity, the object
might be a Boolean function or distribution on strings, and the tests
are functions of low circuit complexity. In graph theory, the object is
a large graph, and the tests are the cuts In the graph; the
representation should determine approximately the size of any cut. In
additive combinatorics, the object might be a function or distribution
over an Abelian group, and the tests might be correlations with linear
functions or polynomials.

The focus of the working group is to understand the common elements that
underlie results in all of these areas, to use the connections between
them to make existential results algorithmic, and to then use
algorithmic versions of these results for new purposes. For example, can
we use boosting, a technique from supervised learning, in an
unsupervised context? Can we characterize the pseudo-entropy of
distributions, a concept arising in cryptography? Do the properties of
dense graphs “relativize” to sub-graphs of expanders?

In particular, we’ll start from boosting, a technique in machine
learning to go from weak learning to strong learning, i.e., taking an
algorithm that learns a function only with a small correlation and
making one that learns the function on almost all inputs. We’ll show how
boosting implies a general Hardcore Distribution Lemma, showing that any
function that cannot be :math:`1-\delta` approximated by simple
functions has a sub-distribution of size :math:`\delta` where it has
almost no correlation with simple functions. By starting from boosting,
we will be able to show a constructive version of this lemma. From the
Hardcore Distribution lemma, we’ll derive the Dense Model Theorem used
by Green and Tao to show arbitrarily long arithmetic progressions in the
primes. Again, by starting with boosting, we get a general algorithmic
version of DMT. This algorithmic version can then be used to derive a
general Weak Regularity Theorem, with that of Frieze and Kannan and
analogs for sparse graphs as a special case.

Hopefully, at this point, the working group will segue from known
connections to new connections, e.g., is there a strong boosting that
implies strong regularity? Can algorithmic regularity lemmas be used in
ML?

We won’t assume any background and will develop everything from first
principles using only simple calculations. Here’s an optional reading
list, and some papers we might refer to.

Papers with results we’ll cover:

-  Klivans and Servedio, Boosting and Hard-core Sets, FOCS 99.

-  Omer Reingold, Luca Trevisan, Madhur Tulsiani, Salil P. Vadhan: Dense
   Subsets of Pseudorandom Sets. FOCS 2008: 76-85

-  Luca Trevisan, Madhur Tulsiani, Salil P. Vadhan: Regularity,
   Boosting, and Efficiently Simulating Every High-Entropy Distribution.
   IEEE Conference on Computational Complexity 2009: 126-136

-  Russell Impagliazzo, Algorithmic Dense Model Theorems and Weak
   Regularity

-  Sita Gakkhar Russell Impagliazzo Valentine Kabanets. Hardcore
   Measures, Dense Models and Low Complexity Approximations

•

Bibliography:

We won’t go through these papers explicitly, but they provide the
context.

-  Robert E. Schapire: The Strength of Weak Learnability (Extended
   Abstract). FOCS 1989: 28-33 : 01 June 2005 A desicion-theoretic
   generalization of on-line learning and an application to boosting
   Yoav Freund, Robert E. Schapire

-  Yoav Freund, Robert E. Schapire: Game Theory, On-Line Prediction and
   Boosting. COLT 1996: 325-332

-  Russell Impagliazzo: Hard-Core Distributions for Somewhat Hard
   Problems. FOCS 1995: 538-545

-  Thomas Holenstein: Key agreement from weak bit agreement. STOC 2005:
   664-673

-  Boaz Barak, Ronen Shaltiel, Avi Wigderson: Computational Analogues of
   Entropy. RANDOM-APPROX 2003: 200-215

-  Alan M. Frieze, Ravi Kannan: The Regularity Lemma and Approximation
   Schemes for Dense Problems. FOCS 1996: 12-20

-  Noga Alon, Amin Coja-Oghlan, Hiêp Hàn, Mihyun Kang, Vojtech R'’odl,
   Mathias Schacht: Quasi-Randomness and Algorithmic Regularity for
   Graphs with General Degree Distributions. SIAM J. Comput. 39(6):
   2336-2362(2010)

-  Noga Alon, Assaf Naor: Approximating the Cut-Norm via Grothendieck’s
   Inequality. SIAM J. Comput. 35(4): 787-803 (2006)

-  Green, Ben; Tao, Terence (2008). “The primes contain arbitrarily long
   arithmetic progressions”. Annals of Mathematics. 167 (2): 481–547.

-  Tao, Terence; Ziegler, Tamar (2008). “The primes contain arbitrarily
   long polynomial progressions”. Acta Mathematica. 201 (2): 213–305


Big picture
-----------

| We’ll talk about several results which have different names in
  different fields. You probably know them, but don’t know the same or
  related idea comes up in the other fields.

+--------------------+------------------------------------------------------------------------+---------------------------+-------------------------------------------------------------------+-------------------------------------+-----+
|                    | Boosting                                                               | Hard-core lemma           | Dense model theorem                                               | Weak regularity                     | ?   |
+====================+========================================================================+===========================+===================================================================+=====================================+=====+
| Area               | ML                                                                     | CC, Derandom-ization      | Additive combinatorics, CC                                        | Graph theory                        |     |
+--------------------+------------------------------------------------------------------------+---------------------------+-------------------------------------------------------------------+-------------------------------------+-----+
| Credit             | Shapiro, Freund-Schapire                                               | Impagliazzo, Holenstein   | Green-Tao, Barak-Shaltiel-Wigderson                               | Szemeredi, Frieze-Kannan            |     |
+--------------------+------------------------------------------------------------------------+---------------------------+-------------------------------------------------------------------+-------------------------------------+-----+
| Get                | Circuit computing :math:`f` :math:`1-\delta` of the time               | ”                         | Proof that set isn’t :math:`\delta`-dense                         | ”                                   |     |
+--------------------+------------------------------------------------------------------------+---------------------------+-------------------------------------------------------------------+-------------------------------------+-----+
| Unless             | Weak learner fails on distribution of density :math:`\Omega(\delta)`   | Hard-core distribution    | :math:`\Omega(\delta)`-dense “model” indistinguishable from set   | A model succinctly describing set   |     |
+--------------------+------------------------------------------------------------------------+---------------------------+-------------------------------------------------------------------+-------------------------------------+-----+
| Algorithm needed   | Weak learner                                                           | ”                         | Distinguisher                                                     | ”                                   |     |
+--------------------+------------------------------------------------------------------------+---------------------------+-------------------------------------------------------------------+-------------------------------------+-----+

We will take these theorems that we know to be true and show
implications between them. Implications are due to...

#. Boosting\ :math:`\implies`\ Hard-core: Klivans and Servedio.

#. Hard-core\ :math:`\implies`\ Dense model: Impagliazzo

#. Dense model\ :math:`\implies`\ Weak regularity:
   Trevisan-Tulsiani-Vadhan, Reingold-Trevisan-Tulsiani-Vadhan

#. Weak regularity\ :math:`\implies`\ boosting: Trevisan-Tulsiani-Vadhan


What can we gain from looking at these connections?

#. Versatility: We can “retrofit” algorithms for one setting to get
   algorithms for the other settings.

   For example, there are many boosting algorithms. When you follow this
   progression, you get different quantitative and qualitative versions
   of dense model theorem and regularity.

#. Algorithmic and constructive results:

   There are nonconstructive versions using the min-max theorem for
   boosting, hard-core lemma, dense model theorem. We care about
   algorithmic versions.

   Note that the algorithmic result that we care about is different in
   the different settings. In ML we care about getting a function that
   computes a function much of the time. On the other side, we’re really
   after the distribution where the weak learner fails, so that we get a
   model that succinctly describes the set.

   We pay attention to do the reductions in an algorithmic, not just an
   existential way.

#. Using the dense model theorem for learning. Can we take a boosting
   technique and use it in an unsupervised way?

#. Generality: some things seem to be specific to a setting (density of
   graphs).

   But actually, weak regularity doesn’t have anything to do with graphs
   being dense. We can relativize it to subgraphs of any graph. You can
   look at subgraphs of expanders, bipartite graphs, etc., and plug it
   in the same machinery. Likewise if you want to look at spectral norms
   rather than cuts.

Here is a cartoon:

#. Let :math:`X` be a set, e.g. a distribution of points in the square.
   Let :math:`S` be some distribution on points in :math:`X`.

   .. image:: pic1.png

   Let :math:`\mathcal T` be a set of classifiers, ex. a set of
   half-planes.

   Let :math:`\mathcal F_K\mathcal T` be boolean functions on :math:`K`
   functions in :math:`\mathcal T`; here, partitions into polygonal
   regions by :math:`k` half-planes.

   We want to pre-process the distribution to be able to answer queries
   in :math:`\mathcal F_K\mathcal T`.

#. A violation of pseudo-density in this setting means there is a
   polygonal region with many more points from :math:`S` than its
   volume, a “hot spot”.

   .. image:: pic2.png

   .. math:: \text{Area}(\text{region})< \delta \Pr_S (\text{region})-\varepsilon.

#. A model is a partition into polygonal regions, with a probability
   distribution on regions. A simple model is defined by at most
   :math:`k` lines.

   The property of a model is that we can estimate half-space
   probabilities (“given any half-space, what proportion of points of
   :math:`S` are on one side of it?”) by treating the points as if
   uniform within regions.

   .. image:: pic3.png

#. The algorithmic requirement in order to process the points to answer
   queries in :math:`\mathcal F_K\mathcal T` is: given a set of points
   sampled from :math:`S`, and a set of points sampled from :math:`U`,
   find a half-space that approximately maximizes the difference in
   probabilities for these two sets. The equivalent in boosting is a
   distinguishing algorithm.

+---------------+---------------------------------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------------------------+-------------------------------------------------------------------------------------------------------+-------------------+
| Setting       | Boosting                                                                                                                        | Hard-core measure                                                                        | DMT/transference principle                                                                            | Weak regularity   |
+===============+=================================================================================================================================+==========================================================================================+=======================================================================================================+===================+
|               | WL: :math:`|\mu_{i}|\ge2\delta`, :math:`\mu_{i}=g(h_{1,}\ldots,h_{i},f)`, :math:`h_{i+1}\in\mathcal{T}`, :math:`k` iterations   | Hardcore measure: :math:`\mu_{k}=g(h_{1},\ldots,h_{k},f)`, :math:`|\mu_{k}|\ge2\delta`   | Model: :math:`\mu_{k}=g(h_{1},\ldots,h_{k},o)`, :math:`|\mu_{k}|\ge\delta`                            |                   |
+---------------+---------------------------------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------------------------+-------------------------------------------------------------------------------------------------------+-------------------+
|               | SL: :math:`H=G(h_{1},\ldots,h_{k})`, :math:`\Pr[H=f]\ge1-\delta`                                                                | Violation of hardness: :math:`H=G(h_{1},\ldots,h_{k})`, :math:`\Pr[H=f]>1-\delta`        | Violation of pseudo-density :math:`H=G(h_{1},\ldots,h_{k})`, :math:`H(U)\le\delta H(S)-\varepsilon`   |                   |
+---------------+---------------------------------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------------------------+-------------------------------------------------------------------------------------------------------+-------------------+
| Assumption    | WL never fails                                                                                                                  | Violation is impossible                                                                  | Violation of pseudo-density is impossible                                                             | Actually dense    |
+---------------+---------------------------------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------------------------+-------------------------------------------------------------------------------------------------------+-------------------+
| Conclusion    | SL works                                                                                                                        | Hard-core measure exists, with same :math:`k`, :math:`G`, :math:`g`                      | Model exists                                                                                          | Model exists      |
+---------------+---------------------------------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------------------------+-------------------------------------------------------------------------------------------------------+-------------------+
| Algorithmic   | Weak learner requirement                                                                                                        | Approximately optimal weak learner                                                       | Approximately optimal distinguisher                                                                   |                   |
+---------------+---------------------------------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------------------------+-------------------------------------------------------------------------------------------------------+-------------------+

+---------------+---------------------------------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------------------------+-------------------------------------------------------------------------------------------------------+-------------------+
| Setting       | Boosting                                                                                                                        | Hard-core measure                                                                        | DMT/transference principle                                                                            | Weak regularity   |
+===============+=================================================================================================================================+==========================================================================================+=======================================================================================================+===================+
|               | WL: :math:`|\mu_{i}|\ge2\delta`, :math:`\mu_{i}=g(h_{1,}\ldots,h_{i},f)`, :math:`h_{i+1}\in\mathcal{T}`, :math:`k` iterations   | Hardcore measure: :math:`\mu_{k}=g(h_{1},\ldots,h_{k},f)`, :math:`|\mu_{k}|\ge2\delta`   | Model: :math:`\mu_{k}=g(h_{1},\ldots,h_{k},o)`, :math:`|\mu_{k}|\ge\delta`                            |                   |
+---------------+---------------------------------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------------------------+-------------------------------------------------------------------------------------------------------+-------------------+
|               | SL: :math:`H=G(h_{1},\ldots,h_{k})`, :math:`\Pr[H=f]\ge1-\delta`                                                                | Violation of hardness: :math:`H=G(h_{1},\ldots,h_{k})`, :math:`\Pr[H=f]>1-\delta`        | Violation of pseudo-density :math:`H=G(h_{1},\ldots,h_{k})`, :math:`H(U)\le\delta H(S)-\varepsilon`   |                   |
+---------------+---------------------------------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------------------------+-------------------------------------------------------------------------------------------------------+-------------------+
| Assumption    | WL never fails                                                                                                                  | Violation is impossible                                                                  | Violation of pseudo-density is impossible                                                             | Actually dense    |
+---------------+---------------------------------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------------------------+-------------------------------------------------------------------------------------------------------+-------------------+
| Conclusion    | SL works                                                                                                                        | Hard-core measure exists, with same :math:`k`, :math:`G`, :math:`g`                      | Model exists                                                                                          | Model exists      |
+---------------+---------------------------------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------------------------+-------------------------------------------------------------------------------------------------------+-------------------+
| Algorithmic   | Weak learner requirement                                                                                                        | Approximately optimal weak learner                                                       | Approximately optimal distinguisher                                                                   |                   |
+---------------+---------------------------------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------------------------+-------------------------------------------------------------------------------------------------------+-------------------+

Some comments:

#. Boosting: Note it’s important that the :math:`\delta` here is the
   same; many boosting algorithms meet this criterion. The theorem says
   that “either weak learner fails or strong learner works.”

   In boosting, we think of weak learner as never failing.

#. Hard-core measure lemma: The lemma says that either we can find
   hard-core measure, on which no function can compute the function
   :math:`f` more than :math:`1/2 +\delta` of time; or find a function
   computing :math:`f` :math:`1-\delta` of the time.

   Here, we want to come up with the measure. Although the logical
   format is the same as boosting, here we assume that the violations
   never happen (there is no strong learner). Every boosting algorithm
   gives hard-core measure lemma with the same parameters, and with
   exactly the same way of “gluing” the functions. Sometime you care
   about computational complexity of :math:`G` but not of :math:`g`, or
   vice versa.

#. We can convert the hard-core measure theorem into the dense model
   theorem/transference principle (Tao and Ziegler).

   Here, we have a distribution we’re trying to model. Either the
   distribution has pseudo-density property— there isn’t a violation
   that’s definable from :math:`k` different properties from hypothesis
   class, where violation means that the expected value is much smaller
   on :math:`U` than on :math:`S`—or we get a model of density
   :math:`\ge \delta`. Assuming that violation of pseudo-density does
   not happen, we get a model.

#. Weak regularity is just DMT except the distribution actually is
   dense. It’s not so interesting that it has a dense model.

   What we get is that the dense model you get is simple, definable in
   terms of a small number of basic hypotheses.

   Sometimes we care about simplicity in the model, and sometimes
   simplicity in :math:`G`.

#. Note the :math:`k` is the same throughout. Reductions preserves
   :math:`k`, and the functions :math:`h_i, G`.

   We don’t only have the fact that boosting implies hard-core lemma
   implies regularity lemma. We have the stronger result that whatever
   boosting algorithm you give me, I get a hard-core lemma and
   regularity lemma with the same parameters and algorithm. Thus we can
   pick the boosting algorithm that gives the best results for our
   application.

Setup
-----

First we discuss the PAC learning model.

Let :math:`U` be a set, and by abuse of notation, also a distribution on
that set. (Think of :math:`U` as the universe, the set of possible
inputs.) For simplicity, take the distribution to be uniform. Let
:math:`f:U\to \{0,1\}` be a boolean function. A learning algorithm can
request any number of points :math:`(x,f(x))` where :math:`x\sim U`. The
goal is to find a hypothesis :math:`h` such that

.. math:: \Pr_{x\sim U} [h(x)=f(x)]\ge 1-\delta.

A for :math:`(U,f)` with hypothesis class :math:`\mathcal H` is an
algorithm such that given samples :math:`(x,f(x)), x\sim U`, outputs
:math:`h\in \mathcal H` (with high probability) such that

.. math:: \Pr_{x\sim U}[h(x)=f(x)]\ge 1-\delta.

(Typically, we say that the probability of success is
:math:`1-\varepsilon`, ask for a strong learner for all
:math:`f\in \mathcal F`, and require it to run in time
:math:`\operatorname{poly}(1/\varepsilon, 1/\delta)`.)

In boosting, we assume that we have weak learners.

A :math:`\varepsilon`- for :math:`(\mu, f)` with hypothesis class
:math:`\mathcal H` is an algorithm such that given
:math:`(x,f(x)), x\sim \mu`, outputs :math:`h` (with high probability)
such that

.. math:: \Pr_{x\sim \mu} [h(x)=f(x)] \ge \frac{1}{2}+\varepsilon.

It only has to output a function that is somewhat correlated with the
right answer. Typically, we ask the weak learner to work on any
distribution :math:`\mu` satisfying some assumptions.

In order to use a weak learner, we construct a routine that subsamples
the distribution :math:`U` to pass to pass to the weak learner.

Let :math:`\mu:U\to [0,1]`. Define the probability distribution [1]_

.. math:: D_\mu(x) = \frac{\mu(x)}{\sum_{x'\in U}\mu(x')}.

Think of this as rejection sampling: pick :math:`x\sim U`, keep it with
probability in :math:`[0,1]`, or else throw if back and repeat.

In order for this sampling to be efficient, we need :math:`\mu` to not
be too small.

Define the of :math:`\mu` in :math:`U` to be

.. math:: |\mu| = \operatorname{E}_{x\in U} \mu(x).

We will use weak learners in the following context.

#. We will only run weak learners on distributions whose density is not
   too small (the dependence on :math:`\delta` is
   :math:`|\mu|=\Omega(\delta)`). We don’t want to run a weak learner on
   a distribution of very low density, because the time to simulate the
   distribution is inversely proportional to the density.

#. We ask the weak learners to output a function in a given class
   :math:`h\in \mathcal T`.

   Then it will turn out that that both the measures that we run the
   weak learners on, and the final hypothesis, will be describable using
   :math:`\mathcal F_l \mathcal T` (see below), for some class
   :math:`\mathcal F`.

Say that a set :math:`\mathcal T` of functions :math:`U\to \{0,1\}` form
a class if :math:`f\in \mathcal T` implies :math:`1-f \in \mathcal T`.

Let :math:`\mathcal F` be a class of boolean functions. Define the class
of functions

.. math:: \mathcal F_k \mathcal T = \{f(h_1(x),\ldots, h_k(x)) : f\in\mathcal F, h_1,\ldots, h_k\in \mathcal T\}.

Boosting and the Hard-core lemma
--------------------------------

The first boosting algorithm we give is totally ridiculous from the ML
point of view. For people who work on weak regularity on graphs this is
the natural version, and leads to the standard versions of results.

We will take :math:`\mathcal F` to be the set of all boolean functions,
so given hypotheses :math:`h_1,\ldots, h_k`, we can choose the best
predictor using :math:`h_1(x),\ldots, h_k(x)`.

[Boosting with decision trees][thm:boosting] Let :math:`U` be a
distribution, :math:`\mathcal T` a class of boolean functions
:math:`U\to \{0,1\}`, :math:`\mathcal F` the class of all boolean
functions. Let :math:`f:U\to \{0,1\}` be a given function (which we are
trying to learn).

#. Suppose that there is a :math:`\delta`-weak learner such that given
   any distribution :math:`\mu` on :math:`U` with
   :math:`|\mu|\ge 2\delta`, it produces :math:`h\in \mathcal T` such
   that

   .. math:: \Pr_{x\sim \mu} [h(x) = f(x)] \ge \frac{1}{2}+ \varepsilon.

#. Then there is a strong learner that produces
   :math:`h\in \mathcal F_k\mathcal T` with
   :math:`k\le\lceil 1/\varepsilon^2\delta^2\rceil` such that [2]_

   .. math:: \Pr_{x\sim U} [h(x) = f(x)]\ge 1-\delta.

[Hard-core lemma] [thm:hardcore] Let :math:`U` be a distribution,
:math:`\mathcal T` a class of boolean functions :math:`U\to \{0,1\}`,
:math:`\mathcal F` the class of all boolean functions.

Then either

#. There exists :math:`h\in \mathcal F_k \mathcal T` such that

   .. math:: \Pr_{x\sim U} [h(x)=f(x)] \ge 1-\delta,

   where :math:`k \le 1/\varepsilon^2\delta^2`, or

#. (There exists a hard-core distribution.) There exists
   :math:`|\mu|\ge 2\delta` on :math:`U`, such that for all
   :math:`h\in \mathcal T`,

   .. math:: \Pr_{x\sim \mu}[h(x) = f(x)] \le \frac{1}{2}+\varepsilon.

Note it is important for us to keep track of the size of the hardcore
distribution, which is :math:`\ge 2\delta` here. Different boosting
algorithms will give the result for different classes of functions
:math:`\mathcal F`.

[Proof of hard-core lemma [thm:hardcore] from boosting [thm:boosting]]
Let weak learner be exhaustive search over :math:`\mathcal T`. The weak
learner operates on distributions :math:`|\mu_i|\ge 2\delta`. If it
always produces :math:`h_i` with bias :math:`\ge \delta`, then continue
and obtain the strong learner: we get some
:math:`H\in \mathcal F_k \mathcal T` such that :math:`H(x)=f(x)` with
probability :math:`1-\delta`.

If at some step :math:`i` our exhaustive search algorithm gets stuck, we
get a distribution :math:`\mu_i` that’s hard-core.

Dense model theorem
-------------------

For a set :math:`S\subseteq U` and a function :math:`T:U \to \{0,1\}`,
let :math:`T(S):=\operatorname{E}_{x\in S} T(x)`. (For a measure
:math:`\mu: U\to [0,1]`, also write
:math:`T(\mu) = \operatorname{E}_{x\sim \mu} T(x)`.)

Let :math:`S\subseteq U` be a subset, and let :math:`\mathcal T` be a
set of tests. :math:`S` is if for all :math:`T\in \mathcal T`,

.. math:: T(U) \ge \delta T(S)-\varepsilon.

Think of saying that the tests :math:`\mathcal T` don’t reveal that the
set :math:`S` is small.

#. One way of being pseudo-dense is to actually be dense.

#. Another, one step removed, is that there’s a set :math:`R` (or more
   generally, a measure :math:`\mu`) that’s indistibguishable from
   :math:`S` by :math:`\mathcal T`, and such that :math:`R` occupies at
   least a :math:`\delta` fraction of :math:`U`.

•

For two distributions :math:`\mu_1,\mu_2` on :math:`U`, we say that
:math:`\mu_1,\mu_2` are indistinguishable by tests in :math:`\mathcal T`
up to :math:`\varepsilon`, written :math:`\mu_1 \sim_{\mathcal T} \mu_2`
within :math:`\varepsilon`, if for every :math:`T\in \mathcal T`,

.. math:: |\operatorname{E}_{\mu_1}T - \operatorname{E}_{\mu_2} T| \le \varepsilon.

[Dense model theorem][thm:dmt] Let :math:`\mathcal T` be a class of
tests :math:`U\to \{0,1\}`.

If :math:`S` is :math:`(\varepsilon,\delta)`-pseudodense against
:math:`F_k\mathcal T`, :math:`k=O(1/\varepsilon^2\delta^2)` then there
exists :math:`\mu`, :math:`\mu\in F_k\cal T` such that
:math:`|\mu|\ge \frac{\delta}{1+\delta}-O(\varepsilon)` and
:math:`D_\mu\sim_{\cal T} S` to within :math:`O(\varepsilon/\delta)`.

The idea in the proof is to use the Hard-core lemma, with the hard
function being membership in :math:`S`.

Let :math:`U'` be the following distribution: let
:math:`\delta'=\frac{\delta}{1+\delta}` and

#. with probability :math:`\delta'`, take :math:`x\in S` and output
   :math:`(0,x)`

#. with probability :math:`1-\delta'`, take :math:`x\in U` and output
   :math:`(1,x)`.

Define a test :math:`T\in \mathcal T` to operate on an example
:math:`(y, x)` by :math:`T(y,x)=T(x)`. For
:math:`T\in \mathcal F_k \mathcal T`,

.. math::

   \begin{aligned}
   \Pr_{U'}[T((y,x))=y] &= \delta' T(S) + (1-\delta') (1-T(U)) \\
      &= 1-\delta' + \delta' (T(S)) - (1-\delta') T(U)\\
      &= 1-\delta' + \frac{1}{1+\delta} (\delta T(S) - T(U))\\
      &\le 1-\delta'+\varepsilon.\end{aligned}

No test in :math:`\mathcal F_k \mathcal T` can be correct with
probability :math:`>\delta'-\varepsilon`. By the Hard-core
Lemma [thm:hardcore], there exists
:math:`|\mu'|\ge 2(\delta'-\varepsilon)` such that for any
:math:`T\in \mathcal T`,
:math:`\Pr_{(x,y) \sim U'}[T(x)=y]\le  \frac{1}{2}+\varepsilon`.

In order for :math:`\mu'` to be hardcore, it must be split approximately
evenly between :math:`U` and :math:`S` (up to :math:`\varepsilon`);
otherwise; we could have an advantage by predicting constant 0 or 1.
Thus each part has at least
:math:`2(\delta'-\varepsilon) (1/2 - \varepsilon) = \delta'(1-O(\varepsilon/\delta))`
of the mass. Then

.. math:: D_{\mu'|_U}\sim_{O(\varepsilon)} D_{\mu'|_S}\sim_{O(\varepsilon/\delta)} S.

Proof for boosting
------------------

[Proof of Theorem [thm:boosting]] The algorithm is as follows. Let
:math:`WL(\mu)` denote the weak learner operating on :math:`(\mu, f)`.

Let :math:`\mu_0` be constant 1, :math:`i=0`.

While :math:`|\mu_i|\ge 2\delta`, do

-  :math:`h_{i+1}\mapsfrom WL(\mu_i)`.

-  Partition :math:`U` according to values of :math:`h_1,\ldots,h_i`.

   Let :math:`h_{1:i}(x):= (h_1(x),\ldots, h_i(x))\in \{0,1\}^i`, and
   let :math:`B_i(x)` be the “block” that :math:`x` is in,

   .. math:: B_i(x) = h_{1:i}^{-1}(h_{1:i}(x)) = \{y\in U : h_{1:i}(x)=h_{1:i}(y)\}.

   For a set :math:`B`, let :math:`\operatorname{Maj}(B)` denote the
   majority value of :math:`f` on :math:`B`.

-  Define :math:`\mu_{i+1}` by

   .. math::

      \mu_{i+1}(x) = \begin{cases}
      \frac{1-p_{\operatorname{Maj}, B_i(x)}}{p_{\operatorname{Maj}, B_i(x)}},&\text{if } f(x)=\operatorname{Maj}(B_i(x))\\
      1,&\text{otherwise}
      \end{cases}•

   where
   :math:`p_{\operatorname{Maj},B} = \Pr(f(y) = \operatorname{Maj}(B)| y\in B)`,
   the proportion of the majority in :math:`B`.

-  :math:`i\mapsfrom i+1`.

Finally, return :math:`H_{i}(x) = \operatorname{Maj}({B_{i}(x)})`, i.e.,
look at the block that :math:`x` is in, and choose the majority value.

Note that the measure :math:`\mu_{i+1}` rebalances each block
:math:`B_i` such that conditioned on :math:`y` being in a block
:math:`B_i(x)`,

.. math:: \Pr_{y\sim \mu_{i+1}}(f(y)=1|y\in B_i(x)) = \Pr_{y \sim \mu_{i+1}}(f(y)=0|y\in B_i(x))=\frac{1}{2}.

Indeed, we have

.. math::

   \begin{aligned}
   \operatorname{E}_{y\sim U}[\mathbf{1}_{f(y)=1} 
    \mu_{i+1}(y) |y\in B_i(x)]
    &=p_{\operatorname{Maj}, B_i(x)} \frac{1-p_{\operatorname{Maj}, B_i(x)}}{p_{\operatorname{Maj}, B_i(x)}} = 1-p_{\operatorname{Maj}, B_i(x)}\\
    \operatorname{E}_{y\sim U}[\mathbf{1}_{f(y)=0} 
    \mu_{i+1}(y) |y\in B_i(x)]
    &=\left(1-p_{\operatorname{Maj}, B_i(x)}\right)\cdot 1 = 1-p_{\operatorname{Maj}, B_i(x)}\\
   |\mu_{i+1}| =  \operatorname{E}_{y\sim U}[
    \mu_{i+1}(y)]&=\sum_{\text{block }B_i} [2(1-p_{\operatorname{Maj}, B_i}) \Pr(B_i)]\\
    & \ge 2(1-p_{\operatorname{Maj},U}).\end{aligned}

Note that if :math:`|\mu_{i+1}|\le 2\delta`, then
:math:`\Pr_{x\in X}[H_i=f]\ge 1-\delta`, and we are done. (We stop
before we have to apply the weak learner to a distribution of density
:math:`<\delta`.)

We need to show this method terminates in a bounded number of steps.

Consider the potential function

.. math::

   \varphi_i = \operatorname{E}_{x\sim U} [(\Pr[f=1|B_i(x)])^2]
    = \operatorname{E}_{x\sim U} [\operatorname{E}[ f|B_i]^2]

(Think of :math:`B_i` as a partition; for a partition,
:math:`\operatorname{E}[f|P]` is a function of :math:`x` that takes
:math:`x` to the average value in the atom of the partition that
contains :math:`x`.) Note this have value in :math:`[0,1]` and is
maximized if :math:`f` is constant on every block. We show every
iteration increases this potential function by at least a fixed amount,
:math:`(\varepsilon\delta)^2`. Fix a block :math:`B` in the partition.
Define :math:`p,q,\alpha_+,\alpha_-,p_0,p_1` as follows.

.. math::

   \begin{aligned}
   p&=\Pr[f=1|B]\\
   q&=\Pr[h_{i+1} = 1|B]\\ q+\alpha_+ &= \Pr[h_{i+1}=1|B, f=1]\\ q-\alpha_- &= \Pr[h_{i+1}=1|B, f=0]\\ \alpha_+p &= \alpha_-(1-p) \text{ by conservation}\\
   p_0&= \Pr[f=1|h=0,B] = \frac{\Pr[f=1\wedge h=0|B]}{\Pr[h=0|B]} = \frac{p(1-q-\alpha_+)}{1-q}\\
   p_1&= \Pr[f=1|h=1,B] = \frac{\Pr[f=1\wedge h=1|B]}{\Pr[h=1|B]} = \frac{p(q+\alpha_+)}{q}\\
   \operatorname{E}_{x\in B} [\operatorname{E}[f|B_{i+1}]^2]&=qp_1^2 + (1-q)p_0^2 = p^2 \left(\frac{(q+\alpha_+)^2}{q} + \frac{(1-q-\alpha_+)^2}{1-q}\right) \\
   &=p^2\left(
   \left(q+2\alpha_+ + \frac{\alpha_+^2}{q}\right)
   +
   \left(1-q-2\alpha_+ + \frac{\alpha_+^2}{1-q}\right)\right)
   \\
   &=p^2\left(1+\frac{\alpha_+^2}{q} + \frac{\alpha_+^2}{1-q}\right)\\
   &\ge p^2 + 4p^2 \alpha_+^2 \ge
   p^2+
    \alpha_+^2\\
    \operatorname{E}[f|B_{i+1}]^2 - \operatorname{E}[f|B_i]^2&=\alpha_+^2(B_i(x)).\end{aligned}

Assume WLOG that :math:`\operatorname{Maj}(B_i(x))=1`. (Otherwise the
LHS is smaller.)

.. math::

   \begin{aligned}
   \operatorname{E}_{x\in B}[\mu(x) ((-1)^{(h(x)\ne f(x))})]
   &=\quad p\left(\frac{1-p}{p}\right) \left[(q+\alpha_+) - (1-q-\alpha_+)\right]&(f=1)\\
   &\quad +(1-p) 1 [1-(1-\alpha_-) - (q-\alpha_-)]&(f=0)\\
   &=(1-p) (2\alpha_++2\alpha_-)\\
   &= 2\alpha_+(1-p) + 2\alpha_+p=2\alpha_+\\
   \operatorname{E}_{x\sim U} 2\alpha_+(B_i(x)) 
   &=\operatorname{E}_{x\sim U} [\mu(x) ((-1)^{h(x)\ne f(x)})]\\
   &\ge \varepsilon|\mu| \ge 2\delta \varepsilon\\
   \varphi_{i+1}-\varphi_i &\ge 
   \operatorname{E}_{x\sim U} [\operatorname{E}[f|B_{i+1}]^2 - \operatorname{E}[f|B_i]^2]\\
   &\ge 
   \operatorname{E}_{x\sim U} \alpha_+^2(B_i(x))\ge  (\delta\varepsilon)^2.\end{aligned}

\ • Because :math:`\varphi_i` is always in :math:`[0,1]`, the number of
iterations is at most :math:`k\le (\delta \varepsilon)^2`.

Comments, Regularity lemmas
---------------------------

Some comments:

#. All you get from this proof is a decision tree; the complexity is
   exponential in :math:`k`. This is a bug, not a feature.

   In complexity terms, we don’t get good hard-core measure, because the
   circuit size for the outer function :math:`G` is :math:`2^k`. A
   better boosting algorithm would give :math:`G` have smaller
   complexity. If your stopping point is the hard-core lemma, this is
   not the boosting algorithm you want. For the dense model theorem,
   this is fine because all you care about is size of :math:`k`, not the
   complexity of :math:`G`.

   There is another boosting algorithm which gives a weighted majority
   function, which is a simpler function. A weighted majority can be
   converted into a decision tree, but not vice versa.

#. This potential function matches this boosting algorithm. Other
   boosting algorithms can be analyzed with other potential functions.
   This is like the potential function used most in graph theory. Key
   property: you can’t make negative progress; you always go forwards.

#. For Szemeredi regularity, we need a stronger boosting theorem.
   Suppose we get stuck at some step: no function correlates globally,
   but there are many blocks where we can find functions that correlate
   with the function inside that block. If in :math:`\varepsilon`
   fraction of blocks we find functions that correlate, partition them
   based on all the values of these functions, and repeat.

   In one step we’ve gone from order of :math:`2^k` to order of
   :math:`2^{2^k}` buckets, and increased the potential function by a
   polynomial in terms of :math:`\varepsilon,\delta`. This is a familiar
   argument; we can only go :math:`\frac{1}{\varepsilon}` iterations
   before we terminate. This time, the number of sets is a tower
   depending on :math:`\varepsilon`.

#. Regularity lemmas:

   Fix a set of vertices :math:`V` of set :math:`n`. Let :math:`U` be
   edges in complete graph on :math:`V`. (We can also consider the case
   when :math:`U` is not the complete graph, ex. :math:`U` is the edges
   in :math:`d`-regular expander on :math:`V`.)

   The underlying set we care about is the set of cuts defined by
   :math:`A,B\subseteq V` where :math:`A\cap B=\phi`; there are
   :math:`3^k` of them.

   If :math:`|E|\ge \delta \binom n2`, the generic regularity lemma says
   there exists :math:`\mu=G(T_1,\ldots, T_k)`, where
   :math:`k=O(1/\varepsilon^2\delta^2)`, that is a good predictor the
   number of edges of any cut in the graph. Use the :math:`T`\ ’s to
   divide the vertices into :math:`3^k` subsets such that :math:`\mu` is
   a constant on every pair of subsets.

   .. math::

      \frac{E_G(A,B)}{|E_G|}
      \approx_\varepsilon \sum_{i,j} 
      \mu_{ij}
      \frac{|A\cap A_i||B\cap B_j|}{|V|^2}.

   This is the weak regularity of Frieze-Kannan. For Szemeredi we need
   the stronger boosting lemma (see previous point).

   We can also do something similar with :math:`G` a subset of an
   expander. The expander mixing lemma gives an error term.

.. [1]
   When :math:`U` is not uniform and has distribution :math:`u(x)`, this
   is :math:`\frac{\mu(x)u(x)}{\sum_{x'\in U} \mu(x')u(x')}`.

.. [2]
   We ignore sample complexity here. In reality, because we only see
   :math:`U` from samples, we need to think about generalization. If the
   VC-dimension of :math:`\mathcal T` is :math:`d`, then the
   VC-dimension of :math:`\mathcal F_k\mathcal H` is at most
   :math:`k^d`. In ML we don’t want to take :math:`\mathcal F` to be the
   class of all boolean functions. For this theorem, let’s just assume
   we are actually given all pairs :math:`(x,f(x))`.
