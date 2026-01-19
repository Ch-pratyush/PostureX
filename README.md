# PostureX - AI-Powered Real-Time Posture Tracking

A hackathon-ready demo application for real-time posture analysis and correction during workouts and yoga sessions. Built with React, React Native, and AI/ML technologies.

## 🎯 Quick Start

### Prerequisites
- Node.js 16+ and npm
- Camera access (browser or mobile device)
- For web: Modern browser with WebGL support
- For mobile: iOS or Android device with Expo

### Web App Setup

```bash
cd web
npm install
npm start
```

The app will open at `http://localhost:3000`

### Mobile App Setup

```bash
cd mobile
npm install
npx expo start
# Press 'a' for Android or 'i' for iOS
```

## 📋 Features

### Core Functionality
✅ **Real-Time Posture Analysis**
- Live camera feed with skeleton overlay
- Frame-by-frame pose estimation using MediaPipe
- 30+ FPS real-time performance

✅ **Intelligent Scoring System**
- Rule-based angle calculations (knees, hips, back, elbows)
- Posture score from 0-100
- Explainable AI feedback showing which joints need correction

✅ **Exercise Library**
- 5 pre-built exercises: Squat, Push-Up, Plank, Tree Pose, Lunge
- Custom routine builder
- Exercise-specific posture analysis

✅ **Progress Tracking Dashboard**
- Session history with scores and duration
- Trend graphs showing improvement over time
- Exercise-wise performance comparison
- Local data persistence

✅ **Live Feedback System**
- Real-time posture suggestions
- Top 3 corrections per frame
- Color-coded score indicator (green/yellow/red)

## 🏗️ Project Structure

```
PostureX/
├── web/                          # React web application
│   ├── src/
│   │   ├── components/           # Reusable UI components
│   │   │   ├── Navbar.jsx
│   │   │   ├── CameraFeed.jsx
│   │   │   ├── PostureScoreCard.jsx
│   │   │   ├── ExerciseCard.jsx
│   │   │   └── SessionStats.jsx
│   │   ├── pages/                # Page components
│   │   │   ├── Home.jsx
│   │   │   ├── PoseAnalyzer.jsx (Main feature)
│   │   │   ├── ExerciseSelector.jsx
│   │   │   └── Dashboard.jsx
│   │   ├── services/             # Firebase & backend
│   │   │   ├── firebase.js
│   │   │   └── firestoreService.js
│   │   ├── utils/                # AI/ML logic
│   │   │   ├── poseEstimation.js
│   │   │   ├── postureAnalyzer.js
│   │   │   └── exercises.js
│   │   ├── App.jsx
│   │   └── index.jsx
│   ├── public/
│   ├── package.json
│   ├── tailwind.config.js
│   └── .env.example
│
├── mobile/                       # React Native app (Expo)
│   ├── src/
│   │   └── screens/
│   │       ├── HomeScreen.js
│   │       ├── AnalyzerScreen.js
│   │       └── DashboardScreen.js
│   ├── App.js
│   ├── babel.config.js
│   └── package.json
│
├── backend/                      # Cloud Functions & APIs
│   └── [Firebase Cloud Functions]
│
├── docs/                         # Documentation
├── .gitignore
└── README.md
```

## 🧠 AI/ML Architecture

### Pose Estimation
- **Model**: Google's MoveNet (SinglePose Thunder)
- **Framework**: TensorFlow.js
- **Output**: 17 body keypoints with confidence scores
- **Performance**: ~30 FPS on modern browsers

### Posture Scoring
The system uses **rule-based angle analysis**:

1. **Joint Angle Calculation**
   - Calculate angles between connected joints
   - Example: Knee angle = angle(hip, knee, ankle)

2. **Threshold Comparison**
   - Compare calculated angles with ideal ranges
   - Penalize deviations from proper form

3. **Feedback Generation**
   - Identify which joints are out of position
   - Generate actionable correction suggestions
   - Return score (0-100) based on overall alignment

### Exercise-Specific Analysis

**Squat**
- Knee angle: 60-90° (deeper = better, not too deep)
- Knee-ankle alignment: <30px horizontal deviation
- Back angle: Should align with hips

