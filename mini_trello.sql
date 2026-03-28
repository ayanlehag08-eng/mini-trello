-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : jeu. 26 mars 2026 à 14:58
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `mini_trello`
--

-- --------------------------------------------------------

--
-- Structure de la table `activity_logs`
--

CREATE TABLE `activity_logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `task_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `action` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `activity_logs`
--

INSERT INTO `activity_logs` (`id`, `task_id`, `user_id`, `action`, `description`, `created_at`, `updated_at`) VALUES
(42, 36, 3, 'create', 'a créé la tâche', '2026-03-25 16:42:40', '2026-03-25 16:42:40'),
(43, 36, 3, 'upload', 'a ajouté un fichier', '2026-03-25 16:42:43', '2026-03-25 16:42:43'),
(44, 16, 2, 'update', 'a modifié la tâche', '2026-03-26 09:44:25', '2026-03-26 09:44:25');

-- --------------------------------------------------------

--
-- Structure de la table `attachments`
--

CREATE TABLE `attachments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `file_path` varchar(255) NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `task_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `attachments`
--

INSERT INTO `attachments` (`id`, `file_path`, `file_name`, `task_id`, `created_at`, `updated_at`) VALUES
(8, 'attachments/UNE8hbv6NnQTf0CdrfP6rllEMfmrkF41toGBCsEL.docx', 'Analyse de besoin.docx', 36, '2026-03-25 16:42:43', '2026-03-25 16:42:43');

-- --------------------------------------------------------

--
-- Structure de la table `boards`
--

CREATE TABLE `boards` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `boards`
--

INSERT INTO `boards` (`id`, `title`, `description`, `user_id`, `created_at`, `updated_at`) VALUES
(14, 'Mini trello', 'gestion agile', 2, '2026-03-22 10:45:12', '2026-03-22 10:45:12'),
(16, 'Mini-trello', 'Methode Agile', 3, '2026-03-25 16:28:30', '2026-03-25 16:28:30');

-- --------------------------------------------------------

--
-- Structure de la table `board_user`
--

CREATE TABLE `board_user` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `board_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `role` varchar(255) NOT NULL DEFAULT 'member'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `board_user`
--

INSERT INTO `board_user` (`id`, `board_id`, `user_id`, `created_at`, `updated_at`, `role`) VALUES
(18, 14, 2, '2026-03-22 10:45:12', '2026-03-22 10:45:12', 'member'),
(22, 16, 3, '2026-03-25 16:28:30', '2026-03-25 16:28:30', 'member'),
(23, 16, 2, '2026-03-25 16:46:36', '2026-03-25 16:46:36', 'member'),
(24, 14, 3, '2026-03-26 09:43:46', '2026-03-26 09:43:46', 'member');

-- --------------------------------------------------------

--
-- Structure de la table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `columns`
--

CREATE TABLE `columns` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `position` int(11) NOT NULL DEFAULT 0,
  `board_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `columns`
--

INSERT INTO `columns` (`id`, `title`, `position`, `board_id`, `created_at`, `updated_at`) VALUES
(31, 'To Do', 1, 14, '2026-03-22 10:45:31', '2026-03-22 10:45:31'),
(32, 'Doing', 2, 14, '2026-03-22 10:45:41', '2026-03-22 10:45:41'),
(33, 'Done', 3, 14, '2026-03-22 10:45:50', '2026-03-22 10:45:50'),
(37, 'To Do', 1, 16, '2026-03-25 16:35:05', '2026-03-25 16:35:05'),
(38, 'Doing', 2, 16, '2026-03-25 16:36:37', '2026-03-25 16:36:37'),
(39, 'Done', 3, 16, '2026-03-25 16:36:48', '2026-03-25 16:36:48');

-- --------------------------------------------------------

--
-- Structure de la table `comments`
--

CREATE TABLE `comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `content` text NOT NULL,
  `task_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `comments`
--

INSERT INTO `comments` (`id`, `content`, `task_id`, `user_id`, `created_at`, `updated_at`) VALUES
(11, 'avancement du projet', 36, 3, '2026-03-25 16:44:26', '2026-03-25 16:44:26');

-- --------------------------------------------------------

