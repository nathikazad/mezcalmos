import axios from "axios";


export async function generateQr(qrData:string): Promise<string|null>  {
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

        return data['imageUrl'];
    } catch (error) {
        console.log(`Error Happend when generating the QR code:\n${error}`);
        return null;
    }
};