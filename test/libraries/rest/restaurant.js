const User = require("./user");

module.exports.Restaurant = class Restaurant {
  constructor(user) {
    this.user = user
  }

  async setRestaurantInfo(admin, restaurantInfo) {
    await admin.database().ref(`/restaurants/info/${this.user.id}`).set(restaurantInfo)
  }

  async addItem(item) {
    return await this.user.db.push(`/restaurants/info/${this.user.id}/menu`, item)
  }

  async updateItem(itemId, itemModification) {
    await this.user.db.update(`/restaurants/info/${this.user.id}/menu/${itemId}`, itemModification)
  }

  async removeItem(itemId) {
    await this.user.db.remove(`/restaurants/info/${this.user.id}/menu/${itemId}`)
  }
}