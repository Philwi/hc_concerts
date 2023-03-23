<script setup lang="ts">
import { RouterView } from 'vue-router'
import TheHeader from '@/components/TheHeader.vue'
import TopUpcommingConcerts from '@/components/TopUpcommingConcerts.vue'
</script>

<template lang="pug">
TheHeader
TopUpcommingConcerts
RouterView
</template>
