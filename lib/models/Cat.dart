class Cat {
  String id,name,image;
  List<dynamic> subs;
  Cat({required this.id,required this.name,required this.image,required this.subs});

  factory Cat.fromJson(dynamic data){
    return Cat(
      id: data['_id'],
      image: data['image'],
      name: data['name'],
      subs: data['subs']
      );
  }
  }