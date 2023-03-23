import { ApolloClient, InMemoryCache } from '@apollo/client/core'
import { createApolloProvider } from '@vue/apollo-option'

const cache = new InMemoryCache()

export const apolloClient = new ApolloClient({
  cache,
  uri: `${import.meta.env.VITE_API_URL}/graphql`,
})

export const apolloProvider = createApolloProvider({
  defaultClient: apolloClient,
})
