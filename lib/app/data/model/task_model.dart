class Task {
  String taskImage;
  String taskTitle;
  String taskDesc;
  String startTime;
  DateTime taskDate;
  bool isRepeat;

  Task({
    required this.taskImage,
    required this.taskTitle,
    required this.taskDesc,
    required this.startTime,
    required this.taskDate,
    required this.isRepeat,
  });

  Task.fromJson(Map<String, dynamic> json)
      : taskImage = json['taskImage'] ?? '',
        taskTitle = json['taskTitle'] ?? '',
        taskDesc = json['taskDesc'] ?? '',
        startTime = json['startTime'] ?? '',
        taskDate = DateTime.parse(json['taskDate'] ?? ''),
        isRepeat = json['isRepeat'] ?? false;

  Map<String, dynamic> toJson() => {
        'taskImage': taskImage,
        'taskTitle': taskTitle,
        'taskDesc': taskDesc,
        'startTime': startTime,
        'taskDate': taskDate,
        'isRepeat': isRepeat,
      };
}
