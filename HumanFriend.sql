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

