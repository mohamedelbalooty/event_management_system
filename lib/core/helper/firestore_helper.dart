import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreHelper {
  final FirebaseFirestore _fireStore;

  const FireStoreHelper({required FirebaseFirestore fireStore})
      : _fireStore = fireStore;


}
