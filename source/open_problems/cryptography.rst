Cryptography
============

Cryptography using Weak Sources of Randomness (Feb 6--Feb 9)
------------------------------------------------------------

Open Problems presented by Yevgeniy Dodis at the Simons Working Group on Cryptography using Weak Sources of Randomness.

:math:`\mathbf{IP\mbox{-}weak} = \mathbf{IP}`
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Is $\mathbf{IP\mbox{-}weak} = \mathbf{IP}$? Note, only one weak source and must be conditional (e.g., $\mathbf{IP} \neq \mathbf{AM}$).

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

