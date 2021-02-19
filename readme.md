# Compound interest smart contract

A contract for calculating compound interest. Unfortunately, since floats aren't supported, the rate isn't computed as expected.

## Usage

### `get-accrued-amount`

Returns the result of `A = P(1 + r / n) ^ (nt)`, where `P`, `r`, `n` and `t` are all variables that can be modified.
