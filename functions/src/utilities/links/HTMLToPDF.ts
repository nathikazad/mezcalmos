import * as puppeteer from 'puppeteer-core';
// import * as os from 'os';
// import * as fs from 'fs';
// import * as path from 'path';
// import { Storage } from '@google-cloud/storage';
import { storage } from 'firebase-admin';
import { getHasura } from '../hasura';
import { $ } from '../../../../hasura/library/src/generated/graphql-zeus';

// const storage = new Storage();

export async function generateFlyers() {
    let chain = getHasura();

    let response = await chain.query({
        service_provider_service_link: [{}, {
            id: true,
            customer_qr_image_link: true,
            service_provider: {
                unique_id: true,
            }
        }]
    });
    let updates: any = [];
    for(let link of response.service_provider_service_link) {
        if(link.customer_qr_image_link == null || link.service_provider == null) 
            continue;
        console.log("id: ", link.id)
        let flyerLinks = await htmlToPdf(link.service_provider.unique_id, link.customer_qr_image_link);
        updates.push({
            where: {
                id: {
                    _eq: link.id,
                }
            },
            _set: {
                customer_flyer_links: flyerLinks,
            }
        });
    };
    let response1 = await chain.mutation({
        update_service_provider_service_link_many: [{
            updates: $`updates`,
        }, {
            affected_rows: true,
        }]
    }, {
        "updates": updates,
    });
    console.log(response1);
}

export const htmlToPdf = async (uniqueId: string, qrURL: string): Promise<{en: string, es: string}> => {
  const browser = await puppeteer.launch({
    // executablePath: 'C:\\Program Files\\Google\\Chrome\\Application\\Chrome.exe',
    args: ['--no-sandbox', '--disable-dev-shm-usage']
  });

  const page = await browser.newPage();

  let htmlWithUniqueId = html.replace("Unique Id", uniqueId);
  let enHTML = htmlWithUniqueId.replace("flyerImage", "https://firebasestorage.googleapis.com/v0/b/mezcalmos-31f1c.appspot.com/o/Mezkala%20flyer.jpg?alt=media&token=ed744a04-ec11-40d0-9581-2ce662f365b0");
  
  enHTML = enHTML.replace("QRImage", qrURL);
//   console.log(enHTML);
  // Set the HTML content to be the body of the HTTP request
  await page.setContent(enHTML, { waitUntil: 'networkidle0' });
  
  // PDF options
  const pdfOptions: puppeteer.PDFOptions = {
    format: 'A4',
    printBackground: true,
    margin: { top: '1cm', right: '1cm', bottom: '1cm', left: '1cm' }
  };

  const enPdf = await page.pdf(pdfOptions);

  let esHTML = htmlWithUniqueId.replace("flyerImage", "https://firebasestorage.googleapis.com/v0/b/mezcalmos-31f1c.appspot.com/o/Mezkala%20flyer%20-%20Spanish.png?alt=media&token=d1170a34-ea8e-4f07-bc0f-adc0eb4687e8");
  esHTML = esHTML.replace("QRImage", qrURL);

  const page1 = await browser.newPage();

  await page1.setContent(esHTML, { waitUntil: 'networkidle0' });
  const esPdf = await page1.pdf(pdfOptions);

  // Cleanup
  await browser.close();

  // Save the PDF to a temp file
  // const tmpFilePath = path.join(os.tmpdir(), 'output.pdf');
  // fs.writeFileSync(tmpFilePath, pdf);
  // console.log(`PDF written to ${tmpFilePath}`);

  const bucket = storage().bucket();
  // const imageByteArray = new Uint8Array(b64);
  const enFile = bucket.file(`links/${uniqueId}/en-flyer.pdf`);

  console.log("[+] BEFORE file.save :: file.baseUrl :: ", enFile.publicUrl());
  await enFile.save(enPdf , {
      public : true,
  });
  console.log("[+] file.save :: file.name :: ", enFile.name);

  const esFile = bucket.file(`links/${uniqueId}/es-flyer.pdf`);
  await esFile.save(esPdf , {
      public : true,
  });

  return {
    en: enFile.publicUrl(),
    es: esFile.publicUrl()
  }
  // await bucket.upload(tmpFilePath, {
  //   destination: destinationPath,
  //   resumable: false // Set to true for larger files
  // });

}

const html = `<!DOCTYPE html>
<html>
<head>
    <style>
        .image-container {
            position: relative;
            width: 595px;
            height: 842px;
        }

        .big-image {
            position: absolute;
            width: 100%;
            height: 100%;
        }

        .small-image-container {
            position: absolute;
            width: 200px; /* Adjust as needed */
            bottom: 10px;
            right: 10px;
            text-align: center; /* To center the text under the image */
        }
        
        p {
          margin: 0;
          padding: 0;
        }

        .small-image {
            width: 200px;
            height: 200px;
        }
    </style>
</head>
<body>
    <div class="image-container">
        <img src="flyerImage" alt="big image" class="big-image">
        <div class="small-image-container">
             <img src="QRImage" alt="small image" class="small-image">
            <p>Unique Id</p>
        </div>
    </div>
</body>
</html>`
// https://storage.googleapis.com/mezcalmos-31f1c.appspot.com/links%2Ftheplace%2Foperator-qr.png