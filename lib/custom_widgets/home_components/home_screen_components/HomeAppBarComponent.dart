import 'package:flutter/material.dart';
import 'package:pa_bank_app/screens/home_screens/add_new_card_screen.dart';

class HomeAppBarComponent extends StatelessWidget {
  const HomeAppBarComponent({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      bottomOpacity: 0.0,
      elevation: 0.0,
      title: IconButton(
        icon: const Icon(Icons.apps_outlined),
        tooltip: '-',
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddNewCardScreen()),
          );
        },
      ),
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.search_outlined),
          tooltip: 'Ara',
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Arama yapılıyor.')));
          },
        ),
        IconButton(
          icon: const Icon(Icons.exit_to_app_outlined),
          tooltip: 'Çıkış',
          onPressed: () {
            ScaffoldMessenger.of(context)
                .showSnackBar(const SnackBar(content: Text('Çıkış Yapıldı.')));
          },
        ),
      ],
    );
  }
}
/*appBar: AppBar(
        bottomOpacity: 0.0,
        elevation: 0.0,
        title: IconButton(
          icon: const Icon(Icons.apps_outlined),
          tooltip: '-',
          onPressed: () {},
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search_outlined),
            tooltip: 'Ara',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Arama yapılıyor.')));
            },
          ),
          IconButton(
            icon: const Icon(Icons.exit_to_app_outlined),
            tooltip: 'Çıkış',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Çıkış Yapıldı.')));
            },
          ),
        ],
      ),*/
