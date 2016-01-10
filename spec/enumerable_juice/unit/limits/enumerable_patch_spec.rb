require './lib/limits/enumerable_patch'

module EnumerableJuice
  module Limits
    describe Enumerable do
      let(:limited_enumerable) { double LimitedEnumerable }

      before do
        allow(LimitedEnumerable).to receive(:new)
          .and_return limited_enumerable
      end

      describe '#limit' do
        let(:enumerable) { [] }

        it 'should return a LimitedEnumerable' do
          expect(enumerable.limit).to eq limited_enumerable
        end
      end

      describe '#single' do
        context 'when there is a single item' do
          let(:item) { double }
          let(:enumerable) { [item] }

          before do
            allow(limited_enumerable).to receive(:exactly)
              .and_return enumerable
          end

          it 'should return the item' do
            expect(enumerable.single).to eq item
          end
        end

        context 'when there is not a single item' do
          let(:enumerable) { [1,2,3] }

          before do
            allow(limited_enumerable).to receive(:exactly)
              .and_raise 'validation error'
          end

          it 'should raise an error' do
            expect{ enumerable.single }.to raise_error 'validation error'
          end
        end
      end
    end
  end
end
