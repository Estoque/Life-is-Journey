
//----------------------------------------------------------------------
//Symbol 45 MovieClip [__Packages.mx.skins.halo.RectBorder] Frame 0
//----------------------------------------------------------------------
    class mx.skins.halo.RectBorder extends mx.skins.RectBorder
    {
        var offset, getStyle, borderStyleName, __borderMetrics, className, borderColorName, backgroundColorName, shadowColorName, highlightColorName, buttonColorName, __get__width, __get__height, clear, _color, drawRoundRect, beginFill, drawRect, endFill;
        function RectBorder () {
            super();
        }
        function init(Void) {
            borderWidths.default = 3;
            super.init();
        }
        function getBorderMetrics(Void) {
            if (offset == undefined) {
                var _local3 = getStyle(borderStyleName);
                offset = borderWidths[_local3];
            }
            if ((getStyle(borderStyleName) == "default") || (getStyle(borderStyleName) == "alert")) {
                __borderMetrics = {left:3, top:1, right:3, bottom:3};
                return(__borderMetrics);
            }
            return(super.getBorderMetrics());
        }
        function drawBorder(Void) {
            var _local6 = _global.styles[className];
            if (_local6 == undefined) {
                _local6 = _global.styles.RectBorder;
            }
            var _local5 = getStyle(borderStyleName);
            var _local7 = getStyle(borderColorName);
            if (_local7 == undefined) {
                _local7 = _local6[borderColorName];
            }
            var _local8 = getStyle(backgroundColorName);
            if (_local8 == undefined) {
                _local8 = _local6[backgroundColorName];
            }
            var _local16 = getStyle("backgroundImage");
            if (_local5 != "none") {
                var _local14 = getStyle(shadowColorName);
                if (_local14 == undefined) {
                    _local14 = _local6[shadowColorName];
                }
                var _local13 = getStyle(highlightColorName);
                if (_local13 == undefined) {
                    _local13 = _local6[highlightColorName];
                }
                var _local12 = getStyle(buttonColorName);
                if (_local12 == undefined) {
                    _local12 = _local6[buttonColorName];
                }
                var _local11 = getStyle(borderCapColorName);
                if (_local11 == undefined) {
                    _local11 = _local6[borderCapColorName];
                }
                var _local10 = getStyle(shadowCapColorName);
                if (_local10 == undefined) {
                    _local10 = _local6[shadowCapColorName];
                }
            }
            offset = borderWidths[_local5];
            var _local9 = offset;
            var _local3 = __get__width();
            var _local4 = __get__height();
            clear();
            _color = undefined;
            if (_local5 == "none") {
            } else if (_local5 == "inset") {
                _color = colorList;
                draw3dBorder(_local11, _local12, _local7, _local13, _local14, _local10);
            } else if (_local5 == "outset") {
                _color = colorList;
                draw3dBorder(_local11, _local7, _local12, _local14, _local13, _local10);
            } else if (_local5 == "alert") {
                var _local15 = getStyle("themeColor");
                drawRoundRect(0, 5, _local3, _local4 - 5, 5, 6184542, 10);
                drawRoundRect(1, 4, _local3 - 2, _local4 - 5, 4, [6184542, 6184542], 10, 0, "radial");
                drawRoundRect(2, 0, _local3 - 4, _local4 - 2, 3, [0, 14342874], 100, 0, "radial");
                drawRoundRect(2, 0, _local3 - 4, _local4 - 2, 3, _local15, 50);
                drawRoundRect(3, 1, _local3 - 6, _local4 - 4, 2, 16777215, 100);
            } else if (_local5 == "default") {
                drawRoundRect(0, 5, _local3, _local4 - 5, {tl:5, tr:5, br:0, bl:0}, 6184542, 10);
                drawRoundRect(1, 4, _local3 - 2, _local4 - 5, {tl:4, tr:4, br:0, bl:0}, [6184542, 6184542], 10, 0, "radial");
                drawRoundRect(2, 0, _local3 - 4, _local4 - 2, {tl:3, tr:3, br:0, bl:0}, [12897484, 11844796], 100, 0, "radial");
                drawRoundRect(3, 1, _local3 - 6, _local4 - 4, {tl:2, tr:2, br:0, bl:0}, 16777215, 100);
            } else if (_local5 == "dropDown") {
                drawRoundRect(0, 0, _local3 + 1, _local4, {tl:4, tr:0, br:0, bl:4}, [13290186, 7895160], 100, -10, "linear");
                drawRoundRect(1, 1, _local3 - 1, _local4 - 2, {tl:3, tr:0, br:0, bl:3}, 16777215, 100);
            } else if (_local5 == "menuBorder") {
                var _local15 = getStyle("themeColor");
                drawRoundRect(4, 4, _local3 - 2, _local4 - 3, 0, [6184542, 6184542], 10, 0, "radial");
                drawRoundRect(4, 4, _local3 - 1, _local4 - 2, 0, 6184542, 10);
                drawRoundRect(0, 0, _local3 + 1, _local4, 0, [0, 14342874], 100, 250, "linear");
                drawRoundRect(0, 0, _local3 + 1, _local4, 0, _local15, 50);
                drawRoundRect(2, 2, _local3 - 3, _local4 - 4, 0, 16777215, 100);
            } else if (_local5 == "comboNonEdit") {
            } else {
                beginFill(_local7);
                drawRect(0, 0, _local3, _local4);
                drawRect(1, 1, _local3 - 1, _local4 - 1);
                endFill();
                _color = borderColorName;
            }
            if (_local8 != undefined) {
                beginFill(_local8);
                drawRect(_local9, _local9, __get__width() - _local9, __get__height() - _local9);
                endFill();
            }
        }
        function draw3dBorder(c1, c2, c3, c4, c5, c6) {
            var _local3 = __get__width();
            var _local2 = __get__height();
            beginFill(c1);
            drawRect(0, 0, _local3, _local2);
            drawRect(1, 0, _local3 - 1, _local2);
            endFill();
            beginFill(c2);
            drawRect(1, 0, _local3 - 1, 1);
            endFill();
            beginFill(c3);
            drawRect(1, _local2 - 1, _local3 - 1, _local2);
            endFill();
            beginFill(c4);
            drawRect(1, 1, _local3 - 1, 2);
            endFill();
            beginFill(c5);
            drawRect(1, _local2 - 2, _local3 - 1, _local2 - 1);
            endFill();
            beginFill(c6);
            drawRect(1, 2, _local3 - 1, _local2 - 2);
            drawRect(2, 2, _local3 - 2, _local2 - 2);
            endFill();
        }
        static function classConstruct() {
            mx.core.ext.UIObjectExtensions.Extensions();
            _global.styles.rectBorderClass = mx.skins.halo.RectBorder;
            _global.skinRegistry.RectBorder = true;
            return(true);
        }
        static var symbolName = "RectBorder";
        static var symbolOwner = mx.skins.halo.RectBorder;
        static var version = "2.0.2.126";
        var borderCapColorName = "borderCapColor";
        var shadowCapColorName = "shadowCapColor";
        var colorList = {highlightColor:0, borderColor:0, buttonColor:0, shadowColor:0, borderCapColor:0, shadowCapColor:0};
        var borderWidths = {none:0, solid:1, inset:2, outset:2, alert:3, dropDown:2, menuBorder:2, comboNonEdit:2};
        static var classConstructed = classConstruct();
        static var UIObjectExtensionsDependency = mx.core.ext.UIObjectExtensions;
    }
