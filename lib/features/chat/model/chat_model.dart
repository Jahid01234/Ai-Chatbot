class ChatModel {
  final int? id;
  final String message;
  final String sender;
  final String time;


  ChatModel({
    this.id,
    required this.message,
    required this.sender,
    required this.time,
  });


  factory ChatModel.fromMap(Map<String, dynamic> json) => ChatModel(
    id: json['id'],
    message: json['message'],
    sender: json['sender'],
    time: json['time'],
  );

  Map<String, dynamic> toMap() => {
    "message": message,
    "sender": sender,
    "time": time,
  };
}
