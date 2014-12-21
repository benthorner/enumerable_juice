require './lib/limits/enumerable_patch'
require './lib/limits/validation_error'

feature 'limits' do
  scenario 'a single item' do
    expect(['foo'].single).to eq 'foo'

    expect{ [].single }.to raise_error(
      ValidationError, 'Invalid number of items (0 != 1)'
    )
  end

  scenario 'exactly 5 items' do
    expect([1,2,3,4,5].limit.exactly(5)).to eq [1,2,3,4,5]

    expect{ [1,2,3].limit.exactly(5) }.to raise_error(
      ValidationError, 'Invalid number of items (3 != 5)'
    )
  end

  scenario 'less than 2 items' do
    expect([1,2].limit.at_most(2)).to eq [1,2]

    expect{ [1,2,3,4].limit.at_most(2) }.to raise_error(
      ValidationError, 'Invalid number of items (4 > 2)'
    )
  end

  scenario 'more than 1 item' do
    expect([1,2,3].limit.at_least(1)).to eq [1,2,3]

    expect{ [].limit.at_least(1) }.to raise_error(
      ValidationError, 'Invalid number of items (0 < 1)'
    )
  end
end
