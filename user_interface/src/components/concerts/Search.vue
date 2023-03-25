<script setup lang="ts">
</script>
<template lang="pug">
.flex.flex-col.text-center
  form
    input.search.border-2.border-gray-300.bg-white.h-10.px-5.pr-16.rounded-lg.text-xl(
      v-model="search" type="text" placeholder="Search for concerts"
    )
    button.border-2.border-black.bg-yellow-300.h-10.px-5.pr-16.rounded-lg.text-xl.m-2.w-32(
      @click="filterConcerts"
      class="hover:bg-yellow-400 text-black font-bold text-transform: uppercase"
    ) Suchen
</template>

<script lang="ts">
import { defineComponent } from 'vue'
import { useConcertsStore } from '@/stores'

export default defineComponent({
  name: 'ConcertsSearch',
  data() {
    return {
      search: '',
    }
  },
  components: {
  },
  methods: {
    filterConcerts(event: Event) {
      event.preventDefault()

      const concertStore = useConcertsStore()
      concertStore.filterConcerts(this.search)
    }
  }
})
</script>
