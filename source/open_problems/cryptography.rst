Cryptography
============

Cryptography using Weak Sources of Randomness (Feb 6--Feb 9)
------------------------------------------------------------

Open Problems presented by Yevgeniy Dodis at the Simons Working Group on Cryptography using Weak Sources of Randomness.

Prepared by Siyao Guo.

Interactive proofs with imperfect randomness.
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

The class of languages which admit deterministic interactive proofs
is $\mathbf{NP}$.
The class of languages ($\mathbf{IP}$) which admit *probabilistic* interactive
proofs is $\mathbf{PSPACE}$.

**Question:** Is $\mathbf{IP\mbox{-}weak} = \mathbf{IP}$?
Can we simulate probabilistic interactive proofs using imperfect random sources?

Dodis et al. :cite:`DOPS04` (`pdf <https://cs.nyu.edu/~dodis/ps/1-source.pdf>`__)
showed that block sources are sufficient to similate interactive proofs.

Extraction from limited "bit-coin source"
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

source parameterized by $\gamma$, $n$ and $b$.

repeat the following steps until $n$ $b$-bit blocks output:

#. sample random $b$-bit $X$

#. sample a coin which is 1 with probability $1-\gamma$.

#. if coin=0, output $X$ as next block and go to step 1.

#. if coin=1, ask attacker if he wants to block $X$ or not

#. if block, don't output anything and go to step 1, else output $X$ and go to step 1.

Goal: extract (for now 1) $\varepsilon$-unbiased bit from such $X_1\dots X_n$

Known: impossible if $A$ can block unbounded number of times.

So let's limit number of blocked times by $t$

Question 1: $b=1$. given $t$, $\varepsilon$, $\gamma$, what is smallest $n$ for which possible?

Question 2: given $t$, $\varepsilon$, $\gamma$, what is smallest alphabet $b$ for which can set $n=t+1$.

---

Consider the case of (information-theoretic) private-key encryption
where parties wish to encrypt a $b$-bit value using shared secret
key sampled from an imperfect random source $X$ over $n$ bits.
Bosley and Dodis :cite:`BD07` (`pdf <https://www.iacr.org/archive/tcc2007/43920001/43920001.pdf>`__)
showed that if such scheme is secure, then one can deterministically
extract $b-\log{n}$ bits from $X$. Hence, to a large extent,
true randomness is inherent for encryption.

Separation between encryption and extraction.
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

They conjecture that extracting :math:`b` bits from :math:`X` is
impossible.

For any extractor
:math:`\mathrm{Ext}:\{0,1\}^n\times\big(\{0,1\}^{\mathrm{poly}(n)}\big)^B\rightarrow\{0,1\}`,
there exists distribution :math:`X` over :math:`\{0,1\}^n` and
:math:`\mathrm{Enc}:\{0,1\}^n\times[B]\rightarrow \{0,1\}^{\mathrm{poly}(n)}`
such that

-  for any :math:`m_0\neq m_1`,
   :math:`\Delta(\mathrm{Enc}(X,m_0),\mathrm{Enc}(X,m_1))=0,`

-  :math:`\Delta(\mathrm{Ext}(X, \mathrm{Enc}(X,1),\dots, \mathrm{Enc}(X,B)),U_1)>\Omega(1)`

where :math:`U_1` is the uniform distribution over :math:`\{0,1\}`,
:math:`B=2^b` and :math:`\Delta` stands for statistical distance.

Bosley and Dodis :cite:`BD07` showed that above conjecture
is true for :math:`b\leq \log{n}-\log{\log{n}}`.

Is true randomness inherent for sharing schemes?
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

A randomize function :math:`\mathrm{share}(m, X)\rightarrow(L,R)` (which
takes a message :math:`m` over :math:`b` bits as input and uses
:math:`X` as the random source) is a :math:`2`-out-of-:math:`2` secret
sharing scheme if

-  (Reconstruction) there exists an algorithm :math:`\mathrm{Rec}` such
   that

   .. math:: \text{for every $m$, $\Pr[\mathrm{Rec}(L,R)=m]=1,$}

-  (Privacy) for any :math:`m'\neq m`, :math:`\Delta(L(m),L(m'))=0` and
   :math:`\Delta(R(m),R(m'))=0`.

**Question:** If :math:`\mathrm{share}(m,X)` is a
:math:`2`-out-of-:math:`2` secret sharing scheme, can we
deterministically extract random bits from :math:`X`?

More background in secret sharing can be found in the survey by
Beimel :cite:`Beimel11` (`pdf <https://www.cs.bgu.ac.il/~beimel/Papers/Survey.pdf>`__).

Beating RT-bound using computational extractor.
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Radhakrishnan and Ta-Shma
:cite:`RT97` (`pdf <https://pdfs.semanticscholar.org/0385/3893e657cb69e51b603d3f1cc1d5c47be5a5.pdf>`__)
showed that any seeded extractor with error :math:`\varepsilon` suffers from
:math:`2\log{1/\varepsilon}` entropy loss (entropy loss is the amount of
entropy in source and seed substracting output length). Motivated by
bypassing this limitation, one approach is to consider computational
extractor, whose output is only required to be computationally
indistinguishable from uniformly random.

Dachman-Soled et al. :cite:`DGKM12`
(`pdf <https://eprint.iacr.org/2011/708.pdf>`__), together with the
result of Dodis et al. :cite:`DPW14` (`pdf <https://eprint.iacr.org/2013/708.pdf>`__)
showed that any efficient computational extractor beating RT-bound
implies one-way function.

**Question:** Can we construct an *efficient*
computational extractor *beating RT-bound* based on one-way functions?

Krawczyk :cite:`Kra10` (`pdf <https://eprint.iacr.org/2010/264.pdf>`__)
used extract-then-expand approach and showed a computational extractor
for medium-to-high entropy sources. More background and other approaches
for constructing computational extractors can be found in Yevgeniy’s
`slides <http://cs.nyu.edu/~dodis/randomness-in-crypto/no-waste.pdf>`__
and `lecture
note <http://cs.nyu.edu/~dodis/randomness-in-crypto/lecture12.pdf>`__.
