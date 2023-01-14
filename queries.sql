--- Task 1

--- Создать таблицу student с полями student_id serial, first_name varchar,
--- last_name varchar, birthday date, phone varchar
CREATE TABLE students(
	student_id serial,
	first_name varchar,
	last_name varchar,
	birthday date,
	phone varchar
);

--- Добавить в таблицу после создания колонку middle_name varchar
ALTER TABLE students ADD COLUMN middle_name varchar;

--- Удалить колонку middle_name
ALTER TABLE students DROP middle_name;

--- Переименовать колонку birthday в birth_date
ALTER TABLE students RENAME birthday TO birth_day;

--- Изменить тип данных колонки phone на varchar(32)
ALTER TABLE students ALTER COLUMN phone SET DATA TYPE varchar(32);

--- Вставить три любых записи с автогенерацией идентификатора
INSERT INTO students (first_name, last_name, birth_day, phone) VALUES;
('Max', 'Ivanov', '1990-12-12', '122455'),
('Anna', 'Ivanovna', '1992-05-06', '123456'),
('Alex', 'Vasilyev', '1993-06-07', '1234567');

--- Удалить все данные из таблицы со сбросом идентификатор в исходное состояние
TRUNCATE TABLE students RESTART IDENTITY;

--- Task 2

--- добавить ограничение на поле unit_price таблицы products (цена должна быть больше 0)
ALTER TABLE products ADD CONSTRAINT
chk_products_unit_price_gt_0 CHECK (unit_price > 0);

--- добавить ограничение, что поле discontinued таблицы products может содержать только значения 0 или 1
ALTER TABLE products ADD CONSTRAINT
chk_products_discontinued CHECK (discontinued IN (0, 1));

--- Создать новую таблицу, содержащую все продукты, снятые с продажи (discontinued = 1)
SELECT * INTO discontinued_products FROM products WHERE discontinued = 0;

--- Удалить из products товары, снятые с продажи (discontinued = 1)
ALTER TABLE order_details DROP CONSTRAINT fk_order_details_products;

ALTER TABLE order_details ADD CONSTRAINT fk_order_details_products
FOREIGN KEY (product_id) REFERENCES products(product_id) ON DELETE CASCADE;

DELETE FROM products WHERE discontinued = 1
