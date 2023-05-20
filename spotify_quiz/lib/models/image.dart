
class Image {
  late String url;
  late int heigth;
  late int width;
  

  Image( this.url, this.heigth, this.width);

  
  dynamic toJson() => {'url': url, 'heigth': heigth, 'width': width};

  @override
  String toString() {
    return toJson().toString();
  }
}
