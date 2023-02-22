## Create schema `HumanFriends`;
## drop schema `HumanFriends`;
use `HumanFriends`;

## Создаем низкоуровневые таблицы
create table Cat (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(45),
    Command VARCHAR(45),
    Birthday DATE
);


create table Dog (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(45),
    Command VARCHAR(45),
    Birthday DATE
);


create table Hamster (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(45),
    Command VARCHAR(45),
    Birthday DATE
);



create table Horse (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	liftWeight INT,
    Name VARCHAR(45),
    Command VARCHAR(45),
	Birthday DATE
);


create table Camel (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	liftWeight INT,
    Name VARCHAR(45),
    Command VARCHAR(45),
	Birthday DATE
);


create table Donkey (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	liftWeight INT,
    Name VARCHAR(45),
    Command VARCHAR(45),
	Birthday DATE
);

## Создаем таблицы уровня выше
create table Pet (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(45),
    Command VARCHAR(45),
    Birthday DATE
);


create table PackAnimal (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    liftWeight INT,
    Name VARCHAR(45),
    Command VARCHAR(45),
    Birthday DATE
);

## Создаем общую таблицу
create table HumanFriend(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(45),
    Command VARCHAR(45),
    Birthday Date
);

## Заполняем данными низкоуровневые таблицы    
insert into cat (Name, Command, Birthday) values
('Барсик', 'Кушать', '2020-02-01'),
('Васька', 'Спать', '2017-01-06'),
('Барон', 'Царапать', '2023-02-06'),
('Мурка', 'Спать', '2019-03-17');

select * from cat;
insert into dog (Name, Command, Birthday) values
('Мишка', 'Лежать', '2020-03-01'),
('Рекс', 'Сидеть', '2015-01-01'),
('Трал', 'Фас', '2019-02-07'),
('Сергеич', 'Лежать', '2021-01-17');

select * from dog;

insert into hamster (Name, Command, Birthday) values
('Хома', 'Бежать', '2021-11-12'),
('Чарл', 'Кувырок', '2015-03-05'),
('Кабачок', 'Бежать', '2019-01-10'),
('Комочек', 'Бежать', '2020-01-17');

select * from hamster;
 
insert into camel (camelName, camelCommand, camelLiftWeight, camelBirthday) values
('Мимир', 'Поднять', 168, '2022-01-01'),
('Ахсан', 'Плюнуть', 194, '2017-06-06'),
('Песочек', 'Куснуть', 325, '2023-01-06'),
('Бархан', 'Поднять', 129, '2021-03-17');

select * from camel;
 
insert into horse (Name, Command, liftWeight, Birthday) values
('Хортон', 'Галоп', 203, '2022-01-01'),
('Молния', 'Перепрыгнуть', 167, '2017-06-06'),
('Плотва', 'Галоп', 259, '2023-01-06'),
('Черный', 'Надыбы', 304, '2021-03-17');

select * from horse;    
 
insert into donkey (Name, Command, liftWeight, Birthday) values
('Иа', 'Жевать', 56, '2022-01-01'),
('Генри', 'Голос', 98, '2017-06-06'),
('Шрек', 'Жевать', 49, '2023-01-06'),
('Морисон', 'Жевать', 121, '2021-03-17');

select * from donkey;

## Удаление таблицы верблюдов
delete from camel where id > 0;
select * from camel;
 
## Объединение таблицы лошадей и ослов в одну таблицу.
create table packAnimalNew (id INT NOT NULL AUTO_INCREMENT PRIMARY KEY)
select  Name, 
    Command, 
    Birthday
from horse union 
select  Name, 
    Command, 
    Birthday
from donkey;

select * from packAnimalNew;

## Создание таблицы, в которой все животные в возрасте от 1 до 3 лет.
INSERT into pet (Name, Command, Birthday)
select  Name, 
    Command, 
    Birthday
from cat union 
select  Name, 
    Command, 
    Birthday
from dog union
select  Name, 
    Command, 
    Birthday
from hamster;
select * from pet;

INSERT into HumanFriend (Name, Command, Birthday)
select  Name, 
    Command, 
    Birthday
from pet union 
select  Name, 
    Command, 
    Birthday
from packAnimalNew;
select * from HumanFriend;

create table youngAnimals (id INT NOT NULL AUTO_INCREMENT PRIMARY KEY)
select Name, 
    Command, 
    Birthday,
    Round((year(current_date()) - year(Birthday)) + (month(current_date() - month(Birthday)))/10, 2) as age
from humanFriend
where Round((year(current_date()) - year(Birthday)) + (month(current_date() - month(Birthday)))/10, 2) > 1 
	and Round((year(current_date()) - year(Birthday)) + (month(current_date() - month(Birthday)))/10, 2) < 3;
select * from youngAnimals;

## Объединить все таблицы в одну, при этом сохраняя поля, указывающие на прошлую принадлежность к старым таблицам.
create table newHumanFriend (id INT NOT NULL AUTO_INCREMENT PRIMARY KEY)
select  Name, 
    Command,
    Birthday,
    'cat' as oldTable
from cat union 
select  Name, 
    Command, 
    Birthday,
    'dog' as oldTable
from dog union
select  Name, 
    Command, 
    Birthday,
    'hamster' as oldTable
from hamster union 
select  Name, 
    Command, 
    Birthday,
    'horse' as oldTable
from horse union 
select  Name, 
    Command, 
    Birthday,
    'donkey' as oldTable
from donkey;

select * from newHumanFriend;
