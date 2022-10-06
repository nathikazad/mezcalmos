String restuarantAuthNode({
  required String uid,
}) {
  return 'restaurants/info/$uid';
}

String restaurantAvailabeNode({required String uid}) {
  return restuarantAuthNode(uid: uid) + "/state/available";
}

String restaurantOpenNode({required String uid}) {
  return restuarantAuthNode(uid: uid) + "/state/open";
}

String dailyMenuNode({required String uid}) {
  return restuarantAuthNode(uid: uid) + "/menu/daily/";
}

String categoryNode({required String uid, required String categoryId}) {
  return dailyMenuNode(uid: uid) + "/$categoryId";
}

String itemsNode({required String uid, required String categoryId}) {
  return dailyMenuNode(uid: uid) + "/$categoryId/items";
}

String noCategoryNode({required String uid}) {
  return dailyMenuNode(uid: uid) + "/noCategory";
}

String itemNode(
    {required String uid, required String itemId, String? categoryId}) {
  if (categoryId != null) {
    return categoryNode(uid: uid, categoryId: categoryId) + "/items/$itemId";
  } else {
    return noCategoryNode(uid: uid) + "/items/$itemId";
  }
}

String optionNode({
  required String uid,
  required String itemId,
  required String optionId,
  String? categoryId,
}) {
  if (categoryId != null) {
    return itemNode(uid: uid, categoryId: categoryId, itemId: itemId) +
        "/options/$optionId";
  } else {
    return itemNode(uid: uid, categoryId: null, itemId: itemId) +
        "/options/$optionId";
  }
}

String choiceNode({
  required String uid,
  required String itemId,
  required String optionId,
  required String choiceId,
  String? categoryId,
}) {
  if (categoryId != null) {
    return optionNode(
            uid: uid,
            categoryId: categoryId,
            itemId: itemId,
            optionId: optionId) +
        "/choices/$choiceId";
  } else {
    return optionNode(
            uid: uid, categoryId: null, itemId: itemId, optionId: optionId) +
        "/choices/$choiceId";
  }
}

String currentSpecialsNode({required String uid}) {
  return restuarantAuthNode(uid: uid) + "/menu/specials/current";
}

String pastSpecialsNode({required String uid}) {
  return restuarantAuthNode(uid: uid) + "/menu/specials/past";
}

String detailsNode({required String uid}) {
  return restuarantAuthNode(uid: uid) + "/details/";
}

String payemntInfoNode({required String uid}) {
  return detailsNode(uid: uid) + "/paymentInfo/";
}

String feesOptionNode({required String uid}) {
  return detailsNode(uid: uid) + "/paymentInfo/stripe/chargeFeesOnCustomer";
}

String acceptedPaymentNode({required String uid}) {
  return payemntInfoNode(uid: uid) + "/acceptedPayments/";
}
