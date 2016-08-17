
//----------------------------------------------------------------------
//Symbol 108 MovieClip [__Packages.PHON] Frame 0
//----------------------------------------------------------------------
    class PHON
    {
        function PHON () {
        }
        static function serialize(object) {
            if (!(object === null)) {
            } else {
                return("N;");
            }
            switch (typeof(object)) {
                case "boolean" : 
                    return("b:" + (object ? "1;" : "0;"));
                case "number" : 
                    if ((object % 1) == 0) {
                        return(("i:" + object) + ";");
                    }
                    return(("d:" + object) + ";");
                case "string" : 
                    return(((("s:" + strlen(object)) + ":\"") + object) + "\";");
                case "object" : 
                    if (object.push == undefined) {
                        var _local5 = object.toString();
                        var _local3 = 0;
                        var _local2 = "";
                        for (var _local4 in object) {
                            _local3++;
                            _local2 = _local2 + serialize(_local4);
                            _local2 = _local2 + serialize(object[_local4]);
                        }
                        return(((((((("O:" + _local5.length) + ":\"") + _local5) + "\":") + _local3) + ":{") + _local2) + "}");
                    }
                    var _local3 = 0;
                    var _local2 = "";
                    for (var _local4 in object) {
                        _local3++;
                        if ((Number(_local4) == NaN) || ((Number(_local4) % 1) != 0)) {
                            _local2 = _local2 + serialize(_local4);
                        } else {
                            _local2 = _local2 + serialize(Number(_local4));
                        }
                        _local2 = _local2 + serialize(object[_local4]);
                    }
                    return(((("a:" + _local3) + ":{") + _local2) + "}");
            }
            trace(typeof(object));
            return(null);
        }
        static function unserialize(notation) {
            return(_unserialize(notation)[0]);
        }
        static function _unserialize(notation) {
            switch (notation.charAt(0)) {
                case "N" : 
                    return([null, notation.substr(2)]);
                case "b" : 
                    return([notation.substr(2, 1) == "1", notation.substr(4)]);
                case "i" : 
                case "d" : 
                    var _local6 = notation.substring(2, notation.indexOf(";"));
                    return([Number(_local6), notation.substr(_local6.length + 3)]);
                case "s" : 
                    var _local10 = _getLength(notation);
                    var _local5 = 4 + String(_local10).length;
                    var _local2 = _local5;
                    while (_local2 = notation.indexOf("\"", _local2) , _local2 > 0) {
                        if (strlen(notation.substring(_local5, _local2)) == _local10) {
                            return([notation.substring(_local5, _local2), notation.substr(_local2 + 2)]);
                        }
                        _local2++;
                    }
                    break;
                case "a" : 
                    _local10 = _getLength(notation);
                    notation = notation.substr(String(_local10).length + 4);
                    var _local9 = new Array();
                    var _local3;
                    var _local4 = 0;
                    while (_local4 < _local10) {
                        _local3 = _unserialize(notation);
                        notation = _local3[1];
                        _local6 = _unserialize(notation);
                        notation = _local6[1];
                        _local9[_local3[0]] = _local6[0];
                        _local4++;
                    }
                    return([_local9, notation.substr(1)]);
                case "O" : 
                    _local10 = _getLength(notation);
                    var _local11 = notation.substr(String(_local10).length + 4, _local10);
                    notation = notation.substr((String(_local10).length + 6) + _local10);
                    var _local7 = Number(notation.substring(0, notation.indexOf(":")));
                    notation = notation.substr(String(_local7).length + 2);
                    var _local8 = new Object(_local11);
                    var _local12;
                    _local4 = 0;
                    while (_local4 < _local7) {
                        _local3 = _unserialize(notation);
                        notation = _local3[1];
                        _local6 = _unserialize(notation);
                        notation = _local6[1];
                        _local8[_local3[0]] = _local6[0];
                        _local4++;
                    }
                    return([_local8, notation.substr(1)]);
            }
            return([undefined, null]);
        }
        static function strlen(str) {
            var _local2 = 0;
            var _local1 = 0;
            while (_local1 < str.length) {
                if (str.charCodeAt(_local1) < 128) {
                    _local2 = _local2 + 1;
                } else if (str.charCodeAt(_local1) < 2048) {
                    _local2 = _local2 + 2;
                } else if (str.charCodeAt(_local1) < 65536) {
                    _local2 = _local2 + 3;
                } else {
                    _local2 = _local2 + 4;
                }
                _local1++;
            }
            return(_local2);
        }
        static function _getLength(notation) {
            return(Number(notation.substring(2, notation.indexOf(":", 3))));
        }
    }
