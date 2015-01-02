# -*- encoding: utf-8 -*-
require 'helper'

class TestBoard < Webrelais::TestCase
  include Webrelais

  def setup
    Webrelais.gpio = 'echo 0'
  end

  def test_pin_count
    board = Board.new(8)
    refute_nil(board)
    assert_equal(8, board.pin_count)
  end

  def test_all
    board = Board.new(8)
    refute_nil(board)
    assert_equal('{"0":1,"1":1,"2":1,"3":1,"4":1,"5":1,"6":1,"7":1}', board.to_json)
  end
end
