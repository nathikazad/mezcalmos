import React from 'react';
import PrivacyPoliciesComponent from './Components/PrivacyPoliciesComponent';
import AppBar from './Components/utils/AppBar';
import Footer from './Components/utils/Footer';

function PrivacyPolicy() {
  return   <div className="flex flex-col h-screen">
      <AppBar />
      <main className="flex-grow">
          <PrivacyPoliciesComponent />
      </main>
      <Footer />


    </div>
}

export default PrivacyPolicy;
