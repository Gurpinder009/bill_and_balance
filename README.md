# Bill & Balance

A personal accountability app that helps you organize your finances and tasks without becoming a burden.

![Flutter](https://img.shields.io/badge/Flutter-02569B?style=flat&logo=flutter&logoColor=white)
![SQLite](https://img.shields.io/badge/SQLite-003B57?style=flat&logo=sqlite&logoColor=white)
![BLoC](https://img.shields.io/badge/BLoC-Pattern-blue)

## 📱 What is Bill & Balance?

Bill & Balance is a local-first mobile app that combines financial tracking with task management to help you stay accountable to your commitments. It learns your patterns and helps you make better decisions about both time and money.

### Core Principle
**Minimum input, maximum insight** - The app does the thinking, you just capture the data.

## ✨ Features

### 💰 Financial Tracking
- **Receipt Management** - Snap photos and manually log transaction details
- **Smart Categorization** - Automatically organize expenses (Groceries, Utilities, Entertainment, etc.)
- **Spending Analytics** - See where your money goes with visual breakdowns
- **Savings Calculator** - Input salary and track net savings monthly
- **Shared Expenses** - Split bills and track who owes what
- **Payment Reminders** - Never miss credit card or bill due dates

### ✅ Task Management
- **Smart Workload Prediction** - Get warned when you're taking on too much
- **Progressive Check-ins** - App asks how tasks are going before deadlines
- **Honest Status Tracking** - Mark tasks as done, delayed, or abandoned
- **Performance Dashboard** - See your completion rate and patterns
- **Accountability Loop** - Learn why you fail to complete tasks

## 🎯 Why Bill & Balance?

Unlike other productivity apps:
- ✅ Works 100% offline (local-first architecture)
- ✅ No cloud dependencies or subscriptions
- ✅ Adapts to your behavior instead of overwhelming you
- ✅ Learns from your failures, not just successes
- ✅ Privacy-focused - your data stays on your device

## 🛠️ Tech Stack

- **Framework**: Flutter (Android, iOS coming soon)
- **State Management**: BLoC Pattern
- **Local Database**: SQLite
- **Charts/Visualizations**: Syncfusion Flutter Charts (Community License)
- **Notifications**: flutter_local_notifications
- **Storage**: Local filesystem for images

## 🚀 Getting Started

### Prerequisites
- Flutter SDK (3.0 or higher)
- Android Studio / VS Code
- Android device or emulator

### Installation

1. Clone the repository
```bash
git clone https://github.com/yourusername/bill-and-balance.git
cd bill-and-balance
```

2. Install dependencies
```bash
flutter pub get
```

3. Run the app
```bash
flutter run
```

## 📋 Development Roadmap

### ✅ Phase 1: Core Receipt Tracking (Week 1-2)
- Camera integration
- Manual entry form
- Basic list view

### ✅ Phase 2: Financial Insights (Week 3)
- Monthly spending summary
- Category breakdown
- Savings calculator

### 🚧 Phase 3: Basic Task Management (Week 4)
- Task creation and list view
- Mark complete
- Basic notifications

### 📅 Phase 4: Smart Workload Prediction (Week 5)
- Committed hours calculation
- Overcommit warnings

### 📅 Phase 5: Task Check-ins (Week 6)
- Status updates
- Progressive reminders

### 📅 Phase 6: Performance Dashboard (Week 7)
- Completion rate tracking
- Analytics and insights

### 📅 Phase 7: OCR Integration (Week 8)
- Auto-extract receipt data
- Google ML Kit integration

### 📅 Phase 8: Shared Expenses (Week 9)
- Split bill tracking
- Settlement management

## 🏗️ Project Structure

```
lib/
├── main.dart
├── blocs/
│   ├── receipt/
│   ├── task/
│   └── analytics/
├── models/
│   ├── receipt.dart
│   ├── task.dart
│   └── task_checkin.dart
├── repositories/
│   ├── receipt_repository.dart
│   └── task_repository.dart
├── services/
│   ├── database_helper.dart
│   ├── notification_service.dart
│   └── storage_service.dart
├── screens/
│   ├── receipts/
│   ├── tasks/
│   └── dashboard/
├── widgets/
└── utils/
```

## 🗃️ Database Schema

### Receipts
```sql
id, date, amount, category, merchant, notes, 
image_path, is_shared, shared_data, timestamps
```

### Tasks
```sql
id, title, description, deadline, estimated_hours, 
status, completed_at, completion_type, timestamps
```

### Task Check-ins
```sql
id, task_id, checkin_date, status_response, 
notes, timestamp
```

## 🎨 Design Principles

### User Experience
- **Frictionless Entry** - Quick capture over perfect data
- **Instant Value** - Show insights immediately
- **Adaptive Behavior** - App adjusts to user patterns
- **Easy Recovery** - Simple catch-up after breaks
- **Optional Complexity** - Lite mode available if needed

### Technical
- **Local-First** - All data stored on device
- **Privacy-Focused** - No data leaves your phone
- **Offline-Capable** - Works without internet
- **Performance** - Fast, responsive UI
- **Testable** - BLoC pattern enables comprehensive testing

## 📊 Success Metrics

**Personal Use Goals:**
- Week 4: Still using both modules regularly
- Week 8: Using 3+ times per week
- Month 3: Core habit established

**Feature Validation:**
- Receipt tracking: 80%+ of purchases logged
- Task management: 15+ tasks created per month
- Check-ins: 70%+ response rate
- Workload prediction: Prevents overcommit 50%+ of time

## 🔮 Future Enhancements

- Optional cloud backup (Supabase)
- Multi-device sync
- Time blocking and calendar integration
- Task dependencies
- Advanced analytics (spending vs productivity patterns)
- Export data (CSV, PDF)
- iOS version
- Failure pattern analysis
- Habit tracking integration

## 🤝 Contributing

This is a personal project built for self-improvement and skill development. However, if you find it useful and want to contribute:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- Built with Flutter and the amazing Flutter community
- Charts powered by Syncfusion Flutter Charts
- Inspired by the need for honest self-accountability

## 📬 Contact

Questions or feedback? Open an issue or reach out!

---

**Remember**: The goal isn't perfection—it's progress. If you're still using this app after 3 months, it's a success. 🎯