-- phpMyAdmin SQL Dump
-- version 4.7.8
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Июн 05 2018 г., 15:32
-- Версия сервера: 10.1.30-MariaDB
-- Версия PHP: 7.2.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `utile_rest`
--

-- --------------------------------------------------------

--
-- Структура таблицы `category`
--

CREATE TABLE `category` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `alias` varchar(255) NOT NULL,
  `keywords` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `category`
--

INSERT INTO `category` (`id`, `title`, `alias`, `keywords`, `description`) VALUES
(1, 'Starters', 'starters', 'Starters', 'Starter meals'),
(2, 'Main Dishes', 'main-dishes', 'Main', 'Main dishes'),
(3, 'Desserts', 'desserts', 'Desserts', 'Desserts'),
(4, 'Drinks', 'drinks', 'Drinks', 'Drinks');

-- --------------------------------------------------------

--
-- Структура таблицы `currency`
--

CREATE TABLE `currency` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(50) NOT NULL,
  `code` varchar(3) NOT NULL,
  `symbol_left` varchar(10) NOT NULL,
  `symbol_right` varchar(10) NOT NULL,
  `value` float(15,2) NOT NULL,
  `base` enum('0','1') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `currency`
--

INSERT INTO `currency` (`id`, `title`, `code`, `symbol_left`, `symbol_right`, `value`, `base`) VALUES
(1, 'гривна', 'UAH', '', ' грн.', 25.80, '0'),
(2, 'доллар', 'USD', '$', '', 1.00, '1'),
(3, 'eвро', 'EUR', '€', '', 0.88, '0');

-- --------------------------------------------------------

--
-- Структура таблицы `gallery`
--

CREATE TABLE `gallery` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `img` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `gallery`
--

INSERT INTO `gallery` (`id`, `product_id`, `img`) VALUES
(1, 2, 'special-image-2.png'),
(2, 2, 'special-image-2-2.png');

-- --------------------------------------------------------

--
-- Структура таблицы `order`
--

CREATE TABLE `order` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `status` bit(1) NOT NULL DEFAULT b'0',
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_at` timestamp NULL DEFAULT NULL,
  `currency` varchar(10) NOT NULL,
  `note` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `order`
--

INSERT INTO `order` (`id`, `user_id`, `status`, `date`, `update_at`, `currency`, `note`) VALUES
(14, 23, b'0', '2018-06-03 17:47:11', '2018-06-05 09:40:51', 'USD', '4 nuts and 1 radic'),
(17, 23, b'0', '2018-06-04 21:44:11', '2018-06-05 09:43:57', 'USD', ''),
(19, 23, b'1', '2018-06-04 21:44:37', '2018-06-05 09:44:18', 'USD', ''),
(20, 23, b'1', '2018-06-04 21:44:59', '2018-06-05 09:44:27', 'USD', 'Last one'),
(21, 43, b'1', '2018-06-05 09:35:27', '2018-06-05 09:28:26', 'UAH', 'Im hungry, please hurry up'),
(22, 36, b'0', '2018-06-05 09:54:20', '2018-06-05 09:25:54', 'USD', '');

-- --------------------------------------------------------

--
-- Структура таблицы `order_product`
--

CREATE TABLE `order_product` (
  `id` int(10) UNSIGNED NOT NULL,
  `order_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `qty` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `price` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `order_product`
--

INSERT INTO `order_product` (`id`, `order_id`, `product_id`, `qty`, `title`, `price`) VALUES
(39, 14, 5, 4, 'Tigernut', 4),
(40, 14, 4, 1, 'Soko Radicchio', 7),
(46, 17, 2, 1, 'Celery Quandong', 30),
(47, 17, 1, 1, 'Greens Fava', 17),
(49, 19, 3, 1, 'Pea Horseradish', 25),
(50, 19, 5, 2, 'Tigernut', 4),
(51, 19, 4, 1, 'Soko Radicchio', 7),
(52, 20, 2, 2, 'Celery Quandong', 30),
(53, 20, 3, 1, 'Pea Horseradish', 25),
(54, 21, 3, 7, 'Pea Horseradish', 645),
(55, 21, 6, 3, 'Yarrow Sweet', 129),
(56, 21, 2, 3, 'Celery Quandong', 774),
(57, 22, 1, 1, 'Greens Fava', 17),
(58, 22, 5, 2, 'Tigernut', 4);

