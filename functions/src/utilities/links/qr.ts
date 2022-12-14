import axios from "axios";
import { storage } from "firebase-admin";

export async function generateQr(path:string, qrData:string): Promise<string|null>  {
    try {
        const { data } = await axios.post(
            'https://api.qrcode-monkey.com/qr/custom',
            {
                "data": qrData,
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
                    "logo": "8bca5bfcf253b24ea2d42ba071e481a9e4129697.png",
                    "logoMode": "clean"
                },
                "size": 300,
                "download": "imageUrl",
                "file": "png",
            },
            {
                headers: {
                  'Content-Type': 'application/json',
                  'Accept': 'application/json',
                },
            },
        );
        let imgUrl : string | null | undefined = data['imageUrl']
        if (!imgUrl)
            return null
        else 
            return await uploadRestaurantQrImg(path, (data['imageUrl'] as string).replace('//', 'https://'));
    } catch (error) {
        console.log(`Error Happend when generating the QR code:\n${error}`);
        return null;
    }
};


async function uploadRestaurantQrImg(path:string , qrExternalUrl: string): Promise<string|null> {
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

        const bucket = storage().bucket('gs://mezcalmos-staging.appspot.com/')
        // const imageByteArray = new Uint8Array(b64);
        const file = bucket.file(`${path}/qr.png`);

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
    }
    // .then(response => {
        
    // })
    // .catch((err: any) => {
    //     console.log("[+] get :: ", qrExternalUrl, " :: EXCEPTION! :: ", err);
    //     return undefined
    // });
    
    return null;
  }
 