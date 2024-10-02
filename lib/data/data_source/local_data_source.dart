import 'package:injectable/injectable.dart';

class LocalDataSourceKeysName {}

abstract class LocalDataSource {
  void clearCache();

  void removeFromCache(String key);
}

@LazySingleton(as: LocalDataSource)
class LocalDataSourceImplementer implements LocalDataSource {
  // run time cache
  Map<String, CachedItem> cacheMap = {};

  @override
  void clearCache() {
    cacheMap.clear();
  }

  @override
  void removeFromCache(String key) {
    cacheMap.remove(key);
  }
}

class CachedItem {
  CachedItem(this._data);

  final dynamic _data;

  dynamic get data {
    return _data;
  }
}
