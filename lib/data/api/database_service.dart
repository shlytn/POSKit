import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dicoding_capstone_pos/data/models/item.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DatabaseService {
  final _db = FirebaseFirestore.instance;
  late CollectionReference _ref;
  User? user = FirebaseAuth.instance.currentUser;

  DatabaseService() {
    _ref = _db
        .collection('users')
        .doc(user!.uid)
        .collection('items')
        .withConverter<Item>(
            fromFirestore: (snapshot, _) => Item.fromJson(snapshot.data()!),
            toFirestore: (item, _) => item.toJson());
  }

  Future<DocumentReference> addData(Item item) {
    return _ref.add(item);
  }
}