--
-- Structure de la table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2026_03_17_105417_create_boards_table', 2),
(5, '2026_03_17_105437_create_columns_table', 2),
(6, '2026_03_17_105449_create_tasks_table', 2),
(7, '2026_03_17_105616_create_comments_table', 2),
(8, '2026_03_17_112041_create_personal_access_tokens_table', 3),
(9, '2026_03_18_231455_add_avatar_to_users_table', 4),
(10, '2026_03_19_114930_add_role_to_users_table', 5),
(11, '2026_03_19_115357_create_board_user_table', 6),
(12, '2026_03_20_164642_add_role_to_board_user_table', 7),
(13, '2026_03_22_095648_create_attachments_table', 8),
(14, '2026_03_24_071027_add_dates_to_tasks_table', 9),
(15, '2026_03_24_083139_create_activity_logs_table', 10),
(16, '2026_03_24_152423_create_notifications_table', 11);

-- --------------------------------------------------------

--
-- Structure de la table `notifications`
--

CREATE TABLE `notifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `is_read` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `notifications`
--

INSERT INTO `notifications` (`id`, `user_id`, `type`, `message`, `is_read`, `created_at`, `updated_at`) VALUES
(3, 2, 'task_reassigned', 'Une tâche vous a été attribuée : analyse', 1, '2026-03-25 04:30:53', '2026-03-25 06:41:14'),
(4, 3, 'task_reassigned', 'Une tâche vous a été attribuée : analyse', 1, '2026-03-25 04:38:39', '2026-03-25 16:24:22'),
(5, 3, 'task_reassigned', 'Une tâche vous a été attribuée : FAIRE COUR', 1, '2026-03-25 06:15:53', '2026-03-25 16:24:21'),
(6, 3, 'task_reassigned', 'Une tâche vous a été attribuée : bbbbbbbbbb', 1, '2026-03-25 06:50:57', '2026-03-25 16:24:20'),
(7, 3, 'task_assigned', 'Une nouvelle tâche vous a été assignée : Analyse de besoins', 0, '2026-03-25 16:42:40', '2026-03-25 16:42:40'),
(8, 3, 'task_reassigned', 'Une tâche vous a été attribuée : Analyse de besoins', 0, '2026-03-26 09:44:25', '2026-03-26 09:44:25');

-- --------------------------------------------------------

--
-- Structure de la table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` text NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'auth_token', '6d34366bee757aa37638bae2b8a1d8069ff63f61b1015306cb205005a0e40223', '[\"*\"]', NULL, NULL, '2026-03-17 10:33:19', '2026-03-17 10:33:19'),
(2, 'App\\Models\\User', 1, 'auth_token', 'f6579e2f8e7f7269fbd11830a15245c651eba6699ee22b94c02d0efe3cd09c04', '[\"*\"]', '2026-03-17 12:55:39', NULL, '2026-03-17 10:49:22', '2026-03-17 12:55:39'),
(3, 'App\\Models\\User', 2, 'auth_token', '970523863b5ce44d30471060adeb7fd23d5d54e2c550c2980bcc9b0b9de0ecde', '[\"*\"]', '2026-03-17 14:29:48', NULL, '2026-03-17 13:51:35', '2026-03-17 14:29:48'),
(6, 'App\\Models\\User', 2, 'auth_token', 'f72e8394d059befeb7f7cc5abaf8e5aafefbe449ef6ecab4468e359f37983a0a', '[\"*\"]', '2026-03-18 09:29:08', NULL, '2026-03-18 09:29:02', '2026-03-18 09:29:08'),
(7, 'App\\Models\\User', 2, 'auth_token', '78595c86b7a8fed0975cf0a4ae16c3810d3745df041915a9be271ba561eee51f', '[\"*\"]', NULL, NULL, '2026-03-18 09:29:05', '2026-03-18 09:29:05'),
(11, 'App\\Models\\User', 2, 'auth_token', '8c40ea3a067386f1aa270a20f1fc74bce4c3a07b32f2972f47c7184737b8a5e9', '[\"*\"]', '2026-03-18 11:11:36', NULL, '2026-03-18 10:49:24', '2026-03-18 11:11:36'),
(12, 'App\\Models\\User', 2, 'auth_token', 'b0c686289ad2ba1d4b90aeb50591d76a2e60305ac4fe70e48f9177652d98940e', '[\"*\"]', '2026-03-18 14:11:12', NULL, '2026-03-18 11:44:32', '2026-03-18 14:11:12'),
(17, 'App\\Models\\User', 2, 'auth_token', '3caed75756d19a447aa1019fd504efe1fe3a251aaeea06e678abbdba52151941', '[\"*\"]', '2026-03-18 20:09:13', NULL, '2026-03-18 20:09:12', '2026-03-18 20:09:13'),
(18, 'App\\Models\\User', 2, 'auth_token', 'ff191ffb1d687781e8517102723f5554c933e336ea722c1de405081633d3e35c', '[\"*\"]', '2026-03-18 20:40:24', NULL, '2026-03-18 20:40:18', '2026-03-18 20:40:24'),
(19, 'App\\Models\\User', 2, 'auth_token', '3b6c05af47ad68321f22113322d3f19b2f88ee74e3e50523117bc1ecdc8fc1ed', '[\"*\"]', '2026-03-18 20:44:00', NULL, '2026-03-18 20:40:22', '2026-03-18 20:44:00'),
(20, 'App\\Models\\User', 2, 'auth_token', '011c44af56f413e5e5480a2df39473cb7543bbd0ca7655cb56bc2398b4024b14', '[\"*\"]', '2026-03-18 22:29:33', NULL, '2026-03-18 22:29:30', '2026-03-18 22:29:33'),
(21, 'App\\Models\\User', 2, 'auth_token', '12ad6703cedab3b6185c9d288aa53fc1fedb2103dd107225ea1fa6c0bf4ec97b', '[\"*\"]', '2026-03-18 22:30:48', NULL, '2026-03-18 22:30:47', '2026-03-18 22:30:48'),
(22, 'App\\Models\\User', 2, 'auth_token', '7458fa8b23507b31121adc6c72e6ca848b20d2cfb06d0e29cbdba29a69b5f687', '[\"*\"]', '2026-03-19 05:52:00', NULL, '2026-03-19 05:51:53', '2026-03-19 05:52:00'),
(23, 'App\\Models\\User', 2, 'auth_token', '32d3450231bbe17be3635acc690ae4d5856cf4c5c1ed38c611b59898e037ef69', '[\"*\"]', '2026-03-19 08:00:13', NULL, '2026-03-19 05:51:58', '2026-03-19 08:00:13'),
(24, 'App\\Models\\User', 2, 'auth_token', 'ea84e3c283d4ad29cacef593e5d833795d25e7043cec0c6dda6f1cbcf6143bfb', '[\"*\"]', '2026-03-19 08:07:37', NULL, '2026-03-19 08:02:25', '2026-03-19 08:07:37'),
(25, 'App\\Models\\User', 2, 'auth_token', '84122445f566fd12dade56d5f175606ea5a7e83b92186c5c3f32b2087684f3f3', '[\"*\"]', '2026-03-19 08:30:23', NULL, '2026-03-19 08:10:44', '2026-03-19 08:30:23'),
(26, 'App\\Models\\User', 2, 'auth_token', 'ac4d8db80618293777156d3317d04697f7d5a3670f06787460802f516a8cf420', '[\"*\"]', '2026-03-19 08:32:23', NULL, '2026-03-19 08:31:47', '2026-03-19 08:32:23'),
(27, 'App\\Models\\User', 2, 'auth_token', '099e04c5f817d40879929f52d6d040d8e0f02ec9ab96f9c9349a55f746f5cfe3', '[\"*\"]', '2026-03-19 08:41:09', NULL, '2026-03-19 08:34:03', '2026-03-19 08:41:09'),
(28, 'App\\Models\\User', 2, 'auth_token', 'aa657940572311669411e9c1fbba210331688660636abd94404ed25f3ddf5db7', '[\"*\"]', '2026-03-19 08:42:08', NULL, '2026-03-19 08:41:34', '2026-03-19 08:42:08'),
(29, 'App\\Models\\User', 2, 'auth_token', '5d0f810eeb8b8c8ca98b0279323a81fb234cdc1fc430eae084b1fb352eaed1f7', '[\"*\"]', NULL, NULL, '2026-03-19 09:32:58', '2026-03-19 09:32:58'),
(30, 'App\\Models\\User', 2, 'auth_token', 'd27fec8b063831180d1f536aa2d49fb7bd92bc1c88900bc79bcb310b7b4f5084', '[\"*\"]', NULL, NULL, '2026-03-19 09:33:03', '2026-03-19 09:33:03'),
(31, 'App\\Models\\User', 2, 'auth_token', 'd96d0637d62cd099b71d56ab0e79b813dc7e75ff0ea6d30954197381b1321f21', '[\"*\"]', NULL, NULL, '2026-03-19 09:33:07', '2026-03-19 09:33:07'),
(32, 'App\\Models\\User', 2, 'auth_token', '6b1ee6a3b4f79acfca5503840b4177f4d247af6af8871458659cae3c944dc2d6', '[\"*\"]', NULL, NULL, '2026-03-19 09:33:29', '2026-03-19 09:33:29'),
(33, 'App\\Models\\User', 2, 'auth_token', '0079322250e13cbead032d6197a9f6655db68953249906eae1cc8bcde0f8915e', '[\"*\"]', NULL, NULL, '2026-03-19 09:34:45', '2026-03-19 09:34:45'),
(34, 'App\\Models\\User', 2, 'auth_token', '00067b150efd8d4a1bb0d4910bd3a7a852c8189b343cd249fcc1842e8b4aadf2', '[\"*\"]', NULL, NULL, '2026-03-19 09:35:25', '2026-03-19 09:35:25'),
(35, 'App\\Models\\User', 2, 'auth_token', 'b74ddcfe3428a1b024a742aad22bfc8032f014751cab216e6e386f9a83818e39', '[\"*\"]', NULL, NULL, '2026-03-19 09:35:29', '2026-03-19 09:35:29'),
(36, 'App\\Models\\User', 2, 'auth_token', '43934296dbe657c71e76554a4924811358e7650bb248b77bf7bf01733358226f', '[\"*\"]', NULL, NULL, '2026-03-19 10:07:13', '2026-03-19 10:07:13'),
(37, 'App\\Models\\User', 2, 'auth_token', '48a11725855f8f8dfd01bcd60372abdec970c997b1727ed80cfe68d8064a3f7c', '[\"*\"]', NULL, NULL, '2026-03-19 10:07:34', '2026-03-19 10:07:34'),
(38, 'App\\Models\\User', 2, 'auth_token', 'e9c676ea5ba9c58cef568ec3ab1803a9909dba53dac1fc32133e0d023e33b790', '[\"*\"]', NULL, NULL, '2026-03-19 10:08:26', '2026-03-19 10:08:26'),
(39, 'App\\Models\\User', 2, 'auth_token', 'e1645f3f3ffb1f33c70ea4429df74f4ac07b711657e50725ee4ba7100e930fcc', '[\"*\"]', NULL, NULL, '2026-03-19 10:18:19', '2026-03-19 10:18:19'),
(40, 'App\\Models\\User', 2, 'auth_token', 'ea3b9cd30797fcac03d7eae60e6e10c36b6addafb278140ee5b898a0ce851e68', '[\"*\"]', NULL, NULL, '2026-03-19 10:26:25', '2026-03-19 10:26:25'),
(41, 'App\\Models\\User', 2, 'auth_token', '757b08bef8cce662f5d4968a2f0e3bf72b5585a5a2f90afdfa78e42d28c91f64', '[\"*\"]', NULL, NULL, '2026-03-19 10:28:29', '2026-03-19 10:28:29'),
(42, 'App\\Models\\User', 2, 'auth_token', 'a55a2b7edc87b538d9cecba9e4d28eba213c16ace53bdf32889471dcb36e9728', '[\"*\"]', NULL, NULL, '2026-03-19 10:42:50', '2026-03-19 10:42:50'),
(43, 'App\\Models\\User', 2, 'auth_token', 'bace058fec3a75cd8ccbf591c954ad64a30977213d6ed7cac76c9915224650c6', '[\"*\"]', NULL, NULL, '2026-03-19 10:42:52', '2026-03-19 10:42:52'),
(44, 'App\\Models\\User', 2, 'auth_token', 'f926322205c160579946afd42999704632575fecfa0ef995d4de8a8f860d21fd', '[\"*\"]', NULL, NULL, '2026-03-19 10:43:46', '2026-03-19 10:43:46'),
(45, 'App\\Models\\User', 2, 'auth_token', 'b22ef8551ebceb8d133ed58425cc8f5a529afc975e85ac10d9076a9c8e8f8385', '[\"*\"]', NULL, NULL, '2026-03-19 10:47:28', '2026-03-19 10:47:28'),
(58, 'App\\Models\\User', 2, 'auth_token', 'fae470f7c8f145241bd74d4990ea3685952d6991a8ded30b7c91ab0b724a1000', '[\"*\"]', '2026-03-20 13:08:04', NULL, '2026-03-19 21:22:51', '2026-03-20 13:08:04'),
(60, 'App\\Models\\User', 2, 'auth_token', '839f8db8468f6f6507a13f2eb5362c89b97284cbfc1a3ccdd0d287a6ee4f11dc', '[\"*\"]', NULL, NULL, '2026-03-20 13:10:39', '2026-03-20 13:10:39'),
(61, 'App\\Models\\User', 2, 'auth_token', '7c2b2c7988a55406cc93b26f865c9ef53e38933137837b264ad9aec7973f5687', '[\"*\"]', NULL, NULL, '2026-03-20 13:10:40', '2026-03-20 13:10:40'),
(63, 'App\\Models\\User', 2, 'auth_token', '8ac938dbc2b865a62f8afc9226e74eed57d433f1246d7aa75585b7d9a07dfa53', '[\"*\"]', '2026-03-20 13:15:52', NULL, '2026-03-20 13:15:43', '2026-03-20 13:15:52'),
(73, 'App\\Models\\User', 2, 'auth_token', '3161ebb4dc9ee5d329d011deccc50704599b6e8898f83e83dd99aa80619c0828', '[\"*\"]', '2026-03-22 06:28:24', NULL, '2026-03-22 06:27:59', '2026-03-22 06:28:24'),
(80, 'App\\Models\\User', 7, 'auth_token', '1baccd76bac2b7edb6a936e2d5112cdd7fc62eaae5c19706e77be457cfa78306', '[\"*\"]', '2026-03-22 09:54:26', NULL, '2026-03-22 09:54:24', '2026-03-22 09:54:26'),
(81, 'App\\Models\\User', 2, 'auth_token', 'fd4aa0c3c3a70db3513df77f0834c55d0a71b2e65a375ac6b604cdf2d04f5f13', '[\"*\"]', '2026-03-22 10:10:47', NULL, '2026-03-22 10:05:55', '2026-03-22 10:10:47'),
(84, 'App\\Models\\User', 2, 'auth_token', '8bdd16f12b093dcf56cf8a95e9bba44d48c91e1c4e9c290b39dce325601e4775', '[\"*\"]', '2026-03-22 11:06:16', NULL, '2026-03-22 10:59:47', '2026-03-22 11:06:16'),
(85, 'App\\Models\\User', 2, 'auth_token', '1506e2934e043aee6f76b6a7d16643f2cfb4a640d1335c10134244329f968e47', '[\"*\"]', '2026-03-22 11:15:52', NULL, '2026-03-22 11:15:50', '2026-03-22 11:15:52'),
(89, 'App\\Models\\User', 8, 'auth_token', 'af590e8a6c121ae72e381e1daac6a0ada6d12fd60a7e4f191b282b3b4325d0cb', '[\"*\"]', '2026-03-22 11:26:56', NULL, '2026-03-22 11:23:11', '2026-03-22 11:26:56'),
(90, 'App\\Models\\User', 2, 'auth_token', 'd17d3785fa5a158633e592562651aa94217129c876163478a180973f793a75a4', '[\"*\"]', '2026-03-22 11:28:49', NULL, '2026-03-22 11:28:37', '2026-03-22 11:28:49'),
(91, 'App\\Models\\User', 2, 'auth_token', '60985ec2473ad952968b885ca86f2b9bea4bd679a61f0425337122bc6fe40449', '[\"*\"]', '2026-03-23 15:53:04', NULL, '2026-03-23 11:47:39', '2026-03-23 15:53:04'),
(93, 'App\\Models\\User', 2, 'auth_token', '5852b48c711be4b0750589a95b15f1fa25a7b3123aeea1ca17d0d08588fb77a0', '[\"*\"]', '2026-03-24 05:19:30', NULL, '2026-03-24 04:42:35', '2026-03-24 05:19:30'),
(94, 'App\\Models\\User', 2, 'auth_token', 'e55c6f864164551c3ed452243d233a97d93dfdee709e944bde488db075c014b2', '[\"*\"]', '2026-03-24 06:28:11', NULL, '2026-03-24 05:46:51', '2026-03-24 06:28:11'),
(95, 'App\\Models\\User', 2, 'auth_token', '270666d32a4f3f835d1d2102a22eca50f963fad3bd7929d63b58b20625e9ad5a', '[\"*\"]', '2026-03-24 06:37:26', NULL, '2026-03-24 06:28:36', '2026-03-24 06:37:26'),
(105, 'App\\Models\\User', 3, 'auth_token', '3a4c168a59504d8e513af6af542cc8a750f95bbda601df2209e3382a8c411c5e', '[\"*\"]', '2026-03-24 12:46:13', NULL, '2026-03-24 12:22:12', '2026-03-24 12:46:13'),
(108, 'App\\Models\\User', 2, 'auth_token', '09b3ad8328ebcc8a4216a0705029e05617553791834fa9fd24f159d232a30a34', '[\"*\"]', '2026-03-24 16:56:43', NULL, '2026-03-24 16:56:28', '2026-03-24 16:56:43'),
(113, 'App\\Models\\User', 2, 'auth_token', '9c4c0ee5f06e9a04cffe56b8a24244c8fef0bab27c6da20a45e6ea9680ad6850', '[\"*\"]', NULL, NULL, '2026-03-25 15:33:10', '2026-03-25 15:33:10'),
(114, 'App\\Models\\User', 2, 'auth_token', '3b859ce6ccaabb36a8bb9e94a2d560a9cd825ca35d002556626b2f7d3c274af3', '[\"*\"]', NULL, NULL, '2026-03-25 15:33:11', '2026-03-25 15:33:11'),
(118, 'App\\Models\\User', 3, 'auth_token', '73aaa08f47a394067c20281fc34c2674c26d0ea533e7a127a7ea3abbb30a4ef4', '[\"*\"]', '2026-03-25 17:14:54', NULL, '2026-03-25 16:24:05', '2026-03-25 17:14:54'),
(120, 'App\\Models\\User', 2, 'auth_token', '9f4610e8116b54948c8b960918eb1effed897e9db288e954f5761864bdacaa02', '[\"*\"]', '2026-03-26 09:45:43', NULL, '2026-03-26 09:41:54', '2026-03-26 09:45:43');

