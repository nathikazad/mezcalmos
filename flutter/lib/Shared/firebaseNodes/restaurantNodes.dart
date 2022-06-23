String restuarantAuthNode({
  required String uid,
}) {
  return 'restaurants/info/$uid';
}

String menuNode({required String uid}) {
  return restuarantAuthNode(uid: uid) + "/menu2";
}

String categoryNode({required String uid, required String categoryId}) {
  return menuNode(uid: uid) + "/category/$categoryId";
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
