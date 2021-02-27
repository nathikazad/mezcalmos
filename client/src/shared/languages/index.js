import en from './en.json'
import es from './es.json'
import {
    getBrowserLanguage
  } from '@/shared/mixins/functions'

export const defaultLocale = getBrowserLanguage()



export const languages = {
    en: en,
    es: es,
}