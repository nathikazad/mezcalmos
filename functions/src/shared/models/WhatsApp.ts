
export interface TextMessage {
    body: string;
}
  
export interface LocationMessage {
    latitude: number;
    longitude: number;
}
  
export interface ImageMessage {
    id: string;
    url: string;
    mime_type: string;
    sha256: string;
    caption?: string;
}
  
export interface Message {
    from: string;
    id: string;
    type: string;
    timestamp: string;
    text?: TextMessage;
    location?: LocationMessage;
    image?: ImageMessage;
    driverId?:number
}
  
export interface Profile {
    name: string;
}
  
export interface Contact {
    profile: Profile;
    wa_id: string;
}
  
export interface ChangeValue {
    contacts: Array<Contact>;
    messages: Array<Message>;
    messaging_product: string;
    metadata: Metadata
}

export interface Metadata {
    display_phone_number: string;
    phone_number_id: string;
}
  
export interface Change {
    field: string;
    value: ChangeValue;
}
  
export interface Entry {
    changes: Array<Change>;
    id: string;
}
  