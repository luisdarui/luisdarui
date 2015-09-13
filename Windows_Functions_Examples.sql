--RANK()
SELECT	RANK() OVER(ORDER BY tpl.Points DESC, tpl.GoalDifference DESC, tpl.GoalsFor DESC) AS [POS]
		, c.Name AS [Club]
		, tpl.Played AS [P]
		, tpl.Won AS [W]
		, tpl.Drawn AS [D]
		, tpl.Lost AS [L]
		, tpl.GoalsFor AS [GF]
		, tpl.GoalsAgainst AS [GA]
		, tpl.GoalDifference AS [GD]
		, tpl.Points AS [PTS]
		, tpl.Development AS [%DEV]
FROM		Football.TablePL tpl
INNER JOIN	Football.Clubs c	ON tpl.ClubId = c.ClubId;

--DENSE_RANK()
SELECT	DENSE_RANK() OVER(ORDER BY tpl.Points DESC, tpl.GoalDifference DESC, tpl.GoalsFor DESC) AS [POS]
		, c.Name AS [Club]
		, tpl.Played AS [P]
		, tpl.Won AS [W]
		, tpl.Drawn AS [D]
		, tpl.Lost AS [L]
		, tpl.GoalsFor AS [GF]
		, tpl.GoalsAgainst AS [GA]
		, tpl.GoalDifference AS [GD]
		, tpl.Points AS [PTS]
		, tpl.Development AS [%DEV]
FROM		Football.TablePL tpl
INNER JOIN	Football.Clubs c	ON tpl.ClubId = c.ClubId;

--ROW_NUMBER()
SELECT	ROW_NUMBER() OVER(ORDER BY tpl.Points DESC, tpl.GoalDifference DESC, tpl.GoalsFor DESC) AS [POS]
		, c.Name AS [Club]
		, tpl.Played AS [P]
		, tpl.Won AS [W]
		, tpl.Drawn AS [D]
		, tpl.Lost AS [L]
		, tpl.GoalsFor AS [GF]
		, tpl.GoalsAgainst AS [GA]
		, tpl.GoalDifference AS [GD]
		, tpl.Points AS [PTS]
		, tpl.Development AS [%DEV]
FROM		Football.TablePL tpl
INNER JOIN	Football.Clubs c	ON tpl.ClubId = c.ClubId;

--NTILE()
/*Page 1*/
SELECT	a.POS, a.Club, a.P, a.W, a.D, a.L, a.GF, a.GA, a.GD, a.PTS, a.[%DEV]
FROM	(
		SELECT NTILE(2) OVER (ORDER BY tpl.Points DESC, tpl.GoalDifference DESC, tpl.GoalsFor DESC) AS [Page]
			, ROW_NUMBER() OVER(ORDER BY tpl.Points DESC, tpl.GoalDifference DESC, tpl.GoalsFor DESC) AS [POS]
			, c.Name AS [Club]
			, tpl.Played AS [P]
			, tpl.Won AS [W]
			, tpl.Drawn AS [D]
			, tpl.Lost AS [L]
			, tpl.GoalsFor AS [GF]
			, tpl.GoalsAgainst AS [GA]
			, tpl.GoalDifference AS [GD]
			, tpl.Points AS [PTS]
			, tpl.Development AS [%DEV]
		FROM		Football.TablePL tpl
		INNER JOIN	Football.Clubs c	ON tpl.ClubId = c.ClubId
) AS a
WHERE a.Page = 1;
/*Page 2*/
SELECT	a.POS, a.Club, a.P, a.W, a.D, a.L, a.GF, a.GA, a.GD, a.PTS, a.[%DEV]
FROM	(
		SELECT NTILE(2) OVER (ORDER BY tpl.Points DESC, tpl.GoalDifference DESC, tpl.GoalsFor DESC) AS [Page]
			, ROW_NUMBER() OVER(ORDER BY tpl.Points DESC, tpl.GoalDifference DESC, tpl.GoalsFor DESC) AS [POS]
			, c.Name AS [Club]
			, tpl.Played AS [P]
			, tpl.Won AS [W]
			, tpl.Drawn AS [D]
			, tpl.Lost AS [L]
			, tpl.GoalsFor AS [GF]
			, tpl.GoalsAgainst AS [GA]
			, tpl.GoalDifference AS [GD]
			, tpl.Points AS [PTS]
			, tpl.Development AS [%DEV]
		FROM		Football.TablePL tpl
		INNER JOIN	Football.Clubs c	ON tpl.ClubId = c.ClubId
) AS a
WHERE a.Page = 2;