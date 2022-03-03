import React from 'react'

function ServiceCard({image,title,desc}) {
    return (
        <div className="flex font-sans bg-white  rounded-xl shadow-md overflow-hidden m-3 p-3 items-center">
        
        <form className="  m-2 flex-auto">
          <div className="flex-col  justify-start">
        <div className=" block mt-1 text-3xl leading-tight font-bold text-black  hover:underline">{ title}</div>
            <p className=" mt-2 md:mt-5 text-gray-500 text-sm md:text-xl ">{desc}</p>
            </div>
            </form>
            <div className="flex-none  w-32 h-32 md:w-48 md:h-48 relative  m-1">
          <img src={image} alt="" className="absolute inset-0 w-full h-full object-fill" />
        </div>
      </div>
      
      
    )
}

export default ServiceCard
