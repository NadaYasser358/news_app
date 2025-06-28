import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/sources/data/sources_model.dart';
import 'package:news/screens/catigories/wedgits/newsList.dart';


class SourcesWidget extends StatefulWidget {
  SourcesWidget({super.key,required this.sources});
  final List<Sources> sources;
  @override
  State<SourcesWidget> createState() => _SourcesWidgetState();
}

class _SourcesWidgetState extends State<SourcesWidget> {
  String? selectedSourceId;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedSourceId=widget.sources.isNotEmpty?widget.sources[0].id:null;
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 60.h,
          child: ListView.builder(
            itemCount: widget.sources.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) =>
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 10.h),
                  child: ChoiceChip(
                    onSelected: (value){
                      selectedSourceId=widget.sources[index].id;
                      setState(() {
                      });
                    },
                    label: Text(widget.sources[index].name??''),
                    selected: widget.sources[index].id == selectedSourceId,
                    showCheckmark: false,
                    labelStyle: TextStyle(
                        color: widget.sources[index].id == selectedSourceId? Colors.white:Colors.green),
                    selectedColor: Colors.green,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.r),
                        side: const BorderSide(color: Colors.green)
                    ),
                  ),
                ),
          ),
        ),
        if(selectedSourceId!=null) NewsList(sourceId: selectedSourceId!)
      ],
    ) ;
  }

}
