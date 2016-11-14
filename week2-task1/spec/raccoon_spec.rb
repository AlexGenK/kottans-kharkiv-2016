require 'spec_helper'

describe Raccoon do

  RSpec::Matchers.define :is_dead do 
    match do |raccoon|
      (raccoon.state=='dead') && (raccoon.speed==0)
    end
  end

  subject(:raccoon) { described_class.new() }

  context 'when born' do

    it 'has to be raccoon' do 
      is_expected.to be_an Raccoon
    end

    its(:speed) {is_expected.to eq 0}
    its(:state) {is_expected.to eq 'healthy'}

  end

  describe '#run!' do

    before(:each) do
      raccoon.run!
    end

    context 'when run witn random speed' do
      
      it 'has run in default range of speed' do
        expect(raccoon.speed).to be_between(1, 24)
      end

      it 'has to be healthy' do
        expect(raccoon.state).to eq 'healthy'
      end

    end

    context 'when run with overspeed' do
      it 'has to died' do
        expect(raccoon.run!(25)).to is_dead
      end
    end

  end

  describe '#swim!' do

    before(:each) do
      raccoon.swim!
    end

    context 'when swim witn random speed' do
      
      it 'has swim in default range of speed' do
        expect(raccoon.speed).to be_between(1, 4)
      end

      it 'has to be healthy' do
        expect(raccoon.state).to eq 'healthy'
      end

    end

    context 'when swim with overspeed' do
      it 'has to died' do
        expect(raccoon.swim!(5)).to is_dead
      end
    end

  end

  describe '#stop!' do
    before(:each) do
      raccoon.run!(10)
    end

    context 'when stopped' do
      it 'has to stop' do
        expect{ raccoon.stop! }.to change(raccoon, :speed).from(10).to(0)
      end
    end
  end

  describe '#reproduction' do

    let(:raccoon_female) { Raccoon.new('female') }
    let(:die_raccoon_female) { Raccoon.new('female').run!(30) }
    let(:raccoon_male) { Raccoon.new('male') }
    let(:die_raccoon_male) { Raccoon.new('male').run!(30) }

    before(:each) do
      raccoon.gender='female'
    end

    context 'when meet raccoon with same gender' do
      it 'has no reproduction' do
        expect(raccoon.reproduction(raccoon_female)).to have(0).items
      end
    end

    context 'when meet raccoon with another gender' do
      it 'has do reproduction' do
        expect(raccoon.reproduction(raccoon_male))
          .to have_at_most(5).items
          .and have_at_least(2).items
          .and include(Raccoon)
      end

      it 'has not reprodiction with dead raccoon' do
        expect(raccoon.reproduction(die_raccoon_male)).to have(0).items
      end

      it 'has not reproduction if himself is dead' do
        expect(die_raccoon_female.reproduction(raccoon_female)).to have(0).items
      end

    end

  end

  describe '#eat' do
    context 'when is not eating' do
      it 'has not to eat' do
        expect(raccoon.eat('nail')).to eq 'nail reject'
      end
    end

    context 'when is eating' do
      it 'has dousing' do
        expect(raccoon.eat('plant')).to include('douse')
      end

      it 'has to eat' do
        expect(raccoon.eat('plant')).to include('eaten')
      end

    end
  end

  describe '#die!' do
    context 'when is die' do
        it 'has to died' do
          expect(raccoon.die!).to is_dead
        end
    end
  end

end
