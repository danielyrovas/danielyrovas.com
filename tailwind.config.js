/** @type {import('tailwindcss').Config} */
module.exports = {
  content: ["./templates/**/*.html"],
  theme: {
    extend: {
      colors: {
        primary: {
          1: "#dd6da4",
          2: "#e78db2",
        },
        secondary: {
          1: "#509594",
          2: "#509594",
        },
        background: {
          1: "#1b202b",
          2: "#6c93da",
        },
        text: {
          1: "#cdd5df",
        },
      },
      screens: {
        xs: "475px",
      },
    },
  },
  plugins: [],
};
