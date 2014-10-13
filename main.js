_ = require('./helpers')

var Swift = function(){}

Swift.prototype.render = function($) {
  $('let '+this.name+' = UILabel()');
  $(this.name+'.setTranslatesAutoresizingMaskIntoConstraints(false)');
  $(this.name+'.backgroundColor = UIColor.clearColor()');
  $(this.name+'.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)');
  $(this.name+'.font = UIFont(name: "MyriadPro-Regular", size: 6)');
  $(this.name+'.textAlignment = .Left');
  $(this.name+'.text = '+_.nsLocalizedString(this));
  $.newline()
  $('view.addSubview('+this.name+')');
}


exports.renderClass = Swift
