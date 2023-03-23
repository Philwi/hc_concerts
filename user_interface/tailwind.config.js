/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    './src/**/*.html',
    './src/**/*.vue'
  ],
  theme: {
    extend: {},
    fontFamily: {
      headline: ['Underdog'],
    },
    backgroundImage: {
      'concerts_bg': "url('./src/assets/concerts_bg.jpg')",
    }
  },
  plugins: [],
  fontFamily: {
    headline: ['Underdog'],
  }
}
