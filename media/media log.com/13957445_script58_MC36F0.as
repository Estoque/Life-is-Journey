
//----------------------------------------------------------------------
//Symbol 36 MovieClip [__Packages.mx.core.ext.UIObjectExtensions] Frame 0
//----------------------------------------------------------------------
    class mx.core.ext.UIObjectExtensions
    {
        function UIObjectExtensions () {
        }
        static function addGeometry(tf, ui) {
            tf.addProperty("width", ui.__get__width, null);
            tf.addProperty("height", ui.__get__height, null);
            tf.addProperty("left", ui.__get__left, null);
            tf.addProperty("x", ui.__get__x, null);
            tf.addProperty("top", ui.__get__top, null);
            tf.addProperty("y", ui.__get__y, null);
            tf.addProperty("right", ui.__get__right, null);
            tf.addProperty("bottom", ui.__get__bottom, null);
            tf.addProperty("visible", ui.__get__visible, ui.__set__visible);
        }
        static function Extensions() {
            if (bExtended == true) {
                return(true);
            }
            bExtended = true;
            var _local6 = mx.core.UIObject.prototype;
            var _local9 = mx.skins.SkinElement.prototype;
            addGeometry(_local9, _local6);
            mx.events.UIEventDispatcher.initialize(_local6);
            var _local13 = mx.skins.ColoredSkinElement;
            mx.styles.CSSTextStyles.addTextStyles(_local6);
            var _local5 = MovieClip.prototype;
            _local5.getTopLevel = _local6.getTopLevel;
            _local5.createLabel = _local6.createLabel;
            _local5.createObject = _local6.createObject;
            _local5.createClassObject = _local6.createClassObject;
            _local5.createEmptyObject = _local6.createEmptyObject;
            _local5.destroyObject = _local6.destroyObject;
            _global.ASSetPropFlags(_local5, "getTopLevel", 1);
            _global.ASSetPropFlags(_local5, "createLabel", 1);
            _global.ASSetPropFlags(_local5, "createObject", 1);
            _global.ASSetPropFlags(_local5, "createClassObject", 1);
            _global.ASSetPropFlags(_local5, "createEmptyObject", 1);
            _global.ASSetPropFlags(_local5, "destroyObject", 1);
            _local5.__getTextFormat = _local6.__getTextFormat;
            _local5._getTextFormat = _local6._getTextFormat;
            _local5.getStyleName = _local6.getStyleName;
            _local5.getStyle = _local6.getStyle;
            _global.ASSetPropFlags(_local5, "__getTextFormat", 1);
            _global.ASSetPropFlags(_local5, "_getTextFormat", 1);
            _global.ASSetPropFlags(_local5, "getStyleName", 1);
            _global.ASSetPropFlags(_local5, "getStyle", 1);
            var _local7 = TextField.prototype;
            addGeometry(_local7, _local6);
            _local7.addProperty("enabled", function () {
                return(this.__enabled);
            }, function (x) {
                this.__enabled = x;
                this.invalidateStyle();
            });
            _local7.move = _local9.move;
            _local7.setSize = _local9.setSize;
            _local7.invalidateStyle = function () {
                this.invalidateFlag = true;
            };
            _local7.draw = function () {
                if (this.invalidateFlag) {
                    this.invalidateFlag = false;
                    var _local2 = this._getTextFormat();
                    this.setTextFormat(_local2);
                    this.setNewTextFormat(_local2);
                    this.embedFonts = _local2.embedFonts == true;
                    if (this.__text != undefined) {
                        if (this.text == "") {
                            this.text = this.__text;
                        }
                        delete this.__text;
                    }
                    this._visible = true;
                }
            };
            _local7.setColor = function (color) {
                this.textColor = color;
            };
            _local7.getStyle = _local5.getStyle;
            _local7.__getTextFormat = _local6.__getTextFormat;
            _local7.setValue = function (v) {
                this.text = v;
            };
            _local7.getValue = function () {
                return(this.text);
            };
            _local7.addProperty("value", function () {
                return(this.getValue());
            }, function (v) {
                this.setValue(v);
            });
            _local7._getTextFormat = function () {
                var _local2 = this.stylecache.tf;
                if (_local2 != undefined) {
                    return(_local2);
                }
                _local2 = new TextFormat();
                this.__getTextFormat(_local2);
                this.stylecache.tf = _local2;
                if (this.__enabled == false) {
                    if (this.enabledColor == undefined) {
                        var _local4 = this.getTextFormat();
                        this.enabledColor = _local4.color;
                    }
                    var _local3 = this.getStyle("disabledColor");
                    _local2.color = _local3;
                } else if (this.enabledColor != undefined) {
                    if (_local2.color == undefined) {
                        _local2.color = this.enabledColor;
                    }
                }
                return(_local2);
            };
            _local7.getPreferredWidth = function () {
                this.draw();
                return(this.textWidth + 4);
            };
            _local7.getPreferredHeight = function () {
                this.draw();
                return(this.textHeight + 4);
            };
            TextFormat.prototype.getTextExtent2 = function (s) {
                var _local3 = _root._getTextExtent;
                if (_local3 == undefined) {
                    _root.createTextField("_getTextExtent", -2, 0, 0, 1000, 100);
                    _local3 = _root._getTextExtent;
                    _local3._visible = false;
                }
                _root._getTextExtent.text = s;
                var _local4 = this.align;
                this.align = "left";
                _root._getTextExtent.setTextFormat(this);
                this.align = _local4;
                return({width:_local3.textWidth, height:_local3.textHeight});
            };
            if (_global.style == undefined) {
                _global.style = new mx.styles.CSSStyleDeclaration();
                _global.cascadingStyles = true;
                _global.styles = new Object();
                _global.skinRegistry = new Object();
                if (_global._origWidth == undefined) {
                    _global.origWidth = Stage.width;
                    _global.origHeight = Stage.height;
                }
            }
            var _local4 = _root;
            while (_local4._parent != undefined) {
                _local4 = _local4._parent;
            }
            _local4.addProperty("width", function () {
                return(Stage.width);
            }, null);
            _local4.addProperty("height", function () {
                return(Stage.height);
            }, null);
            _global.ASSetPropFlags(_local4, "width", 1);
            _global.ASSetPropFlags(_local4, "height", 1);
            return(true);
        }
        static var bExtended = false;
        static var UIObjectExtended = Extensions();
        static var UIObjectDependency = mx.core.UIObject;
        static var SkinElementDependency = mx.skins.SkinElement;
        static var CSSTextStylesDependency = mx.styles.CSSTextStyles;
        static var UIEventDispatcherDependency = mx.events.UIEventDispatcher;
    }
