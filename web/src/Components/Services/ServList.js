import React from 'react'
import ServiceCard from './ServiceCard'
import foodImage from '../../../src/assets/images/restaurantService.png'
import taxiImage from '../../../src/assets/images/taxiService.png'
import laundryImage from '../../../src/assets/images/laundryService.png'
import TestCard from './ServiceCard'
function ServList() {
    return (
        <div className="mx-1 md:mx-5">
            <p className="text-xl md:text-2xl font-semibold m-2">Services</p>
        {/* <div className="md:grid grid-cols-2 gap-x-3 gap-y-0  "> */}
        <div className="flex flex-col  ">
     
            
            <ServiceCard title={'Food'} image={foodImage} desc={'Discover the most delicious dishes from the nearest restaurant and get your order delivered in the blink of an eye .'} />
            <ServiceCard title={'Taxi'} image={taxiImage} desc={'Get the nearest taxi arround at the best price and get your destinatiion as soon as possible .'} />
            <ServiceCard title={'Laundry'} image={laundryImage} desc={' Coming Soon... '} />
           
            
            </div>
            </div>
    )
}

export default ServList
