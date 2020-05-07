// Additional JS Intro Problems
// Code up the following functions and run them in Node.

// Phase I: Callbacks
// Write a function titleize that takes an array of names and a function (callback). titleize should use Array.prototype.map to create a new array full of titleized versions of each name - titleize meaning "Roger" should be made to read "Mx. Roger Jingleheimer Schmidt". Then pass this new array of names to the callback, which should use Array.prototype.forEach to print out each titleized name.

// > titleize(["Mary", "Brian", "Leo"], printCallback);
// Mx. Mary Jingleheimer Schmidt
// Mx. Brian Jingleheimer Schmidt
// Mx. Leo Jingleheimer Schmidt
// undefined
// Make sure it works before moving on!

function titleize(arr, callback){
    const newArr = arr.map(arg => {
       return `Mx. ${arg} Jingleheimer Schmidt`
    });
    return callback(newArr);
}


function printCallback(arr){
    arr.forEach(el => console.log(el));
}

// Phase II: Constructors, Prototypes, and this
// First write a constructor function for an elephant. Each elephant should have a name, height (in inches), and array of tricks in gerund form (e.g. "painting a picture" rather than "paint a picture").

// Next write a few prototype functions that will be shared among all elephants:

function Elephant (name, height, tricks) {
    this.name = name;
    this.height = height;
    this.tricks = tricks;
}

Elephant.prototype.trumpet = function(){
    console.log(`${this.name} the elephant goes 'phrRRRRRRR!!!!!!!`);
}

Elephant.prototype.grow = function(){
    this.height += 12;
}
Elephant.prototype.addTrick = function(trick){
    this.tricks.push(trick);
}

Elephant.prototype.play = function(){
    var num = Math.floor(Math.random() * this.tricks.length);
    console.log(`${this.name} is ${this.tricks[num]}`);
};



// Elephant.prototype.trumpet: should print "(name) the elephant goes 'phrRRRRRRRRRRR!!!!!!!'"
// Elephant.prototype.grow: should increase the elephant's height by 12 inches
// Elephant.prototype.addTrick(trick): add a new trick to their existing repertoire
// Elephant.prototype.play: print out a random trick, e.g. "(name) is (trick)!"
// Hint: look up some JS Math methods!
// Make sure to create an elephant and test all of these functions out on them method style!

// Phase III: Function Invocation
// First, let's make a few elephants so we have a small herd. Feel free to copy the code below, or to make your own with any attributes you like. Make sure to store all of our elephants in an array.

let ellie = new Elephant("Ellie", 185, ["giving human friends a ride", "playing hide and seek"]);
let charlie = new Elephant("Charlie", 200, ["painting pictures", "spraying water for a slip and slide"]);
let kate = new Elephant("Kate", 234, ["writing letters", "stealing peanuts"]);
let micah = new Elephant("Micah", 143, ["trotting", "playing tic tac toe", "doing elephant ballet"]);

let herd = [ellie, charlie, kate, micah];
// Now let's create a function called paradeHelper that we'll use to have an elephant parade. It should take a single elephant as an argument; this way, we can pass it as a callback to forEach when called on our herd. Make sure to store it as a property on the Elephant object. You can populate it with any console.log statement you want to build your parade (e.g. "___ is trotting by!").

// For example:

// > Elephant.paradeHelper(micah);
// Micah is trotting by!
// undefined
// Once you have this function, call forEach on the herd and pass it in as the callback without invoking it. Elephants galore!

Elephant.prototype.paradeHelper = function(){
    console.log(`${this.name} is trotting by!`)
}

herd.forEach(elephant => {
    elephant.paradeHelper();
});

// 🐘 🐘 🐘 🐘 🐘 🐘 🐘 🐘

// Phase IV: Closures
// Let's make a function dinerBreakfast. Ultimately, we want it to return an anonymous closure, which we will be able to use to keep adding breakfast foods to our initial order.


const dinerBreakfast = order => {
    this.orders = ["cheesy scrambled eggs"];
    console.log(`${this.orders.join(" and ")} please.`);
    
    return order => {
        if (order) {this.orders.push(order)};
        console.log(`${this.orders.join(" and ")} please.`);
    };
}

let bfastOrder = dinerBreakfast();
bfastOrder("chocolate chip pancakes");
bfastOrder("grits");

// order should be initialized to a starting order (e.g. scrambled eggs and bacon) before the anonymous function can do its work.
// The closure should capture/close over order
// What should the return value of dinerBreakfast be?
// Which function should take in the additional food as an argument?
// Make sure you can call it multiple times and keep chaining on more breakfast foods!

