import 'models.dart';

class Image {
  late String url;
  late int heigth;
  late int width;
  

  Image( String url, int heigth, int width){
     this.url = url;
     this.width = width;
     this.heigth = heigth;
  }

  
  dynamic toJson() => {'url': url, 'heigth': heigth, 'width': width};

  @override
  String toString() {
    return toJson().toString();
  }
}
