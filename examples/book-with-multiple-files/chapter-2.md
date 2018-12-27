# Math Equations

The following are 2 examples for equations.

## Normal distribution
The normal distribution is a continuous probability distribution with probability density function (pdf) defined as

\begin{equation}\label{eqn:normal-distribution}
f(x ; \mu, \sigma^{2}) = \frac{1}{\sqrt{2\pi\sigma^{2}}}e^{-\frac{\displaystyle (x - \mu)^{2}}{\displaystyle 2\sigma^{2}}}, \quad -\infty < x < \infty
\end{equation}
where

* $\mu$ is the mean or expectation of the distribution.
* $\sigma$ is the standard deviation of the distribution.
* $\sigma^{2}$ is the variance of the distribution.

If you use a `\label{eqn:normal-distribution}` in this equation, then you could use a

`\ref{eqn:normal-distribution}` to refer to this equation.
For example, please refer to Eq. \ref{eqn:normal-distribution}.

## $t$-distribution

The $t$-distribution is a continuous probability distribution with probability density function defined as
\begin{equation}\label{eqn:student-t}
f(x ; \nu) = \frac{\Gamma(\frac{\nu+1}{2})}{\sqrt{\nu\pi}\Gamma(\frac{\nu}{2})}
\left( 1 + \frac{x^{2}}{\nu} \right)^{\displaystyle -\frac{\nu+1}{\displaystyle 2}}
, \quad -\infty < x < \infty
\end{equation}
where

* $\nu$ is the degrees of freedom and is a positive integer.
* $\Gamma$ is the gamma function.

If you use a `\label{eqn:student-t}` in this equation, then you could use a

`\ref{eqn:student-t}` to refer to this equation.
For example, please refer to Eq. \ref{eqn:student-t}.


