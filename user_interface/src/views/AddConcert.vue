<template lang="pug">
div.bg-concerts_bg.h-full.w-screen.bg-cover.bg-center.bg-fixed
  div.container.mx-auto
    form.flex.flex-col.justify-center.items-center
      input.search.border-2.border-gray-300.bg-white.h-10.px-5.pr-16.rounded-lg.text-xl(v-model="title" type="text" placeholder="Konzertname")
      input.search.border-2.border-gray-300.bg-white.h-10.px-5.pr-16.rounded-lg.text-xl(v-model="date" type="date" placeholder="Datum")
      input.search.border-2.border-gray-300.bg-white.h-10.px-5.pr-16.rounded-lg.text-xl(v-model="city" type="text" placeholder="Stadt")
      input.search.border-2.border-gray-300.bg-white.h-10.px-5.pr-16.rounded-lg.text-xl(v-model="image" type="text" placeholder="Bild")
      input.search.border-2.border-gray-300.bg-white.h-10.px-5.pr-16.rounded-lg.text-xl(v-model="description" type="text" placeholder="Beschreibung")
      input.search.border-2.border-gray-300.bg-white.h-10.px-5.pr-16.rounded-lg.text-xl(v-model="price" type="text" placeholder="Preis")
      input.search.border-2.border-gray-300.bg-white.h-10.px-5.pr-16.rounded-lg.text-xl(v-model="venue" type="text" placeholder="Venue")
      input.search.border-2.border-gray-300.bg-white.h-10.px-5.pr-16.rounded-lg.text-xl(v-model="bands" type="text" placeholder="Bands")

      button.border-2.border-black.bg-yellow-300.h-10.px-5.pr-16.rounded-lg.text-xl.m-2.w-32(
        @click="filterConcerts"
        class="hover:bg-yellow-400 text-black font-bold text-transform: uppercase"
      ) Senden



</template>

<script lang="ts">
import { defineComponent } from 'vue'

export default defineComponent({
  name: 'AddConcert',
  data() {
    return {
      title: '',
      date: '',
      city: '',
      image: '',
      description: '',
      price: '',
      venue: '',
      bands: [],
    }
  },
})
</script>
