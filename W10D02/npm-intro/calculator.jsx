import React from "react";

class Calculator extends React.Component {
    constructor(props) {
        super(props);
        this.state = {num1: "", num2: "", result: 0}
        this.setNum1 = this.setNum1.bind(this);
        this.setNum2 = this.setNum2.bind(this);
        this.updateResult = this.updateResult.bind(this);
    }

    setNum1(e){
        let num = parseInt(e.currentTarget.value)
        this.setState({num1: num})
    }

    setNum2(e){
        let num = parseInt(e.currentTarget.value)
        this.setState({num2: num})
    }

    updateResult(e){
        const { num1, num2 } = this.state;
        let operand = e.currentTarget.value
        let sum = 0
        if (this.state.num1 && this.state.num2){
            switch(operand){
                case "+": 
                    sum = num1 + num2;break;
                case "-": 
                    sum = num1 - num2;break;
                case "*": 
                    sum = num1 * num2;break;
                case "/": 
                    sum = num1 / num2;break;
            }
            this.setState({ result: sum })
        } else {
            this.setState({ result: "..." })
        }
    }

    render() {
        const {num1, num2, result} = this.state;
        return (
            <div>
                <h1>I'm a calculator!</h1>
                <input onChange={this.setNum1} value={num1}></input>
                <input onChange={this.setNum2} value={num2}></input>
                <button onClick={this.updateResult} value="+">+</button>
                <button onClick={this.updateResult} value="-">-</button>
                <button onClick={this.updateResult} value="*">*</button>
                <button onClick={this.updateResult} value="/">/</button>
                <p>Here's my result: {result}</p>
            </div>
        );
    }
}

export default Calculator;