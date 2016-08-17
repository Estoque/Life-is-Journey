
//----------------------------------------------------------------------
//Symbol 25 MovieClip [__Packages.mx.skins.SkinElement] Frame 0
//----------------------------------------------------------------------
    class mx.skins.SkinElement extends MovieClip
    {
        var _visible, _x, _y, _width, _height;
        function SkinElement () {
            super();
        }
        static function registerElement(name, className) {
            Object.registerClass(name, ((className == undefined) ? (mx.skins.SkinElement) : (className)));
            _global.skinRegistry[name] = true;
        }
        function __set__visible(visible) {
            _visible = visible;
        }
        function move(x, y) {
            _x = x;
            _y = y;
        }
        function setSize(w, h) {
            _width = w;
            _height = h;
        }
    }
