class User {

  bool? status = false;
  String? id,name,email,phone,token;

  User({this.status,this.id,this.name,this.email,this.phone,this.token});

  factory User.fromJson(dynamic data) {
    return User (
      status: data['status'],
      id: data['_id'],
      name: data['name'],
      email: data['email'],
      phone: data['phone'],
      token: data['token'],
      );
  }
}

/*
 result: {status: true,
  _id: 605c19163bac7310fb16aabb,
   name: Owner,
    email: owner@gmail.com,
     phone: 09300300300,
      created: 2021-03-25T05:01:10.732Z, 
      updated: 2021-03-25T05:01:10.732Z, __v: 0, 
      roles: [{permits: [605c19163bac7310fb16aab9],_id: 605c19163bac7310fb16aab7, name: Owner, level: 0, __v: 0}], 
       permits: [{_id: 605c19163bac7310fb16aab9, name: Can Edit, __v: 0}], 
       token: eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYwNWMxOTE2M2JhYzczMTBmYjE2YWFiYiIsImlhdCI6MTcxMzUwMTUwMH0.C77Po22ljnc1JNoSyApXnsKDDrXJ3XpKwfL8WzYMzgo}}
 */