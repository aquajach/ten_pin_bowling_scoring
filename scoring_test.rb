require 'minitest/autorun'
require_relative 'scoring'

describe 'method:score' do
  describe 'when there is no spare or strike' do
    it 'aggregates the pins from all balls' do
      score([1, 2, 3, 4, 5]).must_be :==, 15
    end
  end

  describe 'when there are spares in the middle' do
    it 'adds the pins of the next ball to each spare' do
      score([2, 3, 9, 1, 4, 2, 3, 4, 0, 10, 7, 1]).must_be :==, 57
    end
  end

  describe 'when there are strikes in the middle' do
    it 'adds the pins of the following two balls to each strikes' do
      score([9, 1, 10, 8, 2, 2]).must_be :==, 54
    end
  end

  describe 'when there is a spare at the end' do
    it 'has no bonus on the spare' do
      score([9, 1, 3, 4, 3, 7]).must_be :==, 30
    end
  end

  describe 'when there is a strike at the end or the second last' do
    it 'has no bonus on the strike at the end' do
      score([9, 1, 3, 4, 3, 7, 10]).must_be :==, 50
    end

    it 'has one ball bonus on the strike at the second last' do
      score([9, 1, 3, 4, 3, 7, 10, 4]).must_be :==, 58
    end
  end

  describe 'when the game has full ten frames' do
    it 'has no bonus on the tenth frame' do
      score([10,10,10,10,10,10,10,10,10,10,10,10]).must_be :==, 300
    end
  end
end

describe 'method:frames' do
  describe 'when there is no strike' do
    it 'groups all balls in the size of TWO before the tenth frame' do
      frames([1, 2, 3, 4]).must_be :==, [[1,2],[3,4]]
    end

    it 'groups all the remaining balls in the tenth frame' do
      frames([1, 2, 3, 4, 4, 3, 2, 1, 1, 2, 3, 4, 4, 3, 2, 1, 8, 2, 3, 4, 0]).must_be :==,
        [[1, 2], [3, 4], [4, 3], [2, 1], [1, 2], [3, 4], [4, 3], [2, 1], [8, 2], [3, 4, 0]]
    end
  end

  describe 'when there are strikes' do
    it 'groups all the balls in the size of TWO for non-strike, and in the size of ONE for strike' do
      frames([1, 2, 3, 5, 10, 8, 2]).must_be :==, [[1, 2], [3, 5], [10], [8, 2]]
    end

    it 'group all the remaining balls in the tenth frame even if it has strikes' do
      frames([1, 2, 3, 4, 4, 3, 2, 1, 1, 2, 3, 4, 4, 3, 2, 1, 8, 2, 10, 10, 4]).must_be :==,
        [[1, 2], [3, 4], [4, 3], [2, 1], [1, 2], [3, 4], [4, 3], [2, 1], [8, 2], [10, 10, 4]]
    end
  end
end
