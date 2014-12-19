require './lib/limits/enumerable_patch'

describe Enumerable do

  describe '#limit' do
    let(:enumerable) { [] }

    it 'should return a LimitedEnumerable' do
      expect(enumerable.limit).to be_a LimitedEnumerable
    end
  end

  describe '#single' do
    context 'when there is a single item' do
      let(:item) { double }
      let(:enumerable) { [item] }

      it 'should return the item' do
        expect(enumerable.single).to eq item
      end
    end

    context 'when there is not a single item' do
      let(:enumerable) { [1,2,3] }

      it 'should raise an error' do
        expect{ enumerable.single }.to raise_error(
          "cannot get single item when count is plural"
        )
      end
    end
  end

end
