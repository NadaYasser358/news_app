import 'package:flutter/material.dart';
import 'package:news/common/assets_manage.dart';
import 'package:news/common/colors.dart';
import '../../common/theme.dart';
import '../data/category_model.dart';
import 'category_wedgit.dart';

class Categories extends StatelessWidget {
  const Categories({super.key, required this.selected});
  final Function(CategoryModel) selected;
  @override
  Widget build(BuildContext context) {
    List<CategoryModel> categories = [
      CategoryModel(
        id: 'sports',
        title: 'Sports',
        color: ColorsManager.sports,
        image: AssetsManager.sports,

      ),
      CategoryModel(
          id: 'general',
          title: 'Politics',
          color: ColorsManager.politics,
          image: AssetsManager.politics),
      CategoryModel(
          id: 'health',
          title: 'Health',
          color: ColorsManager.health,
          image: AssetsManager.health),
      CategoryModel(
          id: 'business',
          title: 'Business',
          color: ColorsManager.bussines,
          image: AssetsManager.bussines),
      CategoryModel(
          id: 'technology',
          title: 'Technology',
          color: ColorsManager.environment,
          image: AssetsManager.environment),
      CategoryModel(
          id: 'science',
          title: 'Science',
          color: ColorsManager.science,
          image: AssetsManager.science),
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 35),
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(AssetsManager.pattern), fit: BoxFit.cover)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Pick your category\nof interest',
              style: Style.homeText,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: GridView.builder(
                  itemCount: 6,
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      mainAxisExtent: 171,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      maxCrossAxisExtent: 148),
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: ()=>selected(categories[index]),
                      child: CategoryWidget(
                        index: index,
                        categoryModel: categories[index],
                      ),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
