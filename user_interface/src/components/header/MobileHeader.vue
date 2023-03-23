<template lang="pug">
header.bg-yellow-300.min-h-content
  .flex.items-center.justify-center.h-full(class="md:justify-end")
    #showMenu.cursor-pointer.items-center.h-full(@click="toggleMenu")
      img.h-28(src='@/assets/logos/Menu.svg' alt='Menu icon')
  nav.flex.items-center.hidden.h-full
    ul.w-full.justify-center.items-center
      .text-4xl.font-bold.font-headline.text-center HC & Punk Konzerte
      img.h-48.w-48.rounded-full.m-4.m-auto(src="@/assets/logo.png")
      hr.m-4.border-black.border(class="border-opacity-50 opacity-50")
      ul
        template(v-for="item in navigation")
          li.mr-4.p-4.rounded(:class="{ 'bg-yellow-400': $route.path === item.path }")
            .text-3xl.font-headline.text-center.justify-center
              RouterLink(:to="item.path") {{ item.name }}
      hr.m-4.border-black.border(class="border-opacity-50 opacity-50")
      div.text-center
        TheLanguageChooser
</template>

<script lang="ts">
import { defineComponent } from 'vue'
import { RouterLink } from 'vue-router'
import TheLanguageChooser from '@/components/TheLanguageChooser.vue'

export default defineComponent({
  name: 'MobileHeader',
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
      menuIsOpen: false,
    }
  },
  methods: {
    toggleMenu() {
      const menu = document.querySelector('nav')
      menu?.classList.toggle('hidden')
      this.menuIsOpen = !this.menuIsOpen
    },
  },
})
</script>
