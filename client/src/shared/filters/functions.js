export const formatMessage = (value, nbr) => {
    if (!value) return ''
    value = value.toString()
    if (value.length > nbr) {
        return value.slice(0, nbr - 3) + '...'
    } else {
        return value
    }

}