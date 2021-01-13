import 'package:cloud_firestore/cloud_firestore.dart';

class CrudMethods{
Future<void> putdata(dataentries){
  FirebaseFirestore.instance.collection("data")
      .add(dataentries)
      .catchError((e){
        print(e);
  });
}

getData() async {
  return await FirebaseFirestore.instance
      .collection("data")
      .snapshots();
}
}