import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:task_infinity_scroll/viewmodel/cards_view_model.dart';

import 'card_item_view.dart';

class CardsView extends StatefulWidget {
  const CardsView({Key? key}) : super(key: key);

  @override
  _CardsViewState createState() => _CardsViewState();
}

class _CardsViewState extends State<CardsView> {
  late CardsViewModel _vm;

  @override
  void initState() {
    _vm = CardsViewModel();
    _vm.init();
    _vm.fetchCards();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cards infinity scroll'),
      ),
      body: Observer(builder: (_) {
        if (_vm.cards.isEmpty) {
          return _buildLoading;
        }

        return ListView.builder(
          padding: const EdgeInsets.all(16.0),
          itemCount: _vm.cards.length + 1,
          itemBuilder: (context, index) {
            if (index == _vm.cards.length ) {
              _vm.fetchCards();
              return _buildLoading;
            }

            return CardItemView(card: _vm.cards[index]);
          },
        );
      }),
    );
  }

  Center get _buildLoading {
    return const Center(
      child: SizedBox(
        width: 20,
          height: 20,
          child: CircularProgressIndicator(
              strokeWidth: 2,
          )),
    );
  }
}
