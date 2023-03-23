<template lang="pug">
.flex.justify-center
  button(
    v-if="currentPage > 1"
    @click="currentPage--"
    class="bg-yellow-300 hover:bg-yellow-400 text-yellow-800 font-bold py-2 px-4 rounded-l"
  )
    | ←
  button(
    v-show="pages > 1"
    v-for="page in pages"
    @click="currentPage = page"
    :class="{'bg-yellow-400': currentPage === page}"
    class="bg-yellow-300 hover:bg-yellow-400 text-yellow-800 font-bold py-2 px-4 rounded"
  )
    | {{ page }}
  button(
    v-if="currentPage < pages"
    @click="currentPage++"
    class="bg-yellow-300 hover:bg-yellow-400 text-yellow-800 font-bold py-2 px-4 rounded-r"
  )
    | →
</template>

<script lang="ts">
import { defineComponent } from 'vue'

export default defineComponent({
  name: 'ThePagination',
  components: {
  },
  data() {
    return {
      currentPage: 1,
      itemsPerPage: 10,
    }
  },
  props: {
    paginateable: {
      type: Array,
      required: true,
    },
    paginate: {
      type: Function,
      required: true,
    },
  },
  watch: {
    currentPage() {
      this.paginate(this.currentPage)
    }
  },
  computed: {
    pages() {
      return Math.ceil(this.paginateable.length / this.itemsPerPage)
    },
    paginated() {
      const start = (this.currentPage - 1) * this.itemsPerPage
      const end = start + this.itemsPerPage
      return this.paginateable.slice(start, end)
    },
  },
})

</script>
