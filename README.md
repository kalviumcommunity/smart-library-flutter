# Smart Library - Flutter App 📚✨

A modern and user-friendly **Public Library Management App** built with **Flutter**, featuring a **responsive and adaptive UI** that works seamlessly across mobile phones, tablets, and different screen orientations.

The app is designed to replace manual library registers with a digital system for **book discovery, reservations, and real-time status tracking**, while ensuring consistent layout behavior on all screen sizes.

---

## 🚀 Problem Statement

Public libraries frequently rely on manual registers for book availability and borrowing, limiting accessibility for readers.
This app modernizes the library experience by enabling:

* Easy book discovery
* Online reservations
* Borrowing status tracking
* User-friendly digital access for readers

---

## 🎯 Key Features

✅ Book Discovery (Search + Browse)
✅ Book Details View (Author, Category, Availability)
✅ Reserve Books Online
✅ Track Borrowing Status (Borrowed / Reserved / Available)
✅ User Profile & Borrow History *(optional)*
✅ Admin Book Management *(optional)*

---

## 🛠 Tech Stack

* **Flutter** (UI + App Logic)
* **Dart**
* **Firebase / Supabase / Local Storage** *(based on implementation)*

---

## 📐 Responsive Layout Overview

The Smart Library app uses **Flutter’s responsive design principles** to adapt layouts dynamically based on:

* Screen width and height
* Device type (phone vs tablet)
* Orientation (portrait vs landscape)

The UI automatically switches between **single-column layouts on phones** and **grid-based layouts on tablets or landscape mode**, ensuring readability and usability across platforms.

---

## 🧩 Responsive Implementation (Code Examples)

### Using MediaQuery

```dart
double screenWidth = MediaQuery.of(context).size.width;
double screenHeight = MediaQuery.of(context).size.height;

bool isTablet = screenWidth > 600;
bool isLandscape = screenWidth > screenHeight;
```

This logic allows the app to:

* Adjust padding and spacing dynamically
* Switch layouts based on device size
* Maintain visual consistency across orientations

---

### Adaptive Layout Switching

```dart
isTablet || isLandscape
  ? GridView.count(
      crossAxisCount: isTablet ? 2 : 1,
    )
  : ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) => BookCard(),
    );
```

* **GridView** is used for tablets and landscape mode
* **ListView** is used for smaller phone screens

---

### Flexible & Adaptive Widgets Used

* `Expanded` and `Flexible` to prevent overflow
* `AspectRatio` to maintain card proportions
* `FittedBox` to scale text gracefully
* `GridView` and `ListView` for adaptive layouts

---

## 📸 Screenshots

Below are screenshots demonstrating the responsive behavior of the Smart Library app across devices and orientations:

* **Phone – Portrait**
  [https://drive.google.com/file/d/1AtRhsiapXN5379MVPFqrbxuk5oH4AUpg/view?usp=sharing](https://drive.google.com/file/d/1AtRhsiapXN5379MVPFqrbxuk5oH4AUpg/view?usp=sharing)

* **Phone / Tablet – Landscape**
  [https://drive.google.com/file/d/1esWQhNODuAOMzm8Z-OoBJdHxcjSq09HZ/view?usp=sharing](https://drive.google.com/file/d/1esWQhNODuAOMzm8Z-OoBJdHxcjSq09HZ/view?usp=sharing)

These screenshots validate:

* Layout adaptation using MediaQuery
* Grid/List switching based on screen width
* Consistent spacing and alignment across orientations

---

📐 Responsive & Adaptive UI Design (Flutter)

To ensure the Smart Library app remains visually consistent across different screen sizes while preserving the original Figma design intent, Flutter’s responsive layout widgets were used strategically instead of fixed dimensions.

🧩 Flexible & Expanded

Used in: Book cards, list rows, action buttons, and profile sections

These widgets allow UI elements to share available space proportionally within Row and Column layouts.

Prevents overflow issues on smaller screens while maintaining balanced spacing on larger devices.

Why this matters:
The Figma design specifies relative spacing rather than fixed pixel values. Flexible and Expanded translate this intent directly into Flutter by letting elements resize naturally.

📱 MediaQuery

Used for: Padding, font scaling, card sizes, and responsive spacing

Screen dimensions are dynamically accessed using:

MediaQuery.of(context).size


Enables adaptive UI behavior for:

Mobile phones

Tablets

Different aspect ratios

Example use cases:

Adjusting grid column count

Scaling typography without breaking layout

Maintaining consistent margins across devices

Why this matters:
Figma frames vary in size. MediaQuery ensures that UI proportions remain visually aligned with the design regardless of device resolution.

🧠 LayoutBuilder

Used for: Adaptive layouts in book lists, dashboards, and detail pages

Determines layout behavior based on available width constraints, not just screen size.

Adaptive logic example:

Small width → List layout

Medium width → Two-column grid

Large width → Expanded grid layout

Why this matters:
This approach keeps the UI future-proof for tablets and web screens while staying faithful to the original mobile-first Figma layout.

🎨 Design Consistency with Figma

To preserve the original design:

Spacing values were derived as percentages, not absolute pixels

Text styles were mapped directly from Figma typography scales

Consistent use of ThemeData for colors and fonts

No hard-coded widths unless strictly necessary

✅ Result

By combining Flexible, Expanded, MediaQuery, and LayoutBuilder, the app:

Adapts smoothly across screen sizes

Avoids UI breakage and overflow

Maintains Figma design proportions

Delivers a consistent, modern user experience



## 📱 App Screens (Planned)
- Splash Screen  
- Login / Register  
- Home (Books List)  
- Search Books  
- Book Details  
- Reserve Book  
- My Reservations  
- Borrowing Status Tracker  
- Profile  

---

## 📂 Project Structure

```bash
lib/
 ├── main.dart
 ├── core/
 ├── models/
 ├── services/
 ├── screens/
 │    └── responsive_home.dart
 ├── widgets/
 └── utils/
```

---

## 🧠 Reflection

### Challenges Faced

* Designing layouts that work consistently across vastly different screen sizes
* Preventing text overflow and widget clipping in landscape mode
* Maintaining visual balance between compact and expanded layouts

### How Responsive Design Improves UX

* Ensures accessibility on phones, tablets, and desktops
* Provides better readability and spacing
* Enhances usability without requiring separate codebases per platform
* Delivers a consistent user experience across orientations and devices

---

## ✅ Conclusion

The Smart Library app demonstrates how **responsive UI design in Flutter** can deliver a scalable, performant, and user-friendly application suitable for real-world deployment across multiple platforms.


## Responsive Home Screen

This screen adapts seamlessly across phones and tablets using MediaQuery and LayoutBuilder.

### Responsive Techniques Used
```dart
final isTablet = MediaQuery.of(context).size.width >= 600;

LayoutBuilder(
  builder: (context, constraints) {
    return isTablet ? GridView(...) : ListView(...);
  },
)
