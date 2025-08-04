class ApiModel {
  final int id;
  final String advice;

  ApiModel({required this.id, required this.advice});

  factory ApiModel.fromJson(Map<String, dynamic> json) {
    return ApiModel(id: json['slip']['id'], advice: json['slip']['advice']);
  }
}


