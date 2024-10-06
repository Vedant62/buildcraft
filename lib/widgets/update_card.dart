import 'package:buildcraft/utils/card_date.dart';
import 'package:buildcraft/utils/card_time.dart';
import 'package:buildcraft/widgets/image_filter.dart';
import 'package:cached_network_image/cached_network_image.dart';
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
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Stack(
            children: [
              SizedBox(
                height: 190,
                width: MediaQuery.sizeOf(context).width * 0.95,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: YImageFilter(
                      image: CachedNetworkImage(
                        // height: 190,
                        // width: 40,
                        imageUrl: _update.projectUpdateImageLink,
                        placeholder: (context, url) =>
                            const CircularProgressIndicator(),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned.fill(
                child: Align(
                  alignment: Alignment.center, // Center the text
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        cFormatDate(_update.dateTime),
                        style: Theme.of(context)
                            .textTheme
                            .headlineLarge!
                            .copyWith(color: Colors.white70, fontSize: 40),
                      ),
                      Text(
                        cFormatTime(_update.dateTime),
                        style: Theme.of(context)
                            .textTheme
                            .headlineLarge!
                            .copyWith(color: Colors.white70, fontSize: 40),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
