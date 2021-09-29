module.exports.restaurantData = {
  "email": "burger_restaurant@gmail.com",
  "displayName": "Burger Burger",
  "password": "password",
  "photoURL": "https://randomuser.me/api/portraits/men/72.jpg",
  "returnSecureToken": true
}


module.exports.restaurantInfo = {
  state: {
    authorizationStatus: true,
    open: false,
  }
}

module.exports.itemToAdd = {
  options: {
    chooseOne: {
      meat: "fish",
      cheese: "mozarella"
    },
    chooseMany: {
      lettuce: true,
      tomato: true,
      avocado: false
    },
    sides: {
      frenchFries: true
    }
  }
}

module.exports.item = {
  name: {
    en: "normal burger",
    es: "burgesa normal"
  },
  description: {
    en: "a normal burger with patty and cheese",
    es: "un burgesa normal con carne y queso"
  },
  available: true,
  image: "img1",
  cost: 5.99,
  options: {
    chooseOne: {
      meat: {
        optionName: { en: "Meat", es: "Carne" },
        optionDialogText: { en: "Choose your patty type", es: "Elige el tipo de carne" },
        options: {
          chicken: { name: { en: "chicken", es: "pollo" }, cost: 0 },
          beef: { name: { en: "beef", es: "res" }, cost: 0 },
          fish: { name: { en: "fish", es: "pescado" }, cost: 1.99 },
        }
      },
      cheese: {
        optionName: { en: "Cheese", es: "Queso" },
        optionDialogText: { en: "Choose your cheese", es: "Elige el tipo de queso" },
        options: {
          mozarella: { name: { en: "Mozarella", es: "Mozarella" }, cost: 0 },
          american: { name: { en: "American", es: "Americano" }, cost: 0 },
          oaxacan: { name: { en: "Oaxacan", es: "Oaxaqueno" }, cost: 0 },
        }
      }
    },
    chooseMany: {
      lettuce: {
        name: { en: "Lettuce", es: "Lechuga" },
        cost: 0,
        default: true
      },
      tomato: {
        name: { en: "Tomato", es: "Tomate" },
        cost: 0,
        default: true
      },
      onion: {
        name: { en: "Onion", es: "Cebolla" },
        cost: 0,
        default: true
      },
      avocado: {
        name: { en: "Avocado", es: "Avocado" },
        cost: 1.00,
        default: false
      },
    },
    sides: {
      frenchFries: {
        name: { en: "French fries", es: "Batatas fritas" },
        cost: 1.99,
      },
      nachos: {
        name: { en: "Nachos", es: "Nachos" },
        cost: 2.99,
      }
    }
  }
}