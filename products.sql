-- Database Setup
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";

-- Version Information
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `project`
--

-- --------------------------------------------------------

--
-- Table structure for table `options`
--

CREATE TABLE `options` (
  `ID` int(11) NOT NULL,
  `Name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `options`
--

INSERT INTO `options` (`ID`, `Name`) VALUES
(1, 'Color'),
(2, 'Size'),
(3, 'Description'),
(4, 'Status'),
(5, 'Amount');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(8) NOT NULL,
  `name` varchar(255) NOT NULL,
  `image` text NOT NULL,
  `Price` int(11) NOT NULL,
  `Product_Type` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `name`, `image`, `Price`, `Product_Type`) VALUES
(1, 'Digital frame', 'public/img/digitalframe.jpeg', 5, 1),
(2, 'Album', 'public/img/album.jpeg', 10, 2),
(3, 'film', 'public/img/film.jpeg', 20, 5),
(4, 'Pillow', 'public/img/pillow.jpeg', 20, 3),
(5, 'Wooden frame', 'public/img/woodenframe.jpeg', 25, 1),
(6, 'Camera', 'public/img/cameras.jpeg', 27, 5),
(7, 'Wooden album', 'public/img/Mainwood.jfif', 40, 2),
(8, 'Print photo', 'public/img/photo.jpeg', 40, 4);

-- --------------------------------------------------------

--
-- Table structure for table `product_s_o_v`
--
-- Bady hena values ll option bt3ty
CREATE TABLE `product_s_o_v` (
  `ID` int(11) NOT NULL,
  `Product_ID` int(11) NOT NULL,
  `Product_Type_S_O` int(11) NOT NULL,
  `Value` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product_s_o_v`
--

INSERT INTO `product_s_o_v` (`ID`, `Product_ID`, `Product_Type_S_O`, `Value`) VALUES
(1, 1, 2, '13x15'),
(2, 1, 5, '5'),
(3, 2, 2, '13x15'),
(4, 2, 1, 'black'),
(5, 3, 3, 'فيلم لتسجيل ما تحب'),
(6, 3, 5, '30'),
(7, 4, 2, '30x30'),
(8, 4, 4, 'available'),
(9, 5, 2, '13x15'),
(10, 5, 1, 'brown'),
(11, 6, 5, '10'),
(12, 6, 4, 'not availavle'),
(13, 6, 1, 'white'),
(14, 7, 2, '13x15'),
(15, 7, 1, 'dark brown'),
(16, 8, 3, 'طباعة بكل الاحجام');

-- --------------------------------------------------------

--
-- Table structure for table `product_type`
--

CREATE TABLE `product_type` (
  `ID` int(11) NOT NULL,
  `Type` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product_type`
--

INSERT INTO `product_type` (`ID`, `Type`) VALUES
(1, 'Frames'),
(2, 'Albums'),
(3, 'Product_Custom'),
(4, 'Photoprint'),
(5, 'Accessories');

-- --------------------------------------------------------

--
-- Table structure for table `product_type_s_o`
--

CREATE TABLE `product_type_s_o` (
  `ID` int(11) NOT NULL,
  `Product_Type` int(11) NOT NULL,
  `Options` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product_type_s_o`
--

INSERT INTO `product_type_s_o` (`ID`, `Product_Type`, `Options`) VALUES
(1, 1, 1), -- Product Type ID 1 (Frames) can have Attribute ID 1 (Color)
(2, 1, 2), -- Product Type ID 1 (Frames) can have Attribute ID 2 (Size)
(3, 2, 5), -- Product Type ID 2 (Albums) can have Attribute ID 5 (Amount)
(4, 2, 4),
(5, 3, 3),
(6, 3, 2),
(7, 4, 4),
(8, 5, 4);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `options`
--
ALTER TABLE `options`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Product_Type` (`Product_Type`);

--
-- Indexes for table `product_s_o_v`
--
ALTER TABLE `product_s_o_v`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Product_ID` (`Product_ID`),
  ADD KEY `Option_ID` (`Product_Type_S_O`);

--
-- Indexes for table `product_type`
--
ALTER TABLE `product_type`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `product_type_s_o`
--
ALTER TABLE `product_type_s_o`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Product_Type` (`Product_Type`),
  ADD KEY `Options` (`Options`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `options`
--
ALTER TABLE `options`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT,  AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `product_s_o_v`
--
ALTER TABLE `product_s_o_v`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `product_type`
--
ALTER TABLE `product_type`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `product_type_s_o`
--
ALTER TABLE `product_type_s_o`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`Product_Type`) REFERENCES `product_type` (`ID`);


-- Constraints for table `product_s_o_v`
ALTER TABLE `product_s_o_v` 
    ADD CONSTRAINT `product_s_o_v_ibfk_2` FOREIGN KEY (`Product_ID`) REFERENCES `product` (`id`), 
    ADD CONSTRAINT `product_s_o_v_ibfk_3` FOREIGN KEY (`Product_Type_S_O`) REFERENCES `product_type_s_o` (`ID`);

-- Constraints for table `product_type_s_o`
--
ALTER TABLE `product_type_s_o`
  ADD CONSTRAINT `product_type_s_o_ibfk_1` FOREIGN KEY (`Product_Type`) REFERENCES `product_type` (`ID`),
  ADD CONSTRAINT `product_type_s_o_ibfk_2` FOREIGN KEY (`Options`) REFERENCES `options` (`ID`);
COMMIT;

-- This line adds two foreign key constraints to the product_type_s_o table:
-- product_type_s_o_ibfk_1: References the ID column in the product_type table.
-- product_type_s_o_ibfk_2: References the ID column in the options table.

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
