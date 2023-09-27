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
import fs from 'fs';
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
  qrImage: string,
  pngImageLocation?: string,
  pdfImageLocation?: string,
  pdfOptions?: any
}

export const generateCustomerFlyerForBusiness = async (
  uniqueId: string,
  qrLink?: string
): Promise<any> => {
  if (qrLink == null) {
    try {
      qrLink = await generateQr({
        imageUploadPath: `links/${uniqueId}/customerQR`,
        shortLink: `https://mezc.co/${uniqueId}/`
      });

    } catch (err: any) {
      console.log("QR image generation error: ", err)
      throw new MezError("QRGenerationError");
    }
    console.log(qrLink);

  }
  const flyerImage = await generateImageWithQR(uniqueId, {
    height: 842,
    width: 650,
    qrWidth: 200,
    additionalStyles: {
      bottom: "10px",
      right: "10px"
    },
    mainImage: "https://firebasestorage.googleapis.com/v0/b/mezcalmos-31f1c.appspot.com/o/links%2Fyaab%2FFlyer%203%20A1%20-%20Mezkala.png?alt=media&token=d8515e0f-2a15-44d7-8c26-6fa15ee284f8",
    qrImage: qrLink

  });
  const bucket = storage().bucket();
  const bucketFile = bucket.file(`links/${uniqueId}/customerFlyer.png`);

  console.log("[+] BEFORE file.save :: file.baseUrl :: ", bucketFile.publicUrl());
  await bucketFile.save(flyerImage, {
    public: true,
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
    headless: true,
    args: ['--no-sandbox', '--disable-setuid-sandbox'],
  });

  const page = await browser.newPage();
  page.setDefaultTimeout(60000);
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

  await page.setContent(styledHtml, { waitUntil: 'networkidle0' });

  const flyerImage = await page.screenshot({
    path: `${createImageParams.pngImageLocation ?? ''}${uniqueId ?? 'screenshot'}.png`,
    clip: { x: 8, y: 8, height: createImageParams.height, width: createImageParams.width },
  });

  const pdfOptions: puppeteer.PDFOptions = {
    // format: 'A4',
    ...createImageParams.pdfOptions,
    printBackground: false,
    margin: { top: '0cm', right: '0cm', bottom: '0cm', left: '0cm' }

  };

  const enPdf = await page.pdf(pdfOptions);

  fs.writeFileSync(`${createImageParams.pdfImageLocation ?? ''}${uniqueId ?? 'screenshot'}.pdf`, enPdf);
  await browser.close();
  return flyerImage;
};
// This will save the PDF to a file called 'output.pdf'

interface GenerateA4Params {
  uniqueId: string,
  location: string,
  image: string,
  qrLink?: string,
  additionalStyles?: any
}

export const generateA4 = async (
  generateA4Params: GenerateA4Params
): Promise<string | Buffer> => { 
  if(generateA4Params.qrLink == null)
  generateA4Params.qrLink = await generateQr({
    imageUploadPath: `links/${generateA4Params.uniqueId}/customerQR`,
    shortLink: `https://mezc.co/${generateA4Params.uniqueId}/`
  });
return generateImageWithQR(generateA4Params.uniqueId, {
  height: 1105,
  width: 777,
  qrWidth: 350,
  additionalStyles: generateA4Params.additionalStyles ?? {
      top: "530px",
      left: "210px"
  },
  mainImage: generateA4Params.image,
  qrImage: generateA4Params.qrLink,
  pdfImageLocation: generateA4Params.location+"/pdf/",
  pngImageLocation: generateA4Params.location+"/png/",
  pdfOptions: {
    format: "A4"
  }
});
}

export const generate4by6 = async (
  generateA4Params: GenerateA4Params
): Promise<string | Buffer> => { 
  if(generateA4Params.qrLink == null)
  generateA4Params.qrLink = await generateQr({
    imageUploadPath: `links/${generateA4Params.uniqueId}/customerQR`,
    shortLink: `https://mezc.co/${generateA4Params.uniqueId}/`
  });
return generateImageWithQR(generateA4Params.uniqueId, {
  height: 552,
  width: 398,
  qrWidth: 166,
  additionalStyles: generateA4Params.additionalStyles ?? {
      top: "286px",
      left: "100px"
  },
  mainImage: generateA4Params.image,
  qrImage: generateA4Params.qrLink,
  pdfImageLocation: generateA4Params.location+"/pdf/",
  pngImageLocation: generateA4Params.location+"/png/",
  pdfOptions: {
    height: "15.24cm",
    width: "10.16cm",
  }
});
}



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
              
          }
          
          .small-image {
              width: 100%;
              height: 100%;
          }
      
          .small-image-container {
            display: flex;
            align-items: flex-start;
            justify-content: flex-end;
            position: absolute;
            width: <smallImageWidth>;
            height: <smallImageHeight>;
            <additionalStyles>
          }
      
      
          p {
            position: absolute;
            bottom: 0;
            right: 0;
            margin: 0;
            padding: 0;
            z-index: 1; /* to place it above the image */
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