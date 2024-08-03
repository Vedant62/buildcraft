import 'package:uuid/uuid.dart';

class IdGen {
  static final Uuid _uuid =  Uuid();

  static String id() {
    return _uuid.v4();
  }
}