-- --------------------------------------------------------

--
-- Structure de la table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `tasks`
--

CREATE TABLE `tasks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `priority` enum('low','medium','high') NOT NULL DEFAULT 'medium',
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `position` int(11) NOT NULL DEFAULT 0,
  `column_id` bigint(20) UNSIGNED NOT NULL,
  `assigned_user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `tasks`
--

INSERT INTO `tasks` (`id`, `title`, `description`, `priority`, `start_date`, `end_date`, `due_date`, `position`, `column_id`, `assigned_user_id`, `created_at`, `updated_at`) VALUES
(16, 'Analyse de besoins', 'définir tous ce qui es nécessaire sur ce tache', 'high', '2026-03-26', '2026-03-31', NULL, 1, 31, 3, '2026-03-22 10:46:44', '2026-03-26 09:44:25'),
(17, 'Conception et developpement', NULL, 'medium', NULL, NULL, NULL, 0, 31, NULL, '2026-03-22 10:47:22', '2026-03-22 10:47:22'),
(18, 'Realisation et implementation', NULL, 'medium', NULL, NULL, NULL, 0, 31, NULL, '2026-03-22 10:48:00', '2026-03-22 10:48:00'),
(19, 'Test et validation', NULL, 'medium', NULL, NULL, NULL, 0, 31, NULL, '2026-03-22 10:48:44', '2026-03-22 10:48:44'),
(36, 'Analyse de besoins', '1.1. besoins fonctionnel\n1.2. besoin non fonctionnel', 'medium', '2026-03-25', '2026-03-31', NULL, 0, 37, 3, '2026-03-25 16:42:40', '2026-03-25 16:42:40');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `role` varchar(255) NOT NULL DEFAULT 'user'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `avatar`, `role`) VALUES
(2, 'Daoud', 'daouddjamahassan@gmail.com', NULL, '$2y$12$/TCHon9eINeGy4/IBsjUK.VKzCgmWRBlZgsUjj5s3XTBBLLqipl6m', NULL, '2026-03-17 13:51:35', '2026-03-22 09:23:27', '1773914580_2.jpg', 'admin'),
(3, 'Charko', 'Charkomohamed@gmail.com', NULL, '$2y$12$AygDHwdB1JLAiKoAxFOKg.oR0Tq6xlZdD.IjqPbx6ijt3s.Df2g8m', NULL, '2026-03-19 12:50:34', '2026-03-19 13:00:50', '1773936050_3.jpg', 'user');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `activity_logs`
--
ALTER TABLE `activity_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `activity_logs_task_id_foreign` (`task_id`),
  ADD KEY `activity_logs_user_id_foreign` (`user_id`);

--
-- Index pour la table `attachments`
--
ALTER TABLE `attachments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `attachments_task_id_foreign` (`task_id`);

