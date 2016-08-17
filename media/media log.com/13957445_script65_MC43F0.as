
//----------------------------------------------------------------------
//Symbol 43 MovieClip [__Packages.mx.styles.CSSSetStyle] Frame 0
//----------------------------------------------------------------------
    class mx.styles.CSSSetStyle
    {
        var styleName, stylecache, _color, setColor, invalidateStyle;
        function CSSSetStyle () {
        }
        function _setStyle(styleProp, newValue) {
            this[styleProp] = newValue;
            if (mx.styles.StyleManager.TextStyleMap[styleProp] != undefined) {
                if (styleProp == "color") {
                    if (isNaN(newValue)) {
                        newValue = mx.styles.StyleManager.getColorName(newValue);
                        this[styleProp] = newValue;
                        if (newValue == undefined) {
                            return(undefined);
                        }
                    }
                }
                _level0.changeTextStyleInChildren(styleProp);
                return(undefined);
            }
            if (mx.styles.StyleManager.isColorStyle(styleProp)) {
                if (isNaN(newValue)) {
                    newValue = mx.styles.StyleManager.getColorName(newValue);
                    this[styleProp] = newValue;
                    if (newValue == undefined) {
                        return(undefined);
                    }
                }
                if (styleProp == "themeColor") {
                    var _local7 = mx.styles.StyleManager.colorNames.haloBlue;
                    var _local6 = mx.styles.StyleManager.colorNames.haloGreen;
                    var _local8 = mx.styles.StyleManager.colorNames.haloOrange;
                    var _local4 = {};
                    _local4[_local7] = 12188666 /* 0xB9FBFA */;
                    _local4[_local6] = 13500353 /* 0xCDFFC1 */;
                    _local4[_local8] = 16766319 /* 0xFFD56F */;
                    var _local5 = {};
                    _local5[_local7] = 13958653 /* 0xD4FDFD */;
                    _local5[_local6] = 14942166 /* 0xE3FFD6 */;
                    _local5[_local8] = 16772787 /* 0xFFEEB3 */;
                    var _local9 = _local4[newValue];
                    var _local10 = _local5[newValue];
                    if (_local9 == undefined) {
                        _local9 = newValue;
                    }
                    if (_local10 == undefined) {
                        _local10 = newValue;
                    }
                    setStyle("selectionColor", _local9);
                    setStyle("rollOverColor", _local10);
                }
                _level0.changeColorStyleInChildren(styleName, styleProp, newValue);
            } else {
                if ((styleProp == "backgroundColor") && (isNaN(newValue))) {
                    newValue = mx.styles.StyleManager.getColorName(newValue);
                    this[styleProp] = newValue;
                    if (newValue == undefined) {
                        return(undefined);
                    }
                }
                _level0.notifyStyleChangeInChildren(styleName, styleProp, newValue);
            }
        }
        function changeTextStyleInChildren(styleProp) {
            var _local4 = getTimer();
            var _local5;
            for (_local5 in this) {
                var _local2 = this[_local5];
                if (_local2._parent == this) {
                    if (_local2.searchKey != _local4) {
                        if (_local2.stylecache != undefined) {
                            delete _local2.stylecache.tf;
                            delete _local2.stylecache[styleProp];
                        }
                        _local2.invalidateStyle(styleProp);
                        _local2.changeTextStyleInChildren(styleProp);
                        _local2.searchKey = _local4;
                    }
                }
            }
        }
        function changeColorStyleInChildren(sheetName, colorStyle, newValue) {
            var _local6 = getTimer();
            var _local7;
            for (_local7 in this) {
                var _local2 = this[_local7];
                if (_local2._parent == this) {
                    if (_local2.searchKey != _local6) {
                        if (((_local2.getStyleName() == sheetName) || (sheetName == undefined)) || (sheetName == "_global")) {
                            if (_local2.stylecache != undefined) {
                                delete _local2.stylecache[colorStyle];
                            }
                            if (typeof(_local2._color) == "string") {
                                if (_local2._color == colorStyle) {
                                    var _local4 = _local2.getStyle(colorStyle);
                                    if (colorStyle == "color") {
                                        if (stylecache.tf.color != undefined) {
                                            stylecache.tf.color = _local4;
                                        }
                                    }
                                    _local2.setColor(_local4);
                                }
                            } else if (_local2._color[colorStyle] != undefined) {
                                if (typeof(_local2) != "movieclip") {
                                    _local2._parent.invalidateStyle();
                                } else {
                                    _local2.invalidateStyle(colorStyle);
                                }
                            }
                        }
                        _local2.changeColorStyleInChildren(sheetName, colorStyle, newValue);
                        _local2.searchKey = _local6;
                    }
                }
            }
        }
        function notifyStyleChangeInChildren(sheetName, styleProp, newValue) {
            var _local5 = getTimer();
            var _local6;
            for (_local6 in this) {
                var _local2 = this[_local6];
                if (_local2._parent == this) {
                    if (_local2.searchKey != _local5) {
                        if (((_local2.styleName == sheetName) || ((_local2.styleName != undefined) && (typeof(_local2.styleName) == "movieclip"))) || (sheetName == undefined)) {
                            if (_local2.stylecache != undefined) {
                                delete _local2.stylecache[styleProp];
                                delete _local2.stylecache.tf;
                            }
                            delete _local2.enabledColor;
                            _local2.invalidateStyle(styleProp);
                        }
                        _local2.notifyStyleChangeInChildren(sheetName, styleProp, newValue);
                        _local2.searchKey = _local5;
                    }
                }
            }
        }
        function setStyle(styleProp, newValue) {
            if (stylecache != undefined) {
                delete stylecache[styleProp];
                delete stylecache.tf;
            }
            this[styleProp] = newValue;
            if (mx.styles.StyleManager.isColorStyle(styleProp)) {
                if (isNaN(newValue)) {
                    newValue = mx.styles.StyleManager.getColorName(newValue);
                    this[styleProp] = newValue;
                    if (newValue == undefined) {
                        return(undefined);
                    }
                }
                if (styleProp == "themeColor") {
                    var _local10 = mx.styles.StyleManager.colorNames.haloBlue;
                    var _local9 = mx.styles.StyleManager.colorNames.haloGreen;
                    var _local11 = mx.styles.StyleManager.colorNames.haloOrange;
                    var _local6 = {};
                    _local6[_local10] = 12188666 /* 0xB9FBFA */;
                    _local6[_local9] = 13500353 /* 0xCDFFC1 */;
                    _local6[_local11] = 16766319 /* 0xFFD56F */;
                    var _local7 = {};
                    _local7[_local10] = 13958653 /* 0xD4FDFD */;
                    _local7[_local9] = 14942166 /* 0xE3FFD6 */;
                    _local7[_local11] = 16772787 /* 0xFFEEB3 */;
                    var _local12 = _local6[newValue];
                    var _local13 = _local7[newValue];
                    if (_local12 == undefined) {
                        _local12 = newValue;
                    }
                    if (_local13 == undefined) {
                        _local13 = newValue;
                    }
                    setStyle("selectionColor", _local12);
                    setStyle("rollOverColor", _local13);
                }
                if (typeof(_color) == "string") {
                    if (_color == styleProp) {
                        if (styleProp == "color") {
                            if (stylecache.tf.color != undefined) {
                                stylecache.tf.color = newValue;
                            }
                        }
                        setColor(newValue);
                    }
                } else if (_color[styleProp] != undefined) {
                    invalidateStyle(styleProp);
                }
                changeColorStyleInChildren(undefined, styleProp, newValue);
            } else {
                if ((styleProp == "backgroundColor") && (isNaN(newValue))) {
                    newValue = mx.styles.StyleManager.getColorName(newValue);
                    this[styleProp] = newValue;
                    if (newValue == undefined) {
                        return(undefined);
                    }
                }
                invalidateStyle(styleProp);
            }
            if (mx.styles.StyleManager.isInheritingStyle(styleProp) || (styleProp == "styleName")) {
                var _local8;
                var _local5 = newValue;
                if (styleProp == "styleName") {
                    _local8 = ((typeof(newValue) == "string") ? (_global.styles[newValue]) : (_local5));
                    _local5 = _local8.themeColor;
                    if (_local5 != undefined) {
                        _local8.rollOverColor = (_local8.selectionColor = _local5);
                    }
                }
                notifyStyleChangeInChildren(undefined, styleProp, newValue);
            }
        }
        static function enableRunTimeCSS() {
        }
        static function classConstruct() {
            var _local2 = MovieClip.prototype;
            var _local3 = mx.styles.CSSSetStyle.prototype;
            mx.styles.CSSStyleDeclaration.prototype.setStyle = _local3._setStyle;
            _local2.changeTextStyleInChildren = _local3.changeTextStyleInChildren;
            _local2.changeColorStyleInChildren = _local3.changeColorStyleInChildren;
            _local2.notifyStyleChangeInChildren = _local3.notifyStyleChangeInChildren;
            _local2.setStyle = _local3.setStyle;
            _global.ASSetPropFlags(_local2, "changeTextStyleInChildren", 1);
            _global.ASSetPropFlags(_local2, "changeColorStyleInChildren", 1);
            _global.ASSetPropFlags(_local2, "notifyStyleChangeInChildren", 1);
            _global.ASSetPropFlags(_local2, "setStyle", 1);
            var _local4 = TextField.prototype;
            _local4.setStyle = _local2.setStyle;
            _local4.changeTextStyleInChildren = _local3.changeTextStyleInChildren;
            return(true);
        }
        static var classConstructed = classConstruct();
        static var CSSStyleDeclarationDependency = mx.styles.CSSStyleDeclaration;
    }
