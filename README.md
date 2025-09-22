# A1Connect

An iOS application developed as a take-home assignment for the iOS Developer position at A1apps. The app fetches and displays a list of candidates from a remote API, demonstrating modern iOS development practices.

---

## Features

* **SwiftUI:** The UI is built entirely with SwiftUI, Apple's modern declarative framework.
* **API Integration:** Fetches data asynchronously from the provided API endpoint using Swift Concurrency (`async/await`).
* **MVVM Architecture:** Utilizes the Model-View-ViewModel pattern for a clean separation of concerns, improved testability, and a scalable codebase.
* **Client-Side Pagination:** Implements an "infinite scrolling" list that smoothly loads data in chunks, providing an excellent user experience even though the API returns the full dataset at once.
* **Robust State Handling:** Gracefully handles loading, error, and content states, providing clear feedback to the user.
* **Image Caching:** Efficiently downloads, caches, and displays remote images using the **Kingfisher** library.
* **Clean & Scalable Folder Structure:** The project is organized by feature, making it easy to navigate and expand.

---

## Architecture

The project follows the **MVVM (Model-View-ViewModel)** architectural pattern.

* **Model:** The `Candidate` struct, which is a simple data structure that represents the information fetched from the API.
* **View:** SwiftUI views (`CandidateListView`, `CandidateCardView`) that are responsible for the presentation layer. They are "dumb" and simply reflect the state of the ViewModel.
* **ViewModel:** The `CandidateListViewModel` acts as the bridge between the Model and the View. It contains all the business logic, state management, and triggers the data fetching from the `NetworkService`.

---

## Technical Stack

* **Language:** Swift 6
* **UI Framework:** SwiftUI
* **Concurrency:** Swift Concurrency (`async/await`)
* **Dependency:**
    * **Kingfisher:** For efficient image loading and caching, added via Swift Package Manager.

---

## Folder Structure

The project is organized by feature to ensure scalability and maintainability.

```plaintext
A1Connect/
├── Application/
├── Features/
│   └── CandidateList/
│       ├── Model/
│       │   └── Candidate.swift
│       ├── View/
│       │   ├── CandidateListView.swift
│       │   ├── CandidateCardView.swift
│       │   └── HeaderStatsView.swift
│       └── ViewModel/
│           └── CandidateListViewModel.swift
├── Services/
│   └── NetworkService.swift
├── Extensions/
│   └── Color+Extensions.swift
└── Resources/
    └── Assets.xcassets

## How to Run

1.  Clone the repository to your local machine.
2.  Open the `A1Connect.xcodeproj` file in Xcode.
3.  The Kingfisher dependency should resolve automatically. If not, add it via Swift Package Manager: `https://github.com/onevcat/Kingfisher.git`.
4.  Build and run the project on your desired simulator or physical device.
