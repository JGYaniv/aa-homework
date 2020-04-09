require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef") }

  subject(:brownie) { Dessert.new("brownie", 100, chef)}
  
  describe "#initialize" do
    it "sets a type" do
      expect(brownie.type).to eq('brownie')
    end
    it "sets a quantity" do
      expect(brownie.quantity).to eq(100)
    end
    it "starts ingredients as an empty array" do
      expect(brownie.ingredients).to eq([])
    end
    it "raises an argument error when given a non-integer quantity" do
      expect { Dessert.new("brownie", nil, chef) }.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      expect(brownie.add_ingredient("rum")).to eq(["rum"])
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      expect(brownie.mix!).to eq(brownie.ingredients)
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      expect(brownie.eat(20)).to eq(80)
    end
    
    it "raises an error if the amount is greater than the quantity" do
      expect{ brownie.eat(1000) }.to raise_error(RuntimeError)
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      allow(chef).to receive(:titleize).and_return("Chef chef the Great Baker")
      
      expect(brownie.serve).to eq("#{chef.titleize} has made #{brownie.quantity} #{brownie.type.pluralize}!")
    end
  end
  
  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      allow(chef).to receive(:bake).and_return(brownie.heat!)

      expect(brownie.make_more).to eq(400)
    end
  end
end
