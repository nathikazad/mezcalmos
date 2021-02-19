import Vue from "vue";
import VueI18n from 'vue-i18n'
import {
    languages
} from '../languages/index.js'
import {
    defaultLocale
} from '../languages/index.js'
//Internationalization
Vue.use(VueI18n)

const messages = Object.assign(languages)

export const i18n = new VueI18n({
    locale: defaultLocale,
    fallbackLocale: 'en',
    messages
})