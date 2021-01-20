<template>
  <h1 class="title">Vue Calculator</h1>
  <p class="sub-title">A simple calculator build solely with Vue.js</p>
  <Calculator style="margin-bottom: 2rem" />
  <!-- <a href="http://v3.vuejs.org/" target="_blank" rel="noopener noreferrer"><img src="./assets/logo.png" width="50" height="50" alt="Vue logo"></a> -->
</template>

<script>
import Calculator from './components/Calculator.vue'

export default {
  name: 'App',
  components: {
    Calculator
  },
}
</script>

<style>
  #app {
    font-family: 'Rubik', sans-serif;
    -webkit-font-smoothing: antialiased;
    -moz-osx-font-smoothing: grayscale;
    text-align: center;
    color: white;
    margin-top: 60px;
  }

  .title {
    margin-bottom: 1rem;
  }

  .sub-title {
    margin-bottom: 2rem;
    opacity: .5;
  }
</style>
