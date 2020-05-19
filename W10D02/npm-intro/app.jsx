import React from "react";
import ReactDOM from 'react-dom';
import Calculator from './calculator';


// Renders a SimpleComponent into #root.
document.addEventListener('DOMContentLoaded', function () {
    const root = document.querySelector('#root');
    ReactDOM.render(<Calculator />, root);
});