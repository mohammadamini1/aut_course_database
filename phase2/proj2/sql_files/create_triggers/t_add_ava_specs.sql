delimiter // DROP TRIGGER IF EXISTS add_ava_specs;

CREATE TRIGGER add_ava_specs
AFTER
INSERT
    ON AVA FOR EACH ROW BEGIN


SET @res = "";
SET @i = 1;
SET @updtAdvanceKeyVal = "apple:100|pinapple:200|orange:300";

REPEAT
SET
    @r = SUBSTRING(
        SUBSTRING_INDEX(@updtAdvanceKeyVal, "|", @i),
        LENGTH(SUBSTRING_INDEX(@updtAdvanceKeyVal, "|", @i -1)) + 1
    );

SET
    @r = REPLACE(@r, "|", "");

IF @r <> "" THEN
SET
    @key = SUBSTRING_INDEX(@r, ":", 1);

SET
    @val = SUBSTRING_INDEX(@r, ":", -1);

SELECT
    @key,
    @val;

END IF;

SET
    @i = @i + 1;

until @r = ""
END REPEAT; //



END // 
delimiter;

