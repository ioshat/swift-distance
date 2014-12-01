_ = require './helpers'

class Swift
  constraints: ($) ->
    if @options.constraints.verticalTop
      $ "// align #{@layers[0].name} and #{@layers[1].name} to top"
      $ "#{@options.superviewName}.addConstraint(NSLayoutConstraint(item: #{@layers[0].name}, attribute: .Top, relatedBy: .Equal, toItem: #{@layers[1].name}, attribute: .Top, multiplier: 1.0, constant: 0.0))"
      $.newline()

    if @options.constraints.verticalCenter
      $ "// center #{@layers[0].name} vertically with #{@layers[1].name}"
      $ "#{@options.superviewName}.addConstraint(NSLayoutConstraint(item: #{@layers[0].name}, attribute: .CenterY, relatedBy: .Equal, toItem: #{@layers[1].name}, attribute: .CenterY, multiplier: 1.0, constant: 0.0))"
      $.newline()

    if @options.constraints.verticalBottom
      $ "// align #{@layers[0].name} and #{@layers[1].name} to bottom"
      $ "#{@options.superviewName}.addConstraint(NSLayoutConstraint(item: #{@layers[0].name}, attribute: .Bottom, relatedBy: .Equal, toItem: #{@layers[1].name}, attribute: .Bottom, multiplier: 1.0, constant: 0.0))"
      $.newline()

    if @options.constraints.horizontalLeft
      $ "// align #{@layers[0].name} and #{@layers[1].name} to left"
      $ "#{@options.superviewName}.addConstraint(NSLayoutConstraint(item: #{@layers[0].name}, attribute: .Left, relatedBy: .Equal, toItem: #{@layers[1].name}, attribute: .Left, multiplier: 1.0, constant: 0.0))"
      $.newline()

    if @options.constraints.horizontalCenter
      $ "// center #{@layers[0].name} horizontally with #{@layers[1].name}"
      $ "#{@options.superviewName}.addConstraint(NSLayoutConstraint(item: #{@layers[0].name}, attribute: .CenterX, relatedBy: .Equal, toItem: #{@layers[1].name}, attribute: .CenterX, multiplier: 1.0, constant: 0.0))"
      $.newline()

    if @options.constraints.horizontalRight
      $ "// align #{@layers[0].name} and #{@layers[1].name} to right"
      $ "#{@options.superviewName}.addConstraint(NSLayoutConstraint(item: #{@layers[0].name}, attribute: .Right, relatedBy: .Equal, toItem: #{@layers[1].name}, attribute: .Right, multiplier: 1.0, constant: 0.0))"
      $.newline()

  render: ($) ->
    @constraints $

    if @options.distance.x and @measures.distanceX >= 0
      $ "// views #{@layers[0].name}, #{@layers[1].name} horizontal distance"
      $ "#{@options.superviewName}.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(\"H:[#{@layers[0].name}]-#{@measures.distanceX}-[#{@layers[1].name}]\", options: .DirectionLeadingToTrailing, metrics: nil, views: [\"#{@layers[0].name}\": #{@layers[1].name}]))"
      $.newline()

    if @options.distance.y and @measures.distanceY >= 0
      $ "// views #{@layers[0].name}, #{@layers[1].name} vertical distance"
      $ "#{@options.superviewName}.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(\"V:[#{@layers[0].name}]-#{@measures.distanceY}-[#{@layers[1].name}]\", options: .DirectionLeadingToTrailing, metrics: nil, views: [\"#{@layers[0].name}\": #{@layers[1].name}]))"
      $.newline()


exports.renderClass = Swift