**Push-Up**
- Elbow angle: 40-90° at lowest point
- Body alignment: Straight line from head to heels
- Back angle: No sagging or arching

**Plank**
- Spine alignment: 180° angle (straight line)
- Hip position: Must not sag (<30px below knee level)
- Shoulder stability: Over wrist position

**Tree Pose (Yoga)**
- Hip balance: Both hips level (<30px diff)
- Upright posture: Shoulder-hip vertical distance >80px
- Standing leg stability

**Lunge**
- Front knee: 90° angle
- Knee-ankle alignment: <40px horizontal deviation
- Front leg depth: Proper 90° position

## 🎨 UI/UX Features

- **Modern Dark Theme**: Eye-friendly interface optimized for gym lighting
- **Real-Time Feedback**: Instant visual and text feedback
- **Responsive Design**: Works on desktop, tablet, and mobile
- **Performance Metrics**: Live FPS, frame count, and session duration
- **Progress Visualization**: Charts and graphs for trend analysis

## 📊 Data Persistence

### Web App
- **Local Storage**: Session history stored in browser
- **Firebase** (Optional): User auth, cloud sync
- **Structure**: 
  ```javascript
  {
    id: "session-123",
    exercise: "squat",
    score: 85,
    duration: 45,
    timestamp: "2024-01-16T10:30:00Z",
    feedback: ["Align knees with ankles"],
    frameCount: 1200
  }
  ```

### Mobile App
- **AsyncStorage**: Persistent local data on device
- **Same data structure** for cross-platform compatibility

## 🔐 Privacy & Safety

- ✅ **No cloud upload by default** - All processing happens locally
- ✅ **No personal data collection** - Camera feed is not stored
- ✅ **Open source** - Full transparency on what runs on your device
- ⚠️ **Not a medical device** - Guidance-only fitness tool

## 🚀 Demo Walkthrough

### 1. Home Page
- Explains the app and its benefits
- Shows 3 key features with icons
- Large "Start Analysis" CTA button
- Safety disclaimer

### 2. Exercise Selector
- Browse 5 available exercises
- View tips and difficulty levels
- Create custom routines
- Save routines locally

### 3. Pose Analyzer (Main Feature)
- **Camera Setup**: Automatic camera request and initialization
- **Live Feed**: Real-time video with skeleton overlay
- **Exercise Selection**: Quick buttons to switch between exercises
- **Score Display**: Large circular indicator (0-100)
- **Feedback Panel**: Top 3 real-time suggestions
- **Stats**: Frame count, FPS, duration
- **Controls**: Start/Stop buttons, link to Dashboard

### 4. Dashboard
- **Overview Stats**: Total sessions, average score, best score
- **Trend Graph**: Line chart showing score progression
- **Exercise Comparison**: Bar chart of average scores per exercise
- **Recent Sessions**: List of last 5 sessions with scores
- **Empty State**: Helpful CTA when no data yet

## 🛠️ Technical Stack

### Frontend
- **React 18** - UI framework
- **Tailwind CSS** - Styling
- **React Router** - Navigation
- **Recharts** - Data visualization

### AI/ML
- **TensorFlow.js** - JavaScript ML runtime
- **Google MoveNet** - Pose estimation model
- **Custom postureAnalyzer.js** - Rule-based scoring

### Mobile
- **React Native** - Cross-platform framework
- **Expo** - Quick development and deployment
- **expo-camera** - Camera access

### Backend (Optional)
- **Firebase Authentication** - User login
- **Firestore** - Cloud database
- **Cloud Functions** - Serverless API

### Deployment
- **Web**: Vercel, Netlify, Firebase Hosting
- **Mobile**: Expo Go app or EAS Build

## 📝 Configuration

### Firebase Setup (Optional)

1. Create a Firebase project: https://firebase.google.com
2. Copy your config from Firebase Console
3. Create `.env.local` in the `web/` folder:

```env
REACT_APP_FIREBASE_API_KEY=your_api_key
REACT_APP_FIREBASE_AUTH_DOMAIN=your_auth_domain
REACT_APP_FIREBASE_PROJECT_ID=your_project_id
REACT_APP_FIREBASE_STORAGE_BUCKET=your_storage_bucket
REACT_APP_FIREBASE_MESSAGING_SENDER_ID=your_sender_id
REACT_APP_FIREBASE_APP_ID=your_app_id
```

