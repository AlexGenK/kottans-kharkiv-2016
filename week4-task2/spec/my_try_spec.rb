require 'spec_helper'

describe '#try' do

  let (:test_array) { ["Homer", "Marge", "Lisa", "Bart", "Maggy"] }
  let (:test_nil) { nil }

  context "when receiver is not nil and argument is name of existing method" do
    it "has invokes the method" do
      expect(test_array.try(:size)).to eq 5
    end
  end

  context "when receiver is not nil and argument is name of non existing method" do
    it "returns nil" do
      expect(test_array.try(:non_existing_method)).to eq nil
    end
  end

  context "when receiver is nil and argument is name of existing method" do
    it "returns nil" do
      expect(test_nil.try(:to_i)).to eq nil
    end
  end

  context "when receiver is nil and argument is name of non existing method" do
    it "returns nil" do
      expect(test_nil.try(:non_existing_method)).to eq nil
    end
  end

  context "when receiver is not nil and argument is the block" do
    it "has yields the receiver to a given block" do
      expect(test_array.try{|a| "First - #{a.first}, last - #{a.last}"}).to eq 'First - Homer, last - Maggy'
    end
  end

  context "when reciever is nil and argument is the block" do
    it "returns nil" do
      expect(test_nil.try{|a| "First - #{a.first}, last - #{a.last}"}).to eq nil
    end
  end
  
  context "when receiver is not nil and arguments is name of existing method with arguments and block" do
    it "has invokes the method, and arguments and block are forwarded to the method" do
      expect(test_array.try(:min, 2) {|a, b| a.length<=>b.length}).to eq ["Lisa", "Bart"]
    end
  end

end