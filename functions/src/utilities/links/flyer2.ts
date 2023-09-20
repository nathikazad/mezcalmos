import * as puppeteer from 'puppeteer';
// import * as os from 'os';
// import * as fs from 'fs';
// import * as path from 'path';
// import { Storage } from '@google-cloud/storage';
// import { storage } from 'firebase-admin';
// import { getHasura } from '../hasura';
// import { $ } from '../../../../hasura/library/src/generated/graphql-zeus';
import { Language, MezError } from '../../shared/models/Generic/Generic';
import { storage } from 'firebase-admin';
import { generateQr } from './qr';

// const storage = new Storage();

export async function generateFlyers() {
//     let chain = getHasura();

//     let response = await chain.query({
//         service_provider_service_link: [{}, {
//             id: true,
//             service_provider: {
//                 unique_id: true,
//             }
//         }]
//     });
//     let updates: any = [];
//     for(let link of response.service_provider_service_link) {
//         if(link.service_provider == null) 
//             continue;
//         console.log("id: ", link.id)
//         let QRflyerLinks = await createQRFlyerPDF(link.service_provider.unique_id);
//         updates.push({
//             where: {
//                 id: {
//                     _eq: link.id,
//                 }
//             },
//             _set: {
//                 customer_qr_image_link: QRflyerLinks.customerQRImageLink,
//                 customer_flyer_links: QRflyerLinks.flyerLinks,
//             }
//         });
//     };
//     let response1 = await chain.mutation({
//         update_service_provider_service_link_many: [{
//             updates: $`updates`,
//         }, {
//             affected_rows: true,
//         }]
//     }, {
//         "updates": updates,
//     });
//     console.log(response1);
}

export interface QRFlyerLinks {
    customerQRImageLink: string,
    flyerLinks: Record<Language, string>
}

export interface CreateImageParams {
    height: number,
    width: number,
    qrWidth: number,
    additionalStyles?: { [key: string]: string },
    mainImage: string,
    qrImage: string
}

export const generateCustomerFlyerForBusiness = async (
  uniqueId: string
): Promise<any> => {
  let customerQRUrl: string | undefined;
    try {
        customerQRUrl = await generateQr({
            imageUploadPath: `links/${uniqueId}/customerQR`, 
            shortLink:`https://mezc.co/${uniqueId}/`
        });

    } catch(err: any) {
        console.log("QR image generation error: ", err)
        throw new MezError("QRGenerationError");
    }
  const flyerImage = await generateImageWithQR(uniqueId, {
    height: 842,
    width: 650,
    qrWidth: 200,
    additionalStyles: {
        bottom: "10px",
        right: "10px"
    },
    mainImage: "https://firebasestorage.googleapis.com/v0/b/mezcalmos-31f1c.appspot.com/o/Mezkala%20flyer.jpg?alt=media&token=ed744a04-ec11-40d0-9581-2ce662f365b0",
    qrImage: customerQRUrl

  });
  const bucket = storage().bucket();
  const bucketFile = bucket.file(`links/${uniqueId}/customerFlyer.png`);

  console.log("[+] BEFORE file.save :: file.baseUrl :: ", bucketFile.publicUrl());
  await bucketFile.save(flyerImage , {
      public : true,
  });
  console.log("[+] file.save :: file.name :: ", bucketFile.name);
  return bucketFile.publicUrl();
}



export const generateImageWithQR = async (
    uniqueId: string,
    createImageParams: CreateImageParams
    
  ): Promise<string | Buffer> => {
    
    const browser = await puppeteer.launch({
      executablePath: puppeteer.executablePath(),
      headless: false,
      args: ['--no-sandbox', '--disable-setuid-sandbox'],
    });
  
    console.log("new page");
    const page = await browser.newPage();
  
    // Create additional styles string from the object
    const additionalStylesString = Object.entries(createImageParams.additionalStyles ?? {})
      .map(([key, value]) => `${key}: ${value};`)
      .join(" ");
  
    // Replace placeholders in HTML with actual content and styles
    let styledHtml = html
      .replace("<Unique Id>", uniqueId)
      .replace("<height>", `${createImageParams.height}px`)
      .replace("<width>", `${createImageParams.width}px`)
      .replace("<smallImageHeight>", `${createImageParams.qrWidth}px`)
      .replace("<smallImageWidth>", `${createImageParams.qrWidth}px`)
      .replace("<additionalStyles>", additionalStylesString)
      .replace("Unique Id", uniqueId)
      .replace("flyerImage", createImageParams.mainImage)
      .replace("QRImage", createImageParams.qrImage);
  
    console.log(styledHtml);
    await page.setContent(styledHtml, { waitUntil: 'networkidle0' });
  
    const flyerImage = await page.screenshot({
      path: 'screenshot.png',
      clip: { x: 8, y: 8, height: createImageParams.height, width: createImageParams.width },
    });
    await browser.close();
    return flyerImage;
  };
  
  const html = `<!DOCTYPE html>
  <html>
  <head>
      <style>
          .image-container {
              position: relative;
              width: <width>;
              height: <height>;
          }
  
          .big-image {
              position: absolute;
              width: 100%;
              height: 100%;
          }
  
          .small-image-container {
              position: absolute;
              width: <smallImageWidth>;
              height: <smallImageHeight>;
              <additionalStyles>
          }
          
          p {
            margin: 0;
            padding: 0;
          }
  
          .small-image {
              width: 100%;
              height: 100%;
          }
      </style>
  </head>
  <body>
      <div class="image-container">
          <img src="flyerImage" alt="big image" class="big-image">
          <div class="small-image-container">
               <img src="QRImage" alt="small image" class="small-image">
              <p><Unique Id></p>
          </div>
      </div>
  </body>
  </html>`;
  
// https://storage.googleapis.com/mezcalmos-31f1c.appspot.com/links%2Ftheplace%2Foperator-qr.png