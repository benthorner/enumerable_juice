require './lib/limits/enumerable_patch'

feature 'limits', integration: true do
  scenario 'limit to a single item' do
    expect(['foo'].single).to eq 'foo'
    expect{ [].single }.to raise_error
  end

  scenario 'limit to exactly 5 items' do
    expect([1,2,3,4,5].limit.exactly(5)).to eq [1,2,3,4,5]
    expect([1,2,3].limit.exactly(5)).to raise_error
  end

  scenario 'limit to less than 2 items' do
    expect([1,2].limit.at_most(2)).to eq [1,2]
    expect([1,2,3,4].limit.at_most(2)).to raise_error
  end

  scenario 'limit to more than 0 items' do
    expect([1,2,3].limit.at_least(0)).to eq [1,2,3]
    expect([].limit.at_least(0)).to raise_error
  end
end
