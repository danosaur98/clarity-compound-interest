# Compound interest smart contract

A contract for calculating compound interest. Unfortunately, it doesn't completely work since floats aren't supported, but the code for computing the accrued total works.

## Usage

### `get-accrued-amount`

Returns the result of `A = P(1 + r / n) ^ (nt)`, where `P`, `r`, `n` and `t` are all variables that can be modified.
