import 'dart:convert';

import 'package:advice_app_bloc_sample/controllers/services/advice_model.dart';
import 'package:http/http.dart' as http;

Future<AdviceModel> fetchAdvice() async {
  try {
    final adviceUrl = Uri.parse('https://api.adviceslip.com/advice');
    final response = await http.get(adviceUrl);

    if (response.statusCode == 200) {
      final Map<String, dynamic> decodeData = jsonDecode(response.body);
      return AdviceModel.fromJson(decodeData);
    }else{
      throw Exception('Failed to load Advice!');
    }
  } catch (e) {
    throw Exception('Error fetching advice: $e');
  }
}
