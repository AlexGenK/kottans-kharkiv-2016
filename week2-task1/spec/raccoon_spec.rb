require 'spec_helper'

describe Raccoon do

  subject(:raccoon) { described_class.new() }

  RSpec.shared_examples "a moving object" do |moving_method, max_speed|

    before do
      raccoon.send(moving_method)
    end

    context 'by default' do
      
      it 'has run in default range of speed' do
        expect(raccoon.speed).to be_between(1, max_speed)
      end

      it 'has to be healthy' do
        expect(raccoon.state).to eq :healthy
      end

    end

    context 'when runs with normal speed' do

      before do
        raccoon.run!(max_speed-1)
      end
      
      it 'has to run with normal speed' do
        expect(raccoon.speed).to eq max_speed-1
      end

      it 'has to be healthy' do
        expect(raccoon.state).to eq :healthy
      end

    end    

    context 'when runs with overspeed' do
      it 'has to raise error' do
        expect { raccoon.send(moving_method, max_speed+1) }.to raise_error(ArgumentError, "Too fast")
      end
    end

  end

  context 'when born' do

    it 'has to be raccoon' do 
      is_expected.to be_an Raccoon
    end

    its(:speed) {is_expected.to eq 0}
    its(:state) {is_expected.to eq :healthy}

  end

  describe '#run!' do
    it_should_behave_like "a moving object", :run!, 24
  end

  describe '#swim!' do
    it_should_behave_like "a moving object", :swim!, 4
  end

  describe '#stop!' do
    before do
      raccoon.run!(10)
    end

    context 'when stopped' do
      it 'has to stop' do
        expect{ raccoon.stop! }.to change(raccoon, :speed).from(10).to(0)
      end
    end
  end

  describe '#reproduction' do

    let(:raccoon_female) { Raccoon.new(:female) }
    let(:another_raccoon_female) { Raccoon.new(:female) }
    let(:dead_raccoon_female) { Raccoon.new(:female, state: :dead) }
    let(:raccoon_male) { Raccoon.new(:male) }
    let(:dead_raccoon_male) { Raccoon.new(:male, state: :dead) }

    context 'when meet raccoon with same gender' do
      it 'has no reproduction' do
        expect(raccoon_female.reproduction(another_raccoon_female)).to have(0).items
      end
    end

    context 'when meet raccoon with another gender' do
      it 'has do reproduction' do
        expect(raccoon_female.reproduction(raccoon_male))
          .to have_at_most(5).items
          .and have_at_least(2).items
          .and include(Raccoon)
      end

      it 'has not reprodiction with dead raccoon' do
        expect(raccoon_female.reproduction(dead_raccoon_male)).to have(0).items
      end

      it 'has not reproduction if himself is dead' do
        expect(dead_raccoon_female.reproduction(raccoon_male)).to have(0).items
      end

    end

  end

  describe '#eat' do
    context 'when is not eating' do
      it 'has not to eat' do
        expect { raccoon.eat('nail') }.to raise_error(ArgumentError, "Not eating")
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
          expect(raccoon.die!).to be_dead
        end
    end
  end

end
