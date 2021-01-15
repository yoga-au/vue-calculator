<template>
  <input type="text" v-model="calculatorOutput">
  <div>Result {{ result }}</div>
  <div class="numpad-container">
	<div class="numpad" @click="clear">AC</div>
	<div class="numpad" @click="numOne">1</div>
	<div class="numpad" @click="numTwo">2</div>
	<div class="numpad" @click="numThree">3</div>
	<div class="numpad" @click="plus">+</div>
	<div class="numpad" @click="minus">-</div>
	<div class="numpad" @click="evaluate">=</div>
  </div>
</template>

<script>
import { Parser } from 'expr-eval'

export default {
	data() {
		return {
			calculatorOutput: '',
			result: '',
		}
	},

	updated() {
		console.log(this.calculatorOutput)
	},

	methods: {
		clear() {
			this.calculatorOutput = ''
			this.result = ''
		},
		numOne() {
			this.calculatorOutput = this.calculatorOutput.concat('1')
		},
		numTwo() {
			this.calculatorOutput = this.calculatorOutput.concat('2')
		},
		numThree() {
			this.calculatorOutput = this.calculatorOutput.concat('3')
		},
		plus() {
			this.calculatorOutput = this.calculatorOutput.concat(' + ')
		},
		minus() {
			this.calculatorOutput = this.calculatorOutput.concat(' - ')
		},
		evaluate() {
			this.result = Parser.evaluate(this.calculatorOutput)
			console.log(this.result)
		}
	}
}
</script>

<style>
	.numpad-container {
		width: 320px;
		margin: 0 auto;
		/* border: 1px solid black; */
		display: flex;
		justify-content: center;
	}

	.numpad {
		padding: 1em;
		border: 1px solid black;
		flex-grow: 1;
		flex-wrap: wrap;
		cursor: pointer;
	}

</style>