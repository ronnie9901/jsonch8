class Todomodel {

  late String title;
  late String url;
  Todomodel({required this.title,required this.url});

  factory Todomodel.fromMap( Map m1){
    return Todomodel(title: m1['title'], url: m1['url']);
  }

}