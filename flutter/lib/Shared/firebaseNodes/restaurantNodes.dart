String restuarantAuthNode({
  required String uid,
}) {
  return 'restaurants/info/$uid';
}

String menuNode({required String uid}) {
  return restuarantAuthNode(uid: uid) + "/menu2";
}

String categoryNode({required String uid, required String categoryId}) {
  return menuNode(uid: uid) + "/$categoryId";
}

String itemsNode({required String uid, required String categoryId}) {
  return menuNode(uid: uid) + "/$categoryId/items";
}

String noCategoryNode({required String uid}) {
  return menuNode(uid: uid) + "/noCategory";
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
