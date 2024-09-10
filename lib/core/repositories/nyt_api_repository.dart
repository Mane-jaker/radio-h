import 'package:radio_head/core/models/nyt_respons.dart';
import 'package:radio_head/core/services/nyt_api_service.dart';

class NYTApiRepository {
  final NYTApiService _nytApiService = NYTApiService();

  Future<NYTResponse> getNews() async {
    final data = await _nytApiService.getNews();
    return NYTResponse.fromJson(data);
  }
}
