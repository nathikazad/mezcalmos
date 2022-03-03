
import React from 'react'



import ServList from './Components/Services/ServList';
import AppBar from './Components/utils/AppBar';
import Footer from './Components/utils/Footer';
import Hero from './Components/utils/Hero';
function App() {
  return (
    <div className="flex flex-col h-screen">
      <AppBar />
      <main className="flex-grow md:mx-32" >
      <Hero />

        <ServList />
        </main>
      <Footer />


    </div>
  );
}

export default App;
