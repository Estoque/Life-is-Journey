/* jQuery 부분  */
jQuery(document).ready(function(){  // 문서가 모두 읽힌 후에 다음을 실행
    jQuery("blockquote").each( function() {  //blokquote가 사용한 태그
        if (jQuery(this).attr('alt'))
        // 그중 클래스명 있는 것만 찾기
        {
            var temp = jQuery(this).html(); //  내용 복사
            temp = temp.replace(/\n/gi, "");
            temp = temp.replace(/<BR>/gi, "\n");
            temp = temp.replace(/<BR \/>/gi, "\n");
            temp = '<pre><code class="'+ jQuery(this).attr('class') + '">'+temp+'<\/code><\/pre>'
            jQuery(this).after(temp);   // 뒤에 새 작성된 pre 또는 script태그로 붙인다.
            jQuery(this).remove();         //  기존의 인용태그 삭제
        }
    });
    hljs.initHighlightingOnLoad();

});