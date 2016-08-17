
//----------------------------------------------------------------------
//Symbol 82 MovieClip [__Packages.net.imazing.util.JukeBox] Frame 0
//----------------------------------------------------------------------
    class net.imazing.util.JukeBox
    {
        var list, fade, sound, current, _volume, _maxVolume, here, loop, _pause, dispatchEvent, fadeInterval, addEventListener, removeEventListener;
        function JukeBox (sound) {
            list = new Array();
            fade = true;
            this.sound = sound;
            current = 0;
            _volume = 100;
            _maxVolume = 100;
            here = this;
            loop = true;
            var _here = this;
            _pause = 0;
            mx.events.EventDispatcher.initialize(this);
            this.sound.onLoad = function () {
                this.setVolume(_here._volume);
                _here.dispatchEvent({type:"onLoad", target:_here});
            };
            this.sound.onSoundComplete = function () {
                _here._volume = _here.sound.getVolume();
                _here.current = (_here.current + 1) % _here.total();
                _here.sound.loadSound(_here.list[_here.current], true);
                _here.dispatchEvent({type:"onChange", target:_here});
                _here.dispatchEvent({type:"onSoundComplete", target:_here});
            };
        }
        function setFade(value) {
            fade = value;
        }
        function setLoop(value) {
            loop = value;
        }
        function setMaxVolume(value) {
            setVolume(value);
            _maxVolume = value;
        }
        function getMaxVolume() {
            return(_maxVolume);
        }
        function getSound() {
            return(sound);
        }
        function addItem(value) {
            list.push(value);
        }
        function addItemAt(index, value) {
            list.splice(index, 0, value);
        }
        function removeAt(index) {
            list.splice(index, 1);
        }
        function removeAll() {
            sound.stop();
            current = 0;
            list = new Array();
        }
        function get name() {
            return(list[current]);
        }
        function next() {
            if ((getVolume() == 0) || (sound.duration == undefined)) {
                dispatchEvent({type:"onPlay", target:this});
            }
            clearInterval(fadeInterval);
            fadeInterval = setInterval(fadeOut, 33.3333333333333, this);
            var listener = new Object();
            var _local2 = this;
            listener.doFadeOut = function (event) {
                if (event.target.loop == true) {
                    event.target.current = (event.target.current + 1) % event.target.total();
                } else if (event.target.current < event.target.total()) {
                    event.target.current = event.target.current + 1;
                }
                event.target.setVolume(event.target._maxVolume);
                if (event.target.current < event.target.total()) {
                    trace(event.target.list[event.target.current]);
                    event.target.sound.loadSound(event.target.list[event.target.current], true);
                    event.target.dispatchEvent({type:"onChange", target:event.target});
                } else {
                    event.target.dispatchEvent({type:"onEndSound", target:event.target});
                }
                event.target.removeEventListener("doFadeOut", listener);
            };
            addEventListener("doFadeOut", listener);
        }
        function prev() {
            if ((getVolume() == 0) || (sound.duration == undefined)) {
                dispatchEvent({type:"onPlay", target:this});
            }
            clearInterval(fadeInterval);
            fadeInterval = setInterval(fadeOut, 33.3333333333333, this);
            var listener = new Object();
            var _local3 = this;
            listener.doFadeOut = function (event) {
                var _local2;
                if (event.target.loop == true) {
                    trace(event.target.current - 1);
                    if ((event.target.current - 1) < 0) {
                        _local2 = (event.target.current = event.target.total() - 1);
                    } else {
                        _local2 = (event.target.current = event.target.current - 1);
                    }
                } else if (event.target.current >= 0) {
                    event.target.current = event.target.current - 1;
                }
                event.target.setVolume(event.target._maxVolume);
                if ((event.target.current >= 0) && (event.target.loop == false)) {
                    event.target.sound.loadSound(event.target.list[event.target.current], true);
                    event.target.dispatchEvent({type:"onChange", target:event.target});
                } else if (event.target.loop == true) {
                    event.target.sound.loadSound(event.target.list[_local2], true);
                    event.target.dispatchEvent({type:"onChange", target:event.target});
                } else {
                    event.target.dispatchEvent({type:"onEndSound", target:event.target});
                }
                event.target.removeEventListener("doFadeOut", listener);
            };
            removeEventListener("doFadeOut", listener);
            addEventListener("doFadeOut", listener);
        }
        function goto(index) {
            if ((getVolume() == 0) || (sound.duration == undefined)) {
                dispatchEvent({type:"onPlay", target:this});
            }
            clearInterval(fadeInterval);
            fadeInterval = setInterval(fadeOut, 33.3333333333333, this);
            var listener = new Object();
            var _local2 = this;
            listener.doFadeOut = function (event) {
                var _local4;
                event.target.current = index;
                event.target.setVolume(event.target._maxVolume);
                event.target.sound.loadSound(event.target.list[event.target.current], true);
                event.target.dispatchEvent({type:"onChange", target:event.target});
                event.target.removeEventListener("doFadeOut", listener);
            };
            removeEventListener("doFadeOut", listener);
            addEventListener("doFadeOut", listener);
        }
        function get length() {
            return(list.length);
        }
        function play() {
            if (loop == false) {
                if (current < 0) {
                    current = 0;
                } else if (current == total()) {
                    current = total() - 1;
                }
            }
            setVolume(_maxVolume);
            sound.loadSound(list[current], true);
            dispatchEvent({type:"onChange", target:this});
            dispatchEvent({type:"onPlay", target:this});
        }
        function stop() {
            clearInterval(fadeInterval);
            fadeInterval = setInterval(fadeOut, 33.3333333333333, this);
            var listener = new Object();
            listener.doFadeOut = function (event) {
                event.target.sound.stop();
                event.target.removeEventListener("doFadeOut", listener);
            };
            removeEventListener("doFadeOut", listener);
            addEventListener("doFadeOut", listener);
            dispatchEvent({type:"onStop", target:this});
        }
        function pause() {
            _pause = sound.position;
            sound.stop();
        }
        function total() {
            return(list.length);
        }
        function items() {
            return(list);
        }
        function rewind() {
            current = 0;
        }
        function setVolume(value) {
            if (_maxVolume < value) {
                value = _maxVolume;
            }
            _volume = value;
            sound.setVolume(value);
        }
        function getVolume() {
            return(sound.getVolume());
        }
        function mute() {
            clearInterval(fadeInterval);
            fadeInterval = setInterval(fadeOut, 33.3333333333333, this);
        }
        function unmute() {
            clearInterval(fadeInterval);
            fadeInterval = setInterval(fadeIn, 33.3333333333333, this);
        }
        function fadeOut(here) {
            if (here.fade == true) {
                if (here.getVolume() > 0) {
                    here.setVolume(here.getVolume() - 10);
                } else {
                    clearInterval(here.fadeInterval);
                    here.setVolume(0);
                    here.dispatchEvent({type:"doFadeOut", target:here});
                }
            } else {
                clearInterval(here.fadeInterval);
                here.dispatchEvent({type:"doFadeOut", target:here});
            }
        }
        function fadeIn(here) {
            if (here.fade == true) {
                if (here.getVolume() < here._maxVolume) {
                    here.setVolume(here.getVolume() + 10);
                } else {
                    clearInterval(here.fadeInterval);
                    here.setVolume(here._maxVolume);
                    here.dispatchEvent({type:"doFadeIn", target:here});
                }
            } else {
                clearInterval(here.fadeInterval);
                here.dispatchEvent({type:"doFadeIn", target:here});
            }
        }
    }
