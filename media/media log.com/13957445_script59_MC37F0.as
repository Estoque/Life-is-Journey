
//----------------------------------------------------------------------
//Symbol 37 MovieClip [__Packages.mx.skins.halo.Defaults] Frame 0
//----------------------------------------------------------------------
    class mx.skins.halo.Defaults
    {
        var beginGradientFill, beginFill, moveTo, lineTo, curveTo, endFill;
        function Defaults () {
        }
        static function setThemeDefaults() {
            var _local2 = _global.style;
            _local2.themeColor = 8453965 /* 0x80FF4D */;
            _local2.disabledColor = 8684164 /* 0x848284 */;
            _local2.modalTransparency = 0;
            _local2.filled = true;
            _local2.stroked = true;
            _local2.strokeWidth = 1;
            _local2.strokeColor = 0;
            _local2.fillColor = 16777215 /* 0xFFFFFF */;
            _local2.repeatInterval = 35;
            _local2.repeatDelay = 500;
            _local2.fontFamily = "_sans";
            _local2.fontSize = 12;
            _local2.selectionColor = 13500353 /* 0xCDFFC1 */;
            _local2.rollOverColor = 14942166 /* 0xE3FFD6 */;
            _local2.useRollOver = true;
            _local2.backgroundDisabledColor = 14540253 /* 0xDDDDDD */;
            _local2.selectionDisabledColor = 14540253 /* 0xDDDDDD */;
            _local2.selectionDuration = 200;
            _local2.openDuration = 250;
            _local2.borderStyle = "inset";
            _local2.color = 734012 /* 0x0B333C */;
            _local2.textSelectedColor = 24371;
            _local2.textRollOverColor = 2831164 /* 0x2B333C */;
            _local2.textDisabledColor = 16777215 /* 0xFFFFFF */;
            _local2.vGridLines = true;
            _local2.hGridLines = false;
            _local2.vGridLineColor = 6710886 /* 0x666666 */;
            _local2.hGridLineColor = 6710886 /* 0x666666 */;
            _local2.headerColor = 15395562 /* 0xEAEAEA */;
            _local2.indentation = 17;
            _local2.folderOpenIcon = "TreeFolderOpen";
            _local2.folderClosedIcon = "TreeFolderClosed";
            _local2.defaultLeafIcon = "TreeNodeIcon";
            _local2.disclosureOpenIcon = "TreeDisclosureOpen";
            _local2.disclosureClosedIcon = "TreeDisclosureClosed";
            _local2.popupDuration = 150;
            _local2.todayColor = 6710886 /* 0x666666 */;
            _local2 = (_global.styles.ScrollSelectList = new mx.styles.CSSStyleDeclaration());
            _local2.backgroundColor = 16777215 /* 0xFFFFFF */;
            _local2.borderColor = 13290186 /* 0xCACACA */;
            _local2.borderStyle = "inset";
            _local2 = (_global.styles.ComboBox = new mx.styles.CSSStyleDeclaration());
            _local2.borderStyle = "inset";
            _local2 = (_global.styles.NumericStepper = new mx.styles.CSSStyleDeclaration());
            _local2.textAlign = "center";
            _local2 = (_global.styles.RectBorder = new mx.styles.CSSStyleDeclaration());
            _local2.borderColor = 14015965 /* 0xD5DDDD */;
            _local2.buttonColor = 7305079 /* 0x6F7777 */;
            _local2.shadowColor = 15658734 /* 0xEEEEEE */;
            _local2.highlightColor = 12897484 /* 0xC4CCCC */;
            _local2.shadowCapColor = 14015965 /* 0xD5DDDD */;
            _local2.borderCapColor = 9542041 /* 0x919999 */;
            var _local4 = new Object();
            _local4.borderColor = 16711680 /* 0xFF0000 */;
            _local4.buttonColor = 16711680 /* 0xFF0000 */;
            _local4.shadowColor = 16711680 /* 0xFF0000 */;
            _local4.highlightColor = 16711680 /* 0xFF0000 */;
            _local4.shadowCapColor = 16711680 /* 0xFF0000 */;
            _local4.borderCapColor = 16711680 /* 0xFF0000 */;
            mx.core.UIComponent.prototype.origBorderStyles = _local4;
            var _local3;
            _local3 = (_global.styles.TextInput = new mx.styles.CSSStyleDeclaration());
            _local3.backgroundColor = 16777215 /* 0xFFFFFF */;
            _local3.borderStyle = "inset";
            _global.styles.TextArea = _global.styles.TextInput;
            _local3 = (_global.styles.Window = new mx.styles.CSSStyleDeclaration());
            _local3.borderStyle = "default";
            _local3 = (_global.styles.windowStyles = new mx.styles.CSSStyleDeclaration());
            _local3.fontWeight = "bold";
            _local3 = (_global.styles.dataGridStyles = new mx.styles.CSSStyleDeclaration());
            _local3.fontWeight = "bold";
            _local3 = (_global.styles.Alert = new mx.styles.CSSStyleDeclaration());
            _local3.borderStyle = "alert";
            _local3 = (_global.styles.ScrollView = new mx.styles.CSSStyleDeclaration());
            _local3.borderStyle = "inset";
            _local3 = (_global.styles.View = new mx.styles.CSSStyleDeclaration());
            _local3.borderStyle = "none";
            _local3 = (_global.styles.ProgressBar = new mx.styles.CSSStyleDeclaration());
            _local3.color = 11187123 /* 0xAAB3B3 */;
            _local3.fontWeight = "bold";
            _local3 = (_global.styles.AccordionHeader = new mx.styles.CSSStyleDeclaration());
            _local3.fontWeight = "bold";
            _local3.fontSize = "11";
            _local3 = (_global.styles.Accordion = new mx.styles.CSSStyleDeclaration());
            _local3.borderStyle = "solid";
            _local3.backgroundColor = 16777215 /* 0xFFFFFF */;
            _local3.borderColor = 9081738 /* 0x8A938A */;
            _local3.headerHeight = 22;
            _local3.marginLeft = (_local3.marginRight = (_local3.marginTop = (_local3.marginBottom = -1)));
            _local3.verticalGap = -1;
            _local3 = (_global.styles.DateChooser = new mx.styles.CSSStyleDeclaration());
            _local3.borderColor = 9542041 /* 0x919999 */;
            _local3.headerColor = 16777215 /* 0xFFFFFF */;
            _local3 = (_global.styles.CalendarLayout = new mx.styles.CSSStyleDeclaration());
            _local3.fontSize = 10;
            _local3.textAlign = "right";
            _local3.color = 2831164 /* 0x2B333C */;
            _local3 = (_global.styles.WeekDayStyle = new mx.styles.CSSStyleDeclaration());
            _local3.fontWeight = "bold";
            _local3.fontSize = 11;
            _local3.textAlign = "center";
            _local3.color = 2831164 /* 0x2B333C */;
            _local3 = (_global.styles.TodayStyle = new mx.styles.CSSStyleDeclaration());
            _local3.color = 16777215 /* 0xFFFFFF */;
            _local3 = (_global.styles.HeaderDateText = new mx.styles.CSSStyleDeclaration());
            _local3.fontSize = 12;
            _local3.fontWeight = "bold";
            _local3.textAlign = "center";
        }
        function drawRoundRect(x, y, w, h, r, c, alpha, rot, gradient, ratios) {
            if (typeof(r) == "object") {
                var _local18 = r.br;
                var _local16 = r.bl;
                var _local15 = r.tl;
                var _local10 = r.tr;
            } else {
                var _local10 = r;
                var _local15 = _local10;
                var _local16 = _local15;
                var _local18 = _local16;
            }
            if (typeof(c) == "object") {
                if (typeof(alpha) != "object") {
                    var _local9 = [alpha, alpha];
                } else {
                    var _local9 = alpha;
                }
                if (ratios == undefined) {
                    ratios = [0, 255];
                }
                var _local14 = h * 0.7;
                if (typeof(rot) != "object") {
                    var _local11 = {matrixType:"box", x:-_local14, y:_local14, w:w * 2, h:h * 4, r:rot * 0.0174532925199433 /* Math.PI/180 */};
                } else {
                    var _local11 = rot;
                }
                if (gradient == "radial") {
                    beginGradientFill("radial", c, _local9, ratios, _local11);
                } else {
                    beginGradientFill("linear", c, _local9, ratios, _local11);
                }
            } else if (c != undefined) {
                beginFill(c, alpha);
            }
            r = _local18;
            var _local13 = r - (r * 0.707106781186547);
            var _local12 = r - (r * 0.414213562373095);
            moveTo(x + w, (y + h) - r);
            lineTo(x + w, (y + h) - r);
            curveTo(x + w, (y + h) - _local12, (x + w) - _local13, (y + h) - _local13);
            curveTo((x + w) - _local12, y + h, (x + w) - r, y + h);
            r = _local16;
            _local13 = r - (r * 0.707106781186547);
            _local12 = r - (r * 0.414213562373095);
            lineTo(x + r, y + h);
            curveTo(x + _local12, y + h, x + _local13, (y + h) - _local13);
            curveTo(x, (y + h) - _local12, x, (y + h) - r);
            r = _local15;
            _local13 = r - (r * 0.707106781186547);
            _local12 = r - (r * 0.414213562373095);
            lineTo(x, y + r);
            curveTo(x, y + _local12, x + _local13, y + _local13);
            curveTo(x + _local12, y, x + r, y);
            r = _local10;
            _local13 = r - (r * 0.707106781186547);
            _local12 = r - (r * 0.414213562373095);
            lineTo((x + w) - r, y);
            curveTo((x + w) - _local12, y, (x + w) - _local13, y + _local13);
            curveTo(x + w, y + _local12, x + w, y + r);
            lineTo(x + w, (y + h) - r);
            if (c != undefined) {
                endFill();
            }
        }
        static function classConstruct() {
            mx.core.ext.UIObjectExtensions.Extensions();
            setThemeDefaults();
            mx.core.UIObject.prototype.drawRoundRect = mx.skins.halo.Defaults.prototype.drawRoundRect;
            return(true);
        }
        static var classConstructed = classConstruct();
        static var CSSStyleDeclarationDependency = mx.styles.CSSStyleDeclaration;
        static var UIObjectExtensionsDependency = mx.core.ext.UIObjectExtensions;
        static var UIObjectDependency = mx.core.UIObject;
    }
