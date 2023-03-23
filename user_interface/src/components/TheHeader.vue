<template lang="pug">
div(class="xl:hidden")
  MobileHeader

div(class="hidden xl:block")
  DesktopHeader

</template>

<script lang="ts">
import { defineComponent } from 'vue'
import DesktopHeader from '@/components/header/DesktopHeader.vue'
import MobileHeader from '@/components/header/MobileHeader.vue'

export default defineComponent({
  name: 'TheHeader',
  components: {
    DesktopHeader, MobileHeader,
  },
})
</script>
