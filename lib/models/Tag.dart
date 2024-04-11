class Tag {
  String id,name,image;
  Tag({required this.id,required this.name,required this.image});

  factory Tag.fromJson(dynamic data){
    return Tag(
      id: data['_id'],
      image: data['image'],
      name: data['name']
      );
  }
  }