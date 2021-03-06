Pseudorandomness Seminar
========================

We meet 4:30--5:30 in room 116.


Tuesday, Feb. 7th
-----------------

`Luca Trevisan <https://people.eecs.berkeley.edu/~luca/>`_:
Fundamental Techniques in Pseudorandomness V (Samplers)

This is a continuation of Luca's mini-course at the recent Boot Camp,
and covers the topic of "Samplers" which was omitted from the original
sequence of lectures due to lack of time.

*Lightning talk.*  `Arnab Bhattacharyya <http://drona.csa.iisc.ernet.in/~arnabb/>`_
will present "Improved bounds for universal one-bit compressed sensing."

Tuesday, Feb. 14th
------------------

`Avi Wigderson <http://www.math.ias.edu/avi/home>`_
"A gentle introduction to Brascamp--Lieb inequalities, and why I like them"

The celebrated Brascamp--Lieb (BL) inequalities  are an important mathematical
tool, unifying and generalizing numerous inequalities in analysis, convex
geometry and information theory, with many used in computer science. While
their structural theory is very well understood, far less is known about
computing their main parameters. Prior to this work, the best known
algorithms for any of these optimization tasks required at least exponential
time. In this work, we give polynomial time algorithms to compute them. In
particular, these efficiently solve a large family of linear programs with
exponentially many facets, something which can be used for combinatorial
optimization. Both algorithms and analysis rely on our previous Operator
Scaling algorithm, and combine interesting math from several diverse fields.
However, no prior knowledge will be assumed for this talk.

Joint work with Ankit Garg, Leonid Gurvits and Rafael Olivera

Tuesday, Feb. 21th
------------------

Manuel Sabin (UC Berkeley)
"Average-Case Fine-Grained Hardness"

We present functions that are hard to compute on average for algorithms running
in some fixed polynomial time, assuming widely-conjectured worst-case hardness
for Orthogonal Vectors (OV), 3SUM, and All-Pairs Shortest Paths (APSP). Using
the same techniques we also obtain a conditional average-case time hierarchy of
functions.

Based on the average-case hardness and the algebraic structure we achieve for
our functions, we outline the construction of a Proof of Work scheme and
discuss possible approaches to constructing fine-grained One-Way Functions. We
also show how our reductions make conjectures regarding the worst-case hardness
of the problems we reduce from (and consequently the Strong Exponential Time
Hypothesis) heuristically falsifiable in a sense similar to that of (Naor,
CRYPTO 2003).

We will discuss many open problems that these results reveal, including
pseudorandomness and derandomization in the fine-grained world.

Joint with Marshall Ball, Alon Rosen, and Prashant Nalini Vasudevan.

*Lightning talk.* Dean Doron (Tel Aviv University) will present recent work on solving
Lapalcian systems in probabilistic logspace.

Tuesday, Feb. 28th
------------------

`Daniel Kane <https://cseweb.ucsd.edu/~dakane/>`_
"Fooling Fourier Shapes"

We present recent work providing a nearly optimal, explicit
pseudorandom generator against linear threshold functions. The basic
idea is to fool the Fourier transform of the corresponding linear
forms rather than the threshold function. This generalizes further to
fooling a class of functions that we call "Fourier shapes". We discuss
the generator and some of its applications.

*Lightning talk.* Pierre Bienvenu (University of Bristol) will present problems
of arithmetic combinatorics in Function fields and possible use of the polynomial method to attack them.

Tuesday, Mar. 7th
-----------------

`Proving and Using Pseudorandomness Workshop <https://simons.berkeley.edu/workshops/pseudorandomness2017-2>`_ **(no seminar)**.

Tuesday, Mar. 14th
------------------

`Amnon Ta-Shma <http://www.cs.tau.ac.il/~amnon/>`_
"Explicit, Almost Optimal, Epsilon-Balanced Codes"

The subject of the talk is the same as the one I gave in the workshop. However,
I hope to use the hour to describe the construction, technique and proof in
more detail.

The abstract of the workshop talk is:

The question of finding an epsilon-biased set with close to optimal support
size, or, equivalently, finding an explicit binary code with distance
$\frac{1-\varepsilon}{2}$ and rate close to the Gilbert-Varshamov bound, attracted a
lot of attention in recent decades. In this paper we solve the problem almost
optimally and show an explicit $\varepsilon$-biased set over $k$ bits with support
size $O(\frac{k}{\varepsilon^{2+o(1)}})$. This improves upon all previous explicit
constructions which were in the order of $\frac{k^2}{\varepsilon^2}$,
$\frac{k}{\varepsilon^3}$ or $\frac{k^{5/4}}{\varepsilon^{5/2}}$. The result is close to the
Gilbert-Varshamov bound which is $O(\frac{k}{\varepsilon^2})$ and the lower bound
which is $\Omega\left(\frac{k}{\varepsilon^2 \log(\frac{1}{\varepsilon})}\right)$.

The main technical tool we use is bias amplification with the $s$-wide
replacement product. The sum of two independent samples from an $\varepsilon$-biased
set is $\varepsilon^2$ biased. Rozenman and Wigderson showed how to amplify the bias
more economically by choosing two samples with an expander. Based on that they
suggested a recursive construction that achieves sample size
$O(\frac{k}{\varepsilon^4})$. We show that amplification with a long random walk over
the $s$-wide replacement product reduces the bias almost optimally.


Tuesday, Mar. 21st
------------------

