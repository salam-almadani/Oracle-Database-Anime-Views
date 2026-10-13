CREATE OR REPLACE FUNCTION VIEWS_ADJUSTED_GET (ID_VIEW IN NUMBER)
RETURN NUMBER
IS
    v_views   ANIME_VIEWS.Views_Count%TYPE;
    v_genre   ANIME_VIEWS.Genre%TYPE;
    v_bonus   NUMBER;
BEGIN
    SELECT Views_Count, Genre
    INTO   v_views, v_genre
    FROM   ANIME_VIEWS
    WHERE  View_ID = ID_VIEW;

    v_bonus := CASE v_genre
                   WHEN 'Action' THEN 0.20
                   WHEN 'Sci-Fi' THEN 0.15
                   WHEN 'Comedy' THEN 0.10
                   ELSE 0
               END;

    RETURN ROUND(v_views * (1 + v_bonus));
END VIEWS_ADJUSTED_GET;
/

CREATE OR REPLACE PROCEDURE ADJUSTMENT_AFTER_VIEWS_UPDATE (ID_VIEW IN NUMBER)
IS
    v_new_views NUMBER;
BEGIN
    v_new_views := VIEWS_ADJUSTED_GET(ID_VIEW);

    UPDATE ANIME_VIEWS
    SET    Views_Count = v_new_views
    WHERE  View_ID = ID_VIEW;

    COMMIT;
END ADJUSTMENT_AFTER_VIEWS_UPDATE;
/

GRANT EXECUTE ON VIEWS_ADJUSTED_GET TO c##animeuser2;
GRANT EXECUTE ON ADJUSTMENT_AFTER_VIEWS_UPDATE TO c##animeuser2;

-- ============================================================
-- Stop
-- ============================================================


EXPLAIN PLAN FOR
SELECT * FROM ANIME_VIEWS WHERE Genre = 'Action';
SELECT * FROM TABLE(DBMS_XPLAN.DISPLAY);

EXPLAIN PLAN FOR
SELECT * FROM ANIME_VIEWS WHERE Fan_Name = 'Ahmed Al-Hassan' AND Genre = 'Action';
SELECT * FROM TABLE(DBMS_XPLAN.DISPLAY);

EXPLAIN PLAN FOR
SELECT * FROM ANIME_VIEWS
WHERE View_Date BETWEEN TO_DATE('2026-01-01','YYYY-MM-DD') AND TO_DATE('2026-06-30','YYYY-MM-DD');
SELECT * FROM TABLE(DBMS_XPLAN.DISPLAY);

-- ============================================================
-- index
-- ============================================================

CREATE BITMAP INDEX idx_genre ON ANIME_VIEWS(Genre);

CREATE INDEX idx_fanname_genre ON ANIME_VIEWS(Fan_Name, Genre);

CREATE INDEX idx_view_date ON ANIME_VIEWS(View_Date);

-- ============================================================
-- screen shot
-- ============================================================
EXPLAIN PLAN FOR
SELECT * FROM ANIME_VIEWS WHERE Genre = 'Action';
SELECT * FROM TABLE(DBMS_XPLAN.DISPLAY);

EXPLAIN PLAN FOR
SELECT * FROM ANIME_VIEWS WHERE Fan_Name = 'Ahmed Al-Hassan' AND Genre = 'Action';
SELECT * FROM TABLE(DBMS_XPLAN.DISPLAY);

EXPLAIN PLAN FOR
SELECT * FROM ANIME_VIEWS
WHERE View_Date BETWEEN TO_DATE('2026-01-01','YYYY-MM-DD') AND TO_DATE('2026-06-30','YYYY-MM-DD');
SELECT * FROM TABLE(DBMS_XPLAN.DISPLAY);

