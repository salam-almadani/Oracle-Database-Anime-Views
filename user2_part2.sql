-- ============================================================
-- c##animeuser2
-- ============================================================

SELECT View_ID,
       Fan_Name,
       Views_Count                              AS Original_Views,
       c##animeuser1.VIEWS_ADJUSTED_GET(View_ID) AS Adjusted_Views
FROM   c##animeuser1.ANIME_VIEWS;

BEGIN
    c##animeuser1.ADJUSTMENT_AFTER_VIEWS_UPDATE(3);
END;
/

SELECT * FROM c##animeuser1.ANIME_VIEWS;

SELECT Fan_Name,
       Genre,
       Adjusted_Views
FROM (
    SELECT Fan_Name,
           Genre,
           c##animeuser1.VIEWS_ADJUSTED_GET(View_ID) AS Adjusted_Views
    FROM   c##animeuser1.ANIME_VIEWS
)
WHERE  Adjusted_Views > 1000
ORDER  BY Adjusted_Views DESC;
