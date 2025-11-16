# WeatherApp 

**WeatherApp** is a simple iOS application built with **Swift** and **SwiftUI** that provides real-time weather updates for your current location.  
The app fetches weather data from an API and presents it in a clean, modern, and user-friendly interface.

---

## Features

- **Location-Based Weather**  
  Automatically detects your current location using CoreLocation and displays the weather information for that location.

- **Weather Details Displayed**  
  - Temperature (°C)  
  - Location name (city, country)  
  - Weather condition (e.g., sunny, cloudy, rain)

- **Asynchronous Data Fetching**  
  Uses Swift `async/await` to fetch weather data in the background, ensuring a smooth and responsive user interface.

- **Error Handling**  
  - Handles location permission denial gracefully.  
  - Displays user-friendly messages if the API call fails or returns invalid data.  

- **Scalable and Extensible**  
  Designed to support future features such as multi-day forecasts, search by city, or UI enhancements.

---

## Architecture & Design

- **MVVM Pattern**  
  - **Model:** `WeatherResponse` represents the weather data returned by the API.  
  - **ViewModel:** `WeatherViewModel` handles fetching weather data using APIManager, where we decode the data obtained from HTTTP Client(which is the raw data) to a stuctured manner , managing UI state (loading, error messages), and exposing observable properties to the views.  
  - **View:** SwiftUI views present the weather information dynamically based on the state provided by the ViewModel.

- **Dependency Injection**  
  Both `APIManager` and `LocationHandler` are injected into the ViewModel. This allows for better modularity, easier updates, and flexibility to switch or mock services in the future.

- **Protocols & Abstraction**  
  - `LocationHandling` abstracts CoreLocation functionality.  
  - `APIManaging` abstracts API calls and network handling.  
  This makes the code modular, testable, and easy to maintain.

- **Swift Concurrency**  
  The app leverages `async/await` for network requests and location fetching, ensuring a responsive UI while performing background tasks efficiently.

- **Clean & Modular Code**  
  - Clear separation between UI, business logic, and data.  
  - Easy to read, maintain, and extend for future features.

---

## Technologies Used

- Swift   
- SwiftUI  
- CoreLocation  
- URLSession  
- MVVM architectural pattern  
- Swift Concurrency (`async/await`)  

---

## Setup Instructions

- **Clone the repository**  
  - git clone https://github.com/gokuldastk/WeatherApp.git
  - cd WeatherApp
 
- **Open the project in Xcode**
  - open WeatherApp.xcodeproj
 
- **Open the project in Xcode**
  - Open APIManager.swift and insert your API key for the weather service you are using.
 
- **Run the app**
  - Select a simulator or a real device (location access is required).
  - Press Run (⌘ + R) in Xcode.

---

## Assumptions & Limitations

- Assumes the user grants location permission; otherwise, weather cannot be fetched.
- Currently supports fetching weather only for the current location.
- The app fetches only current weather conditions; multi-day forecasts are not implemented.
- Network errors are displayed as a generic error message; detailed error handling may be added in future updates.
- The UI is designed for portrait orientation; landscape support is minimal.


---

## Author

**Gokul Das T K**  
iOS Developer | Swift & SwiftUI 
[GitHub](https://github.com/gokuldastk) | [LinkedIn](https://www.linkedin.com/in/gokul-das-b41b69227/)
