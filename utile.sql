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
(3, 'mrxulk', '12345678', 'svavka@mail.com', 'Svavik', 'Some address', 'user'),
(4, 'dan', 'password', 'denyast@ukr.net', 'Denys Stetsenko', 'Olzhycha 8, 18', 'user'),
(5, 'Petro', '13;jsdf', 'perto@gmail.com', 'Petroshka', 'asfa[sfasfasf', 'user'),
(6, 'Taras', '$2y$10$48qRJ2yLrVGDK6nxd5MeYOjBZ3w/jxB3LNpELA7O/WTdap9cg7Cz6', 'shev@ukr.met', 'Sheva', 'askfhaskfhk', 'user');

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `attribute_value`
--
ALTER TABLE `attribute_value`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT для таблицы `category`
--
ALTER TABLE `category`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT для таблицы `currency`
--
ALTER TABLE `currency`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `gallery`
--
ALTER TABLE `gallery`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `order`
--
ALTER TABLE `order`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `order_product`
--
ALTER TABLE `order_product`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `product`
--
ALTER TABLE `product`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT для таблицы `user`
--
ALTER TABLE `user`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

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
