import React from 'react'
import { Link } from 'react-router-dom'

function Footer() {
    return (
      
        <footer class=" w-full bg-black shadow-md flex justify-center py-5 
        inset-x-0
        bottom-0">
            <Link to='privacy-policy'><p className="text-white mx-4"> Privacy Policy  </p>   </Link>
            <p className="text-white"> All rights reserved 2022 ©  </p>   
  <div className=" text-l ml-2 font-bold text-white  ">MEZ<span  className="text-purple-500">CALMOS </span> </div>
   
    </footer>
    )
}

export default Footer
