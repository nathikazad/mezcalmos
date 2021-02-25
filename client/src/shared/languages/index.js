import en from './en.json'
import es from './es.json'
let userLanguage = navigator.language.split('-')[0];
let existingLanguages = {
    'en': true,
    'es': true
}
export const defaultLocale = !existingLanguages[userLanguage] ? 'en' : userLanguage



export const languages = {
    en: en,
    es: es,
}