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
        ThePagination(:paginateable="filtered" :paginate="concertStore.paginate")
        ul(class="xl:justify-between xl:flex-row")
          template(v-for="concert in concertStore.paginated")
            ConcertsCard(:concert="concert")
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
