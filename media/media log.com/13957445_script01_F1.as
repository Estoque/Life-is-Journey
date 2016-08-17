
//----------------------------------------------------------------------
//Frame 1
//----------------------------------------------------------------------
    System.security.allowDomain("*");
    Stage.scaleMode = "noScale";
    Stage.align = "lt";
    if (_url.indexOf("file:///") > -1) {
        path = "http://egoing.egoing.tt/media/data";
    }
    attachMovie("Stage", "mediaStage", 1, {url:path});
    bg._x = (bg._y = 0);
    bg._width = Stage.width;
    bg._height = Stage.height;

