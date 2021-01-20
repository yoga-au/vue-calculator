<template>
	<div class="calculator">
		<div class="output">{{ output }}</div>
		<input class="screen" type="text" v-model="screen">
		<div class="numpad-container">
			<button class="numpad clear" @click="clear">AC</button>
			<button class="numpad delete" :class="{ disabled: disable }" @click="deleteScreen">
				<svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="currentColor" class="bi bi-backspace" viewBox="0 0 16 16">
					<path d="M5.83 5.146a.5.5 0 0 0 0 .708L7.975 8l-2.147 2.146a.5.5 0 0 0 .707.708l2.147-2.147 2.146 2.147a.5.5 0 0 0 .707-.708L9.39 8l2.146-2.146a.5.5 0 0 0-.707-.708L8.683 7.293 6.536 5.146a.5.5 0 0 0-.707 0z"/>
					<path d="M13.683 1a2 2 0 0 1 2 2v10a2 2 0 0 1-2 2h-7.08a2 2 0 0 1-1.519-.698L.241 8.65a1 1 0 0 1 0-1.302L5.084 1.7A2 2 0 0 1 6.603 1h7.08zm-7.08 1a1 1 0 0 0-.76.35L1 8l4.844 5.65a1 1 0 0 0 .759.35h7.08a1 1 0 0 0 1-1V3a1 1 0 0 0-1-1h-7.08z"/>
				</svg>
			</button>
			<button class="numpad operator" :class="{ disabled: disable }" @click="plus" :disabled="disableOperator"> + </button>
			<button class="numpad number" :class="{ disabled: disable }" @click="numOne" :disabled="disable"> 1 </button>
			<button class="numpad number" :class="{ disabled: disable }" @click="numTwo" :disabled="disable"> 2 </button>
			<button class="numpad number" :class="{ disabled: disable }" @click="numThree" :disabled="disable"> 3 </button>
			<button class="numpad operator" :class="{ disabled: disable }" @click="minus" :disabled="disableOperator"> - </button>
			<button class="numpad number" :class="{ disabled: disable }" @click="numFour" :disabled="disable"> 4 </button>
			<button class="numpad number" :class="{ disabled: disable }" @click="numFive" :disabled="disable"> 5 </button>
			<button class="numpad number" :class="{ disabled: disable }" @click="numSix" :disabled="disable"> 6 </button>
			<button class="numpad operator" :class="{ disabled: disable }" @click="multiply" :disabled="disableOperator"> x </button>
			<button class="numpad number" :class="{ disabled: disable }" @click="numSeven" :disabled="disable"> 7 </button>
			<button class="numpad number" :class="{ disabled: disable }" @click="numEight" :disabled="disable"> 8 </button>
			<button class="numpad number" :class="{ disabled: disable }" @click="numNine" :disabled="disable"> 9 </button>
			<button class="numpad operator" :class="{ disabled: disable }" @click="division" :disabled="disableOperator"> / </button>
			<button class="numpad zero" :class="{ disabled: disable }" @click="numZero" :disabled="disable"> 0 </button>
			<button class="numpad evaluate" :class="{ disabled: disable }" @click="evaluate" :disabled="disable"> = </button>
		</div>
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
	.calculator {
		border: .5px solid rgba(255, 255, 255, .3);
		max-width: 320px;
		width: 100%;
		margin: 0 auto;
	}

	.output {
		height: 1rem;
		padding: .5rem .5rem 0;
		text-align: right;
		font-size: .8rem;
		opacity: .5;
	}

	.screen {
		max-width: 320px;
		width: 100%;
		font-size: 3rem;
		padding: .5rem;
		text-align: right;
		border: none;
		background: none;
		color: white;
		opacity: .8;
		border-bottom: 1px solid rgba(255, 255, 255, .3)
	}

	.numpad-container {
		max-width: 320px;
		margin: 0 auto;
		display: grid;
		grid-template-columns: repeat(4, 1fr);
		grid-template-rows: repeat(5, 1fr);
		align-items: center;
		/* border: .5px solid rgba(255, 255, 255, .16); */
	}

	.numpad {
		padding: 1em;
		border: .5px solid rgba(255, 255, 255, .04);
		cursor: pointer;
		font-size: 1.25rem;
		/* font-weight: bold; */
		opacity: .8;
		transition: all .2s ease-out;
	}

	.numpad:hover {
		background: #353234;
	}

	.numpad.disabled {
		opacity: .2;
		cursor: default;
	}

	.numpad.disabled:hover {
		background: none;
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

	.numpad.evaluate {
		background: #41B883;
		color: black;
	}

	.numpad.evaluate:hover {
		background: #278a5d;
		color: black;
	}

	.numpad.evaluate.disabled:hover {
		background: #41B883;
	}
</style>