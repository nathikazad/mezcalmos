import axios from "axios";
import { storage } from "firebase-admin";

export async function generateQr(path:string, shortLink:string): Promise<string>  {
    try {
        const { data } = await axios.post(
            'https://qrcode-monkey.p.rapidapi.com/qr/custom',
            // '{"data":"https://www.qrcode-monkey.com","config":{"body":"rounded-pointed","eye":"frame14","eyeBall":"ball16","erf1":[],"erf2":["fh"],"erf3":["fv"],"brf1":[],"brf2":["fh"],"brf3":["fv"],"bodyColor":"#5C8B29","bgColor":"#FFFFFF","eye1Color":"#3F6B2B","eye2Color":"#3F6B2B","eye3Color":"#3F6B2B","eyeBall1Color":"#60A541","eyeBall2Color":"#60A541","eyeBall3Color":"#60A541","gradientColor1":"#5C8B29","gradientColor2":"#25492F","gradientType":"radial","gradientOnEyes":false,"logo":""},"size":300,"download":false,"file":"png"}',
            {
                "data": shortLink,
                "config": {
                    "body": "japnese",
                    "eye": "frame1",
                    "eyeBall": "ball2",
                    "erf1": [
                        "fh"
                    ],
                    "erf2": [],
                    "erf3": [
                        "fh",
                        "fv"
                    ],
                    "brf1": [
                        "fv"
                    ],
                    "brf2": [],
                    "brf3": [],
                    "bodyColor": "#6779FE",
                    "bgColor": "#FFFFFF",
                    "eye1Color": "#000000",
                    "eye2Color": "#000000",
                    "eye3Color": "#000000",
                    "eyeBall1Color": "#000000",
                    "eyeBall2Color": "#000000",
                    "eyeBall3Color": "#000000",
                    "gradientColor1": "#6779FE",
                    "gradientColor2": "#AC59FC",
                    "gradientType": "linear",
                    "gradientOnEyes": "true",
                    "logo": "https://new-mezcalmose-website.firebaseapp.com/assets/img/logo/logo.png", //"https://firebasestorage.googleapis.com/v0/b/mezcalmos-31f1c.appspot.com/o/logo%402x.png?alt=media&token=4a18a710-e267-40fd-8da7-8c12423cc56d",
                    "logoMode": "clean"
                },
                "size": 300,
                "download": "imageUrl",
                "file": "png",
            },
            {
                headers: {
                  'Content-Type': 'application/json',
                  'X-RapidAPI-Key': '44e3afe025mshd611453cf167049p1dc220jsn387a69f61a51',
                  'X-RapidAPI-Host': 'qrcode-monkey.p.rapidapi.com'
                },
            },
        );
        let imgUrl : string | null | undefined = data['imageUrl']
        if (!imgUrl)
            throw Error('Image Generation Error 1');
        else 
            return await uploadQrImg(path, (data['imageUrl'] as string).replace('//', 'https://'));
    } catch (error) {
        console.log(`Error Happend when generating the QR code:\n${error}`);
        throw Error('Image Generation Error 2');
    }
};


async function uploadQrImg(path:string , qrExternalUrl: string): Promise<string> {
    console.log("[+] uploadRestaurantQrImg :: called  :: path ::", path);
    const response  = await axios
    .get(qrExternalUrl, {
      responseType: 'arraybuffer'
    });
    if (response.status == 200) {

        console.log("[+] get :: ", qrExternalUrl, " :: Called!");
        
        // const b64 = Buffer.from(response.data, 'binary').toString('base64');
        const b64 = Buffer.from(response.data, 'binary');
        console.log("[+] b64 :: ", b64);

        const bucket = storage().bucket()
        // const imageByteArray = new Uint8Array(b64);
        const file = bucket.file(`${path}-qr.png`);

        console.log("[+] BEFORE file.save :: file.baseUrl :: ", file.publicUrl());
        await file.save(b64 , {
            public : true,
        });
        console.log("[+] file.save :: file.name :: ", file.name);
        return file.publicUrl();
        // file.name
        // .then(() => {
        // console.log("[+] file.save :: then :: ", file.baseUrl);

        //     return file.baseUrl;
        // })
        // .catch((err: any) => {
        //     console.log(`Unable to upload encoded file ${err}`)
        //     return undefined
        // })
    } else {
        throw Error('Image Generation Error 3');
    }
    // .then(response => {
        
    // })
    // .catch((err: any) => {
    //     console.log("[+] get :: ", qrExternalUrl, " :: EXCEPTION! :: ", err);
    //     return undefined
    // });
    
    // return null;
  }
    // const options = {
    //     method: 'POST',
    //     url: 'https://qrcode-monkey.p.rapidapi.com/qr/custom',
    //     headers: {
    //       'content-type': 'application/json',
    //       'X-RapidAPI-Key': '44e3afe025mshd611453cf167049p1dc220jsn387a69f61a51',
    //       'X-RapidAPI-Host': 'qrcode-monkey.p.rapidapi.com'
    //     },
    //     data: 
    //     {
    //         "data": shortLink,
    //         "config": {
    //             "body": "japnese",
    //             "eye": "frame1",
    //             "eyeBall": "ball2",
    //             "erf1": [
    //                 "fh"
    //             ],
    //             "erf2": [],
    //             "erf3": [
    //                 "fh",
    //                 "fv"
    //             ],
    //             "brf1": [
    //                 "fv"
    //             ],
    //             "brf2": [],
    //             "brf3": [],
    //             "bodyColor": "#6779FE",
    //             "bgColor": "#FFFFFF",
    //             "eye1Color": "#000000",
    //             "eye2Color": "#000000",
    //             "eye3Color": "#000000",
    //             "eyeBall1Color": "#000000",
    //             "eyeBall2Color": "#000000",
    //             "eyeBall3Color": "#000000",
    //             "gradientColor1": "#6779FE",
    //             "gradientColor2": "#AC59FC",
    //             "gradientType": "linear",
    //             "gradientOnEyes": "true",
    //             "logo": "https://new-mezcalmose-website.firebaseapp.com/assets/img/logo/logo.png", //"https://firebasestorage.googleapis.com/v0/b/mezcalmos-31f1c.appspot.com/o/logo%402x.png?alt=media&token=4a18a710-e267-40fd-8da7-8c12423cc56d",//"8bca5bfcf253b24ea2d42ba071e481a9e4129697.png",
    //             "logoMode": "clean"
    //         },
    //         "size": 300,
    //         "download": "imageUrl",
    //         "file": "png",
    //     }
    // };
      
    // await axios.request(options).then(function (response) {
    //       console.log(response.data);
    //   }).catch(function (error) {
    //       console.error(error);
    //   });
    // return "a"