`Marco Carmosino <http://marco.ntime.org/>`_
"Agnostic Learning From Natural Proofs"

Learning algorithms for circuit complexity classes are often
obtained by inspecting the proofs of circuit lower bounds. In recent
work (CIKK16), it was show that this observation is somewhat generic:
for sufficiently expressive circuit classes C, a natural proof (in the
sense of Razborov-Rudich 97) of a circuit lower bound against C
implies a learning algorithm for concepts exactly realizable by
C-circuits. The learning algorithm constructed in CIKK16 does not need
to "inspect" the proof of the bound: it only requires that the proof
is natural. In this talk we present the natural learning technique,
which is an application of algorithms from the crypto/derandomization
literature. Then we discuss an extension of the technique to learning
concepts only approximately realizable by C-circuits (agnostic
learning).


Tuesday, Mar. 28th
------------------

`Andrej Bogdanov <http://www.cse.cuhk.edu.hk/~andrejb/>`_
"Small bias requires large formulas"

A small-biased function is a randomized function whose distribution of
truth-tables is small-biased. We demonstrate that known explicit lower bounds
on the size of (1) general Boolean formulas, (2) Boolean formulas of fan-in
two, (3) de Morgan formulas, as well as (4) correlation lower bounds against
small de Morgan formulas apply to small-biased functions. As a consequence, any
strongly explicit small-biased generator is subject to the best known explicit
formula lower bounds in all these models.

On the other hand, we give a construction of a small-biased function that is
tight with respect to lower bounds (1) and (2) for the relevant range of
parameters. We interpret this construction as a natural-like barrier against
substantially stronger lower bounds for general formulas.


Tuesday, Apr. 4th
-----------------

`Siyao Guo <https://sites.google.com/site/siyaoguo/>`_
"Fixing Cracks in the Concrete: Random Oracles with Auxiliary Input, Revisited"

We revisit security proofs for various cryptographic primitives in the random
oracle model with auxiliary input (ROM-AI): an attacker $A$ can compute arbitrary
$S$ bits of leakage about the random oracle $O$ before attacking the system, and
then use additional $T$ oracle queries to $O$ during the attack. This model was
explicitly studied by Unruh  (CRYPTO 2007), but dates back to the seminal paper
of Hellman in 1980 about time-space tradeoffs for inverting random functions,
and has natural applications in settings where traditional random oracle proofs
are not useful: (a) security against non-uniform attackers;  (b) security
against preprocessing.

We obtain a number of new results about ROM-AI but our main message is that
ROM-AI is the "new cool kid in town:"  it nicely connects theory and practice,
has a lot of exciting open questions and is still in its infancy.  In short,
you should work on it!

Based on joint works with Sandro Coretti, Yevgeniy Dodis and Jonathan Katz.


Tuesday, Apr. 11th
------------------

`Structure vs. Randomness Workshop <https://simons.berkeley.edu/workshops/pseudorandomness2017-3>`_ **(no seminar)**.

Tuesday, Apr. 18th
------------------

`Nikhil Srivastava <https://math.berkeley.edu/~nikhil/>`_
"Matrix Concentration for Expander Walks"

We prove a Chernoff-type bound for sums of matrix-valued random variables
sampled via a random walk on an expander, confirming a conjecture of
Wigderson and Xiao up to logarithmic factors in the deviation parameter.
This allows one to derandomize certain applications of the matrix Chernoff bound,
going roughly from $k \log(n)$
to $k+\log(n)$ bits as in the scalar case.


Tuesday, Apr. 25th
------------------

`Shachar Lovett <http://cseweb.ucsd.edu/~slovett/home.html>`_
"The Decision Tree Complexity of k-SUM is Near-Linear"

The 3-SUM problem asks, given $n$ real numbers $x_1,\dots,x_n$, whether there exist $3$
of them that sum to zero. There is a trivial algorithm that solves it in $O(n^2)$
time, and the best algorithm to date only improves upon it in logarithmic
terms. A significantly better algorithm is believed to be impossible (or at
least very surprising).
 
We show that in the linear decision tree model, 3-SUM has an $O(n polylog(n))$
algorithm. A linear decision tree is an adaptive algorithm which makes linear
queries of the form "$\sum a_i x_i>0$?" to the input $x$, and at the end decides
whether a 3-SUM exists. Moreover, the type of queries we use are only label
queries of the form "$x_i+x_j+x_k>0$?" or comparison queries of the form
"$x_i+x_j+x_k>x_a+x_b+x_c$?". Thus, the queries are all 6-sparse linear queries
with $\{-1,0,1\}$ coefficients. More generally, for any constant $k$, we get a linear
decision tree for k-SUM which makes $O(n polylog(n))$ queries which are each
$2k$-sparse with $\{-1,0,1\}$ coefficients. This matches a lower bound of Ailon and
Chazelle, and improved upon previous work of Gronlund and Pettie which gave an
$O(n^{k/2})$ linear decision tree for k-SUM.
 
The proof is based on a connection between the linear decision trees model and
active learning. Specifically, it builds upon a new combinatorial notion
introduced by the authors in previous work of "inference dimension".
 
Joint work with Daniel Kane and Shay Moran.

*Lightning talk.* (TBD)

Tuesday, May 2nd
----------------

`Caroline Terry <http://www.math.umd.edu/~cterry/>`_ (TBD)

*Lightning talk.* (TBD)

Tuesday, May 9th
----------------
