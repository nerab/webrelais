# -*- encoding: utf-8 -*-
require 'helper'

class TestBoard < Webrelais::TestCase
  include Webrelais

  def test_pin_count
    board = Board.new(8)
    refute_nil(board)
    assert_equal(8, board.pin_count)
  end
end
