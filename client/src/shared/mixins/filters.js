export const formatMessage = (value, nbr) => {
    if (!value) return ''
    value = value.toString()
    if (value.length > nbr) {
        return value.slice(0, nbr - 3) + '...'
    } else {
        return value
    }

}

export const sortOrdersByDate = (orders) => {
    let newOrders = {}
    for (let key in orders) {
        let date = new Date(orders[key].orderTime).toLocaleDateString("en-US").replaceAll('/', '-'); 
        newOrders[date] = newOrders[date] || {} ;
        newOrders[date][key] = orders[key]
    }
    let dates = Object.keys(newOrders).sort(function(a,b) { return new Date(a) - new Date(b)})
    return {date:dates, dateSortedOrders: newOrders}
}
