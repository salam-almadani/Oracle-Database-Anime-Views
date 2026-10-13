SET DEFINE OFF;

CREATE TABLE ANIME_VIEWS (
    View_ID NUMBER PRIMARY KEY,
    Fan_Name VARCHAR2(50) NOT NULL,
    Anime_Name VARCHAR2(100) NOT NULL,
    Genre VARCHAR2(20) NOT NULL,
    Views_Count NUMBER DEFAULT 0,
    View_Date DATE DEFAULT SYSDATE,
    CONSTRAINT chk_views_positive CHECK (Views_Count > 0),
    CONSTRAINT chk_genre_values CHECK (Genre IN ('Action', 'Sci-Fi', 'Comedy'))
);

INSERT INTO ANIME_VIEWS VALUES (1, 'Ahmed Al-Hassan', 'One Piece', 'Action', 2500, TO_DATE('2026-01-15', 'YYYY-MM-DD'));
INSERT INTO ANIME_VIEWS VALUES (2, 'Sara Khalil', 'Naruto', 'Action', 2200, TO_DATE('2026-02-20', 'YYYY-MM-DD'));
INSERT INTO ANIME_VIEWS VALUES (3, 'Mohammed Ali', 'Conan', 'Sci-Fi', 1800, TO_DATE('2026-03-10', 'YYYY-MM-DD'));
INSERT INTO ANIME_VIEWS VALUES (4, 'Layla Nasser', 'Dragon Ball', 'Action', 3000, TO_DATE('2026-04-05', 'YYYY-MM-DD'));
INSERT INTO ANIME_VIEWS VALUES (5, 'Omar Farouk', 'Tsubasa', 'Sci-Fi', 1600, TO_DATE('2026-05-12', 'YYYY-MM-DD'));
INSERT INTO ANIME_VIEWS VALUES (6, 'Nadia Youssef', 'Astro Boy', 'Sci-Fi', 900, TO_DATE('2026-06-18', 'YYYY-MM-DD'));
INSERT INTO ANIME_VIEWS VALUES (7, 'Khaled Ibrahim', 'Gundam', 'Sci-Fi', 750, TO_DATE('2026-07-22', 'YYYY-MM-DD'));
INSERT INTO ANIME_VIEWS VALUES (8, 'Rana Haddad', 'Remi', 'Comedy', 1400, TO_DATE('2026-08-01', 'YYYY-MM-DD'));
INSERT INTO ANIME_VIEWS VALUES (9, 'Hassan Diab', 'Doraemon', 'Comedy', 850, TO_DATE('2026-08-10', 'YYYY-MM-DD'));
INSERT INTO ANIME_VIEWS VALUES (10, 'Mona Sharif', 'Smart', 'Comedy', 1200, TO_DATE('2026-08-15', 'YYYY-MM-DD'));

COMMIT;

GRANT SELECT, UPDATE ON ANIME_VIEWS TO c##animeuser2;