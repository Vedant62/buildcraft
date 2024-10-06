import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class YImageFilter extends StatefulWidget {
  const YImageFilter({super.key, required this.image});
  final CachedNetworkImage image;
  @override
  State<YImageFilter> createState() => _YImageFilterState();
}

class _YImageFilterState extends State<YImageFilter> {
  late CachedNetworkImage _image;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _image = widget.image;
  }

  @override
  Widget build(BuildContext context) {
    return ImageFiltered(
      imageFilter: ImageFilter.blur(sigmaX: 0.5, sigmaY: 0.5),
      child: _image,
    );
  }
}
