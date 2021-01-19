<template>
	<div>{{ output }}</div>
	<input type="text" v-model="screen">
	<div class="numpad-container">
		<button class="numpad" @click="clear">AC</button>
		<button class="numpad" @click="numOne" :disabled="disable">1</button>
		<button class="numpad" @click="numTwo" :disabled="disable">2</button>
		<button class="numpad" @click="numThree" :disabled="disable">3</button>
		<button class="numpad" @click="plus" :disabled="disable">+</button>
		<button class="numpad" @click="minus" :disabled="disable">-</button>
		<button class="numpad" @click="evaluate" :disabled="disable">=</button>
	</div>
</template>

<script>
import { Parser } from 'expr-eval'

export default {
	data() {
		return {
			screen: '',
			result: '',
			output: '',
			disable: false,
		}
	},

	// updated() {
	// 	console.log(this.output)
	// },

	methods: {
		clear() {
			this.screen = ''
			this.result = ''
			this.output = ''
			this.disable = false
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
			this.disable = true
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