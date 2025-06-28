import 'package:flutter/material.dart';
import 'package:news/sources/view/categories.dart';
import 'package:news/sources/view/category_details.dart';
import 'package:news/sources/data/category_model.dart';
import 'package:news/screens/news_search_delegate.dart';
import 'package:news/screens/settings/settings.dart';

import '../common/assets_manage.dart';
import '../common/custom_Drawer.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  DrawerItem drawerSelected = DrawerItem.categories;
  CategoryModel? selectedCat;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
              image: AssetImage(AssetsManager.pattern), fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
            title: selectedCat != null
                ? Text(selectedCat!.title)
                : drawerSelected == DrawerItem.settings
                    ? const Text('Settings')
                    : const Text('News App'),
            actions: [
              IconButton(
                  onPressed: () {
                    showSearch(context: context, delegate: NewsSearchDelegate());
                  },
                  icon: Icon(
                    Icons.search,
                    color: Colors.white,
                  ))
            ]),
        drawer: CustomDrawer(
          selected: (value) {
            drawerSelected = value;
            selectedCat = null;
            setState(() {});
          },
        ),
        body: selectedCat != null
            ? CategoryDetailsView(id: selectedCat!.id)
            : drawerSelected == DrawerItem.categories
                ? Categories(
                    selected: (value) {
                      selectedCat = value;
                      setState(() {});
                    },
                  )
                : Settings(),
      ),
    );
  }
}
