# Project Architecture – Love2D (Abyss Forge)

## 1. Overview

This project uses **Love2D** with a **modular, data-driven architecture** focused on:

* Reusability across multiple characters
* Clear separation of concerns (logic, animation, assets)
* Easy scalability (new characters, animations, states)
* Readability and maintainability

The game currently targets an **isometric / top-down action RPG** style, inspired by classic titles, with **shared animation sets** across characters.

---

## 2. High-Level Architecture

The codebase is organized around four main concepts:

1. **Core Engine Systems** – game loop, input, utilities
2. **Entities** – characters and their behavior
3. **Animations** – generic animation logic (not character-specific)
4. **Assets** – spritesheets and visual resources

```text
src/
├── main.lua
├── conf.lua
│
├── core/
│   ├── input.lua
│   ├── animation.lua
│   └── utils.lua
│
├── entities/
│   ├── character.lua
│   └── characters/
│       ├── barbarian.lua
│       ├── arcanist.lua
│       └── necromancer.lua
│
├── data/
│   └── animations.lua
│
└── assets/
    └── sprites/
        ├── barbarian/
        │   ├── idle.png
        │   ├── walk.png
        │   └── attack.png
        ├── arcanist/
        │   ├── idle.png
        │   ├── walk.png
        │   └── attack.png
        └── necromancer/
            ├── idle.png
            ├── walk.png
            └── attack.png
```

---

## 3. Core Design Principles

### 3.1 Shared Logic, Different Data

All characters share:

* The same **animation states** (idle, walk, attack, etc.)
* The same **directions** (up, down, left, right)
* The same **state machine logic**

What changes between characters is **only the data**:

* Spritesheets
* Animation timing (if needed)
* Stats (future: speed, damage, mana, etc.)

This avoids code duplication and keeps behavior consistent.

---

## 4. Animation System

### 4.1 animation.lua (Generic)

`core/animation.lua` defines a reusable `Animation` object responsible for:

* Splitting spritesheets into frames
* Advancing frames based on time (`dt`)
* Looping or one-shot playback
* Returning the current frame to render

This file **does not know anything about characters**.

---

### 4.2 animations.lua (Data Definition)

`data/animations.lua` defines animation metadata in a declarative way:

```lua
return {
  idle = {
    frames = 4,
    directions = 4,
    frameWidth = 64,
    frameHeight = 96,
    duration = 0.8,
    loop = true
  },
  walk = {
    frames = 4,
    directions = 4,
    frameWidth = 64,
    frameHeight = 96,
    duration = 0.6,
    loop = true
  },
  attack = {
    frames = 4,
    directions = 4,
    frameWidth = 64,
    frameHeight = 96,
    duration = 0.5,
    loop = false
  }
}
```

This allows **adding new animations without touching engine code**.

---

## 5. Entity System

### 5.1 character.lua (Base Class)

`entities/character.lua` defines a **generic playable character**:

Responsibilities:

* Position and movement
* Direction handling
* Animation state switching
* Update and draw methods

Example responsibilities:

* Decide whether the character is `idle`, `walking`, or `attacking`
* Select the correct animation
* Forward `dt` to the animation system

---

### 5.2 Character Definitions

Each character file only provides **configuration**:

```lua
return {
  name = "Barbarian",
  spritePath = "assets/sprites/barbarian",
  speed = 200
}
```

Files:

* `barbarian.lua`
* `arcanist.lua`
* `necromancer.lua`

No animation logic is duplicated.

---

## 6. Why NOT One File per Animation?

❌ **Avoid**:

```text
walk.lua
idle.lua
attack.lua
```

Reasons:

* Animations are **states**, not systems
* Leads to duplicated logic
* Harder to add new states consistently
* Poor scalability

✅ **Preferred**:

* One **generic animation system**
* One **data file** describing all animations

---

## 7. Asset Organization

Assets are grouped **by character**, not by animation type:

```text
assets/sprites/barbarian/walk.png
assets/sprites/arcanist/walk.png
```

Benefits:

* Easy to replace or redesign a single character
* Clean asset ownership
* Matches how artists usually work

---

## 8. Scalability & Future Extensions

This architecture supports:

* Adding new characters (just add a folder + config file)
* Adding new animations (update `animations.lua`)
* Adding enemies or NPCs (reuse `character.lua` or extend it)
* Adding combat systems, skills, or spells

Future directories may include:

```text
systems/
components/
ui/
```

---

## 9. Documentation Philosophy

Yes, this architecture **should be documented**.

Benefits:

* Clarifies design decisions
* Helps future contributors
* Serves as a reference when the project grows
* Increases project professionalism

This file (`ARCHITECTURE.md`) is considered a **living document** and should evolve with the project.

---

## 10. Summary

* Characters share behavior, differ only in data
* Animations are generic and data-driven
* Assets are organized per character
* Code is modular, scalable, and clean

This structure follows common best practices for **Love2D**, **indie games**, and **classic action RPGs**.

---

*Abyss Forge – Architecture Documentation*

