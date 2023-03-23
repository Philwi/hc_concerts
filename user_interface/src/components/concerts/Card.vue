<template lang="pug">
.bg-yellow-300.rounded-lg.h-64.mt-8
  .flex.justify-space-between.items-center.h-full.text-center
    .flex-1
      .flex.justify-center.items-center.flex-col
        img.h-24.w-24.rounded-full.m-4(:src="concert.image")
        .text-4xl.font-bold.font-headline {{ concert.title }}
    .flex-2(class="w-[65%]")
      .flex.justify-center.items-center.text-left.w-full
        .text-3xl.font-headline.justify-center.w-full
          | Beschreibung: {{ concert.description }}
          br
          | Bands: {{ concert.bands.join(', ') }}
          br
          | Stadt: {{ concert.city }}
          br
          | Venue: {{ concert.venue }}
          br
          | Preis: {{ intlPrice(concert.price) }}

    .flex-1.min-w-md
      .flex.justify-center.items-center
        .text-3xl.font-headline.text-center.justify-center
          | {{ intlDate(concert.date) }}
          br
          | {{ concert.city }}
</template>

<script lang="ts">
import { defineComponent } from 'vue'
import type { Concert } from '@/types'

export default defineComponent({
  name: 'ConcertsCard',
  props: {
    concert: {
      type: Object as () => Concert,
      required: true,
    },
  },
  methods: {
    intlDate(date: string) {
      const options = {
        year: 'numeric',
        month: 'long',
        day: 'numeric',
      }
      return new Date(date).toLocaleDateString('de-DE', options)
    },
    intlPrice(price: string) {
      return new Intl.NumberFormat('de-DE', {
        style: 'currency',
        currency: 'EUR',
      }).format(price)
    },
  }
})
</script>
