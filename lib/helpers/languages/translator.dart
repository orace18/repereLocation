import 'package:get/get.dart';
import 'langs/en_US.dart';
import 'langs/fr_FR.dart';


class Translator extends Translations{
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {'en_US': en_US, 'fr_FR': fr_FR};

}