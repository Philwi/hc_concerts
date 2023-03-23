import { defineStore } from 'pinia'
import { fetch } from '@/services/api'
import { ConcertsQuery } from '@/plugins/graphql'
import type { Concert } from '@/types'

export const useConcertsStore = defineStore('concert', {
  state: () => {
    return {
      concerts: [] as Concert[],
      filtered: [] as Concert[],
      paginated: [] as Concert[],
    }
  },
  actions: {
    async queryConcerts() {
      const result = await fetch(ConcertsQuery)
      console.debug("store", result)

      this.concerts = result.concerts
      this.filtered = result.concerts
      this.paginate(1)
    },
    filterConcerts(search: string) {
      this.filtered = this.concerts

      if (search.length > 0) {
        this.filtered = this.concerts.filter((concert) => {
          if (concert.title.toLowerCase().includes(search.toLowerCase())) return true
          if (concert.venue.toLowerCase().includes(search.toLowerCase())) return true
          if (concert.city && concert.city.toLowerCase().includes(search.toLowerCase())) return true
          if (concert.date.toLowerCase().includes(search.toLowerCase())) return true
          if (concert.description.toLowerCase().includes(search.toLowerCase())) return true
          if (concert.bands.some((band: string) => band.toLowerCase().includes(search.toLowerCase()))) return true

          return false
        })
      } else {
        this.filtered = this.concerts
        this.paginate(1)
      }
    },
    paginate(page: number) {
      const perPage = 10
      const start = (page - 1) * perPage
      const end = start + perPage

      this.paginated = this.filtered.slice(start, end)
    }
  },

  getters: {
    topConcerts: (state) => {
      const top = state.concerts.filter((concert) => concert.image !== null)
      const upcoming = top.filter((concert) => new Date(concert.date) > new Date())
      const next = upcoming.sort((a, b) => new Date(a.date).getTime() - new Date(b.date).getTime()).slice(0, 3)

      return next
    },
    concertsCount: (state) => state.concerts.length,
  }
})
