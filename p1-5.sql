USE shop;

-- 1. Витягти рік, місяць, число в три окремі колонки
SELECT
  id,
  `date`,
  YEAR(`date`)  AS year,
  MONTH(`date`) AS month,
  DAY(`date`)   AS day
FROM orders;

-- 2. Додати до дати один день
SELECT
  id,
  `date`,
  DATE_ADD(`date`, INTERVAL 1 DAY) AS date_plus_1
FROM orders;

-- 3. Timestamp (секунди від початку відліку, 1970-01-01)
SELECT
  id,
  `date`,
  UNIX_TIMESTAMP(`date`) AS unix_ts
FROM orders;

-- 4. Скільки рядків з датою в заданих межах
SELECT COUNT(*) AS rows_in_range
FROM orders
WHERE `date` BETWEEN '1996-07-10 00:00:00' AND '1996-10-08 00:00:00';

-- 5. JSON-об'єкт {"id": ..., "date": ...}
SELECT
  id,
  `date`,
  JSON_OBJECT('id', id, 'date', `date`) AS json_obj
FROM orders;