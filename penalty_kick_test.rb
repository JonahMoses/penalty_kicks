gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative "penalty_kick"

class PenaltyKickTest < MiniTest::Test

  def test_goalie_can_guess
    goalie = Goalie.new
    goalie.guess("L")
    assert goalie.dive == "L"
  end

  def test_valid_goalie_direction
    goalie = Goalie.new
    assert_raises ArgumentError do
      goalie.guess("A")
    end
  end

  def test_player_can_kick
    player = Player.new
    player.kick("L")
    assert player.aim == "L"
  end

  def test_valid_kicker_direction
    player = Player.new
    assert_raises ArgumentError do
      player.kick("B")
    end
  end

  def test_player_can_score
    goalie = Goalie.new
    player = Player.new
    match = Match.new(goalie, player)
    goalie.guess("R")
    player.kick("L")
    assert_equal "Goal!!!", match.score
  end

  def test_goalie_can_block
    goalie = Goalie.new
    player = Player.new
    match = Match.new(goalie, player)
    goalie.guess("R")
    player.kick("R")
    assert_equal "Blocked", match.score
  end
end
