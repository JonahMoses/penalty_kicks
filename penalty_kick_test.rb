gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative "penalty_kick"
require 'pry'

class PenaltyKickTest < MiniTest::Test

  def test_goalie_can_guess
    goalie = Goalie.new
    goalie.guess("L")
  end

  def test_player_can_kick
    player = Player.new
    player.kick("L")
  end

  def test_player_can_score
    goalie = Goalie.new
    player = Player.new
    match = Match.new(goalie, player)
    goalie.guess("R")
    player.kick("L")
    assert_equal "Goal!!!", match.score
  end
end
