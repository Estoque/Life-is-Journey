
//----------------------------------------------------------------------
//Symbol 7 MovieClip [__Packages.mx.controls.Loader] Frame 0
//----------------------------------------------------------------------
    class mx.controls.Loader extends mx.core.View
    {
        var _origWidth, _origHeight, __width, livePreview, __height, createTextField, contentHolder, childrenCreated, destroyChildAt, createChild, border_mc;
        function Loader () {
            super();
        }
        function init() {
            super.init();
        }
        function setSize(w, h, noEvent) {
            _origWidth = w;
            _origHeight = h;
            super.setSize(w, h, noEvent);
            if (_global.isLivePreview) {
                livePreview._width = __width - 1;
                livePreview._height = __height - 1;
            }
        }
        function draw() {
            size();
        }
        function size() {
            super.size();
            if (__scaleContent) {
                doScaleContent();
            } else {
                doScaleLoader();
            }
        }
        function createChildren() {
            super.createChildren();
            if (_global.isLivePreview) {
                createTextField("livePreview", -1000, 0, 0, 99, 99);
                livePreview.text = "mx.controls.Loader";
                livePreview.border = true;
            }
            if (__autoLoad) {
                load();
            }
        }
        function getAutoLoad() {
            return(__autoLoad);
        }
        function get autoLoad() {
            return(getAutoLoad());
        }
        function setAutoLoad(b) {
            if (__autoLoad != b) {
                __autoLoad = b;
                if (__autoLoad && (!this[mx.core.View.childNameBase + 0]._complete)) {
                    load();
                }
            }
        }
        function set autoLoad(b) {
            setAutoLoad(b);
            //return(autoLoad);
        }
        function getBytesLoaded() {
            return(__bytesLoaded);
        }
        function get bytesLoaded() {
            return(getBytesLoaded());
        }
        function getBytesTotal() {
            return(__bytesTotal);
        }
        function get bytesTotal() {
            return(getBytesTotal());
        }
        function getContent() {
            return(contentHolder);
        }
        function get content() {
            return(getContent());
        }
        function getContentPath() {
            return(__contentPath);
        }
        function get contentPath() {
            return(getContentPath());
        }
        function setContentPath(url) {
            if (__contentPath != url) {
                __contentPath = url;
                if (childrenCreated) {
                    if (__autoLoad) {
                        load();
                    }
                }
            }
        }
        function set contentPath(c) {
            setContentPath(c);
            //return(contentPath);
        }
        function getPercentLoaded() {
            var _local2 = 100 * (__bytesLoaded / __bytesTotal);
            if (isNaN(_local2)) {
                _local2 = 0;
            }
            return(_local2);
        }
        function get percentLoaded() {
            return(getPercentLoaded());
        }
        function get scaleContent() {
            return(getScaleContent());
        }
        function getScaleContent() {
            return(__scaleContent);
        }
        function setScaleContent(b) {
            if (__scaleContent != b) {
                __scaleContent = b;
                if (__scaleContent) {
                    doScaleContent();
                } else {
                    doScaleLoader();
                }
            }
        }
        function set scaleContent(b) {
            setScaleContent(b);
            //return(scaleContent);
        }
        function load(url) {
            if (url != undefined) {
                __contentPath = url;
            }
            if (this[mx.core.View.childNameBase + 0] != undefined) {
                if (this[mx.core.View.childNameBase + 0]._complete) {
                    setSize(_origWidth, _origHeight);
                }
                destroyChildAt(0);
            }
            if ((__contentPath == undefined) || (__contentPath == "")) {
                return(undefined);
            }
            createChild(__contentPath, "contentHolder");
        }
        function childLoaded(obj) {
            super.childLoaded(obj);
            obj._rotation = 0;
            _origWidth = __width;
            _origHeight = __height;
            if (__scaleContent) {
                doScaleContent();
            } else {
                doScaleLoader();
            }
        }
        function dispatchEvent(obj) {
            if ((obj.type == "progress") || (obj.type == "complete")) {
                obj.target = this;
                __bytesTotal = obj.total;
                __bytesLoaded = obj.current;
            }
            super.dispatchEvent(obj);
        }
        function doScaleContent() {
            if (!this[mx.core.View.childNameBase + 0]._complete) {
                return(undefined);
            }
            unScaleContent();
            var _local2 = border_mc.__get__borderMetrics();
            var _local7 = (_origWidth - _local2.left) - _local2.right;
            var _local6 = (_origHeight - _local2.top) - _local2.bottom;
            var _local9 = _local2.left;
            var _local8 = _local2.top;
            var _local5 = _local7 / contentHolder._width;
            var _local3 = _local6 / contentHolder._height;
            var _local4;
            if (_local5 > _local3) {
                _local9 = _local2.left + Math.floor((_local7 - (contentHolder._width * _local3)) / 2);
                _local4 = _local3;
            } else {
                _local8 = _local2.top + Math.floor((_local6 - (contentHolder._height * _local5)) / 2);
                _local4 = _local5;
            }
            _local4 = _local4 * 100;
            contentHolder._xscale = (contentHolder._yscale = _local4);
            contentHolder._x = _local9;
            contentHolder._y = _local8;
            if ((__width != _origWidth) || (__height != _origHeight)) {
                setSize(_origWidth, _origHeight);
            }
        }
        function doScaleLoader() {
            if (!this[mx.core.View.childNameBase + 0]._complete) {
                return(undefined);
            }
            unScaleContent();
            var _local2 = border_mc.__get__borderMetrics();
            var _local4 = (contentHolder._width + _local2.left) + _local2.right;
            var _local3 = (contentHolder._height + _local2.top) + _local2.bottom;
            if ((__width != _local4) || (__height != _local3)) {
                setSize(_local4, _local3);
            }
            contentHolder._x = _local2.left;
            contentHolder._y = _local2.top;
        }
        function unScaleContent() {
            contentHolder._xscale = (contentHolder._yscale = 100);
            contentHolder._x = (contentHolder._y = 0);
        }
        static var symbolName = "Loader";
        static var symbolOwner = mx.controls.Loader;
        static var version = "2.0.2.126";
        var className = "Loader";
        var clipParameters = {autoLoad:1, scaleContent:1, contentPath:1};
        static var mergedClipParameters = mx.core.UIObject.mergeClipParameters(mx.controls.Loader.prototype.clipParameters, mx.core.View.prototype.clipParameters);
        var __autoLoad = true;
        var __bytesLoaded = undefined;
        var __bytesTotal = undefined;
        var __contentPath = undefined;
        var __scaleContent = true;
    }
