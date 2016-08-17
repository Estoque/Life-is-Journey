
//----------------------------------------------------------------------
//Symbol 109 MovieClip [__Packages.mx.transitions.TransitionManager] Frame 0
//----------------------------------------------------------------------
    class mx.transitions.TransitionManager
    {
        var _transitions, removeEventListener, _content, addEventListener, _contentAppearance, _innerBounds, _outerBounds, _width, _height, _triggerEvent, dispatchEvent;
        function TransitionManager (content) {
            this.content = (content);
            _transitions = {};
        }
        function set content(c) {
            removeEventListener("allTransitionsInDone", _content);
            removeEventListener("allTransitionsOutDone", _content);
            _content = c;
            saveContentAppearance();
            addEventListener("allTransitionsInDone", _content);
            addEventListener("allTransitionsOutDone", _content);
            //return(content);
        }
        function get content() {
            return(_content);
        }
        function get transitionsList() {
            return(_transitions);
        }
        function get numTransitions() {
            var _local2 = 0;
            for (var _local3 in _transitions) {
                _local2++;
            }
            return(_local2);
        }
        function get numInTransitions() {
            var _local3 = 0;
            var _local2 = _transitions;
            for (var _local4 in _local2) {
                if (!_local2[_local4].direction) {
                    _local3++;
                }
            }
            return(_local3);
        }
        function get numOutTransitions() {
            var _local3 = 0;
            var _local2 = _transitions;
            for (var _local4 in _local2) {
                if (_local2[_local4].direction) {
                    _local3++;
                }
            }
            return(_local3);
        }
        function get contentAppearance() {
            return(_contentAppearance);
        }
        static function start(content, transParams) {
            if (content.__transitionManager == undefined) {
                content.__transitionManager = new mx.transitions.TransitionManager(content);
            }
            if (transParams.direction == 1) {
                content.__transitionManager._triggerEvent = "hide";
            } else {
                content.__transitionManager._triggerEvent = "reveal";
            }
            return(content.__transitionManager.startTransition(transParams));
        }
        function startTransition(transParams) {
            removeTransition(findTransition(transParams));
            var _local3 = transParams.type;
            var _local2 = new _local3[undefined](_content, transParams, this);
            addTransition(_local2);
            _local2.start();
            return(_local2);
        }
        function addTransition(trans) {
            trans.ID = ++IDCount;
            _transitions[trans.ID] = trans;
            return(trans);
        }
        function removeTransition(trans) {
            if (_transitions[trans.ID] == undefined) {
                return(false);
            }
            trans.cleanUp();
            return(delete _transitions[trans.ID]);
        }
        function findTransition(transParams) {
            var _local2;
            for (var _local4 in _transitions) {
                _local2 = _transitions[_local4];
                if (_local2.type == transParams.type) {
                    return(_local2);
                }
            }
            return(undefined);
        }
        function removeAllTransitions() {
            for (var _local2 in _transitions) {
                _transitions[_local2].cleanUp();
                removeTransition(_transitions[_local2]);
            }
        }
        function saveContentAppearance() {
            var _local2 = _content;
            if (_contentAppearance == undefined) {
                var _local3 = (_contentAppearance = {});
                for (var _local4 in _visualPropList) {
                    _local3[_local4] = _local2[_local4];
                }
                _local3.colorTransform = new Color(_local2).getTransform();
            }
            _innerBounds = _local2.getBounds(targetPath(_local2));
            _outerBounds = _local2.getBounds(targetPath(_local2._parent));
            _width = _local2._width;
            _height = _local2._height;
        }
        function restoreContentAppearance() {
            var _local2 = _content;
            var _local3 = _contentAppearance;
            for (var _local4 in _visualPropList) {
                _local2[_local4] = _local3[_local4];
            }
            new Color(_local2).setTransform(_local3.colorTransform);
        }
        function transitionInDone(e) {
            removeTransition(e.target);
            if (numInTransitions == 0) {
                var _local2;
                _local2 = _content._visible;
                if ((_triggerEvent == "hide") || (_triggerEvent == "hideChild")) {
                    _content._visible = false;
                }
                if (_local2) {
                    dispatchEvent({type:"allTransitionsInDone", target:this});
                }
            }
        }
        function transitionOutDone(e) {
            removeTransition(e.target);
            if (numOutTransitions == 0) {
                restoreContentAppearance();
                var _local2;
                _local2 = _content._visible;
                if (_local2 && ((_triggerEvent == "hide") || (_triggerEvent == "hideChild"))) {
                    _content._visible = false;
                }
                updateAfterEvent();
                if (_local2) {
                    dispatchEvent({type:"allTransitionsOutDone", target:this});
                }
            }
        }
        function toString() {
            return("[TransitionManager]");
        }
        static var version = "1.1.0.52";
        static var IDCount = 0;
        var type = mx.transitions.TransitionManager;
        var className = "TransitionManager";
        var _visualPropList = {_x:null, _y:null, _xscale:null, _yscale:null, _alpha:null, _rotation:null};
        static var __mixinFED = mx.events.EventDispatcher.initialize(mx.transitions.TransitionManager.prototype);
    }
