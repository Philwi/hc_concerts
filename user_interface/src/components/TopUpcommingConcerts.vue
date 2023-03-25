<script setup lang="ts">
import { useConcertsStore } from '@/stores'
import { storeToRefs } from 'pinia'

const concertStore = useConcertsStore()
const { topConcerts } = storeToRefs(concertStore)
</script>

<template lang="pug">
div.bg-black.text-yellow-300.p-4
  h1.text-4xl.font-bold.display.font-headline.text-center.p-6 Top Konzerte
  ul.flex.justify-center.items-center.pr-24.pl-24.flex-col(class="xl:justify-between xl:flex-row")
    template(v-for="concert in topConcerts")
      li.text-center.items-center.p-4.rounded(class="xl:w-1/3")
        img.h-48.w-48.rounded-full.m-auto(:src="concert.image")
        .text-3xl.font-headline
          | {{ concert.title }}
          br
          | {{ intlDate(concert.date) }}
          br
          | {{ concert.city }}
</template>

<script lang="ts">
import { defineComponent } from 'vue'

export default defineComponent({
  name: 'TopUpcommingConcerts',
  methods: {
    intlDate(date: string) {
      // TODO: Use i18n
      return new Date(date).toLocaleDateString('de-DE', {
        year: 'numeric',
        month: 'long',
        day: 'numeric',
      })
    },
  },
})
</script>
