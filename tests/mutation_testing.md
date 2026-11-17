
# Mutation Testing

## 1. Introduction

Mutation Testing is a software testing technique used to evaluate the effectiveness of existing test cases.

It introduces small changes into source code and checks whether the test suite detects those changes.

## 2. What Is Mutation Testing?

A mutation is a small modification made to the original program.

Examples include:

- Changing addition to subtraction.
- Replacing greater-than with less-than.
- Removing a condition.
- Changing a return value.
- Modifying boolean expressions.

If the test suite detects the change, the mutation is killed.

If the test suite does not detect it, the mutation survives.

## 3. Mutation Testing Process

1. Execute the original test suite.
2. Generate code mutations.
3. Run tests against each mutation.
4. Identify killed mutations.
5. Identify surviving mutations.
6. Improve test cases.

## 4. Example

Original JavaScript function:

```javascript
function add(a, b) {
  return a + b;
}
