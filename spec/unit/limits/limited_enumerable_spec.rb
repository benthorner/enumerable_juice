require './lib/limits/limited_enumerable'

module EnumerableJuice
  module Limits
    describe LimitedEnumerable do
      let(:enumerable) { [1,2,3,4] }
      subject { described_class.new enumerable }

      describe '#exactly n' do
        context 'when the count is exactly n' do
          it 'should return the enumerable' do
            expect(subject.exactly(4)).to eq enumerable
          end
        end

        context 'when the count is not n' do
          it 'should raise an error' do
            expect{ subject.exactly(3) }.to raise_error(
              ValidationError, 'Invalid number of items (4 != 3)'
            )
          end
        end
      end

      describe '#at_least n' do
        context 'when the count is exactly n' do
          it 'should return the enumerable' do
            expect(subject.at_least(4)).to eq enumerable
          end
        end

        context 'when the count is more than n' do
          it 'should return the enumerable' do
            expect(subject.at_least(3)).to eq enumerable
          end
        end

        context 'when the count is less than n' do
          it 'should raise an error' do
            expect{ subject.at_least(5) }.to raise_error(
              ValidationError, 'Invalid number of items (4 < 5)'
            )
          end
        end
      end

      describe '#at_most n' do
        context 'when the count is exactly n' do
          it 'should return the enumerable' do
            expect(subject.at_most(4)).to eq enumerable
          end
        end

        context 'when the count is less than n' do
          it 'should return the enumerable' do
            expect(subject.at_most(5)).to eq enumerable
          end
        end

        context 'when the count is more than n' do
          it 'should raise an error' do
            expect{ subject.at_most(3) }.to raise_error(
              ValidationError, 'Invalid number of items (4 > 3)'
            )
          end
        end
      end
    end
  end
end
