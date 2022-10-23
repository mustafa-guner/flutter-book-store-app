import "dart:math";

class VirtualDB {
  final List<Map<String, dynamic>> _items = [];
  static final VirtualDB _db = VirtualDB._privateConstructor();

  VirtualDB._privateConstructor();

  factory VirtualDB() {
    return _db;
  }

  /*
    FUTURE:USED FOR ASYNC AWAIT OPERATIONS
   */
  Future<void> insert(Map<String, dynamic> item) async {
    item["id"] = Random().nextInt(1000);
    _items.add(item);
  }

  Future<void> remove(int id) async {
    _items.removeWhere((item) => item["id"] == id);
  }

  Future<void> update(Map<String, dynamic> updatedItem) async {
    //Get the record index that is about to be updated
    int indx = _items.indexWhere((item) => item["id"] == updatedItem["id"]);
    //Update book with the index
    _items[indx] = updatedItem;
  }

  Future<List<Map<String, dynamic>>> list() async {
    //Mock the delay (server fetch delay)
    await Future.delayed(const Duration(milliseconds: 800));
    //return the items;
    return _items;
  }

  Future<Map<String, dynamic>?> findOne(int id) async {
    return _items.firstWhere((item) => item["id"] == id);
  }
}
