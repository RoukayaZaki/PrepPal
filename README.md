# PrepPal Telegram App Readme

## Overview
PrepPal is a Flutter application that allows users to explore and manage their favorite recipes. It utilizes the Soar Quest package, Spoonacular API, and Flutter's Material UI for a user-friendly and visually appealing recipe management experience.

## Getting Started
Follow these steps to get started with the PrepPal Flutter app:

### Prerequisites
- [Flutter](https://flutter.dev/docs/get-started/install) installed on your development machine.
- A compatible code editor (e.g., Visual Studio Code, Android Studio).

### Installation
1. Clone the PrepPal repository to your local machine:

   ```
   git clone https://github.com/RoukayaZaki/PrepPal.git
   ```

2. Navigate to the project directory

3. Install the required dependencies using Flutter's package manager:

   ```
   flutter pub get
   ```

4. Ensure that you have the necessary API keys and configurations set up for Spoonacular API. Refer to the `spoonacular_api.dart` file for API-related details.

5. Run the PrepPal app on an emulator or physical device:

   ```
   flutter run
   ```

### Usage
Once the app is running, you can explore and manage your favorite recipes using the following features:

- **Recipe Collection**: Search for recipes and add them, edit existing ones, or delete recipes.

- **Random Recipe**: Discover random recipes with the click of a button. The app fetches random recipes from the Spoonacular API and displays them for you.

- **Favorites**: Mark your favorite recipes and access them easily in the "Favorites" section.

## Structure
The PrepPal Flutter app is organized into several components:

- **main.dart**: The main entry point of the application. It initializes the app, sets up collections, and defines the app's theme.

- **spoonacular_api.dart**: Contains API-related functions and configurations for fetching recipe data from Spoonacular.

- **RokGalleryScreen**: A custom Flutter widget that displays a collection of recipes as cards. Each card represents a recipe with an image and title. Clicking on a card navigates to the recipe details screen.

## Demo
- [Video](https://photos.app.goo.gl/yrkdpr3JnRfwyerx7)
- [App](https://t.me/PrepPal_bot/PrepPal)


## Contributing
Contributions to the PrepPal Flutter app are welcome! If you would like to contribute to the project, please follow these guidelines:

1. Fork the repository and create a new branch for your feature or bug fix.

2. Make your changes, following best practices and maintaining code quality.

3. Write tests to ensure the functionality is working correctly.

4. Submit a pull request with a clear description of your changes and any relevant details.


## Contact
For any questions or issues related to the PrepPal Flutter app, you can contact me on telegram [@GammaV](https://t.me/GammaV).

Enjoy using PrepPal and happy cooking!