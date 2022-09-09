-- user 샘플데이터
INSERT INTO ci_user (username, password, name, authorities) VALUES
('USER1', '1234', '회원1', 'ROLE_MEMBER'),
('USER2', '1234', '회원2', null),
('ADMIN1', '1234', '관리자1', 'ROLE_MEMBER,ROLE_ADMIN'),
('1234', '1234', '테스트1', 'ROLE_MEMBER')
;
-- movies 샘플데이터
INSERT INTO ci_movies (title, genre, runtime, director, actor, synopsis) VALUES
('코린이의 모험', '액션, 스릴러', 125, '김대진', '김대진, 정의형, 김종훈',
'조직 내 숨어든 스파이를 색출하라!
‘사냥꾼’이 될 것인가, ‘사냥감’이 될 것인가!

망명을 신청한 북한 고위 관리를 통해 정보를 입수한
안기부 해외팀 ‘박평호’(이정재)와 국내팀 ‘김정도’(정우성)는
조직 내 숨어든 스파이 ‘동림’ 색출 작전을 시작한다.
스파이를 통해 일급 기밀사항들이 유출되어 위기를 맞게 되자
날 선 대립과 경쟁 속, 해외팀과 국내팀은 상대를 용의선상에 올려두고
조사에 박차를 가한다.

찾아내지 못하면 스파이로 지목이 될 위기의 상황,
서로를 향해 맹렬한 추적을 펼치던 ‘박평호’와 ‘김정도’는
감춰진 실체에 다가서게 되고,
마침내 ‘대한민국 1호 암살 작전’이라는 거대한 사건과 직면하게 되는데……

하나의 목표, 두 개의 총구
의심과 경계 속 두 남자의 신념을 건 작전이 시작된다'),
('코린이의 모험2', '액션, 로맨스', 128, '김대진', '김대진, 정의형, 김종훈',
'“45개 번호 중에 6개 맞히면 1등인 육사오라는 종이쪼가리,
내가 주웠지 말입니다”

우연히 1등 당첨 로또를 주운 말년 병장 ‘천우’.
심장이 터질듯한 설렘도 잠시,
순간의 실수로 바람을 타고 군사분계선을 넘어간 로또.
바사삭 부서진 멘탈을 부여잡고…기필코 다시 찾아야 한다!

우연히 남쪽에서 넘어온 1등 당첨 로또를 주운 북한 병사 ‘용호’.
이거이 남조선 인민의 고혈을 쥐어 짜내는 육사오라는 종이쪼가리란 말인가?
근데 무려 당첨금이 57억이라고?!

당첨금을 눈앞에서 놓칠 위기에 처한 ‘천우’와
북에선 한낱 종이쪼가리일 뿐일 로또를 당첨금으로 바꿔야 하는 ‘용호’.
여기에 예상치 못한 멤버들(?)까지 합류하고
57억을 사수하기 위한 3:3팀이 결성되는데…

주운 자 VS 또 주운 자
아슬아슬 선 넘는 지분 협상이 시작된다!')
;
-- servlist 샘플데이터
INSERT INTO ci_servlist (user_id, title, content) VALUES
(1, '쌀려쭈쎼요', '쒸프트키까 안뗴쪄요 또와쭈쎼요'),
(2, '버그 발생했습니다', '페이지가 동작을 안하네요'),
(2, '문의글 작성 이렇게하는거 맞나요?', '한번 테스트해 봤습니다'),
(2, '진짜테스트', '테스트임돠')
;
-- mcomment 샘플데이터
INSERT INTO ci_mcomment (user_id, movie_id, content, star) VALUES
(1, 1, '너무 재밌어요!', 8),
(2, 1, '이 영화 강추합니다', 10),
(3, 1, '가족들이랑 같이 봤는데 너무 좋아요', 9),
(1, 2, '개씹명작', 9),
(2, 2, 'ㅋㅋㅋㅋㅋㅋ 개꿀잼', 9),
(3, 2, '재밌습니다 꼭보세요', 10)
;
-- scomment 샘플데이터
INSERT INTO ci_scomment (user_id, serv_id, content) VALUES
(3, 1, '컴퓨터를 껐다 켜보세요'),
(3, 2, '인터넷 연결을 한번 확인해보세요'),
(3, 3, '테스트 댓글입니다'),
(3, 1, '테스트 댓글입니다2'),
(3, 1, '테스트 댓글입니다3'),
(3, 2, '테스트 댓글입니다4'),
(3, 3, '테스트 댓글입니다5')
;
-- file 샘플데이터
insert into ci_file (movie_id, file) values
(1, 'img0.jpg'),
(2, 'img1.jpg')
;
-- reserv 샘플데이터
INSERT INTO ci_reserv (user_id, movie_id, seat) VALUES
(1, 1, 'A1'),
(1, 1, 'A2'),
(1, 2, 'A3'),
(1, 2, 'A4'),
(1, 2, 'A5'),
(2, 1, 'A6'),
(2, 1, 'A7'),
(2, 2, 'B1'),
(2, 2, 'B2'),
(3, 1, 'B3'),
(3, 1, 'B4'),
(3, 1, 'B5'),
(3, 2, 'B6'),
(3, 2, 'B7'),
(3, 2, 'B8')
;

select * from ci_user;
select * from ci_movies;
select * from ci_mcomment;
select * from ci_scomment;
select * from ci_servlist;
select * from ci_file;
select * from ci_reserv;

SELECT count()
        FROM ci_servlist;

