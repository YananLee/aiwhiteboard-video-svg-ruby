require "minitest/autorun"
require_relative "lib/aiwhiteboard_video_svg"
class PackageTest < Minitest::Test
  def test_svg
    svg = AIWhiteboardVideoSvg.render("Hello")
    assert_match(/<svg/, svg)
  end
end
