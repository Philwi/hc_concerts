import { createApp } from 'vue'
import { createPinia } from 'pinia'
import { useConcertsStore } from '@/stores'

import App from './App.vue'
import router from './router'

import './assets/main.css'

const app = createApp(App)

app.use(createPinia())
app.use(router)

app.mount('#app')

setup()

function setup() {
  const concerts = useConcertsStore()
  concerts.queryConcerts()
}
