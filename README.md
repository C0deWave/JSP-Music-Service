# JSP-Music-Service
대학교 DB과제

프로젝트 이미지
<img src="/JulonMusics/WebContent/capture/album.PNG" title="메인 화면" alt="메인 화면"></img>
위 프로젝트는 DB 수업 시간에 배운 SQL 문을 활용해서 음악파일을 CRUD할수 있게 만든 JSP프로젝트이다.

또한 처음 페이지에서 JFreeChart를 사용해서 단순히 음악을 들은 OLTP를 OLAP로 나타나게 해 보기도 했다.

오라클 18.0c와 연동하였으며 톰캣 7.0버전을 사용했다.<br>
각 파일마다 오라클의 접속 아이디 비번이 C##DBTEST , dbgood 로 되어있다.
```
Connection dbconn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl", "C##DBTEST","dbgood");
```
모든 파일의 위 부분을 바꾸어 주어야 한다.

톰캣과 자바 lib안에 오라클 jdbc가 존재해야 한다.

<H1>오라클 테이블 생성 방법</H1>
해당 프로젝트를 끌어오기 위해서는 오라클에 해당 테이블이 있어야 한다.
<H2>테이블 추가하기</H2>
<pre><code>CREATE TABLE ARTIST 
(
  NAME VARCHAR(20) NOT NULL 
, DEBUTYEAR INT 
, ID INT NOT NULL
, PRIMARY KEY (ID)
);
<br>
CREATE TABLE ALBUM 
(
   NAME VARCHAR(100) NOT NULL
,  RELEASEYEAR VARCHAR(20) 
, ID INT NOT NULL 
, ARTISTID INT NOT NULL 
, FILENAME VARCHAR(100)
, PLANNINGCOMPANY VARCHAR(20) 
, PRIMARY KEY (ID)
, FOREIGN KEY (ARTISTID) REFERENCES ARTIST(ID)
);
<br>
CREATE TABLE MUSIC 
(
  NAME VARCHAR(100) NOT NULL 
, LIKES INT DEFAULT 0 
, ALBUMID INT NOT NULL 
, ARTISTID INT NOT NULL
, ID INT NOT NULL 
, GENRE VARCHAR(20) 
, FILENAME VARCHAR(100)
, PRIMARY KEY (ID)
, FOREIGN KEY(ARTISTID) REFERENCES ARTIST(ID)
, FOREIGN KEY(ALBUMID) REFERENCES ALBUM(ID)
);
<br>
CREATE TABLE CUSTOMER 
(
  ID INT NOT NULL 
, AGE INT 
, NAME VARCHAR(100) NOT NULL 
, JOB VARCHAR(20) 
, PRIMARY KEY (ID)
);
<br>
CREATE TABLE PLAYMUSIC
(
   MUSICID INT NOT NULL
,  CUSTOMERID INT NOT NULL
,  FOREIGN KEY (MUSICID) REFERENCES MUSIC(ID)
,  FOREIGN KEY (CUSTOMERID) REFERENCES CUSTOMER(ID)
);
</code></pre>

처음 정보 추가하기 예제
미리 정보를 넣고 싶다면 아래와 같은 예제의 방식으로 넣으면 된다.

내부적으로 파일을 읽거나 삭제할 때 파일의 이름을 ID값으로 바꾸어서 할당 하도록 했다.
한글이나 공백이 들어간 파일의 경우에는 mp3재생이 되지 않았다.
<pre><code>//아티스트 내용 추가
INSERT INTO ARTIST(ID,NAME,DEBUTYEAR) VALUES (1,'트와이스',2015);
INSERT INTO ARTIST(ID,NAME,DEBUTYEAR) VALUES (2,'레드벨벳',2014);

//앨범 내용 추가
//파일은 알아서 구하자
INSERT INTO ALBUM(ARTISTID,ID,NAME,PLANNINGCOMPANY,RELEASEYEAR) VALUES(1,1,'The Story Begins','JYPE',2015);
INSERT INTO ALBUM(ARTISTID,ID,NAME,PLANNINGCOMPANY,RELEASEYEAR) VALUES(2,2,'Ice Cream Cake','SME',2015);

