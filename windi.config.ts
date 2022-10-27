import { defineConfig } from 'vite-plugin-windicss'
import colors from 'windicss/colors'

export default defineConfig({
  extract: {
    include: [
      'app/views/**/*.{html,erb}',
      'app/helpers/**/*.rb',
      'app/javascript/**/*.{js,ts,jsx,tsx}',
    ],
  },
  plugins: [
    require('windicss/plugin/aspect-ratio'),
    require('@windicss/plugin-scrollbar'),
  ],
  theme: {
    extend: {
      colors: {
        transparent: 'transparent',
        current: 'currentColor',
        black: colors.black,
        white: colors.white,
        red: colors.red,
        orange: colors.orange,
        yellow: colors.yellow,
        green: colors.green,
        gray: colors.blueGray,
        indigo: {
          100: '#e6e8ff',
          300: '#b2b7ff',
          400: '#7886d7',
          500: '#6574cd',
          600: '#5661b3',
          800: '#2f365f',
          900: '#191e38',
        },
      },
    },
  },
})