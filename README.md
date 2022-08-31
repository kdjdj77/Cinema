# JSP_project01

★처음 프로젝트 실행 시 해야 할 것

0. db 설정할 것
    (db name : cinema
    id	 : korin
    pw   : 1234)

    DB 설정
      mysql -u root -p
      CREATE DATABASE cinema default CHARACTER SET UTF8;
      CREATE USER 'korin'@'localhost' IDENTIFIED BY '1234';
      GRANT ALL PRIVILEGES ON cinema.* TO 'korin'@'localhost';
      FLUSH PRIVILEGES;
1. 프로젝트 버전 Java-11 로 설정
2. lib에 jar 파일 넣기
3. add server(tomcat 경로로 설정)
4. 프로젝트의 build path library에서 lombok 설정
5. 프로젝트의 build path library에서 server runtime 설정(add library)
6. dbeaver 설정 (db 설정한 대로)
7. file association에서 xml, sql 디폴트 설정
