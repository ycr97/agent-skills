---
name: first-principles-learning
description: Teach or learn a complex concept deeply by extracting its governing principle, building a mental model, explaining the real mechanism, testing misconceptions, requiring active application, using Socratic correction, and verifying transfer. Use when the user asks to learn, understand, master, or deeply explain a topic rather than receive only a direct factual answer. Do not use for simple lookups or when the user explicitly wants only a concise answer.
---

# First Principles Learning

Use this skill to turn explanation into a learning loop. The goal is not merely to answer the current question; the learner should become able to reason about related unfamiliar problems independently.

## Operating model

Follow this progression:

```text
Governing principle
→ Mental model
→ Real mechanism
→ Boundaries and misconceptions
→ Active application
→ Diagnosis and correction
→ Feynman explanation
→ Transfer test
```

Do not mechanically run every phase if the learner already demonstrates mastery. Diagnose the current level and start at the earliest missing capability.

## 1. Extract the governing principle

Start with the smallest principle that explains most of the topic.

State it in 1–3 sentences and explain why it is central. Prefer a principle that remains useful after implementation details are removed and allows later behavior to be derived rather than memorized.

## 2. Build from first principles

Derive the concept from simpler facts and constraints. Distinguish facts, assumptions, abstractions, inferences, implementation choices, and heuristics when that distinction matters.

Prefer causal structure such as:

```text
known facts
→ constraints
→ causal relationships
→ mechanism
→ observed behavior
```

Do not use terminology as a substitute for explanation.

## 3. Build a mental model

Give the learner an intuitive representation before adding full implementation detail. Prefer concrete examples, counterexamples, state transitions, timelines, causal chains, extreme cases, or controlled changes to one variable.

When using an analogy, explicitly identify where the analogy stops matching reality.

## 4. Explain the real mechanism

Map the mental model back to the actual system. Trace inputs, state changes, transformations, constraints, and outputs.

For technical topics, follow the real runtime path when useful instead of stopping at API-level descriptions.

## 5. Attack the model

Actively look for likely false mental models. Cover at least one important misconception, one confusable neighboring concept, one boundary condition, and one counterexample when the topic supports them.

Explain why the incorrect interpretation appears plausible.

## 6. Require active application

Stop explaining and make the learner use the model. Choose the smallest exercise that reveals understanding.

Progressive difficulty:

1. direct application,
2. one changed condition,
3. misleading or irrelevant information,
4. realistic scenario,
5. open-ended diagnosis, design, or prediction.

Do not immediately reveal the answer.

## 7. Correct Socratically

When the learner answers, diagnose the reasoning rather than replying only correct/incorrect.

Identify which category failed:

- missing fact,
- incorrect assumption,
- invalid inference,
- terminology confusion,
- incomplete causal chain,
- boundary-condition failure.

Use the weakest useful hint first:

```text
point to a contradiction
→ point to the governing principle
→ give an analogous case
→ expose the missing reasoning step
→ provide the full explanation
```

## 8. Run the Feynman check

Once the learner appears to understand the mechanism, ask them to explain it to a technically capable person who has never learned it.

Inspect the explanation for vague words, hidden assumptions, unexplained terminology, memorized phrases, skipped transitions, and causal gaps. Probe those gaps until the explanation is internally coherent.

## 9. Run a transfer test

Present a new situation whose surface details differ but whose governing principle is the same. The learner should identify and apply the principle without being told which part of the original lesson it maps to.

## Completion

Treat the topic as provisionally learned when the learner can:

- state the governing principle,
- explain the mechanism causally,
- predict behavior when conditions change,
- identify or reject a common misconception,
- solve a related unfamiliar problem,
- explain the topic without hiding behind jargon,
- transfer the principle to a different context.

## Interaction policy

Default to an interactive loop instead of a long monologue:

```text
teach
→ ask
→ observe
→ diagnose
→ adjust
→ continue
```

If the user explicitly asks for a self-contained lesson, provide one, but preserve the same conceptual ordering and include self-check questions.

## Supporting references

Read these only when needed:

- [`references/protocol.md`](references/protocol.md): the deeper teaching protocol and phase rationale.
- [`references/rubric.md`](references/rubric.md): the understanding-level rubric used to choose the next teaching move.
- [`examples/README.md`](examples/README.md): example activations and boundary cases.
