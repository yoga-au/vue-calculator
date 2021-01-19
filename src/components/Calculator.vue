<template>
	<div>{{ output }}</div>
	<input type="text" v-model="screen">
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
			screen: '',
			result: '',
			output: ''
		}
	},

	updated() {
		console.log(this.output)
	},

	methods: {
		clear() {
			this.screen = ''
			this.result = ''
			this.output = ''
		},
		numOne() {
			this.screen = this.screen.concat('1')
		},
		numTwo() {
			this.screen = this.screen.concat('2')
		},
		numThree() {
			this.screen = this.screen.concat('3')
		},
		plus() {
			this.screen = this.screen.concat(' + ')
			this.output = this.output.concat(this.screen)
			this.screen = ''
		},
		minus() {
			this.screen = this.screen.concat(' - ')
			this.output = this.output.concat(this.screen)
			this.screen = ''
		},
		evaluate() {
			this.output = this.output.concat(this.screen)
			// this.screen = ''
			this.result = Parser.evaluate(this.output).toString()
			this.screen = this.result
			// console.log(this.screen)
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