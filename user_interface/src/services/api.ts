import { provideApolloClient } from "@vue/apollo-composable";
import { apolloClient } from '@/plugins/graphql'
import type { GraphQLType } from "graphql";

export function fetch(query: GraphQLType) {
  const data =
    apolloClient.query({ query }).then((result) => {
      console.debug(result.data)
      return result.data
    }).catch((error) => {
      console.debug(error)
      return error
    })

  return data
}
