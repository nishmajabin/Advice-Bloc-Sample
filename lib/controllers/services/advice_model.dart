class AdviceModel {
  final int id;
  final String advice;

  AdviceModel({required this.id, required this.advice});

  factory AdviceModel.fromJson(Map<String, dynamic> json) {
    return AdviceModel(id: json['slip']['id'], advice: json['slip']['advice']);
  }
}


