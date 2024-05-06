import 'package:better_u/models/objects/program.dart';

class AllPrograms {
  final List<WorkoutProgram> programs = [
    WorkoutProgram( 
      id: 1,
      coverImage: "assets/workout-programs/top-picks-sample1.jpg", 
      days: 5, 
      interval: "30-45", 
      title: "2024 Weight Loss Challenge", 
      desc: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
      workouts: [ // id video is already completed (1) or not (0)
        [1, 2],
        [3, 1],
        0,
        [2, 4],
        [1, 4]
      ],
      hard: true
    ),
    WorkoutProgram( 
      id: 2,
      coverImage: "assets/workout-programs/top-picks-sample2.jpg", 
      days: 5, 
      interval: "20-40", 
      title: "Beginner Abs Challenge", 
      desc: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor inciddunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
      workouts: [ // id video is already completed (1) or not (0)
        [1, 2],
        [3, 1],
        0,
        [2, 4],
        [1, 4]
      ]
    ),
    WorkoutProgram( 
      id: 3,
      coverImage: "assets/workout-programs/top-picks-sample3.jpg", 
      days: 5, 
      interval: "35-45", 
      title: "Flat Belly Challenge", 
      desc: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
      workouts: [ // id video is already completed (1) or not (0)
        [1, 2],
        [3, 1],
        0,
        [2, 4],
        [1, 4]
      ]
    ),
    WorkoutProgram( 
      id: 4,
      coverImage: "assets/workout-programs/top-picks-sample4.jpg", 
      days: 5, 
      interval: "15-30", 
      title: "Strong Arms Challenge", 
      desc: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
      workouts: [ // id video is already completed (1) or not (0)
        [1, 2],
        [3, 1],
        0,
        [2, 4],
        [1, 4]
      ]
    ),
    WorkoutProgram( 
      id: 5,
      coverImage: "assets/workout-programs/top-picks-sample5.webp", 
      days: 5, 
      interval: "50-60", 
      title: "Upper Back Advanced Challenge", 
      desc: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
      workouts: [ // id video is already completed (1) or not (0)
        [1, 2],
        [3, 1],
        0,
        [2, 4],
        [1, 4]
      ],
      hard: true
    ),
    WorkoutProgram( 
      id: 6,
      coverImage: "assets/workout-programs/top-picks-sample6.webp", 
      days: 5, 
      interval: "30-45", 
      title: "Yoga Stretch for Back Pain", 
      desc: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
      workouts: [ // id video is already completed (1) or not (0)
        [1, 2],
        [3, 1],
        0,
        [2, 4],
        [1, 4]
      ]
    ),
    WorkoutProgram(
      id: 7, 
      coverImage: "assets/workout-programs/top-picks-sample7.jpg", 
      days: 5, 
      interval: "30-45", 
      title: "Plank Workout for Beginners", 
      desc: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
      workouts: [ // id video is already completed (1) or not (0)
        [1, 2],
        [3, 1],
        0,
        [2, 4],
        [1, 4]
      ]
    ),
    WorkoutProgram( 
      id: 8,
      coverImage: "assets/workout-programs/top-picks-sample8.jpg", 
      days: 5, 
      interval: "30-45", 
      title: "Hip Dips Workout Challenge", 
      desc: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
      workouts: [ // video id is already completed (1) or not (0)
        [1, 2],
        [3, 1],
        0,
        [2, 4],
        [1, 4]
      ],
      hard: true
    ),
  ];

  void markAsCompleted(int programId, int day, int videoId){
    programs[programId - 1].workouts[day-1][videoId] = !programs[programId - 1].workouts[day-1][videoId]; 
  }
}