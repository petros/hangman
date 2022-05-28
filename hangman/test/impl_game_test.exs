defmodule HangmanImplGameTest do
  use ExUnit.Case
  alias Hangman.Impl.Game

  test "new_game/0 returns structure" do
    game = Game.new_game()

    assert game.turns_left == 7
    assert game.game_state == :initializing
    assert length(game.letters) > 0
  end

  test "new_game/1 returns correct word" do
    game = Game.new_game("wombat")

    assert game.turns_left == 7
    assert game.game_state == :initializing
    assert game.letters == ["w", "o", "m", "b", "a", "t"]
  end

  test "make_move/2 state doesn't change if game is won" do
    game = Game.new_game("wombat")
    game = Map.put(game, :game_state, :won)
    {new_game, _tally} = Game.make_move(game, "x")
    assert new_game == game
  end
end