//음악 내용 추가
INSERT INTO MUSIC(ALBUMID,ARTISTID,NAME,LIKES,ID,GENRE) VALUES
(1,1,'OOH-AHH하게',0,1,'신남');
--(1,1,'노래명',0,0,하나씩 늘어남,'장르');
INSERT INTO MUSIC(ALBUMID,ARTISTID,NAME,LIKES,ID,GENRE) VALUES
(1,1,'다시해줘',0,2,'신남');
--(1,1,'노래명',0,0,하나씩 늘어남,'장르');
INSERT INTO MUSIC(ALBUMID,ARTISTID,NAME,LIKES,ID,GENRE) VALUES
(1,1,'미쳤나봐',0,3,'신남');
--(1,1,'노래명',0,0,하나씩 늘어남,'장르');
INSERT INTO MUSIC(ALBUMID,ARTISTID,NAME,LIKES,ID,GENRE) VALUES
(1,1,'Truth',0,4,'신남');
--(1,1,'노래명',0,0,하나씩 늘어남,'장르');
INSERT INTO MUSIC(ALBUMID,ARTISTID,NAME,LIKES,ID,GENRE) VALUES
(1,1,'Candy Boy',0,5,'신남');
--(1,1,'노래명',0,0,하나씩 늘어남,'장르');
INSERT INTO MUSIC(ALBUMID,ARTISTID,NAME,LIKES,ID,GENRE) VALUES
(1,1,'Like a Fool',0,6,'감성');
--(1,1,'노래명',0,0,하나씩 늘어남,'장르');

INSERT INTO MUSIC(ALBUMID,ARTISTID,NAME,LIKES,ID,GENRE) VALUES
(2,2,'Ice Cream Cake',0,7,'신남');
--(1,1,'노래명',0,0,하나씩 늘어남,'장르');
INSERT INTO MUSIC(ALBUMID,ARTISTID,NAME,LIKES,ID,GENRE) VALUES
(2,2,'Automatic',0,8,'그루브');
--(1,1,'노래명',0,0,하나씩 늘어남,'장르');
INSERT INTO MUSIC(ALBUMID,ARTISTID,NAME,LIKES,ID,GENRE) VALUES
(2,2,'Somethin Kinda Crazy',0,9,'몽환');
--(1,1,'노래명',0,0,하나씩 늘어남,'장르');
INSERT INTO MUSIC(ALBUMID,ARTISTID,NAME,LIKES,ID,GENRE) VALUES
(2,2,'Stupid Cupid',0,10,'신남');
--(1,1,'노래명',0,0,하나씩 늘어남,'장르');
INSERT INTO MUSIC(ALBUMID,ARTISTID,NAME,LIKES,ID,GENRE) VALUES
(2,2,'Take It Slow',0,11,'감성');
--(1,1,'노래명',0,0,하나씩 늘어남,'장르');
INSERT INTO MUSIC(ALBUMID,ARTISTID,NAME,LIKES,ID,GENRE) VALUES
(2,2,'사탕',0,12,'빈티지');
--(1,1,'노래명',0,0,하나씩 늘어남,'장르');

//음악의 mp3파일명 추가하기
//나중에 추가해서 따로 했었다.
//파일을 CRUD할때도 id값에 맞게 파일의 이름을 바꿔 업로드하고 삭제한다.
UPDATE MUSIC SET FILENAME = '1.mp3' WHERE 1 = ID;
UPDATE MUSIC SET FILENAME = '11.mp3' WHERE 11 = ID;
UPDATE MUSIC SET FILENAME = '12.mp3' WHERE 12 = ID;
UPDATE MUSIC SET FILENAME = '2.mp3' WHERE 2 = ID;
UPDATE MUSIC SET FILENAME = '3.mp3' WHERE 3 = ID;
UPDATE MUSIC SET FILENAME = '4.mp3' WHERE 4 = ID;
UPDATE MUSIC SET FILENAME = '5.mp3' WHERE 5 = ID;
UPDATE MUSIC SET FILENAME = '6.mp3' WHERE 6 = ID;
UPDATE MUSIC SET FILENAME = '7.mp3' WHERE 7 = ID;
UPDATE MUSIC SET FILENAME = '8.mp3' WHERE 8 = ID;
UPDATE MUSIC SET FILENAME = '9.mp3' WHERE 9 = ID;
UPDATE MUSIC SET FILENAME = '10.mp3' WHERE 10 = ID;

//앨범의 이미지 파일명 추가
UPDATE ALBUM SET FILENAME = '1.jpg' WHERE 1 = ID;
UPDATE ALBUM SET FILENAME = '2.jpg' WHERE 2 = ID;

</code></pre>
