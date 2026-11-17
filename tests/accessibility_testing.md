
# Accessibility Testing

## 1. Introduction

Accessibility Testing verifies whether an application can be used by people with different abilities.

It ensures that websites and applications are accessible to users who may rely on assistive technologies.

## 2. What Is Accessibility Testing?

Accessibility testing evaluates whether an application follows accessibility standards and provides an inclusive user experience.

It focuses on:

- Keyboard navigation
- Screen reader compatibility
- Color contrast
- Text readability
- Alternative text
- Form accessibility
- Semantic HTML

## 3. WCAG Principles

WCAG defines four major accessibility principles.

### Perceivable

Information must be presented in ways users can perceive.

### Operable

Users must be able to interact with the interface.

### Understandable

Content and navigation should be understandable.

### Robust

Content should work with different browsers and assistive technologies.

## 4. Accessibility Testing Example

Example accessible HTML:

```html
<button aria-label="Open navigation menu">
  Menu
</button>

<img
  src="logo.png"
  alt="Company logo"
>

<label for="email">Email Address</label>
<input
  type="email"
  id="email"
  name="email"
>
