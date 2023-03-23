<script setup lang="ts">
import { useConcertsStore } from '@/stores'
import { storeToRefs } from 'pinia'

const concertStore = useConcertsStore()
const { filtered, concertsCount } = storeToRefs(concertStore)
</script>

<template lang="pug">
div.bg-concerts_bg.h-full.w-screen.bg-cover.bg-center.bg-fixed
  div.container.mx-auto
    h1.text-4xl.font-bold.display.font-headline.text-center.p-6 {{ concertsCount }} Konzerte insgesamt
    ConcertsSearch
    ThePagination(:paginateable="filtered" :paginate="concertStore.paginate").mt-4
    ul(class="xl:justify-between xl:flex-row")
      template(v-for="concert in concertStore.paginated")
        ConcertsCard(:concert="concert")
    template(v-if="concertStore.paginated.length === 0")
      .bg-yellow-300.p-4.rounded
        h1.text-4xl.font-bold.display.font-headline.text-center Keine Konzerte gefunden
        div.text-2xl.font-bold.display.font-headline.text-center
          | Du kannst ein Konzert&nbsp;
          RouterLink(to="/add" class="underline") hinzufügen
          | .
        div.text-2xl.font-bold.display.font-headline.text-center
          | Du kannst auch die&nbsp;
          RouterLink(to="/contact" class="underline") Kontaktseite
          | &nbsp;besuchen.
        div.text-2xl.font-bold.display.font-headline.text-center
          | Oder du&nbsp; kannst dir
          RouterLink(to="/" class="underline") alle Konzerte
          | &nbsp;anzeigen lassen.
    ThePagination(:paginateable="filtered" :paginate="concertStore.paginate").mt-4.pb-4
</template>

<script lang="ts">
import { defineComponent } from 'vue'
import ConcertsCard from '@/components/concerts/Card.vue'
import ConcertsSearch from '@/components/concerts/Search.vue'
import ThePagination from '@/components/Pagination.vue'

export default defineComponent({
  name: 'ConcertsPage',
  components: {
    ConcertsCard, ConcertsSearch, ThePagination,
  },
  methods: {
  }
})
</script>
