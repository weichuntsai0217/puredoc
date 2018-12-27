# Advance Math for Align, Theorems and Proofs

Examples in this section/chapter needs
the following option turned on in the `yaml` header of `md`
```
---
enable-adv-math-packages: true
.
.
.
...
```

## Multi-line equation which aligns to the equal sign
\begin{align}
dP &= \frac{e^{-Q/2}}{(2\pi)^{k/2}}\frac{2\pi^{k/2}}{\Gamma(\frac{k}{2})}Q^{(k-1)/2}\frac{dQ}{2Q^{1/2}} \nonumber \\
   &= \frac{1}{2^{k/2}\Gamma(k/2)}Q^{k/2 - 1}e^{-Q/2}dQ \label{align:multi-line-eq-2nd} \\
   &= f(Q)dQ \label{align:multi-line-eq-3rd}
\end{align}
You can refer to one of its formula after the equal sign like this => Eq. \ref{align:multi-line-eq-2nd}

## Theorem
\begin{theorem}\label{thm:X-2-chi}
If a random variable $Y = X^{2}$ where $X \sim N(0,1)$,
then $Y  \sim \chi^{2}_{1}$.
\end{theorem}
You can refer to this theorem like this => Theorem \ref{thm:X-2-chi}

## Proof
\begin{proof}\label{prf:X-2-chi}
Let $P(Y)$ be the cumulative distribution function of the random variable $Y$, then \\
for $y < 0$, $P(Y < y) = 0$ (since $Y = X^{2} \geq 0$ for all X) \\
for $y > 0$:
\begin{align}
P(Y < y) &= P(X^{2} < y) = P(|X| < \sqrt{y}) = P(-\sqrt{y} < X < \sqrt{y} \nonumber \\
         &= F_{x}(\sqrt{y}) - F_{x}(-\sqrt{y}) = F_{x}(\sqrt{y}) - (1 - F_{x}(\sqrt{y})) \nonumber \\
         & = 2F_{x}(\sqrt{y}) - 1 \nonumber \\
f_{Y}(y) &= 2\frac{d}{dy}F_{x}(\sqrt{y}) - 0 = 2\frac{d}{dy}(\int^{\sqrt{y}}_{-\infty}\frac{1}{\sqrt{2\pi}}e^{\frac{-t^{2}}{2}}dt) \nonumber \\
         &= 2\frac{1}{\sqrt{2\pi}}e^{-\frac{y}{2}}\frac{d}{dy}(\sqrt{y}) = 2\frac{1}{\sqrt{2}\sqrt{\pi}}e^{-\frac{y}{2}}(\frac{1}{2}y^{-\frac{1}{2}}) \nonumber \\
         &= \frac{1}{2^{\frac{1}{2}}\Gamma(\frac{1}{2})}y^{-\frac{1}{2}}e^{-\frac{y}{2}} \label{align:chi1-final}
\end{align}
where $F$ and $f$ are the cdf and pdf of the corresponding random variables. \\
Eq. \ref{align:chi1-final} is just the pdf of $\chi^{2}_{1}$-distribution, then we have proved that $Y  \sim \chi^{2}_{1}$.
\end{proof}
You can refer to this proof like this => Proof \ref{prf:X-2-chi}


