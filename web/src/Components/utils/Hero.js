import React from 'react'
import googleLogo from '../../assets/images/googleDownload.png'
import appleLogo from '../../assets/images/appleDownload.png'
function Hero() {
    return (
        <div >
             <div className="mx-1 my-2 md:mx-5 md:my-5">
                <p className="text-xl md:text-2xl font-semibold m-2">Welcome to Mezcalmos 👋</p>
                <p className="text-sm md:text-xl font-semibold m-2 text-gray-600">Your one stop palce to find all your needed local services and where you can enjoy fast and high quality services.</p>
                <div className="flex flex-row justify-evenly m-5">
     
                    
                    <a href="https://apps.apple.com/us/app/mezcalmos/id1595882320" className=" w-full h-12 md:w-48 md:h-16 relative  m-1"><img className="h-full w-full object-scale-down" src={appleLogo}></img></a>
                    <a href="https://play.google.com/store/apps/details?id=com.mezcalmos.customer" className=" w-full h-12 md:w-48 md:h-16 relative  m-1"><img className="h-full w-full object-scale-down" src={googleLogo}></img></a>
                   
</div>
            </div>
            
        </div>
    )
}

export default Hero
