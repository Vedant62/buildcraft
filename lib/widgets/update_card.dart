import 'package:buildcraft/widgets/image_filter.dart';
import 'package:flutter/material.dart';

import '../models/update.dart';

class UpdateCard extends StatefulWidget {
  const UpdateCard({
    super.key,
    required this.update,
  });

  final Update update;

  @override
  State<UpdateCard> createState() => _UpdateCardState();
}

class _UpdateCardState extends State<UpdateCard> {
  late Update _update;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _update = widget.update;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
      child: Column(
        children: [
          Image.network(_update.projectUpdateImageLink)
        ],
      ),
    );
  }
}
