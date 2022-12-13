import axios from "axios";
import { storage } from "firebase-admin";

export async function generateQr(path:string, qrData:string): Promise<string|null>  {
    Storage
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

    const res : string | undefined = await axios
    .get(qrExternalUrl, {
      responseType: 'arraybuffer'
    })
    .then(response => {
        
        // const b64 = Buffer.from(response.data, 'binary').toString('base64');
        const b64 = Buffer.from(response.data, 'binary');
        const bucket = storage().bucket('gs://mezcalmos-staging.appspot.com')
        // const imageByteArray = new Uint8Array(b64);
        const file = bucket.file(`${path}/qr.png`);
        return file.save(b64)
        .then(() => {
            return file.baseUrl;
        })
        .catch((err: any) => {
            console.log(`Unable to upload encoded file ${err}`)
            return undefined
        })
    })
    .catch(() => undefined);
    
    return !res ? null : res;
  }
 