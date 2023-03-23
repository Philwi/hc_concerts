<template lang="pug">
select.y-2.rounded.bg-yellow-300.p-2.text-xl
  option(v-for="language in languages" :value="language.code" @click="changeLocale(language.code)") {{ language.flag }} {{ language.name }}
</template>

<script lang="ts">
import { defineComponent } from 'vue'

export default defineComponent({
  name: 'TheLanguageChooser',
  data() {
    return {
      languages: [
        { name: 'English', code: 'en', flag: '🇬🇧' },
        { name: 'Deutsch', code: 'de', flag: '🇩🇪' }
      ],
    }
  },
  methods: {
    changeLocale(locale: string) {
      // TODO: Install vue-i18n and use it here
      // this.$i18n.locale = locale
    },
  },
})
</script>

