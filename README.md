# E-commerce Admin in Flutter

This is a Flutter-based e-commerce admin application that allows you to manage products, view product details, and edit dashboard features. It utilizes Firebase for backend services and Bloc for state management.

## Features

- **Add Products**: Easily add new products with details like name, description, price, and images.
- **View Products**: Display a list of all available products with their details.
- **Edit Products**: Update product information, including name, price, and images.
- **Dashboard**: A centralized view to manage and monitor e-commerce data.

---

## Getting Started

Follow these steps to set up and run the application.

### Prerequisites

Make sure you have the following installed:

- Flutter SDK (version 3.0 or higher)
- Dart SDK
- Firebase CLI (for Firebase setup)
- A Google Firebase project

### Installation

1. **Clone the Repository**
   ```bash
   git clone <repository_url>
   cd ecommerce_admin_flutter
   ```

2. **Install Dependencies**
   Run the following command to install the required packages:
   ```bash
   flutter pub get
   ```

3. **Setup Firebase**
   - Create a Firebase project at [Firebase Console](https://console.firebase.google.com/).
   - Download and place the `google-services.json` file (for Android) in the `android/app` directory.
   - Download and place the `GoogleService-Info.plist` file (for iOS) in the `ios/Runner` directory.
   - Ensure you enable the following Firebase services:
     - Authentication
     - Firestore Database

4. **Run the App**
   Execute the following command to launch the application:
   ```bash
   flutter run
   ```

---

## Project Structure

```plaintext
lib/
├── main.dart          # Entry point of the application
├── screens/           # Contains all the UI screens
│   ├── add_product.dart
│   ├── edit_product.dart
│   ├── product_list.dart
│   ├── dashboard.dart
├── blocs/             # Bloc files for state management
│   ├── product_bloc.dart
│   ├── dashboard_bloc.dart
├── models/            # Data models for products, users, etc.
├── services/          # Firebase services for authentication and database
├── widgets/           # Custom reusable widgets
```

---

## Dependencies

The following dependencies are used in this project:

| Dependency        | Version   | Purpose                                      |
|-------------------|-----------|----------------------------------------------|
| `firebase_core`   | ^2.0.0    | Core Firebase functionality                  |
| `firebase_auth`   | ^4.1.0    | Firebase Authentication for user management |
| `cloud_firestore` | ^5.0.0    | Firestore database integration               |
| `bloc`            | ^8.1.0    | State management using Bloc pattern          |
| `flutter_bloc`    | ^8.1.0    | Flutter bindings for Bloc                    |
| `cupertino_icons` | ^1.0.2    | iOS style icons                              |

---

## How to Use

### Adding a Product
1. Navigate to the "Add Product" screen from the dashboard.
2. Fill in the product details such as name, price, description, and upload images.
3. Click on the "Save" button to add the product to the database.

### Viewing Products
- Open the "Product List" screen to view all the available products.
- Each product is displayed with its name, price, and a preview image.

### Editing a Product
1. From the product list, select the product you want to edit.
2. Update the necessary fields and click "Save Changes."

---

## Firebase Configuration

### Authentication
- Enable Email/Password authentication in your Firebase project settings.

### Firestore Rules
Set the following Firestore rules for secure access:
```json
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    match /products/{productId} {
      allow read, write: if request.auth != null;
    }
  }
}
```

---

## Screenshots

Add screenshots of the application here to visually represent the UI.

---

## Contributing

Contributions are welcome! If you have ideas for new features or improvements:

1. Fork the repository.
2. Create a new branch: `git checkout -b feature-name`
3. Commit your changes: `git commit -m 'Add feature-name'`
4. Push to the branch: `git push origin feature-name`
5. Submit a pull request.

---

## License

This project is licensed under the MIT License. See the LICENSE file for details.

---

## Support

If you encounter any issues or have questions, feel free to open an issue or reach out to the maintainers.

