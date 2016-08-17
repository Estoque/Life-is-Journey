카카오링크 API (Mobile Web)
==============

모바일 웹에서는 JavaScript와 Html을 사용하여 카카오링크를 호출합니다.  
위 소스의 실행 결과는 모바일웹에서 [http://kakao.github.com/kakaolink-web/](http://kakao.github.com/kakaolink-web/) 를 입력하여 직접 테스트해볼 수 있습니다.  


카카오톡으로 URL 링크 전달
-------------

모바일웹에서 카카오톡 친구들에게 URL 링크 혹은 메세지(TEXT)를 전송할 수 있습니다.  
> * 지원 OS : iOS, Android, 모바일웹, (Blackberry 추후 지원 예정) 

#### Custom URL Scheme

    kakaolink://sendurl?msg=[message]&url=[url]
    &appid=[appid]&appver=[appver]&type=[type]&appname=[appname]&apiver=[apiver]

#### 파라미터 설명

파라미터 이름   | type	| 필수 여부 | 설명 				| 비고 
---			| ---		| ---		| ---				| --- 
msg			| String	| O 		| 유저에게 전달된 메세지 내용 (UTF-8) | 
url 			| String	| O		| 유저에게 전달될 메세지에 포함되는 링크 url(모바일웹) |  
appid		| String 	| O		| Mobile Site Domain<br/>정확히 입력하지 않을 경우 이용이 제한될 수 있습니다. | 
appver		| String 	| O 		| Mobile Site Version	| 
type			| String	| X 		| 카카오링크 타입 		| link (고정값)  
apiver		| String 	| X		| 카카오링크 API 버전		| 2.0 (고정값)  
appname		| String	| O		| Mobile Site 의 정확한 이름 | 


    
#### 사용 예

> * apiver 파라미터는 `kakao.link.js`에서 처리합니다.

```js
  <script type="text/javascript" src="./kakao.link.js"></script>
  <script type="text/javascript">
  function executeURLLink()
  {
      /* 
      msg, url, appid, appname은 실제 서비스에서 사용하는 정보로 업데이트되어야 합니다. 
      */
      kakao.link("talk").send({
          msg : "카카오링크를 사용하여 메세지를 전달해보세요.; \n 줄바꿈",
          url : "http://link.kakao.com",  
          appid : "m.kakao.com",
          appver : "2.0",
          appname : "카카오",
          type : "link"
      });
  }
  </script>
```


카카오톡으로 APP 링크 전달
-------------
모바일웹에서 카카오톡 친구들에게 해당 앱으로 바로 연결 할 수 있는 링크를 전송할 수 있습니다. 링크를 받는 사람이 해당 앱을 설치하지 않은 경우 설치마켓으로 연결 할 수 있으며, 호환되지 않는 OS의 경우 URL 링크로 대체하여 전달 할 수 있습니다.  
> * 지원 OS : iOS, Android, 모바일웹, (Blackberry 추후 지원 예정)   
> * 지원 설치마켓 : Google Play, App store  

#### Custom URL Scheme

    kakaolink://sendurl?msg=[message]&url=[url]
    &appid=[appid]&appver=[appver]&type=[type]&appname=[appname]&apiver=[apiver]&metainfo=[metainfo]


#### 파라미터 설명

파라미터 이름 	| type	| 필수 여부 | 설명 				| 비고 
---			| ---		| ---		| ---				| --- 
msg			| String	| O 		| 유저에게 전달된 메세지 내용 (UTF-8) | 
url 			| String	| O		| 유저에게 전달될 메세지에 포함되는 링크 url(모바일웹) |  
appid		| String 	| O		| Mobile Site Domain<br/>정확히 입력하지 않을 경우 이용이 제한될 수 있습니다. | 
appver		| String 	| O 		| Mobile Site Version	| 
type			| String	| X 		| 카카오링크 타입 		| link (고정값)  
apiver		| String 	| X		| 카카오링크 API 버전		| 2.0 (고정값)  
appname		| String	| O		| Mobile Site 의 정확한 이름 | 
metainfo		| JSON Object |  O 	| 3rd party app을 구동시키기 위한 meta 정보 <br/>(JSONObject의 String Array 형식으로 지원) | 아래 'metainfo' 참조 


#### metainfo 설명

파라미터 이름 	| 필수 여부 | 설명 				| 비고 
---			| ---		| ---					| --- 
os			| O 		| 앱이 지원하는 OS Platform | ios 또는 android 
devicetype 	| X		| 앱이 지원하는 단말의 종류 | phone 또는 pad  
installurl		| X		| 앱이 설치되지 않은 경우 이동한 Google Play나 iTunes의 설치 url | 
executeurl	| O 		| 앱이 설치된 경우 앱을 구동시키기 위한 url<br/>(custom scheme의 형식만 지원)| 


#### 사용 예

> * APP 링크 전달을 사용할 때에는 meta 정보를 Android, iOS 모두 만들어야 합니다.
> * apiver 파라미터는 `kakao.link.js`에서 처리합니다.

```js
  <script type="text/javascript" src="./kakao.link.js"></script>
  <script type="text/javascript">
  function executeURLLink()
  {
      /* 
      msg, url, appid, appname, metainfo는 실제 서비스에서 사용하는 정보로 업데이트되어야 합니다. 
      */
      kakao.link("talk").send({
          msg : "카카오링크를 사용하여 메세지를 전달해보세요.; \n 줄바꿈",
          url : "http://link.kakao.com",  
          appid : "m.kakao.com",
          appver : "2.0",
          appname : "카카오",
          metainfo : JSON.stringify({metainfo : [ {os:"android", devicetype: "phone",installurl:"market://details?id=com.kakao.talk", executeurl : "kakaoagit://testtest"},{os:"ios", devicetype:"phone",installurl:"items://itunes.apple.com/us/app/kakaotalk/id362057947?mt=8",executeurl : "kakaoagit://testtest"}]}),
          type : "app"
      });
  }
  </script>
```

카카오 스토리로 텍스트/URL 포스팅 전송하기 
-------------
모바일웹에서 텍스트(url 포함 가능)를 카카오스토리로 포스팅할 수 있습니다. 본문에 url이 포함되어 있을 경우 해당 페이지의 썸네일 이미지, 제목, 설명이 자동으로 스크랩되어 포스팅 됩니다. 원하는 정보를 전달하려면 파라미터 중 urlinfo를 활용할 수 있습니다.
> * 지원 OS: iOS, Android, 모바일웹 
> * 카카오스토리에서의 '스크랩 타입'에 대한 정의는 [http://www.kakao.com/link/ko/api_story?tab=mobile](http://www.kakao.com/link/ko/api_story?tab=mobile) 의 내용을 참조하십시오. 

#### 파라미터 설명

파라미터 이름 	| type	| 필수 여부 | 설명 				| 비고 
---			| ---		| ---		| ---				| --- 
post			| String	| O 		| 사용자 메시지 내용(UTF-8) 또는 URL<br/> * 본문에 url이 포함되어 있을 경우 해당 페이지의 썸네일 이미지, 제목, 설명이 자동으로 스크랩되어 포스팅 됩니다. 원하는 정보를 전달하려면 파라미터 중 `urlinfo`를 활용할 수 있습니다.<br/> * 본문에 url이 없는 경우엔 urlinfo를 보내도 동작하지 않습니다. | 
appid		| String 	| O		| Mobile Site Domain<br/>정확히 입력하지 않을 경우 이용이 제한될 수 있습니다. | 
appver		| String 	| O 		| Mobile Site Version	| 
apiver		| String 	| O		| 카카오링크 API 버전		| 1.0 (고정값)  
appname		| String	| O		| Mobile Site 의 정확한 이름 | host(출처)로 이용되니 정확히 기재
urlinfo		| JSON Object | X 	| 스크랩 기능이 동작될 경우 원하는 정보를 보여주기 위한 설정 정보 | 아래 'urlinfo 설명' 참조 


#### urlinfo 설명

파라미터 이름 	| 필수 여부 | 설명 				| 비고 
---			| ---		| ---					| --- 
title			| O 		| 스크랩 형태에 표시되는 제목 | 
desc		 	| X		| 스크랩 형태에 표시되는 설명  | 
imageurl		| X		| 스크랩 형태에 표시되는 대표이미지 url<br/>(JSON Object의 String Array 형식으로 지원) | 
executeurl	| X 		| 스크랩 형태에 사용되는 type | video, music, book, article, profile, website<br/>기본값은 website


#### 사용 예


```js
  <script type="text/javascript" src="./kakao.link.js"></script>
  <script type="text/javascript">
  function executeKakaoStoryLink()
  {
    kakao.link("story").send({   
        post : "http://m.media.daum.net/entertain/enews/view?newsid=20120927110708426",
        appid : "m.media.daum.net",
        appver : "1.0",
        appname : "미디어다음",
        urlinfo : JSON.stringify({title:"(광해) 실제 역사적 진실은?", desc:"(광해 왕이 된 남자)의 역사성 부족을 논하다.", imageurl:["http://m1.daumcdn.net/photo-media/201209/27/ohmynews/R_430x0_20120927141307222.jpg"], type:"article"})
    });
  }
  </script>
```


Required Framework
-------------
Custom Schema 호출을 위해 정의된 Element를 간편하게 다루기 위해 Javascript Library인 JQuery가 필요합니다.  
[www.jquery.com](www.jquery.com)에서 다운로드를 받을 수 있습니다.


개발자용 카카오톡 B.I 다운로드
--------------------------

### [Kakaotalk_BI.zip](http://www.kakao.com/link/images/v2/link/kakaotalk_icon.zip)

*B.I는 카카오링크를 이용하여 카카오톡으로 메시지를 전송하는 기능을 안내하는 버튼/페이지에 한하여 사용하셔야 하며, 다른 페이지나 메뉴 등에서 위 이미지를 그대로 또는 일부 변형하여 사용자가 카카오 제작 앱으로 혼동하게 하시면 안됩니다. 
