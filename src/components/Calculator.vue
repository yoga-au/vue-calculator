<template>
	<div>{{ output }}</div>
	<input type="text" v-model="calculatorScreen">
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
			calculatorScreen: '',
			result: '',
			output: ''
		}
	},

	updated() {
		console.log(this.output)
	},

	methods: {
		clear() {
			this.calculatorScreen = ''
			this.result = ''
		},
		numOne() {
			this.calculatorScreen = this.calculatorScreen.concat('1')
		},
		numTwo() {
			this.calculatorScreen = this.calculatorScreen.concat('2')
		},
		numThree() {
			this.calculatorScreen = this.calculatorScreen.concat('3')
		},
		plus() {
			this.calculatorScreen = this.calculatorScreen.concat(' + ')
			this.output = this.output.concat(this.calculatorScreen)
			this.calculatorScreen = ''
		},
		minus() {
			this.calculatorScreen = this.calculatorScreen.concat(' - ')
			this.output = this.output.concat(this.calculatorScreen)
			this.calculatorScreen = ''
		},
		evaluate() {
			this.output = this.output.concat(this.calculatorScreen)
			// this.calculatorScreen = ''
			this.result = Parser.evaluate(this.output)
			this.calculatorScreen = this.result
			// console.log(this.calculatorScreen)
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