The app works without Firebase - it will use localStorage instead.

## 🎯 Performance Optimizations

- ✅ **WebGL backend**: Accelerated TensorFlow.js
- ✅ **RequestAnimationFrame**: Smooth 30 FPS rendering
- ✅ **Local inference**: No API calls during analysis
- ✅ **Lazy loading**: Components and models loaded on demand
- ✅ **Memory management**: Proper cleanup of video streams and models

## 🧪 Testing Guide

### Camera Access
1. Allow camera permission when prompted
2. Position yourself in good lighting, full body visible
3. Face the camera at arm's length distance

### Posture Analysis
1. Select an exercise from the list
2. Click "Start Analysis"
3. Perform the exercise slowly and deliberately
4. Watch the score update frame-by-frame
5. Check feedback suggestions in real-time

### Data Persistence
1. Complete a session with good posture (>80 score)
2. View it immediately in the Dashboard
3. Close browser/app and reopen
4. Data should still be visible (local storage works)

## 🐛 Troubleshooting

### Camera Not Working
- Check browser permissions: Settings > Privacy > Camera
- Try a different browser (Chrome/Firefox work best)
- Allow HTTP (not required for HTTPS)

### Low FPS
- Reduce browser window size
- Close other tabs
- Disable browser extensions
- Use Chrome instead of Firefox

### No Feedback
- Ensure entire body is visible in frame
- Keep proper lighting
- Move closer to camera
- Try different exercise

### Data Not Saving
- Check if AsyncStorage/localStorage is enabled
- Clear browser cache if corrupted
- Mobile: Ensure app has storage permissions

## 📚 Code Examples

### Calculating Posture Score

```javascript
// From src/utils/postureAnalyzer.js
const analysis = analyzePosture(keypoints, 'squat');
console.log(analysis);
// Output:
// {
//   score: 85,
//   feedback: [
//     "Go deeper into your squat",
//     "Keep knees aligned with ankles"
//   ],
//   details: {
//     leftKneeAngle: 75,
//     kneeAlignment: 25
//   }
// }
```

### Starting Pose Detection

```javascript
// From src/pages/PoseAnalyzer.jsx
const poses = await estimatePoses(videoElement);
drawPose(ctx, poses[0].keypoints);
```

### Saving a Session

```javascript
// From src/services/firestoreService.js
await savePoseSession(
  userId,
  'squat',
  85,
  ['Go deeper', 'Align knees'],
  45  // seconds
);
```

## 🔄 Development Workflow

### Adding a New Exercise

1. Add to `src/utils/exercises.js`:
```javascript
export const EXERCISES = {
  'new-exercise': {
    id: 'new-exercise',
    name: 'New Exercise',
    // ... config
  }
}
```

2. Add analysis function in `src/utils/postureAnalyzer.js`:
```javascript
const analyzeNewExercise = (keypoints, feedback, details, score) => {
  // Implement joint angle checks
  // Update feedback array and score
};
```

3. Call it from `analyzePosture()`:
```javascript
if (exercise === 'new-exercise') {
  analyzeNewExercise(keypoints, feedback, details, score);
}
```

### Adding Real TensorFlow Model

Replace `postureAnalyzer.js` logic with a TensorFlow model:

```javascript
const model = await tf.loadGraphModel('model_url');
const predictions = await model.predict(inputTensor);
```

## 📄 License

This project is open-source and available for hackathon use.

## 🤝 Contributing

Contributions welcome! Please:
1. Fork the repository
2. Create a feature branch
3. Submit a pull request with clear descriptions

## 💡 Future Enhancements

- [ ] Real-time 3D pose visualization
- [ ] Multi-person detection
- [ ] Custom TensorFlow model for better accuracy
- [ ] Voice feedback
- [ ] Workout plan integration
- [ ] Social sharing of achievements
- [ ] AR overlay on mobile
- [ ] Wearable device integration

## 📞 Support

For issues or questions:
1. Check the Troubleshooting section
2. Review code comments in the utils folder
3. Check browser console for error messages

---

**Made with ❤️ for fitness enthusiasts everywhere**
