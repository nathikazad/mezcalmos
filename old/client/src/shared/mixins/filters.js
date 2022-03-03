export const formatMessage = (value, nbr) => {
    if (!value) return ''
    value = value.toString()
    if (value.length > nbr) {
        return value.slice(0, nbr - 3) + '...'
    } else {
        return value
    }

}


export const sortOrdersByDate = (orders, timeParam) => {
    let newOrders = {}
    for (let key in orders) {
        let date;
        if (new Date(orders[key][timeParam]).toLocaleDateString("en-US") == new Date().toLocaleDateString("en-US")) {
            date = 'Today'
        } else {
            date = new Date(orders[key][timeParam]).toLocaleDateString("en-US").replaceAll('/', '.');

        }

        newOrders[date] = newOrders[date] || {};
        newOrders[date][key] = orders[key]
    }
    let dates = Object.keys(newOrders).sort(function (a, b) {
        return new Date(a) - new Date(b)
    }).reverse()
    return {
        date: dates,
        dateSortedOrders: newOrders
    }
}