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
-- Структура таблицы `attribute_group`
--

CREATE TABLE `attribute_group` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `attribute_product`
--

CREATE TABLE `attribute_product` (
  `attr_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `attribute_value`
--

CREATE TABLE `attribute_value` (
  `id` int(10) UNSIGNED NOT NULL,
  `value` varchar(255) NOT NULL,
  `attr_group_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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

-- --------------------------------------------------------

--
-- Структура таблицы `order`
--

CREATE TABLE `order` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '0',
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_at` timestamp NULL DEFAULT NULL,
  `currency` varchar(10) NOT NULL,
  `note` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `order`
--

INSERT INTO `order` (`id`, `user_id`, `status`, `date`, `update_at`, `currency`, `note`) VALUES
(1, 17, '0', '2018-06-03 15:02:39', NULL, 'USD', ''),
(2, 22, '0', '2018-06-03 16:22:18', NULL, 'USD', ''),
(3, 22, '0', '2018-06-03 16:22:33', NULL, 'USD', ''),
(4, 22, '0', '2018-06-03 16:23:03', NULL, 'USD', ''),
(5, 22, '0', '2018-06-03 16:36:17', NULL, 'USD', ''),
(6, 23, '0', '2018-06-03 17:01:49', NULL, 'USD', ''),
(7, 24, '0', '2018-06-03 17:16:48', NULL, 'USD', 'Bring it on, Britney'),
(8, 24, '0', '2018-06-03 17:17:02', NULL, 'USD', 'Bring it on, Britney'),
(9, 24, '0', '2018-06-03 17:17:56', NULL, 'USD', 'Bring it on, Britney'),
(10, 24, '0', '2018-06-03 17:20:58', NULL, 'USD', 'Bring it on, Britney'),
(11, 24, '0', '2018-06-03 17:21:53', NULL, 'USD', 'Bring it on, Britney'),
(12, 24, '0', '2018-06-03 17:32:19', NULL, 'USD', 'Sup nibbas'),
(13, 24, '0', '2018-06-03 17:38:46', NULL, 'USD', '');

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
(1, 1, 2, 1, 'Celery Quandong', 30),
(2, 2, 1, 1, 'Greens Fava', 17),
(3, 2, 6, 1, 'Yarrow Sweet', 5),
(4, 3, 1, 1, 'Greens Fava', 17),
(5, 3, 6, 1, 'Yarrow Sweet', 5),
(6, 4, 1, 1, 'Greens Fava', 17),
(7, 4, 6, 1, 'Yarrow Sweet', 5),
(8, 5, 1, 1, 'Greens Fava', 17),
(9, 5, 6, 1, 'Yarrow Sweet', 5),
(10, 5, 2, 2, 'Celery Quandong', 30),
(11, 6, 1, 1, 'Greens Fava', 17),
(12, 6, 6, 1, 'Yarrow Sweet', 5),
(13, 6, 2, 2, 'Celery Quandong', 30),
(14, 7, 1, 1, 'Greens Fava', 17),
(15, 7, 6, 1, 'Yarrow Sweet', 5),
(16, 7, 2, 2, 'Celery Quandong', 30),
(17, 7, 3, 1, 'Pea Horseradish', 25),
(18, 8, 1, 1, 'Greens Fava', 17),
(19, 8, 6, 1, 'Yarrow Sweet', 5),
(20, 8, 2, 2, 'Celery Quandong', 30),
(21, 8, 3, 1, 'Pea Horseradish', 25),
(22, 9, 1, 1, 'Greens Fava', 17),
(23, 9, 6, 1, 'Yarrow Sweet', 5),
(24, 9, 2, 2, 'Celery Quandong', 30),
(25, 9, 3, 1, 'Pea Horseradish', 25),
(26, 10, 1, 1, 'Greens Fava', 17),
(27, 10, 6, 1, 'Yarrow Sweet', 5),
(28, 10, 2, 2, 'Celery Quandong', 30),
(29, 10, 3, 1, 'Pea Horseradish', 25),
(30, 11, 1, 1, 'Greens Fava', 17),
(31, 11, 6, 1, 'Yarrow Sweet', 5),
(32, 11, 2, 2, 'Celery Quandong', 30),
(33, 11, 3, 1, 'Pea Horseradish', 25),
(34, 12, 1, 1, 'Greens Fava', 17),
(35, 12, 6, 1, 'Yarrow Sweet', 5),
(36, 12, 2, 2, 'Celery Quandong', 30),
(37, 12, 3, 1, 'Pea Horseradish', 25),
(38, 13, 2, 1, 'Celery Quandong', 30);

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
  `status` enum('0','1') NOT NULL DEFAULT '1',
  `keywords` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `img` varchar(255) NOT NULL DEFAULT 'no_image.jpg',
  `special` enum('0','1') NOT NULL DEFAULT '0',
  `full_content` text,
  `ingredients` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `product`
--

INSERT INTO `product` (`id`, `category_id`, `title`, `alias`, `content`, `price`, `status`, `keywords`, `description`, `img`, `special`, `full_content`, `ingredients`) VALUES
(1, 2, 'Greens Fava', 'greens-fava', 'Lorem ipsum dolor sit amet pls help', 17, '1', 'Greens Fava', 'Greens Fava', 'special-image-1.png', '1', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim.', 'fresh samphire, plain flour, cornflower, eggs, fennel'),
(2, 2, 'Celery Quandong', 'celery-quandong', 'Lorem ipsum dolor sit amet pls help', 30, '1', 'Celery Quandong', 'Celery Quandong', 'special-image-2.png', '1', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim.', 'ricotta, shallots, cheddar, capers'),
(3, 2, 'Pea Horseradish', 'pea-horseradish', 'Lorem ipsum dolor sit amet pls help', 25, '1', 'Pea Horseradish', 'Pea Horseradish', 'special-image-3.png', '1', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim.', 'courgette flowers, goats cheese, red onion, pine nuts'),
(4, 3, 'Soko Radicchio', 'soko-radicchio', 'Lorem ipsum dolor sit amet pls help', 7, '1', 'Soko Radicchio', 'Soko Radicchio', 'special-image-4.png', '1', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim.', 'ricotta, shallots, cheddar, capers'),
(5, 3, 'Tigernut', 'tigernut', 'Lorem ipsum dolor sit amet pls help', 4, '1', 'Tigernut', 'Tigernut', 'special-image-5.png', '1', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim.', 'courgette flowers, goats cheese, red onion, pine nuts'),
(6, 3, 'Yarrow Sweet', 'yarrow-sweet', 'Lorem ipsum dolor sit amet pls help', 5, '1', 'Yarrow Sweet', 'Yarrow Sweet', 'special-image-6.png', '1', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim.', 'fresh samphire, plain flour, cornflower, eggs, fennel'),
(7, 1, 'Greens Fava', 'greens-fava', 'Lorem ipsum dolor sit amet pls help', 17, '1', 'Greens Fava', 'Greens Fava', 'special-image-1.png', '0', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim.', 'fresh samphire, plain flour, cornflower, eggs, fennel'),
(8, 1, 'Celery Quandong', 'celery-quandong', 'Lorem ipsum dolor sit amet pls help', 30, '1', 'Celery Quandong', 'Celery Quandong', 'special-image-2.png', '0', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim.', 'ricotta, shallots, cheddar, capers'),
(9, 1, 'Pea Horseradish', 'pea-horseradish', 'Lorem ipsum dolor sit amet pls help', 25, '1', 'Pea Horseradish', 'Pea Horseradish', 'special-image-3.png', '0', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim.', 'courgette flowers, goats cheese, red onion, pine nuts'),
(10, 1, 'Soko Radicchio', 'soko-radicchio', 'Lorem ipsum dolor sit amet pls help', 7, '1', 'Soko Radicchio', 'Soko Radicchio', 'special-image-4.png', '0', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim.', 'ricotta, shallots, cheddar, capers'),
(11, 1, 'Tigernut', 'tigernut', 'Lorem ipsum dolor sit amet pls help', 4, '1', 'Tigernut', 'Tigernut', 'special-image-5.png', '0', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim.', 'courgette flowers, goats cheese, red onion, pine nuts'),
(12, 1, 'Yarrow Sweet', 'yarrow-sweet', 'Lorem ipsum dolor sit amet pls help', 5, '1', 'Yarrow Sweet', 'Yarrow Sweet', 'special-image-6.png', '0', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim.', 'fresh samphire, plain flour, cornflower, eggs, fennel'),
(13, 1, 'Greens Fava', 'greens-fava', 'Lorem ipsum dolor sit amet pls help', 17, '1', 'Greens Fava', 'Greens Fava', 'special-image-1.png', '0', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim.', 'fresh samphire, plain flour, cornflower, eggs, fennel'),
(14, 1, 'Celery Quandong', 'celery-quandong', 'Lorem ipsum dolor sit amet pls help', 30, '1', 'Celery Quandong', 'Celery Quandong', 'special-image-2.png', '0', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim.', 'ricotta, shallots, cheddar, capers'),
(15, 1, 'Pea Horseradish', 'pea-horseradish', 'Lorem ipsum dolor sit amet pls help', 25, '1', 'Pea Horseradish', 'Pea Horseradish', 'special-image-3.png', '0', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim.', 'courgette flowers, goats cheese, red onion, pine nuts'),
(16, 1, 'Soko Radicchio', 'soko-radicchio', 'Lorem ipsum dolor sit amet pls help', 7, '1', 'Soko Radicchio', 'Soko Radicchio', 'special-image-4.png', '0', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim.', 'ricotta, shallots, cheddar, capers'),
(17, 1, 'Tigernut', 'tigernut', 'Lorem ipsum dolor sit amet pls help', 4, '1', 'Tigernut', 'Tigernut', 'special-image-5.png', '0', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim.', 'courgette flowers, goats cheese, red onion, pine nuts'),
(18, 1, 'Yarrow Sweet', 'yarrow-sweet', 'Lorem ipsum dolor sit amet pls help', 5, '1', 'Yarrow Sweet', 'Yarrow Sweet', 'special-image-6.png', '0', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim.', 'fresh samphire, plain flour, cornflower, eggs, fennel'),
(19, 3, 'Greens Fava', 'greens-fava', 'Lorem ipsum dolor sit amet pls help', 17, '1', 'Greens Fava', 'Greens Fava', 'special-image-1.png', '0', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim.', 'fresh samphire, plain flour, cornflower, eggs, fennel'),
(20, 3, 'Celery Quandong', 'celery-quandong', 'Lorem ipsum dolor sit amet pls help', 30, '1', 'Celery Quandong', 'Celery Quandong', 'special-image-2.png', '0', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim.', 'ricotta, shallots, cheddar, capers'),
(21, 3, 'Pea Horseradish', 'pea-horseradish', 'Lorem ipsum dolor sit amet pls help', 25, '1', 'Pea Horseradish', 'Pea Horseradish', 'special-image-3.png', '0', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim.', 'courgette flowers, goats cheese, red onion, pine nuts'),
(22, 2, 'Soko Radicchio', 'soko-radicchio', 'Lorem ipsum dolor sit amet pls help', 7, '1', 'Soko Radicchio', 'Soko Radicchio', 'special-image-4.png', '0', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim.', 'ricotta, shallots, cheddar, capers'),
(23, 2, 'Tigernut', 'tigernut', 'Lorem ipsum dolor sit amet pls help', 4, '1', 'Tigernut', 'Tigernut', 'special-image-5.png', '0', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim.', 'courgette flowers, goats cheese, red onion, pine nuts'),
(24, 2, 'Yarrow Sweet', 'yarrow-sweet', 'Lorem ipsum dolor sit amet pls help', 5, '1', 'Yarrow Sweet', 'Yarrow Sweet', 'special-image-6.png', '0', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim.', 'fresh samphire, plain flour, cornflower, eggs, fennel'),
(25, 2, 'Greens Fava', 'greens-fava', 'Lorem ipsum dolor sit amet pls help', 17, '1', 'Greens Fava', 'Greens Fava', 'special-image-1.png', '0', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim.', 'fresh samphire, plain flour, cornflower, eggs, fennel'),
(26, 4, 'Celery Quandong', 'celery-quandong', 'Lorem ipsum dolor sit amet pls help', 30, '1', 'Celery Quandong', 'Celery Quandong', 'special-image-2.png', '0', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim.', 'ricotta, shallots, cheddar, capers'),
(27, 4, 'Pea Horseradish', 'pea-horseradish', 'Lorem ipsum dolor sit amet pls help', 25, '1', 'Pea Horseradish', 'Pea Horseradish', 'special-image-3.png', '0', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim.', 'courgette flowers, goats cheese, red onion, pine nuts'),
(28, 4, 'Soko Radicchio', 'soko-radicchio', 'Lorem ipsum dolor sit amet pls help', 7, '1', 'Soko Radicchio', 'Soko Radicchio', 'special-image-4.png', '0', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim.', 'ricotta, shallots, cheddar, capers'),
(29, 4, 'Tigernut', 'tigernut', 'Lorem ipsum dolor sit amet pls help', 4, '1', 'Tigernut', 'Tigernut', 'special-image-5.png', '0', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim.', 'courgette flowers, goats cheese, red onion, pine nuts'),
(30, 4, 'Yarrow Sweet', 'yarrow-sweet', 'Lorem ipsum dolor sit amet pls help', 5, '1', 'Yarrow Sweet', 'Yarrow Sweet', 'special-image-6.png', '0', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim.', 'fresh samphire, plain flour, cornflower, eggs, fennel'),
(31, 4, 'Celery Quandong', 'celery-quandong', 'Lorem ipsum dolor sit amet pls help', 30, '1', 'Celery Quandong', 'Celery Quandong', 'special-image-2.png', '0', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim.', 'ricotta, shallots, cheddar, capers'),
(32, 4, 'Pea Horseradish', 'pea-horseradish', 'Lorem ipsum dolor sit amet pls help', 25, '1', 'Pea Horseradish', 'Pea Horseradish', 'special-image-3.png', '0', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim.', 'courgette flowers, goats cheese, red onion, pine nuts'),
(33, 4, 'Soko Radicchio', 'soko-radicchio', 'Lorem ipsum dolor sit amet pls help', 7, '1', 'Soko Radicchio', 'Soko Radicchio', 'special-image-4.png', '0', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim.', 'ricotta, shallots, cheddar, capers'),
(34, 4, 'Tigernut', 'tigernut', 'Lorem ipsum dolor sit amet pls help', 4, '1', 'Tigernut', 'Tigernut', 'special-image-5.png', '0', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim.', 'courgette flowers, goats cheese, red onion, pine nuts'),
(35, 4, 'Yarrow Sweet', 'yarrow-sweet', 'Lorem ipsum dolor sit amet pls help', 5, '1', 'Yarrow Sweet', 'Yarrow Sweet', 'special-image-6.png', '0', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim.', 'fresh samphire, plain flour, cornflower, eggs, fennel'),
(36, 4, 'Greens Fava', 'greens-fava', 'Lorem ipsum dolor sit amet pls help', 17, '1', 'Greens Fava', 'Greens Fava', 'special-image-1.png', '0', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim.', 'fresh samphire, plain flour, cornflower, eggs, fennel'),
(37, 4, 'Celery Quandong', 'celery-quandong', 'Lorem ipsum dolor sit amet pls help', 30, '1', 'Celery Quandong', 'Celery Quandong', 'special-image-2.png', '0', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim.', 'ricotta, shallots, cheddar, capers');

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
(23, 'dan', '$2y$10$oA/F.jBOtbcg7JvEXV6e2OqTCmroMF8AY4WC9.KJ56ShUChj0se7u', 'denyast@ukr.net', 'Dan', 'Kyiv, Olzhyva 8, 18', 'user'),
(24, 'Baguette', '$2y$10$/zk80xM9pwMqeaQ9SJ9siegpXtqqNbZMpKIrL2RH0DLWPpzWLHdeu', 'denyast98@gmail.com', 'Le Baguette', 'Unknown, bitch', 'user');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `attribute_group`
--
ALTER TABLE `attribute_group`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `attribute_product`
--
ALTER TABLE `attribute_product`
  ADD PRIMARY KEY (`attr_id`,`product_id`);

--
-- Индексы таблицы `attribute_value`
--
ALTER TABLE `attribute_value`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `value` (`value`),
  ADD KEY `attr_group_id` (`attr_group_id`);

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
-- AUTO_INCREMENT для таблицы `attribute_group`
--
ALTER TABLE `attribute_group`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `attribute_value`
--
ALTER TABLE `attribute_value`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `order`
--
ALTER TABLE `order`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT для таблицы `order_product`
--
ALTER TABLE `order_product`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT для таблицы `product`
--
ALTER TABLE `product`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT для таблицы `user`
--
ALTER TABLE `user`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

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
