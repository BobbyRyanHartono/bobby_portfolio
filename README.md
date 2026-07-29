# Bobby Ryan Hartono - Portfolio

A responsive, cross-platform personal portfolio application built with Flutter. This project leverages the Google Antigravity CLI for agent-driven rapid iteration and clean architectural scaffolding.

---

## 🚀 Tech Stack

- [cite_start]**Framework:** Flutter [cite: 1, 2]
- [cite_start]**Workflow / Tooling:** Google Antigravity CLI (`agy`) [cite: 2, 57]
- [cite_start]**State Management:** _[Insert Riverpod, Provider, or BLoC here]_
- [cite_start]**Design System:** Material 3

---

## 🏗️ Core Architecture & Features

[cite_start]This portfolio is designed with a strict separation of UI and business logic to ensure maintainability[cite: 12, 23].

| Feature Area            | Details                                                                                        | Technical Approach                                            |
| :---------------------- | :--------------------------------------------------------------------------------------------- | :------------------------------------------------------------ |
| **Hero/Intro**          | [cite_start]Name (Bobby Ryan Hartono), title, and primary call-to-action[cite: 24, 25].        | [cite_start]Stateless UI, custom typography [cite: 25]        |
| **Project Showcase**    | [cite_start]Grid or carousel of past work and achievements[cite: 26].                          | [cite_start]`Project` Data Model, Mock API Service [cite: 26] |
| **Experience Timeline** | [cite_start]A chronological list of work history and skills[cite: 27].                         | [cite_start]`Experience` Data Model, ListViews [cite: 27]     |
| **Contact Section**     | [cite_start]Form to send emails or link out to external platforms (LinkedIn/GitHub)[cite: 28]. | [cite_start]Form validation, external URI launcher [cite: 28] |

---

## 🛠️ Getting Started

### Prerequisites

- Flutter SDK installed and added to PATH.
- [cite_start][Google Antigravity CLI](https://antigravity.google/product/antigravity-cli) installed (`curl -fsSL https://antigravity.google/cli/install.sh | bash`)[cite: 44, 49].

### Running the Project Locally

1. **Clone the repository and fetch dependencies:**
   ```bash
   flutter pub get
   ```
