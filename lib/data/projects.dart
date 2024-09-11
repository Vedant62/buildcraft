import 'package:buildcraft/utils/id.dart';
import 'package:flutter/material.dart';

import '../models/project.dart';

List<Project> projects = [
  Project(
      title: 'Test Project',
      id: IdGen.id(),
      description: 'My first project',
      userId: IdGen.id(),
      startDate: DateTime.now(),
      endDate: DateTime.utc(2025, 2, 2),
      checkInTime: TimeOfDay.now(),
      createdAt: DateTime.now()),
];
