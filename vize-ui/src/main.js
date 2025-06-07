import {createApp} from 'vue'
import {createPinia} from 'pinia'

import App from './App.vue'
import router from './router'
import BoardList from "@/components/BoardList.vue";

const app = createApp(App)

app.use(createPinia())
app.use(router)

app.component('BoardList', BoardList)
app.mount('#app')
