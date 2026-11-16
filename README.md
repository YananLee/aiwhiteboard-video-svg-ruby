# AIWhiteboard.Video SVG for Ruby

A small local SVG utility. For the full product, visit [AIWhiteboard.Video](https://aiwhiteboard.video/).

```sh
gem install aiwhiteboard_video_svg
```

```ruby
require "aiwhiteboard_video_svg"
svg = AIWhiteboardVideoSvg.render("Hello")
File.write("output.svg", svg)
```

This gem generates a basic SVG and does not call the website's AI service. MIT licensed; no runtime dependencies.
