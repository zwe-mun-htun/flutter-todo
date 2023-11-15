# todo_app

A new Flutter project.

## Getting Started

#### 1. Clone and Install

```bash
# Clone the repo
git clone https://github.com/zwe-mun-htun/task-app.git

# Navigate to clonned folder and Install dependencies
cd task_app && flutter packages get
```

#### 2. Run
```bash

# For IOS
cd ios && -rm-rf Podfile.lock

#Reinstall the cocapods
pod install

# Run the app
flutter run
```

## Directory Structure
```
📂android
📂ios
📂lib
 │───main.dart  
 └───📂src
     └─── 📂config
     |    │────📂routes
     |    └────📂utils
     └────📂data
     |    │────📂models
     └────📂domain
     |    │────📂entities
     └────📂presentations
     |    │────📂values
     |    │────📂views
     |    └────📂widgets

```

## Dependencies
Package Name        |
:-------------------------|
|[GetX](https://pub.dev/packages/get) 
|[iconsax](https://pub.dev/packages/iconsax)
|[dropdown_search](https://pub.dev/packages/dropdown_search)

others in pubspec.yaml
<br/>
