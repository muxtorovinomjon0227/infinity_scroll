import 'package:dio/dio.dart';
import 'package:task_infinity_scroll/model/pagination_model.dart';

import '../model/card_model.dart';
import 'card_service_interface.dart';


class CardService extends CardServiceInterface {
  late  Dio _dio;
 CardService() {
    _dio = Dio();
  }

  @override
  Future<List<CardModel>> fetchCards(PaginationModel paginate) async {
    var queryParameters = {"page": paginate.page, "limit": paginate.limit};
    try {
      var response = await _dio.get(
        'https://picsum.photos/v2/list',
        queryParameters: queryParameters,
      );

      return response.data.map((e) => CardModel.fromJson(e)).toList().cast<CardModel>() as List<CardModel>;
    } catch (e) {
      return [];
    }
  }
}
