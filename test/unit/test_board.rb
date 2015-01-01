# -*- encoding: utf-8 -*-
require 'helper'

class TestBoard < Webrelais::TestCase
  include Webrelais

  def setup
  	Webrelais.gpio = 'echo 42'
  end

  def test_pin_count
    board = Board.new(8)
    refute_nil(board)
    assert_equal(8, board.pin_count)
  end

  def test_all
    board = Board.new(8)
    refute_nil(board)
    assert_equal('{"0":42,"1":42,"2":42,"3":42,"4":42,"5":42,"6":42,"7":42}', board.to_json)
  end
end
