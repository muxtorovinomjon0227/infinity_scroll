import 'package:flutter/material.dart';

import '../model/card_model.dart';
import '../viewmodel/cards_view_model.dart';

class CardItemView extends StatelessWidget {
  final CardModel? card;

   CardItemView({Key? key, this.card}) : super(key: key);
  late CardsViewModel _vm;


  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 24.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 5,
      child: Column(
        children: [_buildImageItem, _buildDescriptionItem],
      ),
    );
  }

  ListTile get _buildDescriptionItem {
    return ListTile(
      title: Text(card!.author.toString()),
      subtitle: Text('H=${card!.height} / W=${card!.width}'),
      trailing: IconButton(
        icon: const Icon(Icons.favorite_border),
        onPressed: () {
          print(card!.id);
        },
      ),
    );
  }

  SizedBox get _buildImageItem {
    return SizedBox(
      height: 150,
      width: double.infinity,
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
        child: Image.network(
          card!.downloadUrl.toString(),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
