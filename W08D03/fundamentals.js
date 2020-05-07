function mysteryScoping1() {
    var x = 'out of block';
    if (true) {
        var x = 'in block';
        console.log(x);
    }
    console.log(x);
}

function mysteryScoping2() {
    const x = 'out of block';
    if (true) {
        const x = 'in block';
        console.log(x);
    }
    console.log(x);
}

function mysteryScoping3() {
    const x = 'out of block';
    if (true) {
        var x = 'in block';
        console.log(x);
    }
    console.log(x);
}

function mysteryScoping4() {
    let x = 'out of block';
    if (true) {
        let x = 'in block';
        console.log(x);
    }
    console.log(x);
}

function mysteryScoping5() {
    let x = 'out of block';
    if (true) {
        let x = 'in block';
        console.log(x);
    }
    let x = 'out of block again';
    console.log(x);
}
// Write a function that takes three strings - a verb, an adjective, and a noun - uppercases and interpolates them into the sentence "We shall VERB the ADJECTIVE NOUN".Use ES6 template literals.

// For example,
// > madLib('make', 'best', 'guac');
// "We shall MAKE the BEST GUAC."

function madLib (verb, adj, noun) {

    [verb, adj, noun].forEach(function (word) {
        word.toUpperCase();
    });

    console.log(`We shall ${verb} the ${adj} ${noun}.`)
};


// isSubstring
// Input

// 1) A String, called searchString.
// 2) A String, called subString.
//     Output: A Boolean.true if the subString is a part of the searchString.

// > isSubstring("time to program", "time")
// true

//     > isSubstring("Jump for joy", "joys")
// false

function isSubstring(searchString, subString) {
    const len = searchString.length - subString.length;
    var result = false;

    for (let i=0; i<len; i++) {
        var sub = searchString.slice(i, subString.length)
        if (sub === subString){
            result = true
        }
    }

    return result
};

// fizzBuzz
// 3 and 5 are magic numbers.

// Define a function fizzBuzz(array) that takes an array and returns a new array of every number in the array that is divisible by either 3 or 5, but not both.

function fizzBuzz(array) {
    fizzes = [];
    array.forEach (num) {
        if ()
    }
}

function fizzBuzzable

//     isPrime
// Define a function isPrime(number) that returns true if number is prime.Otherwise, false.Assume number is a positive integer.

// > isPrime(2)
// true

//     > isPrime(10)
// false

//     > isPrime(15485863)
// true

//     > isPrime(3548563)
// false
// sumOfNPrimes
// Using firstNPrimes, write a function sumOfNPrimes(n) that returns the sum of the first n prime numbers.Hint: use isPrime as a helper method.

// > sumOfNPrimes(0)
// 0

//     > sumOfNPrimes(1)
// 2

//     > sumOfNPrimes(4)
// 17