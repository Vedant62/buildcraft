import 'package:buildcraft/widgets/image_filter.dart';
import 'package:flutter/material.dart';

class UpdateCard extends StatefulWidget {
  const UpdateCard({
    super.key,
    required this.projectId,
  });

  final String projectId;

  @override
  State<UpdateCard> createState() => _UpdateCardState();
}

class _UpdateCardState extends State<UpdateCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
      child: Column(
        children: [
          ImageFilter(),

        ],
      ),
    );
  }
}
