<template>
	<div>{{ output }}</div>
	<input class="screen" type="text" v-model="screen">
	<div class="numpad-container">
		<button class="numpad clear" @click="clear">AC</button>
		<button class="numpad delete" @click="deleteScreen">X</button>
		<button class="numpad" @click="plus" :disabled="disableOperator">+</button>
		<button class="numpad" @click="numOne" :disabled="disable">1</button>
		<button class="numpad" @click="numTwo" :disabled="disable">2</button>
		<button class="numpad" @click="numThree" :disabled="disable">3</button>
		<button class="numpad" @click="minus" :disabled="disableOperator">-</button>
		<button class="numpad" @click="numFour" :disabled="disable">4</button>
		<button class="numpad" @click="numFive" :disabled="disable">5</button>
		<button class="numpad" @click="numSix" :disabled="disable">6</button>
		<button class="numpad" @click="multiply" :disabled="disableOperator">x</button>
		<button class="numpad" @click="numSeven" :disabled="disable">7</button>
		<button class="numpad" @click="numEight" :disabled="disable">8</button>
		<button class="numpad" @click="numNine" :disabled="disable">9</button>
		<button class="numpad" @click="division" :disabled="disableOperator">/</button>
		<button class="numpad zero" @click="numZero" :disabled="disable">0</button>
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
			disableOperator: false,
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
			this.disableOperator = false
		},
		numTwo() {
			this.screen = this.screen.concat('2')
			this.disableOperator = false
		},
		numThree() {
			this.screen = this.screen.concat('3')
			this.disableOperator = false
		},
		numFour() {
			this.screen = this.screen.concat('4')
			this.disableOperator = false
		},
		numFive() {
			this.screen = this.screen.concat('5')
			this.disableOperator = false
		},
		numSix() {
			this.screen = this.screen.concat('6')
			this.disableOperator = false
		},
		numSeven() {
			this.screen = this.screen.concat('7')
			this.disableOperator = false
		},
		numEight() {
			this.screen = this.screen.concat('8')
			this.disableOperator = false
		},
		numNine() {
			this.screen = this.screen.concat('9')
			this.disableOperator = false
		},
		numZero() {
			this.screen = this.screen.concat('0')
			this.disableOperator = false
		},
		plus() {
			this.screen = this.screen.concat(' + ')
			this.output = this.output.concat(this.screen)
			this.screen = ''
			this.disableOperator = true
		},
		minus() {
			this.screen = this.screen.concat(' - ')
			this.output = this.output.concat(this.screen)
			this.screen = ''
			this.disableOperator = true
		},
		multiply() {
			this.screen = this.screen.concat(' * ')
			this.output = this.output.concat(this.screen)
			this.screen = ''
			this.disableOperator = true
		},
		division() {
			this.screen = this.screen.concat(' / ')
			this.output = this.output.concat(this.screen)
			this.screen = ''
			this.disableOperator = true
		},
		deleteScreen() {
			this.screen = this.screen.replace(this.screen.slice(-1), '');
		},
		evaluate() {
			this.output = this.output.concat(this.screen)
			// this.screen = ''
			this.result = Parser.evaluate(this.output)
			this.screen = this.result
			this.disable = true
			this.disableOperator = true
			// console.log(this.screen)
		}
	}
}
</script>

<style>
	.screen {
		max-width: 320px;
		width: 100%;
	}

	.numpad-container {
		max-width: 320px;
		margin: 0 auto;
		/* border: 1px solid black; */
		display: grid;
		grid-template-columns: repeat(4, 1fr);
		grid-template-rows: repeat(5, 1fr);
		align-items: center;
	}

	.numpad {
		padding: 1em;
		border: 1px solid black;
		cursor: pointer;
	}

	.numpad.clear {
		grid-column: 1 / span 2;
		grid-row: 1 / 2;
	}

	.numpad.delete {
		grid-column: 3 / 4;
	}

	.numpad.zero {
		grid-column: 1 / span 3;
	}
</style>