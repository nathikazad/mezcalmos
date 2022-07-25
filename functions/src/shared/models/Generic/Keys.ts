export interface Twilio {
  accountid: string;
  authtoken: string;
}

export interface Hasura {
  key: string;
  url: string;
}

export interface Stripe {
  publickey: string,
  secretkey: string,
  accountupdatedsigningsecret: string
}

export interface Fcm {
  key: string;
}

export interface Keys {
  twilio?: Twilio;
  hasura?: Hasura;
  fcm?: Fcm;
  stripe: Stripe,
  serviceAccount?: string | undefined;
  databaseURL?: string | undefined;
}
