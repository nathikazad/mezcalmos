import 'package:get/get.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/pages/ServiceProviderPages/ServiceOfferEditView/controllers/ServiceOfferEditViewController.dart';

class OfferItemsSelectViewController {
  RxList<OfferItemData> allOfferings = RxList.empty();
  RxList<OfferItemData> selectedOfferings = RxList.empty();

  final int fetchSize = 10;
  int _currentOffset = 0;
  bool _fetchingData = false;
  bool _reachedEndOfData = false;
  RxBool isFetching = RxBool(false);
  late int serviceId;
  late ServiceProviderType serviceProviderType;
  List<int> oldSelectedItemsIds = [];
  String? lastSearchedKeyword;

  bool get endData => _reachedEndOfData;

  void init({
    required int serviceId,
    required ServiceProviderType serviceProviderType,
    required List<int> selectedItems,
  }) {
    this.serviceId = serviceId;
    this.serviceProviderType = serviceProviderType;
    oldSelectedItemsIds = selectedItems;
    fetchItems();
  }

  Future<void> fetchItems({String? keyword}) async {
    try {
      await _fetchItems(keyword: keyword);
    } catch (e, stk) {
      mezDbgPrint(e);
      mezDbgPrint(stk);
    }
  }

  Future<void> _fetchItems({String? keyword}) async {
    // mezDbgPrint(
    //     "called fetch items with keyword offset: $_currentOffset   keyword: $keyword isFetching : $_fetchingData _endData: $_reachedEndOfData");
    // isFetching.value = true;
    // if (_fetchingData || _reachedEndOfData) {
    //   return;
    // }
    // _fetchingData = true;
    // List<OfferItemData> newList =
    //     (serviceProviderType == ServiceProviderType.Restaurant)
    //         ? await get_restaurant_offer_items(
    //             withCache: false,
    //             limit: fetchSize,
    //             offset: _currentOffset,
    //             keyword: keyword,
    //             restuarntId: serviceId)
    //         : await search_business_items(
    //             withCache: false,
    //             limit: fetchSize,
    //             offset: _currentOffset,
    //             keyword: keyword,
    //             businessId: serviceId);
    // allOfferings.value += newList;
    // newList
    //     .where(
    //         (OfferItemData element) => oldSelectedItemsIds.contains(element.id))
    //     .forEach((OfferItemData element) {
    //   selectedOfferings.add(element);
    // });

    // if (newList.length == 0) {
    //   _reachedEndOfData = true;
    // }

    // _currentOffset += fetchSize;

    // _fetchingData = false;
    // isFetching.value = false;
  }

  void search(String value) {
    if (value.isEmpty) {
      _resetAndSearch(null);
      lastSearchedKeyword = null;
    } else if (value.length.isEven) {
      _resetAndSearch(value);
      lastSearchedKeyword = value;
    }
  }

  void _resetAndSearch(String? keyword) {
    allOfferings.clear();
    _currentOffset = 0;
    _fetchingData = false;
    _reachedEndOfData = false;
    _fetchItems(keyword: keyword);
  }

  void selectItem({required int itemId, bool? value}) {
    final OfferItemData item = allOfferings
        .firstWhere((OfferItemData element) => element.id == itemId);
    if (value == true && !selectedOfferings.contains(item)) {
      selectedOfferings.add(item);
    } else {
      selectedOfferings
          .removeWhere((OfferItemData element) => element.id == itemId);
    }
    selectedOfferings.refresh();
  }
}
