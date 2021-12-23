import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dicoding_capstone_pos/data/models/cart_item.dart';
import 'package:dicoding_capstone_pos/data/models/history.dart';
import 'package:dicoding_capstone_pos/data/models/item.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';

class DatabaseService {
  final _db = FirebaseFirestore.instance;
  late CollectionReference _ref;
  late DocumentReference _userRef;
  late CollectionReference _cartRef;
  late CollectionReference _historyRef;
  User? user = FirebaseAuth.instance.currentUser;

  DatabaseService() {
    _userRef = _db.collection('users').doc(user!.uid);

    _ref = _userRef.collection('items').withConverter<Item>(
        fromFirestore: (snapshot, _) => Item.fromJson(snapshot.data()!),
        toFirestore: (item, _) => item.toJson());

    _cartRef = _userRef.collection('cart').withConverter<CartItem>(
        fromFirestore: (snapshot, _) => CartItem.fromFirebase(snapshot),
        toFirestore: (item, _) => item.toJson());

    _historyRef = _userRef.collection('history').withConverter<History>(
        fromFirestore: (snapshot, _) => History.fromFirebase(snapshot),
        toFirestore: (item, _) => item.toJson());

    print("user = ${user?.uid}");
  }

  /* Item DB */

  Stream<List<Item>> getStreamData() {
    return _ref.orderBy('name').snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => Item.fromFirebase(doc)).toList());
  }

  Future<QuerySnapshot> getData() {
    return _ref.get();
  }

  Future<DocumentSnapshot> getDataById(String id) {
    return _ref.doc(id).get();
  }

  Future<DocumentReference> addData(Item item) {
    return _ref.add(item);
  }

  Future<void> updateData(String id, Item item) {
    return _ref.doc(id).set(item);
  }

  Future<void> updateSoldData(String id, int totalSold) async {
    DocumentSnapshot? doc = await _cartRef.doc(id).get();
    int sold = Item.fromFirebase(doc).sold! + totalSold;

    return _ref.doc(id).update({"sold": sold});
  }

  Future<void> deleteData(String id) {
    return _ref.doc(id).delete();
  }

  /* Image DB */

  Future<String> uploadImage(File image, bool isItem) async {
    String filename = basename(image.path);

    Reference ref = FirebaseStorage.instance.ref(user!.uid);
    if (isItem) {
      ref = ref.child('items').child(filename);
    } else {
      ref = ref.child('profile_image.jpg');
    }
    ref.putFile(image);

    return await ref.getDownloadURL();
  }

  Future<void> setUserProfile(String? imageUrl) async {
    final data = {
      "profile_image": imageUrl,
    };

    return await _userRef.set(data);
  }

  Stream<DocumentSnapshot> getUserProfile() {
    return _userRef.snapshots();
  }

  Future<DocumentSnapshot> getProfile() {
    return _userRef.get();
  }

  /* Cart DB */

  Stream<List<CartItem>> getCart() {
    return _cartRef.snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => CartItem.fromFirebase(doc)).toList());
  }

  Future<QuerySnapshot> getCartData() {
    return _cartRef.get();
  }

  Future<void> addCart(Item item) async {
    DocumentSnapshot? doc = await _cartRef.doc(item.id).get();

    CartItem cartItem;
    if (!doc.exists) {
      cartItem = CartItem(item: item, quantity: 1, total: item.sellingPrice);
    } else {
      final quantity = CartItem.fromFirebase(doc).quantity;
      final newQuantity = quantity + 1;
      cartItem = CartItem(
          item: item,
          quantity: newQuantity,
          total: item.sellingPrice * newQuantity);
    }
    return _cartRef.doc(item.id).set(cartItem);
  }

  Future<void> updateCart(String id, CartItem item, bool isPlus) async {
    CartItem cartItem;
    int quantity;
    if (isPlus) {
      quantity = item.quantity + 1;
    } else {
      if (item.quantity > 1) {
        quantity = item.quantity - 1;
      } else {
        return await deleteCart(id);
      }
    }
    cartItem = CartItem(
        item: item.item,
        quantity: quantity,
        total: item.item.sellingPrice * quantity);
    return _cartRef.doc(id).update(cartItem.toJson());
  }

  int getTotalPrice(List<CartItem> items) {
    int total = 0;
    for (var item in items) {
      total += item.total;
    }
    return total;
  }

  int getTotalQuantity(List<CartItem> items) {
    int total = 0;
    for (var item in items) {
      total += item.quantity;
    }
    return total;
  }

  Future<void> deleteCart(String id) {
    return _cartRef.doc(id).delete();
  }

  Future<void> clearCart() async {
    var snapshots = await getCartData();
    for (var doc in snapshots.docs) {
      doc.reference.delete();
    }
  }

  /* History DB */

  Stream<List<History>> getHistory() {
    return _historyRef.orderBy('dateTime', descending: true).snapshots().map(
        (snapshot) =>
            snapshot.docs.map((doc) => History.fromFirebase(doc)).toList());
  }

  Future<QuerySnapshot> getHistoryData() {
    return _historyRef.get();
  }

  Future<void> addHistory(List<CartItem> items) {
    DateTime now = DateTime.now();
    int timestamp = Timestamp.now().millisecondsSinceEpoch;
    String id = "#TRX$timestamp";

    History history = History(
        dateTime: now,
        items: items,
        totalItem: getTotalQuantity(items),
        totalPrice: getTotalPrice(items));

    return _historyRef.doc(id).set(history);
  }
}
