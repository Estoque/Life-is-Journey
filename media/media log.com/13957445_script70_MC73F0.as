
//----------------------------------------------------------------------
//Symbol 73 MovieClip [__Packages.com.tattertools.controls.MP3PlayerMini] Frame 0
//----------------------------------------------------------------------
    class com.tattertools.controls.MP3PlayerMini extends mx.core.UIComponent
    {
        var boundingBox_mc, soundObj, jukebox, _initPath, createEmptyMovieClip, attachMovie, play_bnt, stop_bnt, border, __get__width, __get__height;
        function MP3PlayerMini () {
            super();
        }
        function init() {
            function onPlay() {
                this.dispatchEvent({type:"onPlay"});
            }
            function onStop() {
                this.dispatchEvent({type:"onStop"});
            }
            function onSoundComplete() {
                (this.stop());// not popped
                this.dispatchEvent({type:"onSoundComplete"});
            }
            function onLoad() {
                this.dispatchEvent({type:"onLoad"});
            }
            function onChange() {
                this.dispatchEvent({type:"onChange"});
            }
            super.init();
            boundingBox_mc._visible = false;
            boundingBox_mc._width = (boundingBox_mc._height = 0);
            soundObj = new Sound();
            jukebox = new net.imazing.util.JukeBox(soundObj);
            jukebox.addEventListener("onPlay", mx.utils.Delegate.create(this, onPlay));
            jukebox.addEventListener("onStop", mx.utils.Delegate.create(this, onStop));
            jukebox.addEventListener("onSoundComplete", mx.utils.Delegate.create(this, onSoundComplete));
            jukebox.addEventListener("onLoad", mx.utils.Delegate.create(this, onLoad));
            jukebox.addEventListener("onChange", mx.utils.Delegate.create(this, onChange));
            mx.events.EventDispatcher.initialize(this);
            if (_initPath != undefined) {
                jukebox.removeAll();
                jukebox.addItem(_initPath);
            }
        }
        function createChildren() {
            createEmptyMovieClip("border", 1);
            attachMovie("Stop", "stop_bnt", 1000, {_visible:false});
            attachMovie("Play", "play_bnt", 1001);
            play_bnt.onRelease = function () {
                this._parent.play();
            };
            stop_bnt.onRelease = function () {
                this._parent.stop();
            };
        }
        function play() {
            if (jukebox.__get__length() == 0) {
                return(undefined);
            }
            play_bnt._visible = false;
            stop_bnt._visible = true;
            jukebox.play();
        }
        function stop() {
            play_bnt._visible = true;
            stop_bnt._visible = false;
            jukebox.stop();
        }
        function set contentPath(path) {
            if (_initPath == undefined) {
                jukebox.removeAll();
                jukebox.addItem(path);
            } else {
                _initPath = path;
            }
            //return(contentPath);
        }
        function get contentPath() {
            return(jukebox.__get__name());
        }
        function size(Void) {
            super.size();
            invalidate();
            preset = true;
        }
        function set volume(vol) {
            jukebox.setVolume(vol);
            //return(volume);
        }
        function get volume() {
            return(jukebox.getVolume());
        }
        function get bg() {
            return(border);
        }
        function invalidate(Void) {
            if (!preset) {
                bg.clear();
                bg.lineStyle(0, 14540253, 100);
                bg.beginFill(16777215);
                bg.moveTo(0, 0);
                bg.lineTo(__get__width(), 0);
                bg.lineTo(__get__width(), __get__height());
                bg.lineTo(0, __get__height());
                bg.lineTo(0, 0);
                bg.endFill();
            }
            stop_bnt._x = Math.floor((__get__width() / 2) - (stop_bnt._width / 2));
            stop_bnt._y = Math.floor((__get__height() / 2) - (stop_bnt._height / 2));
            play_bnt._x = Math.floor((__get__width() / 2) - (play_bnt._width / 2));
            play_bnt._y = Math.floor((__get__height() / 2) - (play_bnt._height / 2));
        }
        static var symbolName = "MP3PlayerMini";
        static var symbolOwner = com.tattertools.controls.MP3PlayerMini;
        var className = "MP3PlayerMini";
        var _defaultWidth = 100;
        var _defaultHeight = 100;
        var preset = false;
    }
