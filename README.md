# RepositoriesAPI

This project contemplates the creation of an application to consult the GitHub API and show  the most popular swift repositories of GitHub.

## Functional Project

- There will be a button to start the search.
- The application show the results according to server response

## Requirements
- Swift 5
- Target: iOS 13.0
- Xcode 11

### Run project
To execute the project you have to:

1. Clone [the repo](https://github.com/paraisolorrayne/RepositoriesAPI) or download the ZIP file on a Mac
1. If you choose to download the ZIP file, unzip it
1. Open the file `RepositoriesAPI.xcodeproj` with Xcode 11
1. Pick a simulator (choose an iPhone with iOS 13 or later)
1. Run the project (CMD+R)

### Run tests
To run some unit tests you have to:

1. Open the file `RepositoriesAPI.xcodeproj` with Xcode 11
1. Run tests (CMD+U)

---

## Project Patterns

### Architecture 
- MVVM with closures

```
<SCENE_NAME>
├── View
│   └── <SCENE_NAME>View.swift
└── ViewModels
│   └── <SCENE_NAME>ViewModel.swift
└── Model
└── <SCENE_NAME>Model.swift

```
### Structure
- Navigation: Coordinator

```
├── Commom
│   └── Coordinator.swift

```
- Network: Service and protocol

```
<SCENE_NAME>
├── Service
│   └── <SCENE_NAME>Service.swift
│   └── GatewaySetup.swift
└── Protocol
│   └── <SCENE_NAME>ServiceProtocol.swift

```

### UI development
- XIB

### API Documentation

[GitHub REST API v3](https://developer.github.com/v3) 
Usage in this project
##### BaseURL:
- [URL](https://api.github.com)

- Find repo from language by most popular
`{baseURL}/search/repositories?q=language:swift&sort=stars&page=1`

- Find readme
`{baseURL}/repos/{login}}/{name}/contents/README.md?ref=master`

### Network Layer Pattern
- HTTP Client
- URLSessionProtocol
- Service and Protocol

### Screenshots

![alt text](https://github.com/paraisolorrayne/RepositoriesAPI/blob/develop/screenshots/get-started.png?raw=true)
![alt text](https://github.com/paraisolorrayne/RepositoriesAPI/blob/develop/screenshots/repositories.png?raw=true)
