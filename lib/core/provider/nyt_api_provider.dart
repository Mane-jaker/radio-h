
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../repositories/nyt_api_repository.dart';

final nytApiRepositoryProvider = Provider<NYTApiRepository>((ref) {
  return NYTApiRepository();
});