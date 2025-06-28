import 'package:flutter/material.dart';
import 'package:news/sources/model_view/sources_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/screens/catigories/models/news_model.dart';
import 'package:news/sources/view/sources_wedgit.dart';

import '../../api/api_services.dart';
import '../data/sources_model.dart';
import '../../screens/catigories/news_card.dart';

class CategoryDetailsView extends StatefulWidget {
  CategoryDetailsView({super.key, required this.id});
  final String id;
  @override
  State<CategoryDetailsView> createState() => _CategoryDetailsViewState();
}

class _CategoryDetailsViewState extends State<CategoryDetailsView> {
  late SourcesProvider sourcesProvider;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    sourcesProvider = SourcesProvider();
    sourcesProvider.getSources(widget.id);
    print('sources got');
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
        children: [
          ChangeNotifierProvider(
              create: (_) => sourcesProvider,
              child: Consumer<SourcesProvider>(
                builder: (_, value, child) => value.isWaiting
                    ? Center(child: const CircularProgressIndicator())
                    : value.errorMessage != null
                        ? Text(value.errorMessage.toString())
                        : SourcesWidget(
                            sources: value.sourcesModel?.sources ?? [],
                          ),
              ))
        ],
      );
  }
}
