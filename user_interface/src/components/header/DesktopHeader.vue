<template lang="pug">
header.bg-yellow-300
  nav.flex.items-center
    .flex-1.w-full
      .flex.justify-center.items-center
        img.h-24.w-24.rounded-full.m-4(src="@/assets/logo.png")
        .text-4xl.font-bold.font-headline HC & Punk Konzerte

    .flex-1.w-full
      ul.flex
        template(v-for="item in navigation")
          .flex-1.w-full
            li.mr-4.p-8.rounded(:class="{ 'bg-yellow-400': $route.path === item.path }")
              .text-3xl.font-headline.text-center.justify-center
                RouterLink(:to="item.path") {{ item.name }}

    .flex-1.w-auto.text-right
      TheLanguageChooser
</template>

<script lang="ts">
import { defineComponent } from 'vue'
import { RouterLink } from 'vue-router'
import TheLanguageChooser from '@/components/TheLanguageChooser.vue'

export default defineComponent({
  name: 'DesktopHeader',
  components: {
    RouterLink, TheLanguageChooser,
  },
  data() {
    return {
      navigation: [
        { name: 'Konzerte', path: '/' },
        { name: 'Hinzufügen', path: '/add' },
        { name: 'Kontakt', path: '/contact' },
      ],
    }
  },
})
</script>
