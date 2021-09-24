const User = require("./user");
class Restaurant {
  constructor(User) {
    this.user = user
  }

  async setRestaurantInfo(admin, restaurantInfo) {
    await admin.database().ref(`/restaurants/${this.user.id}`).set(restaurantInfo)
  }

  async addItem(item) {
    return await this.user.db.push(`/restaurants/${this.user.id}/menu`, item)
  }

  async updateItem(itemId, itemModification) {
    await this.user.db.update(`/restaurants/${this.user.id}/menu/${itemId}`, itemModification)
  }

  async removeItem(itemId) {
    await this.user.db.remove(`/restaurants/${this.user.id}/menu${itemId}`, item)
  }
}

module.exports = Restaurant;