-- --------------------------------------------------------

--
-- Структура таблицы `product`
--

CREATE TABLE `product` (
  `id` int(10) UNSIGNED NOT NULL,
  `category_id` tinyint(3) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `alias` varchar(255) NOT NULL,
  `content` text,
  `price` float NOT NULL DEFAULT '0',
  `status` bit(1) NOT NULL DEFAULT b'1',
  `keywords` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `img` varchar(255) NOT NULL DEFAULT 'no_image.png',
  `special` bit(1) NOT NULL DEFAULT b'0',
  `full_content` text,
  `ingredients` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `product`
--

INSERT INTO `product` (`id`, `category_id`, `title`, `alias`, `content`, `price`, `status`, `keywords`, `description`, `img`, `special`, `full_content`, `ingredients`) VALUES
(1, 2, 'Greens Fava', 'greens-fava', 'Lorem ipsum dolor sit amet pls help', 17, b'1', 'Greens Fava', 'Greens Fava', 'special-image-1.png', b'1', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim.', 'fresh samphire, plain flour, cornflower, eggs, fennel'),
(2, 2, 'Celery Quandong', 'celery-quandong', 'Lorem ipsum dolor sit amet pls help', 30, b'1', 'Celery Quandong', 'Celery Quandong', 'special-image-2.png', b'1', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim.', 'ricotta, shallots, cheddar, capers'),
(3, 2, 'Pea Horseradish', 'pea-horseradish', 'Lorem ipsum dolor sit amet pls help', 25, b'1', 'Pea Horseradish', 'Pea Horseradish', 'special-image-3.png', b'1', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim.', 'courgette flowers, goats cheese, red onion, pine nuts'),
(4, 3, 'Soko Radicchio', 'soko-radicchio', 'Lorem ipsum dolor sit amet pls help', 7, b'1', 'Soko Radicchio', 'Soko Radicchio', 'special-image-4.png', b'1', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim.', 'ricotta, shallots, cheddar, capers'),
(5, 3, 'Tigernut', 'tigernut', 'Lorem ipsum dolor sit amet pls help', 4, b'1', 'Tigernut', 'Tigernut', 'special-image-5.png', b'1', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim.', 'courgette flowers, goats cheese, red onion, pine nuts'),
(6, 3, 'Yarrow Sweet', 'yarrow-sweet', 'Lorem ipsum dolor sit amet pls help', 5, b'1', 'Yarrow Sweet', 'Yarrow Sweet', 'special-image-6.png', b'0', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim.', 'fresh samphire, plain flour, cornflower, eggs, fennel'),
(7, 1, 'Greens Fava', 'greens-fava', 'Lorem ipsum dolor sit amet pls help', 17, b'1', 'Greens Fava', 'Greens Fava', 'special-image-1.png', b'0', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim.', 'fresh samphire, plain flour, cornflower, eggs, fennel'),
(8, 1, 'Celery Quandong', 'celery-quandong', 'Lorem ipsum dolor sit amet pls help', 30, b'1', 'Celery Quandong', 'Celery Quandong', 'special-image-2.png', b'0', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim.', 'ricotta, shallots, cheddar, capers'),
(9, 1, 'Pea Horseradish', 'pea-horseradish', 'Lorem ipsum dolor sit amet pls help', 25, b'1', 'Pea Horseradish', 'Pea Horseradish', 'special-image-3.png', b'0', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim.', 'courgette flowers, goats cheese, red onion, pine nuts'),
(10, 1, 'Soko Radicchio', 'soko-radicchio', 'Lorem ipsum dolor sit amet pls help', 7, b'1', 'Soko Radicchio', 'Soko Radicchio', 'special-image-4.png', b'0', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim.', 'ricotta, shallots, cheddar, capers'),
(11, 1, 'Tigernut', 'tigernut', 'Lorem ipsum dolor sit amet pls help', 4, b'1', 'Tigernut', 'Tigernut', 'special-image-5.png', b'0', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim.', 'courgette flowers, goats cheese, red onion, pine nuts'),
(12, 1, 'Yarrow Sweet', 'yarrow-sweet', 'Lorem ipsum dolor sit amet pls help', 5, b'1', 'Yarrow Sweet', 'Yarrow Sweet', 'special-image-6.png', b'0', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim.', 'fresh samphire, plain flour, cornflower, eggs, fennel'),
(13, 1, 'Greens Fava', 'greens-fava', 'Lorem ipsum dolor sit amet pls help', 17, b'1', 'Greens Fava', 'Greens Fava', 'special-image-1.png', b'0', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim.', 'fresh samphire, plain flour, cornflower, eggs, fennel'),
(14, 1, 'Celery Quandong', 'celery-quandong', 'Lorem ipsum dolor sit amet pls help', 30, b'1', 'Celery Quandong', 'Celery Quandong', 'special-image-2.png', b'0', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim.', 'ricotta, shallots, cheddar, capers'),
(15, 1, 'Pea Horseradish', 'pea-horseradish', 'Lorem ipsum dolor sit amet pls help', 25, b'1', 'Pea Horseradish', 'Pea Horseradish', 'special-image-3.png', b'0', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim.', 'courgette flowers, goats cheese, red onion, pine nuts'),
(16, 1, 'Soko Radicchio', 'soko-radicchio', 'Lorem ipsum dolor sit amet pls help', 7, b'1', 'Soko Radicchio', 'Soko Radicchio', 'special-image-4.png', b'0', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim.', 'ricotta, shallots, cheddar, capers'),
(17, 1, 'Tigernut', 'tigernut', 'Lorem ipsum dolor sit amet pls help', 4, b'1', 'Tigernut', 'Tigernut', 'special-image-5.png', b'0', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim.', 'courgette flowers, goats cheese, red onion, pine nuts'),
(18, 1, 'Yarrow Sweet', 'yarrow-sweet', 'Lorem ipsum dolor sit amet pls help', 5, b'1', 'Yarrow Sweet', 'Yarrow Sweet', 'special-image-6.png', b'0', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim.', 'fresh samphire, plain flour, cornflower, eggs, fennel'),
(19, 3, 'Greens Fava', 'greens-fava', 'Lorem ipsum dolor sit amet pls help', 17, b'1', 'Greens Fava', 'Greens Fava', 'special-image-1.png', b'0', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim.', 'fresh samphire, plain flour, cornflower, eggs, fennel'),
(20, 3, 'Celery Quandong', 'celery-quandong', 'Lorem ipsum dolor sit amet pls help', 30, b'1', 'Celery Quandong', 'Celery Quandong', 'special-image-2.png', b'0', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim.', 'ricotta, shallots, cheddar, capers'),
(21, 3, 'Pea Horseradish', 'pea-horseradish', 'Lorem ipsum dolor sit amet pls help', 25, b'1', 'Pea Horseradish', 'Pea Horseradish', 'special-image-3.png', b'0', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim.', 'courgette flowers, goats cheese, red onion, pine nuts'),
(22, 2, 'Soko Radicchio', 'soko-radicchio', 'Lorem ipsum dolor sit amet pls help', 7, b'1', 'Soko Radicchio', 'Soko Radicchio', 'special-image-4.png', b'0', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim.', 'ricotta, shallots, cheddar, capers'),
(23, 2, 'Tigernut', 'tigernut', 'Lorem ipsum dolor sit amet pls help', 4, b'1', 'Tigernut', 'Tigernut', 'special-image-5.png', b'0', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim.', 'courgette flowers, goats cheese, red onion, pine nuts'),
(24, 2, 'Yarrow Sweet', 'yarrow-sweet', 'Lorem ipsum dolor sit amet pls help', 5, b'1', 'Yarrow Sweet', 'Yarrow Sweet', 'special-image-6.png', b'0', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim.', 'fresh samphire, plain flour, cornflower, eggs, fennel'),
(25, 2, 'Greens Fava', 'greens-fava', 'Lorem ipsum dolor sit amet pls help', 17, b'1', 'Greens Fava', 'Greens Fava', 'special-image-1.png', b'0', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim.', 'fresh samphire, plain flour, cornflower, eggs, fennel'),
(26, 4, 'Celery Quandong', 'celery-quandong', 'Lorem ipsum dolor sit amet pls help', 30, b'1', 'Celery Quandong', 'Celery Quandong', 'special-image-2.png', b'0', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim.', 'ricotta, shallots, cheddar, capers'),
(27, 4, 'Pea Horseradish', 'pea-horseradish', 'Lorem ipsum dolor sit amet pls help', 25, b'1', 'Pea Horseradish', 'Pea Horseradish', 'special-image-3.png', b'0', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim.', 'courgette flowers, goats cheese, red onion, pine nuts'),
(28, 4, 'Soko Radicchio', 'soko-radicchio', 'Lorem ipsum dolor sit amet pls help', 7, b'1', 'Soko Radicchio', 'Soko Radicchio', 'special-image-4.png', b'0', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim.', 'ricotta, shallots, cheddar, capers'),
(29, 4, 'Tigernut', 'tigernut', 'Lorem ipsum dolor sit amet pls help', 4, b'1', 'Tigernut', 'Tigernut', 'special-image-5.png', b'0', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim.', 'courgette flowers, goats cheese, red onion, pine nuts'),
(30, 4, 'Yarrow Sweet', 'yarrow-sweet', 'Lorem ipsum dolor sit amet pls help', 5, b'1', 'Yarrow Sweet', 'Yarrow Sweet', 'special-image-6.png', b'0', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim.', 'fresh samphire, plain flour, cornflower, eggs, fennel'),
(31, 4, 'Celery Quandong', 'celery-quandong', 'Lorem ipsum dolor sit amet pls help', 30, b'1', 'Celery Quandong', 'Celery Quandong', 'special-image-2.png', b'0', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim.', 'ricotta, shallots, cheddar, capers'),
(32, 4, 'Pea Horseradish', 'pea-horseradish', 'Lorem ipsum dolor sit amet pls help', 25, b'1', 'Pea Horseradish', 'Pea Horseradish', 'special-image-3.png', b'0', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim.', 'courgette flowers, goats cheese, red onion, pine nuts'),
(33, 4, 'Soko Radicchio', 'soko-radicchio', 'Lorem ipsum dolor sit amet pls help', 7, b'1', 'Soko Radicchio', 'Soko Radicchio', 'special-image-4.png', b'0', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim.', 'ricotta, shallots, cheddar, capers'),
(34, 4, 'Tigernut', 'tigernut', 'Lorem ipsum dolor sit amet pls help', 4, b'1', 'Tigernut', 'Tigernut', 'special-image-5.png', b'0', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim.', 'courgette flowers, goats cheese, red onion, pine nuts'),
(35, 4, 'Yarrow Sweet', 'yarrow-sweet', 'Lorem ipsum dolor sit amet pls help', 5, b'1', 'Yarrow Sweet', 'Yarrow Sweet', 'special-image-6.png', b'0', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim.', 'fresh samphire, plain flour, cornflower, eggs, fennel'),
(37, 3, 'Something Changed', '', 'Lorem ipsum dolor sit amet pls help something changed here', 69, b'1', 'Something Changed', 'Something Changed', 'special-image-2.png', b'0', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim.', 'ricotta, shallots, cheddar, capers, changing bois'),
(38, 3, 'Test Product', '', 'Sed ut perspiciatis, unde omnis iste natus error sit', 11, b'1', 'Test Product', 'Test Product', 'no_image.png', b'0', 'Sed ut perspiciatis, unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam eaque ipsa, quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt, explicabo.', 'fresh samphire, plain flour, cornflower, ricotta, shallots'),
(39, 3, 'Test Product', 'test-product', 'Sed ut perspiciatis, unde omnis iste natus error sit', 11, b'1', 'Test Product', 'Test Product', 'no_image.png', b'0', 'Sed ut perspiciatis, unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam eaque ipsa, quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt, explicabo.', 'fresh samphire, plain flour, cornflower, ricotta, shallots'),
(40, 2, 'Borsch', 'borsch', 'Sed ut perspiciatis, unde omnis iste natus ', 25, b'1', 'Borsch', 'Borsch', 'special-image-6.png', b'1', 'Sed ut perspiciatis, unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam eaque ipsa, quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt, explicabo.', 'beef stock, cabbage, potato, carrot, beet root,  bay leaf, tomato paste, sour cream'),
(41, 4, 'Celery Quando', 'celery-quando', 'Lorem ipsum dolor sit amet pls helpas asf', 31, b'1', 'Celery Quando', 'Celery Quando', 'no_image.png', b'0', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. ', 'ricotta, shallots, cheddar, capers, mah dik'),
(42, 3, 'Celery Quan', 'celery-quan', 'Lorem ipsum dolor sit amet pls helpasfasf', 30, b'1', 'Celery Quan', 'Celery Quan', 'no_image.png', b'0', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. ', 'ricotta, shallots, cheddar, capers, somehting else idk');

-- --------------------------------------------------------

--
-- Структура таблицы `user`
--

CREATE TABLE `user` (
  `id` int(10) UNSIGNED NOT NULL,
  `login` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `role` enum('user','admin') NOT NULL DEFAULT 'user'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `user`
--

INSERT INTO `user` (`id`, `login`, `password`, `email`, `name`, `address`, `role`) VALUES
(15, 'danmcswagga', '$2y$10$hzbFzWlqTeHazwKaHeSEmOd2yDCHhVwpa43v38nxGp//4JKY68f8q', 'asfasf@gmailafs.sfdf', 'Denys Stetsenko', 'Olzhycha 8, 18', 'user'),
(16, 'Petro', '$2y$10$7YC1xh5bef.Sc2Qbpzo2JuhH95Wv7awWqaMQr1YJJPN.wdFQay2cS', 'dan@dan.com', 'Denys Stetsenko', 'Olzhycha 8, 18', 'user'),
(17, 'mruxlk', '$2y$10$FS.QXEzjiy9vLKB4wZH72OsxNlGk4qkFfkGOUGK2HzCP3PdkssdO6', 'asgfasga@ukr.tn', 'sadfasfsf', 'asfasfasf', 'user'),
(22, 'Slava', '$2y$10$nQ54jPcjCPAQzw5BXOp5ku1G8lh.LwYdytU0d1LLJAjd3bOY69/f2', 'denyasfast@ukr.netasf', 'Slava', 'Olzhyva', 'user'),
(23, 'dan', '$2y$10$PqaIs8.lb968uBwA7KiVquZp8PwdKxto5xdVM5E6q926gFwNNdf1i', 'denyast@ukr.net', 'Dan', 'Kyiv, Olzhyva 8, 18', 'user'),
(26, 'Petroasf', '$2y$10$67yMvNq2E5UfApf31tJb9.9SwZJPPoURP0eIv.mbf/ymxAIedalti', 'dasfasf@ukr.net', 'asfsafasf', 'asfasf', 'user'),
(27, 'asfsafasf', '$2y$10$azjak93xTT1s830OumOrxe9ewHXxvX4mp8pNybdhSLdUtXpq0wnq2', 'email@email.com', 'asfasfasfasfaf', 'asfasfasfaas', 'user'),
(28, 'asfasfasfasfasfasf', '$2y$10$y2jEiayHY8fFU2sRUyVK9Ok5f.4JaOuA2RMA2bZHTFUhYPPsgAbJm', 'denyast@ukr.metsfsf', 'asfasfasfasfasfasf', 'asfasfassesar', 'user'),
(29, 'asfasfasfasfasfasfas', '$2y$10$S0fXr4IR1C0HqJusxXxxPONKbtfn3IGjFpfQ.AkIR2OK2sbbbaDV6', 'denyast@ukr.metsfsfss', 'asfasfasfasfasfasfsaf', 'asfasfassesar', 'user'),
(30, 'qtqwt', '$2y$10$UJ/mGL.tnNXihPhb7.qtZeDFqM9sVo31tCrNaVXdQ8.1PYuAOC2vm', 'email@email.comqwr', 'qwtqwt', 'qwtqwtqwt', 'user'),
(31, 'yttyy', '$2y$10$o/QS4ofbSh0NLoB6aem6NuXWuTZX7dICMFeeUi95sK9U021k2gFNe', 'denyast98@gmail.comeryre', 'rytryty', 'eryeryryyr', 'user'),
(32, 'wur', '$2y$10$FRnfil/qPZfbSHmYhdi0LuNxtiMG989TpoqLWw0D92PMcKC.aUgra', 'denyast98@gmail.comwruwr', 'weuwur', 'wruwwru', 'user'),
(33, 'euerueru', '$2y$10$QZormhl8U72Yxr4MreHH8.fAkFuLSGoC4mm7kKa8a1jm7wOQwVVzC', 'denyast@ukr.neteru', 'eruerue', 'euruerur', 'user'),
(34, 'test', '$2y$10$IfipiJm9lV6.YDpcR3PuAuqCMWxjI0V.qo9hjEGTQnTtQPSP2s4cu', 'test@test.com', 'test', 'test', 'user'),
(35, 'testest', '$2y$10$iMMetMWqQw83T4s0XfWWh.z0egcErfFFFCsFKmTK.6uXVabJsn5y6', 'denyast98@gmail.comtest', 'etstes', 'testests', 'user'),
(36, 'admin', '$2y$10$qd3oNIxFyAD6jf/c4Ztk9.JMraZ./lIpQ1Y2/UZ7sP8no97xvdrzq', 'denyast98@gmail.com', 'admin', 'Unknown, bitch', 'admin'),
(37, 'chch', '$2y$10$OuKxFPl9yn8pDGOiikyAfONnAaxnDlWyegVRghZjaJ5gO7aNFw22u', 'dan@dan.comchch', 'chhchch', 'chchchchhc', 'user'),
(38, 'ahdsdhsdh', '$2y$10$GdudLfBTasZBQ8thB99LX.uadiLOU6RR.NEW0U31KWp6FqxE/rayK', 'email@email.comhsdhsdh', 'sdhsdhhdshshd', 'hdshsdhsdhsdh', 'user'),
(39, 'testnewtest', '$2y$10$fevIw7WWDTMnHzL60IclC.sUCVY0oJHuUdtgtB/ooOSxvwuAhct4K', 'denyast98@gmail.comtestt', 'testnewname', 'testtt', 'user'),
(40, 'hahahah', '$2y$10$kjW6LmzG2pOQz7WEAhqgLe3EbHtEpdfcxQVlE0B9FedlyXhgl/8Uu', 'denyast98@gmail.comhaha', 'hahaha', 'hahahahah', 'user'),
(41, 'good', '$2y$10$XoRQM/2YKqkDUMnmy0OV2.cnPS9EiNm2gO1sit8Plf8SB0ukKhWUW', 'john@goodman.com', 'John Goodman', 'Good address', 'user'),
(42, 'Tarasasfsaf', '$2y$10$9MHk9jPXv52lTlUeieN6iO1uPjpfOp50a4IoAsW6RYc1/jyJ06yYi', 'asfasf@mgila.cosfmefs', 'asfasfsfA', 'asfasfasffas', 'user'),
(43, 'joe', '$2y$10$WjJt.2WDyANevefGgeNnK.JGdTOMyYlUjm5jfvyPhUBB8cSJ0YiPq', 'joseph@gmail.com', 'Joseph', 'Joseph street', 'user');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `alias` (`alias`);

--
-- Индексы таблицы `currency`
--
ALTER TABLE `currency`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `gallery`
--
ALTER TABLE `gallery`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `order_product`
--
ALTER TABLE `order_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`);

--
-- Индексы таблицы `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `special` (`special`);

--
-- Индексы таблицы `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `login` (`login`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `category`
--
ALTER TABLE `category`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `currency`
--
ALTER TABLE `currency`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `gallery`
--
ALTER TABLE `gallery`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `order`
--
ALTER TABLE `order`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT для таблицы `order_product`
--
ALTER TABLE `order_product`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT для таблицы `product`
--
ALTER TABLE `product`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT для таблицы `user`
--
ALTER TABLE `user`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `order_product`
--
ALTER TABLE `order_product`
  ADD CONSTRAINT `order_product_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
