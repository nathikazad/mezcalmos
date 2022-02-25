import React from 'react'
import { Link } from 'react-router-dom'
import logo from '../../../src/assets/images/logo.png'
function AppBar() {
    return (
      <Link to='/'> 
           <div class=" w-full bg-white shadow-md flex justify-center py-5">
            <div class=" text-lg font-semibold text-gray-900">
            <div className=" w-10 relative h-10 ">
         <img src={logo} alt="" className=" w-full h-full object-contain" />
        </div>
      
      </div>
      <div className=" block ml-3 text-3xl font-medium  text-black  ">MEZ<span  className="text-purple-500">CALMOS </span> </div>
      
      </div>
      </Link>
    )
}

export default AppBar