--
-- Index pour la table `boards`
--
ALTER TABLE `boards`
  ADD PRIMARY KEY (`id`),
  ADD KEY `boards_user_id_foreign` (`user_id`);

--
-- Index pour la table `board_user`
--
ALTER TABLE `board_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `board_user_board_id_user_id_unique` (`board_id`,`user_id`),
  ADD KEY `board_user_user_id_foreign` (`user_id`);

--
-- Index pour la table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`),
  ADD KEY `cache_expiration_index` (`expiration`);

--
-- Index pour la table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`),
  ADD KEY `cache_locks_expiration_index` (`expiration`);

--
-- Index pour la table `columns`
--
ALTER TABLE `columns`
  ADD PRIMARY KEY (`id`),
  ADD KEY `columns_board_id_foreign` (`board_id`);

--
-- Index pour la table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comments_task_id_foreign` (`task_id`),
  ADD KEY `comments_user_id_foreign` (`user_id`);

--
-- Index pour la table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Index pour la table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Index pour la table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_user_id_foreign` (`user_id`);

--
-- Index pour la table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Index pour la table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`),
  ADD KEY `personal_access_tokens_expires_at_index` (`expires_at`);

--
-- Index pour la table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Index pour la table `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tasks_column_id_foreign` (`column_id`),
  ADD KEY `tasks_assigned_user_id_foreign` (`assigned_user_id`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `activity_logs`
--
ALTER TABLE `activity_logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT pour la table `attachments`
--
ALTER TABLE `attachments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `boards`
--
ALTER TABLE `boards`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT pour la table `board_user`
--
ALTER TABLE `board_user`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT pour la table `columns`
--
ALTER TABLE `columns`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT pour la table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT pour la table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT pour la table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=121;

--
-- AUTO_INCREMENT pour la table `tasks`
--
ALTER TABLE `tasks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `activity_logs`
--
ALTER TABLE `activity_logs`
  ADD CONSTRAINT `activity_logs_task_id_foreign` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `activity_logs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `attachments`
--
ALTER TABLE `attachments`
  ADD CONSTRAINT `attachments_task_id_foreign` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `boards`
--
ALTER TABLE `boards`
  ADD CONSTRAINT `boards_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `board_user`
--
ALTER TABLE `board_user`
  ADD CONSTRAINT `board_user_board_id_foreign` FOREIGN KEY (`board_id`) REFERENCES `boards` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `board_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `columns`
--
ALTER TABLE `columns`
  ADD CONSTRAINT `columns_board_id_foreign` FOREIGN KEY (`board_id`) REFERENCES `boards` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_task_id_foreign` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `tasks`
--
ALTER TABLE `tasks`
  ADD CONSTRAINT `tasks_assigned_user_id_foreign` FOREIGN KEY (`assigned_user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `tasks_column_id_foreign` FOREIGN KEY (`column_id`) REFERENCES `columns` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
