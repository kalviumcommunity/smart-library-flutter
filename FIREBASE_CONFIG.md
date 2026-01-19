# Firestore Schema & Security Rules

## Firestore Schema

### Collection: `users`
*   `uid` (String, document ID)
*   `email` (String)
*   `createdAt` (Timestamp)

### Collection: `books_demo`
*   `title` (String)
*   `author` (String)
*   `imageUrl` (String, nullable)
*   `createdAt` (Timestamp)

## Security Rules

```javascript
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    // Only authenticated users can read/write books
    match /books_demo/{bookId} {
      allow read, write: if request.auth != null;
    }
    
    // Users can only read/write their own profiles
    match /users/{userId} {
      allow read, write: if request.auth != null && request.auth.uid == userId;
    }
  }
}
```

## Firebase Storage Rules

```javascript
rules_version = '2';
service firebase.storage {
  match /b/{bucket}/o {
    match /book_covers/{allPaths=**} {
      // Only authenticated users can upload book covers
      allow read, write: if request.auth != null;
    }
  }
}
```
