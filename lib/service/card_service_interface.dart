import '../model/card_model.dart';
import '../model/pagination_model.dart';

abstract class CardServiceInterface {
  Future<List<CardModel>> fetchCards(PaginationModel paginate);
}
