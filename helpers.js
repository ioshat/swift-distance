var helpers = {
    swiftColor: function(chunk, ctx, bodies, params) {
      var color = ctx.get('color');
      var f = function(n) { return n < 0.001 ? 0 : (n/255).toFixed(3); };
      return chunk.write('TODO');
      // return chunk.write('colorWithRed:'+f(color.r)+' green:'+f(color.g)+' blue:'+f(color.b)+' alpha:' + color.a);
    },
    swiftAlignment: function(chunk, ctx, bodies, params) {
      var align = ctx.get('textAlign');
      var code = '';
      switch (align) {
        case 'left':
          code = 'NSTextAlignmentLeft';
          break;
        case 'right':
          code = 'NSTextAlignmentRight';
          break;
        case 'center':
          code = 'NSTextAlignmentCenter';
          break;
        case 'justified':
          code = 'NSTextAlignmentJustified';
          break;
      }
      return chunk.write(code);
    },
    swiftFont: function(chunk, ctx, bodies, params) {
      var baseTextStyle = ctx.get('baseTextStyle');
      return chunk.write(baseTextStyle.font.postScriptName || baseTextStyle.font.name);
    },
    // 'NSLocalizedString("'+this.name+'", comment: "")'
    nsLocalizedString: function(data) {
      var loc = data.options['localizedString'] ? true : false;
      return loc ?
        'NSLocalizedString("' + data.text + '", nil)' :
        '"' + data.text + '"';
    }
};

exports.swiftColor = helpers.swiftColor
exports.swiftAlignment = helpers.swiftAlignment
exports.swiftFont = helpers.swiftFont
exports.nsLocalizedString = helpers.nsLocalizedString
