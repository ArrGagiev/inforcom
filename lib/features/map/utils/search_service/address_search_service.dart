import 'dart:developer';

import 'package:yandex_maps_mapkit/runtime.dart' as yandex;
import 'package:yandex_maps_mapkit/mapkit.dart';
import 'package:yandex_maps_mapkit/search.dart';
import 'dart:async';

class AddressSearchService {
  final SearchManager _searchManager;
  SearchSuggestSession? _suggestSession;
  Timer? _searchDebounce;

  AddressSearchService()
    : _searchManager = SearchFactory.instance.createSearchManager(
        SearchManagerType.Online,
      );

  /// Получение подсказок для поиска
  Future<List<SuggestItem>> getSuggestions({
    required String query,
    required BoundingBox boundingBox,
    Duration debounce = const Duration(milliseconds: 350),
  }) async {
    _searchDebounce?.cancel();

    final completer = Completer<List<SuggestItem>>();

    _searchDebounce = Timer(debounce, () async {
      final text = query.trim();
      if (text.isEmpty) {
        completer.complete([]);
        return;
      }

      _suggestSession ??= _searchManager.createSuggestSession();

      try {
        _suggestSession!.suggest(
          boundingBox,
          SuggestOptions(),
          SearchSuggestSessionSuggestListener(
            onResponse: (SuggestResponse response) {
              completer.complete(response.items);
            },
            onError: (yandex.Error error) {
              completer.complete([]);
            },
          ),
          text: text,
        );
      } catch (e) {
        completer.complete([]);
      }
    });

    return completer.future;
  }

  /// Поиск адреса по тексту
  Future<Point?> searchAddress({
    required String query,
    required BoundingBox boundingBox,
  }) async {
    final completer = Completer<Point?>();
    final geometry = Geometry.fromBoundingBox(boundingBox);

    _searchManager.submit(
      geometry,
      SearchOptions(),
      SearchSessionSearchListener(
        onSearchResponse: (SearchResponse response) {
          if (response.collection.children.isNotEmpty) {
            final obj = response.collection.children.first.asGeoObject();
            if (obj != null && obj.geometry.isNotEmpty) {
              final point = obj.geometry.first.asPoint();
              completer.complete(point);
              log('Координаты искомого адреса: $point');
              return;
            }
          }
          completer.complete(null);
        },
        onSearchError: (yandex.Error error) {
          completer.complete(null);
        },
      ),
      text: query,
    );

    return completer.future;
  }

  /// Очистка ресурсов
  void dispose() {
    _searchDebounce?.cancel();
    _suggestSession = null;
  }
}
