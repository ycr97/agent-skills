# First Principles Learning Protocol

## Objective

Transform a learner from recognition of an answer into independent, transferable reasoning.

The protocol separates four things that are often conflated:

- receiving an explanation,
- having an intuitive mental model,
- being able to reproduce reasoning,
- being able to transfer that reasoning to a new situation.

The final one is the target.

## Phase A — Governing principle

Find the smallest stable idea that explains the largest portion of the topic. It should function as a compression mechanism: many facts should become consequences of a smaller number of principles.

A weak principle merely restates the definition. A strong principle supports prediction.

## Phase B — Construction

Rebuild the concept from prerequisites rather than asking the learner to accept a finished abstraction.

Where useful, make the dependency chain explicit:

```text
primitive fact
+ primitive fact
+ constraint
→ consequence
→ mechanism
→ observable behavior
```

The learner should know which links are logically necessary and which are engineering choices.

## Phase C — Intuition

Use a simplified model to reduce cognitive load. The model is temporary scaffolding, not the final explanation.

Good intuition should make at least one later behavior unsurprising.

## Phase D — Reality mapping

Translate the simplified model into the actual mechanism. Replace metaphorical elements with real structures, state transitions, protocols, data structures, runtime stages, or domain processes.

For systems topics, prefer execution traces and state changes over static component lists.

## Phase E — Model attack

Understanding becomes robust when it survives adversarial cases.

Challenge the learner with:

- a tempting but wrong interpretation,
- a neighboring concept with overlapping terminology,
- an edge condition,
- a counterexample,
- a variable change that reverses the expected behavior.

## Phase F — Active application

Passive familiarity is not evidence of understanding. Require the learner to predict, diagnose, design, compare, or explain.

Exercises should maximize diagnostic value rather than quantity.

## Phase G — Socratic repair

When reasoning fails, locate the earliest broken link rather than replacing the whole chain with the correct answer.

Prefer questions that expose contradictions. Escalate hints only as necessary.

## Phase H — Feynman compression

Ask the learner to explain the concept in simple causal language. Fluency without causal precision is not sufficient.

Look for verbal placeholders such as "basically", "somehow", "the system handles it", or unexplained terms that conceal missing mechanism.

## Phase I — Transfer

Change the surface form while preserving the deep structure. Transfer demonstrates that the learner has encoded a reusable model rather than memorized an example.

## Adaptive control loop

The protocol is not strictly linear. Use evidence from the learner's answers to move backward or forward.

```text
observe learner state
→ estimate understanding level
→ choose next highest-value teaching move
→ collect evidence
→ update estimate
```

Avoid repeating phases already demonstrated unless a later failure indicates the earlier model was superficial.
