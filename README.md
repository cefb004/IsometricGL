# IsometricGL

**IsometricGL** is a lightweight 2D isometric game framework built with **Love2D** and **Lua**, inspired by **Diablo-like gameplay** and the **Neo Geo retro philosophy**. The project aims to provide a solid foundation for fast prototyping of isometric games, with a focus on **large sprites, smooth animations, and classic retro aesthetics**.

---

## íº€ Features

- **Love2D + Lua** setup: simple, lightweight, and cross-platform.
- **Isometric tile-based map** support.
- **Animated character sprites** (supports large Neo Geo style spritesheets).
- **Player movement** in isometric space (8-directional movement).
- **Camera system** (follow player / scrolling).
- **Hot-reload friendly** structure for fast development.
- **Audio support** for retro-style sounds and music.

---

## í¾¯ Goal

The main goal is to build a **Diablo-like action RPG** with retro Neo Geo aesthetics.  
Focus is on:

- Fast prototyping and iteration.
- Large and detailed sprites (classic arcade feel).
- Smooth animation and responsive controls.
- Modular code structure for easy expansion (enemies, items, UI, etc.).
- Portability to Windows, Linux, and potentially mobile (Android/iOS) via Love2D wrappers.

---

## í·‚ Project Structure
Â´Â´Â´
IsometricGL_Lua/
â”œâ”€â”€ main.lua # Main entry point
â”œâ”€â”€ conf.lua # Love2D configuration
â”œâ”€â”€ assets/ # All sprites, tiles, sounds
â”‚ â”œâ”€â”€ sprites/
â”‚ â””â”€â”€ sounds/
â”œâ”€â”€ src/ # Game modules (player, map, camera)
â””â”€â”€ libs/ # Optional Lua libraries (HUMP, STI, etc.)
Â´Â´Â´
---

## âš¡ Quick Start

1. Install **Love2D**: [https://love2d.org/](https://love2d.org/)  
2. Clone the repository:

```bash
git clone <your-repo-url>
cd IsometricGL_Lua
Run the game:

bash

"C:/Program Files/LOVE/love.exe" .
Or create an alias in Git Bash for simpler running:

bash

alias love='"C:/Program Files/LOVE/love.exe"'
love .

## í³¦ Dependencies / Libraries

HUMP â€“ Camera, timers, and utilities.

STI (Simple Tiled Implementation) â€“ Tilemap loader (optional for Tiled maps).

## í¾¨ Art & Assets

Neo Geo retro-inspired sprites.

Large characters and tiles for classic arcade feel.

All sprites are intended for 8-directional animations, ideal for isometric movement.

## í³ Roadmap

Implement animated player character with 8-directional idle/move sprites.

Build basic isometric tilemap.

Implement camera following and screen scrolling.

Add enemy AI and combat mechanics.

Expand UI/HUD, inventory, and sound system.

Optimize for performance and portability (PC â†’ mobile).

## í²¡ Notes

This project is intended as a learning and prototyping platform for isometric games.

Love2D allows fast iteration, hot-reload testing, and minimal setup compared to C++/SDL/OpenGL.

Philosophy: Neo Geo / Diablo-like retro aesthetic with modern Lua convenience.

## í³„ License

MIT License â€“ feel free to use and modify for personal or educational projects.
