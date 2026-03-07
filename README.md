# DrinkUp!
<!-- README.md の冒頭 -->
[English] | [日本語](./README.ja.md)

DrinkUp! is an app that supports your hydration habits.

The concept is very simple.  
**To make it easy for anyone to reliably track their water intake. To cultivate the desire to drink more water.**

This work was created as an entry for the **2026 Swift Student Challenge**.

---

## 🧠 Concept

In daily life, we often forget to hydrate.
While being mindful of hydration is important, you can't tell if you're drinking enough without knowing how much you've actually consumed.
DrinkUp! aims to let all users easily track their intake without constantly thinking about how much they've drunk so far.
Therefore, DrinkUp! is designed assuming users have their own water bottle.
Those without a water bottle will need to get one, as drinking from a water bottle is the simplest and most practical way to track intake.
DrinkUp! promotes natural habit formation by displaying progress through intuitive visuals and numbers.

| Icon | Range | Status |
|----------|------|------|
| 🌱 | 0–499ml | Still a ways to go |
| 🍃 | 500–799ml | Nice! |
| 🌳 | 800–1199ml | Great! |
| 🏆 | 1200ml+ | Unbeatable |

Users can record with a single tap.
Long-press allows entering custom values.

This app is designed for “quick use,” prioritizing an experience where you can return to your routine immediately after logging.

---

## 📱 Key Features

- One-tap hydration tracking
- Long press for custom input
- “Money Saved” feature
- Daily history display
- 4-tier Achievement display
- Clear navigation
- Accessibility considerations (design avoids color-only identification)

---

## 🛠 Technologies Used

### SwiftUI
Simple layout design through declarative UI construction.

### SF Symbols
Utilizes Apple's standard icons, supporting Dynamic Type and accessibility.

### UserDefaults
Lightweight local data storage.

### Combine
Date change detection and notification handling.

### UIKit Integration
- Haptic feedback
- Portrait orientation lock

These were chosen prioritizing maintainability and simplicity.

---

## 🎯 Design Philosophy

- Complete actions as quickly as possible
- Keep decorative animations minimal
- Make state changes intuitive
- Create UI recognizable beyond color

We aim for a design where users don't linger long within the app.

## 🗣 License

Currently a student project; commercial use is not anticipated.
