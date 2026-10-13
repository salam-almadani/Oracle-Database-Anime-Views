CREATE TABLESPACE ANIME_HW
DATAFILE 'anime_hw_file_1.dbf' SIZE 100M,
         'anime_hw_file_2.dbf' SIZE 100M,
         'anime_hw_file_3.dbf' SIZE 100M,
         'anime_hw_file_4.dbf' SIZE 100M,
         'anime_hw_file_5.dbf' SIZE 100M;
         
CREATE ROLE c##anime_manager_role;
GRANT CREATE SESSION, CREATE TABLE, CREATE VIEW, CREATE PROCEDURE, CREATE SEQUENCE TO c##anime_manager_role;

CREATE PROFILE c##anime_security_profile LIMIT
    SESSIONS_PER_USER 1
    IDLE_TIME 20
    PASSWORD_LIFE_TIME 30;
    
CREATE USER c##animeuser1 IDENTIFIED BY Password123
DEFAULT TABLESPACE ANIME_HW
QUOTA UNLIMITED ON ANIME_HW
PROFILE c##anime_security_profile;

CREATE USER c##animeuser2 IDENTIFIED BY Password123
DEFAULT TABLESPACE ANIME_HW
QUOTA UNLIMITED ON ANIME_HW
PROFILE c##anime_security_profile;

GRANT c##anime_manager_role TO c##animeuser1;
GRANT c##anime_manager_role TO c##animeuser2;