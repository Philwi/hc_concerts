import gql from 'graphql-tag'

export const ConcertsQuery = gql`
  query ConcertsQuery {
    concerts {
      id
      title
      description
      date
      venue
      city
      price
      bands
      image
    }
  }
`
