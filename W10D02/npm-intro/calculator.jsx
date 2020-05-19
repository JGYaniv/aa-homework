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
        this.updateResult()
    }

    setNum2(e){
        let num = parseInt(e.currentTarget.value)
        this.setState({num2: num})
        this.updateResult()
    }

    updateResult(){
        if (this.state.num1 && this.state.num2){
            let sum = (this.state.num1 + this.state.num2)
            this.setState({ result: `${sum}` })
        } else {
            this.setState({ result: "..." })
        }
    }

    render() {
        return (
            <div>
                <h1>I'm a calculator!</h1>
                <input onChange={this.setNum1} value={this.state.num1}></input>
                <input onChange={this.setNum2} value={this.state.num2}></input>
                <p>Here's my result: {this.state.result}</p>
                <p>num1: {this.state.num1}</p>
                <p>num2: {this.state.num2}</p>
            </div>
        );
    }
}

export default Calculator;