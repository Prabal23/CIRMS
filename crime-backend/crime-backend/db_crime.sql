-- phpMyAdmin SQL Dump
-- version 4.1.12
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jun 24, 2019 at 06:49 PM
-- Server version: 5.6.16
-- PHP Version: 5.5.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `db_crime`
--

-- --------------------------------------------------------

--
-- Table structure for table `activity_logs`
--

CREATE TABLE IF NOT EXISTS `activity_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `action` enum('created','updated','deleted') COLLATE utf8_unicode_ci NOT NULL,
  `log_type` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `log_type_title` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `log_type_id` int(11) NOT NULL DEFAULT '0',
  `changes` mediumtext COLLATE utf8_unicode_ci,
  `log_for` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `log_for_id` int(11) NOT NULL DEFAULT '0',
  `log_for2` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_for_id2` int(11) DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `announcements`
--

CREATE TABLE IF NOT EXISTS `announcements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text COLLATE utf8_unicode_ci NOT NULL,
  `description` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `created_by` int(11) NOT NULL,
  `share_with` mediumtext COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `read_by` mediumtext COLLATE utf8_unicode_ci,
  `deleted` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `created_by` (`created_by`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

CREATE TABLE IF NOT EXISTS `attendance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` enum('incomplete','pending','approved','rejected','deleted') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'incomplete',
  `user_id` int(11) NOT NULL,
  `in_time` datetime NOT NULL,
  `out_time` datetime DEFAULT NULL,
  `checked_by` int(11) DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci,
  `checked_at` datetime DEFAULT NULL,
  `reject_reason` text COLLATE utf8_unicode_ci,
  `deleted` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `checked_by` (`checked_by`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=9 ;

--
-- Dumping data for table `attendance`
--

INSERT INTO `attendance` (`id`, `status`, `user_id`, `in_time`, `out_time`, `checked_by`, `note`, `checked_at`, `reject_reason`, `deleted`) VALUES
(1, 'pending', 1, '2018-01-24 11:49:35', '2018-01-24 11:49:42', NULL, NULL, NULL, NULL, 0),
(2, 'pending', 1, '2018-01-24 11:57:36', '2018-01-25 07:58:59', NULL, NULL, NULL, NULL, 0),
(3, 'pending', 1, '2018-01-25 07:59:01', '2018-01-25 11:32:40', NULL, NULL, NULL, NULL, 0),
(4, 'pending', 1, '2018-01-29 05:59:48', '2018-01-29 05:59:51', NULL, NULL, NULL, NULL, 0),
(5, 'pending', 7, '2018-02-01 13:27:35', '2018-02-01 13:27:40', NULL, NULL, NULL, NULL, 0),
(6, 'pending', 1, '2018-02-02 07:05:21', '2018-02-02 07:05:26', NULL, NULL, NULL, NULL, 0),
(7, 'pending', 1, '2018-02-06 05:37:33', '2018-02-06 05:37:38', NULL, NULL, NULL, NULL, 0),
(8, 'pending', 1, '2018-02-06 08:06:43', '2018-02-06 08:06:44', NULL, NULL, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE IF NOT EXISTS `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`) VALUES
(1, 'Water & Sanitation'),
(2, 'Electricity'),
(3, 'Waste & Environment'),
(4, 'Legal & Complaints');

-- --------------------------------------------------------

--
-- Table structure for table `ci_sessions`
--

CREATE TABLE IF NOT EXISTS `ci_sessions` (
  `id` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `ip_address` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `timestamp` int(10) unsigned NOT NULL DEFAULT '0',
  `data` blob NOT NULL,
  KEY `ci_sessions_timestamp` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE IF NOT EXISTS `clients` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_name` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `address` text COLLATE utf8_unicode_ci,
  `city` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `state` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `zip` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `category` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_date` date NOT NULL,
  `email` text COLLATE utf8_unicode_ci,
  `phone` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `currency_symbol` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `starred_by` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `vat_number` text COLLATE utf8_unicode_ci,
  `currency` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `disable_online_payment` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `custom_fields`
--

CREATE TABLE IF NOT EXISTS `custom_fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text COLLATE utf8_unicode_ci NOT NULL,
  `placeholder` text COLLATE utf8_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `field_type` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `related_to` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `sort` int(11) NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `show_in_table` tinyint(1) NOT NULL DEFAULT '0',
  `show_in_invoice` tinyint(1) NOT NULL DEFAULT '0',
  `visible_to_admins_only` tinyint(1) NOT NULL DEFAULT '0',
  `hide_from_clients` tinyint(1) NOT NULL DEFAULT '0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `custom_field_values`
--

CREATE TABLE IF NOT EXISTS `custom_field_values` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `related_to_type` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `related_to_id` int(11) NOT NULL,
  `custom_field_id` int(11) NOT NULL,
  `value` longtext COLLATE utf8_unicode_ci NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `email_templates`
--

CREATE TABLE IF NOT EXISTS `email_templates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `template_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `email_subject` text COLLATE utf8_unicode_ci NOT NULL,
  `default_message` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `custom_message` mediumtext COLLATE utf8_unicode_ci,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=14 ;

--
-- Dumping data for table `email_templates`
--

INSERT INTO `email_templates` (`id`, `template_name`, `email_subject`, `default_message`, `custom_message`, `deleted`) VALUES
(1, 'login_info', 'Login details', '<div style="background-color: #eeeeef; padding: 50px 0; "><div style="max-width:640px; margin:0 auto; "> <div style="color: #fff; text-align: center; background-color:#33333e; padding: 30px; border-top-left-radius: 3px; border-top-right-radius: 3px; margin: 0;">  <h1>Login Details</h1></div><div style="padding: 20px; background-color: rgb(255, 255, 255);">            <p style="color: rgb(85, 85, 85); font-size: 14px;"> Hello {USER_FIRST_NAME}, &nbsp;{USER_LAST_NAME},<br><br>An account has been created for you.</p>            <p style="color: rgb(85, 85, 85); font-size: 14px;"> Please use the following info to login your dashboard:</p>            <hr>            <p style="color: rgb(85, 85, 85); font-size: 14px;">Dashboard URL:&nbsp;<a href="{DASHBOARD_URL}" target="_blank">{DASHBOARD_URL}</a></p>            <p style="color: rgb(85, 85, 85); font-size: 14px;"></p>            <p style=""><span style="color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;">Email: {USER_LOGIN_EMAIL}</span><br></p>            <p style=""><span style="color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;">Password:&nbsp;{USER_LOGIN_PASSWORD}</span></p>            <p style="color: rgb(85, 85, 85);"><br></p>            <p style="color: rgb(85, 85, 85); font-size: 14px;">{SIGNATURE}</p>        </div>    </div></div>', '', 0),
(2, 'reset_password', 'Reset password', '<div style="background-color: #eeeeef; padding: 50px 0; "><div style="max-width:640px; margin:0 auto; "><div style="color: #fff; text-align: center; background-color:#33333e; padding: 30px; border-top-left-radius: 3px; border-top-right-radius: 3px; margin: 0;"><h1>Reset Password</h1>\n </div>\n <div style="padding: 20px; background-color: rgb(255, 255, 255); color:#555;">                    <p style="font-size: 14px;"> Hello {ACCOUNT_HOLDER_NAME},<br><br>A password reset request has been created for your account.&nbsp;</p>\n                    <p style="font-size: 14px;"> To initiate the password reset process, please click on the following link:</p>\n                    <p style="font-size: 14px;"><a href="{RESET_PASSWORD_URL}" target="_blank">Reset Password</a></p>\n                    <p style="font-size: 14px;"></p>\n                    <p style=""><span style="font-size: 14px; line-height: 20px;"><br></span></p>\n<p style=""><span style="font-size: 14px; line-height: 20px;">If you''ve received this mail in error, it''s likely that another user entered your email address by mistake while trying to reset a password.</span><br></p>\n<p style=""><span style="font-size: 14px; line-height: 20px;">If you didn''t initiate the request, you don''t need to take any further action and can safely disregard this email.</span><br></p>\n<p style="font-size: 14px;"><br></p>\n<p style="font-size: 14px;">{SIGNATURE}</p>\n                </div>\n            </div>\n        </div>', '', 0),
(3, 'team_member_invitation', 'You are invited', '<div style="background-color: #eeeeef; padding: 50px 0; "><div style="max-width:640px; margin:0 auto; "> <div style="color: #fff; text-align: center; background-color:#33333e; padding: 30px; border-top-left-radius: 3px; border-top-right-radius: 3px; margin: 0;"><h1>Account Invitation</h1>   </div>  <div style="padding: 20px; background-color: rgb(255, 255, 255);">            <p style=""><span style="color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;">Hello,</span><span style="color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;"><span style="font-weight: bold;"><br></span></span></p>            <p style=""><span style="color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;"><span style="font-weight: bold;">{INVITATION_SENT_BY}</span> has sent you an invitation to join with a team.</span></p><p style=""><span style="color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;"><br></span></p>            <p style=""><span style="color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;"><a style="background-color: #00b393; padding: 10px 15px; color: #ffffff;" href="{INVITATION_URL}" target="_blank">Accept this Invitation</a></span></p>            <p style=""><span style="color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;"><br></span></p><p style=""><span style="color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;">If you don''t want to accept this invitation, simply ignore this email.</span><br><br></p>            <p style="color: rgb(85, 85, 85); font-size: 14px;">{SIGNATURE}</p>        </div>    </div></div>', '', 0),
(4, 'send_invoice', 'New invoice', '<div style="background-color: #eeeeef; padding: 50px 0; "> <div style="max-width:640px; margin:0 auto; "> <div style="color: #fff; text-align: center; background-color:#33333e; padding: 30px; border-top-left-radius: 3px; border-top-right-radius: 3px; margin: 0;"><h1>INVOICE #{INVOICE_ID}</h1></div> <div style="padding: 20px; background-color: rgb(255, 255, 255);">  <p style=""><span style="color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;">Hello {CONTACT_FIRST_NAME},</span><br></p><p style=""><span style="font-size: 14px; line-height: 20px;">Thank you for your business cooperation.</span><br></p><p style=""><span style="color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;">Your invoice for the project {PROJECT_TITLE} has been generated and is attached here.</span></p><p style=""><br></p><p style=""><span style="color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;"><a style="background-color: #00b393; padding: 10px 15px; color: #ffffff;" href="{INVOICE_URL}" target="_blank">Show Invoice</a></span></p><p style=""><span style="font-size: 14px; line-height: 20px;"><br></span></p><p style=""><span style="font-size: 14px; line-height: 20px;">Invoice balance due is {BALANCE_DUE}</span><br></p><p style=""><span style="color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;">Please pay this invoice within {DUE_DATE}.&nbsp;</span></p><p style=""><span style="color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;"><br></span></p><p style="color: rgb(85, 85, 85); font-size: 14px;">{SIGNATURE}</p>  </div> </div></div>', '', 0),
(5, 'signature', 'Signature', 'Powered By: <a href="http://fairsketch.com/" target="_blank">fairsketch </a>', '', 0),
(6, 'client_contact_invitation', 'You are invited', '<div style="background-color: #eeeeef; padding: 50px 0; ">    <div style="max-width:640px; margin:0 auto; ">  <div style="color: #fff; text-align: center; background-color:#33333e; padding: 30px; border-top-left-radius: 3px; border-top-right-radius: 3px; margin: 0;"><h1>Account Invitation</h1> </div> <div style="padding: 20px; background-color: rgb(255, 255, 255);">            <p style=""><span style="color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;">Hello,</span><span style="color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;"><span style="font-weight: bold;"><br></span></span></p>            <p style=""><span style="color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;"><span style="font-weight: bold;">{INVITATION_SENT_BY}</span> has sent you an invitation to a client portal.</span></p><p style=""><span style="color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;"><br></span></p>            <p style=""><span style="color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;"><a style="background-color: #00b393; padding: 10px 15px; color: #ffffff;" href="{INVITATION_URL}" target="_blank">Accept this Invitation</a></span></p>            <p style=""><span style="color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;"><br></span></p><p style=""><span style="color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;">If you don''t want to accept this invitation, simply ignore this email.</span><br><br></p>            <p style="color: rgb(85, 85, 85); font-size: 14px;">{SIGNATURE}</p>        </div>    </div></div>', '', 0),
(7, 'ticket_created', 'Ticket  #{TICKET_ID} - {TICKET_TITLE}', '<div style="background-color: #eeeeef; padding: 50px 0; "> <div style="max-width:640px; margin:0 auto; "> <div style="color: #fff; text-align: center; background-color:#33333e; padding: 30px; border-top-left-radius: 3px; border-top-right-radius: 3px; margin: 0;"><h1>Ticket #{TICKET_ID} Opened</h1></div><div style="padding: 20px; background-color: rgb(255, 255, 255);"><p style=""><span style="line-height: 18.5714px; font-weight: bold;">Title: {TICKET_TITLE}</span><span style="line-height: 18.5714px;"><br></span></p><p style=""><span style="line-height: 18.5714px;">{TICKET_CONTENT}</span><br></p> <p style=""><br></p> <p style=""><span style="color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;"><a style="background-color: #00b393; padding: 10px 15px; color: #ffffff;" href="{TICKET_URL}" target="_blank">Show Ticket</a></span></p> <p style=""><br></p><p style="">Regards,</p><p style=""><span style="line-height: 18.5714px;">{USER_NAME}</span><br></p>   </div>  </div> </div>', '', 0),
(8, 'ticket_commented', 'Ticket  #{TICKET_ID} - {TICKET_TITLE}', '<div style="background-color: #eeeeef; padding: 50px 0; "> <div style="max-width:640px; margin:0 auto; "> <div style="color: #fff; text-align: center; background-color:#33333e; padding: 30px; border-top-left-radius: 3px; border-top-right-radius: 3px; margin: 0;"><h1>Ticket #{TICKET_ID} Replies</h1></div><div style="padding: 20px; background-color: rgb(255, 255, 255);"><p style=""><span style="line-height: 18.5714px; font-weight: bold;">Title: {TICKET_TITLE}</span><span style="line-height: 18.5714px;"><br></span></p><p style=""><span style="line-height: 18.5714px;">{TICKET_CONTENT}</span></p><p style=""><span style="line-height: 18.5714px;"><br></span></p><p style=""><span style="color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;"><a style="background-color: #00b393; padding: 10px 15px; color: #ffffff;" href="{TICKET_URL}" target="_blank">Show Ticket</a></span></p></div></div></div>', '', 0),
(9, 'ticket_closed', 'Ticket  #{TICKET_ID} - {TICKET_TITLE}', '<div style="background-color: #eeeeef; padding: 50px 0; "> <div style="max-width:640px; margin:0 auto; "> <div style="color: #fff; text-align: center; background-color:#33333e; padding: 30px; border-top-left-radius: 3px; border-top-right-radius: 3px; margin: 0;"><h1>Ticket #{TICKET_ID}</h1></div><div style="padding: 20px; background-color: rgb(255, 255, 255);"><p style=""><span style="line-height: 18.5714px;">The Ticket #{TICKET_ID} has been closed by&nbsp;</span><span style="line-height: 18.5714px;">{USER_NAME}</span></p> <p style=""><br></p> <p style=""><span style="color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;"><a style="background-color: #00b393; padding: 10px 15px; color: #ffffff;" href="{TICKET_URL}" target="_blank">Show Ticket</a></span></p>   </div>  </div> </div>', '', 0),
(10, 'ticket_reopened', 'Ticket  #{TICKET_ID} - {TICKET_TITLE}', '<div style="background-color: #eeeeef; padding: 50px 0; "> <div style="max-width:640px; margin:0 auto; "> <div style="color: #fff; text-align: center; background-color:#33333e; padding: 30px; border-top-left-radius: 3px; border-top-right-radius: 3px; margin: 0;"><h1>Ticket #{TICKET_ID}</h1></div><div style="padding: 20px; background-color: rgb(255, 255, 255);"><p style=""><span style="line-height: 18.5714px;">The Ticket #{TICKET_ID} has been reopened by&nbsp;</span><span style="line-height: 18.5714px;">{USER_NAME}</span></p><p style=""><br></p><p style=""><span style="color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;"><a style="background-color: #00b393; padding: 10px 15px; color: #ffffff;" href="{TICKET_URL}" target="_blank">Show Ticket</a></span></p>  </div> </div></div>', '', 0),
(11, 'general_notification', '{EVENT_TITLE}', '<div style="background-color: #eeeeef; padding: 50px 0; "> <div style="max-width:640px; margin:0 auto; "> <div style="color: #fff; text-align: center; background-color:#33333e; padding: 30px; border-top-left-radius: 3px; border-top-right-radius: 3px; margin: 0;"><h1>{APP_TITLE}</h1></div><div style="padding: 20px; background-color: rgb(255, 255, 255);"><p style=""><span style="line-height: 18.5714px;">{EVENT_TITLE}</span></p><p style=""><span style="line-height: 18.5714px;">{EVENT_DETAILS}</span></p><p style=""><span style="line-height: 18.5714px;"><br></span></p><p style=""><span style="line-height: 18.5714px;"></span></p><p style=""><span style="color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;"><a style="background-color: #00b393; padding: 10px 15px; color: #ffffff;" href="{NOTIFICATION_URL}" target="_blank">View Details</a></span></p>  </div> </div></div>', '', 0),
(12, 'invoice_payment_confirmation', 'Payment received', '<table border="0" cellpadding="0" cellspacing="0" width="100%" style="border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;background-color: #EEEEEE;border-top: 0;border-bottom: 0;">\r\n <tbody><tr>\r\n <td align="center" valign="top" style="padding-top: 30px;padding-right: 10px;padding-bottom: 30px;padding-left: 10px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;">\r\n <table border="0" cellpadding="0" cellspacing="0" width="600" style="border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;">\r\n <tbody><tr>\r\n <td align="center" valign="top" style="mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;">\r\n <table border="0" cellpadding="0" cellspacing="0" width="100%" style="border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;background-color: #FFFFFF;">\r\n                                        <tbody><tr>\r\n                                                <td valign="top" style="mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;">\r\n                                                    <table border="0" cellpadding="0" cellspacing="0" width="100%" style="min-width: 100%;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;">\r\n                                                        <tbody>\r\n                                                            <tr>\r\n                                                                <td valign="top" style="mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;">\r\n                                                                    <table align="left" border="0" cellpadding="0" cellspacing="0" style="background-color: #33333e; max-width: 100%;min-width: 100%;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;" width="100%">\r\n                                                                        <tbody><tr>\r\n                                                                                <td valign="top" style="padding-top: 40px;padding-right: 18px;padding-bottom: 40px;padding-left: 18px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;word-break: break-word;color: #606060;font-family: Arial;font-size: 15px;line-height: 150%;text-align: left;">\r\n                                                                                    <h2 style="display: block;margin: 0;padding: 0;font-family: Arial;font-size: 30px;font-style: normal;font-weight: bold;line-height: 100%;letter-spacing: -1px;text-align: center;color: #ffffff !important;">Payment Confirmation</h2>\r\n                                                                                </td>\r\n                                                                            </tr>\r\n                                                                        </tbody>\r\n                                                                    </table>\r\n                                                                </td>\r\n                                                            </tr>\r\n                                                        </tbody>\r\n                                                    </table>\r\n                                                    <table border="0" cellpadding="0" cellspacing="0" width="100%" style="min-width: 100%;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;">\r\n                                                        <tbody>\r\n                                                            <tr>\r\n                                                                <td valign="top" style="mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;">\r\n\r\n                                                                    <table align="left" border="0" cellpadding="0" cellspacing="0" style="max-width: 100%;min-width: 100%;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;" width="100%">\r\n                                                                        <tbody><tr>\r\n                                                                                <td valign="top" style="padding-top: 20px;padding-right: 18px;padding-bottom: 0;padding-left: 18px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;word-break: break-word;color: #606060;font-family: Arial;font-size: 15px;line-height: 150%;text-align: left;">\r\n                                                                                    Hello,<br>\r\n                                                                                    We have received your payment of {PAYMENT_AMOUNT} for {INVOICE_ID} <br>\r\n                                                                                    Thank you for your business cooperation.\r\n                                                                                </td>\r\n                                                                            </tr>\r\n                                                                            <tr>\r\n                                                                                <td valign="top" style="padding-top: 10px;padding-right: 18px;padding-bottom: 10px;padding-left: 18px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;word-break: break-word;color: #606060;font-family: Arial;font-size: 15px;line-height: 150%;text-align: left;">\r\n                                                                                    <table border="0" cellpadding="0" cellspacing="0" width="100%" style="min-width: 100%;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;">\r\n                                                                                        <tbody>\r\n                                                                                            <tr>\r\n                                                                                                <td style="padding-top: 15px;padding-right: 0x;padding-bottom: 15px;padding-left: 0px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;">\r\n                                                                                                    <table border="0" cellpadding="0" cellspacing="0" style="border-collapse: separate !important;border-radius: 2px;background-color: #00b393;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;">\r\n                                                                                                        <tbody>\r\n                                                                                                            <tr>\r\n                                                                                                                <td align="center" valign="middle" style="font-family: Arial;font-size: 16px;padding: 10px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;">\r\n                                                                                                                    <a href="{INVOICE_URL}" target="_blank" style="font-weight: bold;letter-spacing: normal;line-height: 100%;text-align: center;text-decoration: none;color: #FFFFFF;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;display: block;">View Invoice</a>\r\n                                                                                                                </td>\r\n                                                                                                            </tr>\r\n                                                                                                        </tbody>\r\n                                                                                                    </table>\r\n                                                                                                </td>\r\n                                                                                            </tr>\r\n                                                                                        </tbody>\r\n                                                                                    </table>\r\n                                                                                </td>\r\n                                                                            </tr>\r\n                                                                            <tr>\r\n                                                                                <td valign="top" style="padding-top: 0px;padding-right: 18px;padding-bottom: 10px;padding-left: 18px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;word-break: break-word;color: #606060;font-family: Arial;font-size: 15px;line-height: 150%;text-align: left;"> \r\n                                                                                    \r\n                                                                                </td>\r\n                                                                            </tr>\r\n                                                                            <tr>\r\n                                                                                <td valign="top" style="padding-top: 0px;padding-right: 18px;padding-bottom: 20px;padding-left: 18px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;word-break: break-word;color: #606060;font-family: Arial;font-size: 15px;line-height: 150%;text-align: left;"> \r\n  {SIGNATURE}\r\n  </td>\r\n </tr>\r\n </tbody>\r\n  </table>\r\n  </td>\r\n  </tr>\r\n  </tbody>\r\n </table>\r\n  </td>\r\n </tr>\r\n  </tbody>\r\n  </table>\r\n  </td>\r\n </tr>\r\n </tbody>\r\n </table>\r\n </td>\r\n </tr>\r\n </tbody>\r\n  </table>', NULL, 0),
(13, 'message_received', '{SUBJECT}', '<meta content="text/html; charset=utf-8" http-equiv="Content-Type"> <meta content="width=device-width, initial-scale=1.0" name="viewport"> <style type="text/css"> #message-container p {margin: 10px 0;} #message-container h1, #message-container h2, #message-container h3, #message-container h4, #message-container h5, #message-container h6 { padding:10px; margin:0; } #message-container table td {border-collapse: collapse;} #message-container table { border-collapse:collapse; mso-table-lspace:0pt; mso-table-rspace:0pt; } #message-container a span{padding:10px 15px !important;} </style> <table id="message-container" align="center" border="0" cellpadding="0" cellspacing="0" style="background:#eee; margin:0; padding:0; width:100% !important; line-height: 100% !important; -webkit-text-size-adjust:100%; -ms-text-size-adjust:100%; margin:0; padding:0; font-family:Helvetica,Arial,sans-serif; color: #555;"> <tbody> <tr> <td valign="top"> <table align="center" border="0" cellpadding="0" cellspacing="0"> <tbody> <tr> <td height="50" width="600">&nbsp;</td> </tr> <tr> <td style="background-color:#33333e; padding:25px 15px 30px 15px; font-weight:bold; " width="600"><h2 style="color:#fff; text-align:center;">{USER_NAME} sent you a message</h2></td> </tr> <tr> <td bgcolor="whitesmoke" style="background:#fff; font-family:Helvetica,Arial,sans-serif" valign="top" width="600"> <table align="center" border="0" cellpadding="0" cellspacing="0"> <tbody> <tr> <td height="10" width="560">&nbsp;</td> </tr> <tr> <td width="560"><p><span style="background-color: transparent;">{MESSAGE_CONTENT}</span></p> <p style="display:inline-block; padding: 10px 15px; background-color: #00b393;"><a href="{MESSAGE_URL}" style="text-decoration: none; color:#fff;" target="_blank">Reply Message</a></p> </td> </tr> <tr> <td height="10" width="560">&nbsp;</td> </tr> </tbody> </table> </td> </tr> <tr> <td height="60" width="600">&nbsp;</td> </tr> </tbody> </table> </td> </tr> </tbody> </table>', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `estimates`
--

CREATE TABLE IF NOT EXISTS `estimates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `client_id` int(11) NOT NULL,
  `estimate_request_id` int(11) NOT NULL DEFAULT '0',
  `estimate_date` date NOT NULL,
  `valid_until` date NOT NULL,
  `note` mediumtext COLLATE utf8_unicode_ci,
  `last_email_sent_date` date DEFAULT NULL,
  `status` enum('draft','sent','accepted','declined') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'draft',
  `tax_id` int(11) NOT NULL DEFAULT '0',
  `tax_id2` int(11) NOT NULL DEFAULT '0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `estimate_forms`
--

CREATE TABLE IF NOT EXISTS `estimate_forms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `status` enum('active','inactive') COLLATE utf8_unicode_ci NOT NULL,
  `enable_attachment` tinyint(4) NOT NULL DEFAULT '0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `estimate_items`
--

CREATE TABLE IF NOT EXISTS `estimate_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `quantity` double NOT NULL,
  `unit_type` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `rate` double NOT NULL,
  `total` double NOT NULL,
  `estimate_id` int(11) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `estimate_requests`
--

CREATE TABLE IF NOT EXISTS `estimate_requests` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `estimate_form_id` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `client_id` int(11) NOT NULL,
  `assigned_to` int(11) NOT NULL,
  `status` enum('new','processing','hold','canceled','estimated') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'new',
  `files` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE IF NOT EXISTS `events` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text COLLATE utf8_unicode_ci NOT NULL,
  `description` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `location` mediumtext COLLATE utf8_unicode_ci,
  `client_id` int(11) NOT NULL DEFAULT '0',
  `labels` text COLLATE utf8_unicode_ci NOT NULL,
  `share_with` mediumtext COLLATE utf8_unicode_ci,
  `deleted` int(1) NOT NULL DEFAULT '0',
  `color` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `created_by` (`created_by`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `expenses`
--

CREATE TABLE IF NOT EXISTS `expenses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `expense_date` date NOT NULL,
  `category_id` int(11) NOT NULL,
  `description` mediumtext COLLATE utf8_unicode_ci,
  `amount` double NOT NULL,
  `files` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `title` text COLLATE utf8_unicode_ci NOT NULL,
  `project_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `expense_categories`
--

CREATE TABLE IF NOT EXISTS `expense_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text COLLATE utf8_unicode_ci NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `expense_categories`
--

INSERT INTO `expense_categories` (`id`, `title`, `deleted`) VALUES
(1, 'Miscellaneous expense', 0);

-- --------------------------------------------------------

--
-- Table structure for table `follow_images`
--

CREATE TABLE IF NOT EXISTS `follow_images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `follow_id` int(11) NOT NULL,
  `photo` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `follow_images`
--

INSERT INTO `follow_images` (`id`, `follow_id`, `photo`, `created_at`, `updated_at`) VALUES
(1, 12, 'profile-1561358659.jpg', '2019-06-24 00:44:19', '2019-06-24 00:44:19'),
(2, 12, 'profile-1561358659.jpg', '2019-06-24 00:44:19', '2019-06-24 00:44:19'),
(3, 13, 'profile-1561391634.jpg', '2019-06-24 09:53:54', '2019-06-24 09:53:54'),
(4, 13, 'profile-1561391634.jpg', '2019-06-24 09:53:54', '2019-06-24 09:53:54');

-- --------------------------------------------------------

--
-- Table structure for table `follow_ups`
--

CREATE TABLE IF NOT EXISTS `follow_ups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `manager_name` varchar(50) DEFAULT NULL,
  `reporting_person` int(11) NOT NULL,
  `work_code` varchar(191) DEFAULT NULL,
  `lat` varchar(191) NOT NULL,
  `longi` int(191) DEFAULT NULL,
  `address` varchar(191) DEFAULT NULL,
  `situation` varchar(20) DEFAULT NULL,
  `report_date` datetime NOT NULL,
  `problem_id` int(11) NOT NULL,
  `notes` text,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `follow_ups`
--

INSERT INTO `follow_ups` (`id`, `manager_name`, `reporting_person`, `work_code`, `lat`, `longi`, `address`, `situation`, `report_date`, `problem_id`, `notes`, `status`, `created_at`, `updated_at`) VALUES
(1, 'admin', 29, 'kelly1', '24.9112688', 92, 'Pollobi Rd, Sylhet, Bangladesh', 'green', '2019-06-20 05:40:17', 6, 'New problem for vandalism', 0, '2019-06-20 05:44:50', '2019-06-20 05:44:50'),
(2, 'admin', 29, 'kelly1', '24.9112688', 92, 'Pollobi Rd, Sylhet, Bangladesh', 'green', '2019-06-22 06:59:43', 7, 'bdb', 0, '2019-06-22 07:24:27', '2019-06-22 07:24:27'),
(3, 'admin', 29, 'kelly1', '24.9112688', 92, 'Pollobi Rd, Sylhet, Bangladesh', 'green', '2019-06-22 06:59:43', 7, 'bdb', 0, '2019-06-22 07:25:11', '2019-06-22 07:25:11'),
(4, 'admin', 39, '123456', '24.9112688', 92, 'Pollobi Rd, Sylhet, Bangladesh', 'green', '2019-06-24 12:09:16', 7, 'notes', 0, '2019-06-24 00:17:03', '2019-06-24 00:17:03'),
(5, 'admin', 39, '123456', '24.9112688', 92, 'Pollobi Rd, Sylhet, Bangladesh', 'green', '2019-06-24 12:09:16', 7, 'notes', 0, '2019-06-24 00:25:23', '2019-06-24 00:25:23'),
(6, 'admin', 39, '123456', '24.9112688', 92, 'Pollobi Rd, Sylhet, Bangladesh', '2', '2019-06-24 12:09:16', 7, 'notes', 0, '2019-06-24 00:27:16', '2019-06-24 00:27:16'),
(7, 'admin', 39, '123456', '24.9112688', 92, 'Pollobi Rd, Sylhet, Bangladesh', 'green', '2019-06-24 12:09:16', 7, 'notes follow', 0, '2019-06-24 00:27:42', '2019-06-24 00:27:42'),
(8, 'admin', 39, '123456', '24.9112', 92, 'Pollobi Rd, Sylhet, Bangladesh', '2', '2019-06-24 12:29:39', 7, 'notes problem', 0, '2019-06-24 00:30:51', '2019-06-24 00:30:51'),
(9, 'admin', 39, '123456', '24.9112', 92, 'Pollobi Rd, Sylhet, Bangladesh', 'green', '2019-06-24 12:29:39', 7, 'notes', 0, '2019-06-24 00:35:02', '2019-06-24 00:35:02'),
(10, 'admin', 39, '123456', '24.9112688', 92, 'Pollobi Rd, Sylhet, Bangladesh', '2', '2019-06-24 12:35:54', 7, 'notes New test', 0, '2019-06-24 00:36:50', '2019-06-24 00:36:50'),
(11, 'admin', 39, '123456', '24.9112688', 92, 'Pollobi Rd, Sylhet, Bangladesh', '2', '2019-06-24 12:35:54', 7, 'notes New test', 0, '2019-06-24 00:37:16', '2019-06-24 00:37:16'),
(12, 'admin', 39, '123456', '24.9112688', 92, 'Pollobi Rd, Sylhet, Bangladesh', 'green', '2019-06-24 12:35:54', 7, 'notes', 0, '2019-06-24 00:44:16', '2019-06-24 00:44:16'),
(13, 'admin', 39, '123456', '24.8908032', 92, '3100 Kastoghar Rd, Sylhet 3100, Bangladesh', '3', '2019-06-24 09:52:16', 8, 'hdhdhd', 0, '2019-06-24 09:53:51', '2019-06-24 09:53:51');

-- --------------------------------------------------------

--
-- Table structure for table `help_articles`
--

CREATE TABLE IF NOT EXISTS `help_articles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `category_id` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `status` enum('active','inactive') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'active',
  `total_views` int(11) NOT NULL DEFAULT '0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `help_categories`
--

CREATE TABLE IF NOT EXISTS `help_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `type` enum('help','knowledge_base') COLLATE utf8_unicode_ci NOT NULL,
  `sort` int(11) NOT NULL,
  `status` enum('active','inactive') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'active',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE IF NOT EXISTS `invoices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `client_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL DEFAULT '0',
  `bill_date` date NOT NULL,
  `due_date` date NOT NULL,
  `note` mediumtext COLLATE utf8_unicode_ci,
  `last_email_sent_date` date DEFAULT NULL,
  `status` enum('draft','not_paid') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'draft',
  `tax_id` int(11) NOT NULL DEFAULT '0',
  `tax_id2` int(11) NOT NULL DEFAULT '0',
  `recurring` tinyint(4) NOT NULL DEFAULT '0',
  `recurring_invoice_id` int(11) NOT NULL DEFAULT '0',
  `repeat_every` int(11) NOT NULL DEFAULT '0',
  `repeat_type` enum('days','weeks','months','years') COLLATE utf8_unicode_ci DEFAULT NULL,
  `no_of_cycles` int(11) NOT NULL DEFAULT '0',
  `next_recurring_date` date NOT NULL DEFAULT '0000-00-00',
  `no_of_cycles_completed` int(11) NOT NULL DEFAULT '0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `invoice_items`
--

CREATE TABLE IF NOT EXISTS `invoice_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `quantity` double NOT NULL,
  `unit_type` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `rate` double NOT NULL,
  `total` double NOT NULL,
  `invoice_id` int(11) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `invoice_payments`
--

CREATE TABLE IF NOT EXISTS `invoice_payments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `amount` double NOT NULL,
  `payment_date` date NOT NULL,
  `payment_method_id` int(11) NOT NULL,
  `note` text COLLATE utf8_unicode_ci,
  `invoice_id` int(11) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `transaction_id` tinytext COLLATE utf8_unicode_ci,
  `created_by` int(11) DEFAULT '1',
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  KEY `id_2` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE IF NOT EXISTS `items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `unit_type` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `rate` double NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `leave_applications`
--

CREATE TABLE IF NOT EXISTS `leave_applications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `leave_type_id` int(11) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `total_hours` decimal(7,2) NOT NULL,
  `total_days` decimal(5,2) NOT NULL,
  `applicant_id` int(11) NOT NULL,
  `reason` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `status` enum('pending','approved','rejected','canceled') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'pending',
  `created_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `checked_at` datetime DEFAULT NULL,
  `checked_by` int(11) NOT NULL DEFAULT '0',
  `deleted` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `leave_type_id` (`leave_type_id`),
  KEY `user_id` (`applicant_id`),
  KEY `checked_by` (`checked_by`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `leave_types`
--

CREATE TABLE IF NOT EXISTS `leave_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `status` enum('active','inactive') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'active',
  `color` varchar(7) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `deleted` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `leave_types`
--

INSERT INTO `leave_types` (`id`, `title`, `status`, `color`, `description`, `deleted`) VALUES
(1, 'Casual Leave', 'active', '#83c340', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE IF NOT EXISTS `messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subject` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Untitled',
  `message` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `from_user_id` int(11) NOT NULL,
  `to_user_id` int(11) NOT NULL,
  `status` enum('unread','read') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'unread',
  `message_id` int(11) NOT NULL DEFAULT '0',
  `deleted` int(1) NOT NULL DEFAULT '0',
  `files` longtext COLLATE utf8_unicode_ci NOT NULL,
  `deleted_by_users` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `message_from` (`from_user_id`),
  KEY `message_to` (`to_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `milestones`
--

CREATE TABLE IF NOT EXISTS `milestones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text COLLATE utf8_unicode_ci NOT NULL,
  `project_id` int(11) NOT NULL,
  `due_date` date NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `deleted` tinyint(11) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contact` int(11) DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=104 ;

--
-- Dumping data for table `milestones`
--

INSERT INTO `milestones` (`id`, `title`, `project_id`, `due_date`, `description`, `deleted`, `name`, `email`, `contact`, `address`) VALUES
(1, 'dsfsdfsdf', 1, '2018-02-07', 'dsfdsfsdfsdf', 1, NULL, NULL, NULL, NULL),
(2, 'sdfsdfsdf', 1, '2018-03-09', 'descrptionmiletstone', 1, NULL, NULL, NULL, NULL),
(100, 'asdasd', 1, '2018-01-31', 'sadasdasd', 0, 'asdasdasd', 'asdasdasd', 23233, '2323sdasdasd'),
(101, '', 0, '0000-00-00', '', 0, 'testnew', 'testnew', 0, 'testnew'),
(102, '', 0, '0000-00-00', '', 0, 'dfsdf', 'sdfsdf', 0, 'sdfsdf'),
(103, '', 0, '0000-00-00', '', 0, 'sdsd', 'sdsd', 0, 'sdsd');

-- --------------------------------------------------------

--
-- Table structure for table `notes`
--

CREATE TABLE IF NOT EXISTS `notes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_by` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `title` text COLLATE utf8_unicode_ci NOT NULL,
  `description` mediumtext COLLATE utf8_unicode_ci,
  `project_id` int(11) NOT NULL DEFAULT '0',
  `client_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `labels` text COLLATE utf8_unicode_ci,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `notes`
--

INSERT INTO `notes` (`id`, `created_by`, `created_at`, `title`, `description`, `project_id`, `client_id`, `user_id`, `labels`, `deleted`) VALUES
(1, 7, '2018-01-28 12:23:13', 'wefsdfsdf', 'asdasdasdasd', 0, 0, 0, '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE IF NOT EXISTS `notifications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `notify_to` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `read_by` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `event` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `project_id` int(11) NOT NULL,
  `task_id` int(11) NOT NULL,
  `project_comment_id` int(11) NOT NULL,
  `ticket_id` int(11) NOT NULL,
  `ticket_comment_id` int(11) NOT NULL,
  `project_file_id` int(11) NOT NULL,
  `leave_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `to_user_id` int(11) NOT NULL,
  `activity_log_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `invoice_payment_id` int(11) NOT NULL,
  `invoice_id` int(11) NOT NULL,
  `estimate_id` int(11) NOT NULL,
  `estimate_request_id` int(11) NOT NULL,
  `actual_message_id` int(11) NOT NULL,
  `parent_message_id` int(11) NOT NULL,
  `deleted` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=26 ;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `user_id`, `description`, `created_at`, `notify_to`, `read_by`, `event`, `project_id`, `task_id`, `project_comment_id`, `ticket_id`, `ticket_comment_id`, `project_file_id`, `leave_id`, `post_id`, `to_user_id`, `activity_log_id`, `client_id`, `invoice_payment_id`, `invoice_id`, `estimate_id`, `estimate_request_id`, `actual_message_id`, `parent_message_id`, `deleted`) VALUES
(1, 1, '', '2018-02-24 07:48:49', '2', ',2', 'project_member_added', 1, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(2, 1, '', '2018-02-24 07:55:08', '2,3', ',3', 'project_member_added', 1, 0, 0, 0, 0, 0, 0, 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(3, 3, '', '2018-02-27 19:20:21', '2', '', 'reassigned', 1, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(4, 2, '', '2018-02-27 19:21:36', '3', ',3', 'reasubmit', 1, 0, 0, 0, 0, 0, 0, 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 2, '', '2018-02-27 19:45:28', '3', ',3', 'reasubmit', 1, 0, 0, 0, 0, 0, 0, 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(6, 1, '', '2018-02-28 18:27:03', '3', '', 'project_member_added', 2, 0, 0, 0, 0, 0, 0, 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7, 1, '', '2018-02-28 18:27:10', '2,3', ',3', 'project_member_added', 2, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(8, 3, '', '2018-03-04 09:03:55', '1', '', 'project_member_deleted', 1, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(9, 3, '', '2018-03-04 09:04:10', '1,2', '', 'project_member_added', 1, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(10, 3, '', '2018-03-04 09:16:24', '2', '', 'project_member_added', 3, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(11, 3, '', '2018-03-04 09:16:32', '1,2', '', 'project_member_added', 3, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(12, 3, '', '2018-03-04 15:35:35', '2', '', 'project_member_added', 4, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(13, 2, '', '2018-03-04 16:38:47', '', '', 'submit', 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(14, 2, '', '2018-03-04 17:33:58', '3,2,', '', 'submit', 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15, 1, '', '2018-03-18 09:29:45', '2', ',2', 'project_member_added', 5, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(16, 1, '', '2018-03-31 10:22:10', '2', '', 'project_member_added', 6, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(17, 1, '', '2018-03-31 10:22:15', '2,3', '', 'project_member_added', 6, 0, 0, 0, 0, 0, 0, 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18, 2, '', '2018-03-31 12:23:27', '1,2,3,', '', 'submit', 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(19, 3, '', '2018-04-20 14:21:49', '2', '', 'project_member_added', 7, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(20, 2, '', '2018-04-20 16:37:36', '3,2,', ',3', 'submit', 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(21, 3, '', '2018-04-20 16:43:15', '2', ',2', 'reassigned', 7, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(22, 2, '', '2018-04-20 16:50:40', '3', '', 'reasubmit', 7, 0, 0, 0, 0, 0, 0, 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(23, 1, '', '2018-05-25 04:20:27', '2', '', 'project_member_added', 8, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(24, 1, '', '2018-05-25 04:20:33', '2,3', '', 'project_member_added', 8, 0, 0, 0, 0, 0, 0, 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(25, 2, '', '2018-05-25 06:26:29', '1,2,3,', '', 'submit', 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `notification_settings`
--

CREATE TABLE IF NOT EXISTS `notification_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `event` varchar(250) NOT NULL,
  `category` varchar(50) NOT NULL,
  `enable_email` int(1) NOT NULL DEFAULT '0',
  `enable_web` int(1) NOT NULL DEFAULT '0',
  `notify_to_team` text NOT NULL,
  `notify_to_team_members` text NOT NULL,
  `notify_to_terms` text NOT NULL,
  `sort` int(11) NOT NULL,
  `deleted` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `event` (`event`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=41 ;

--
-- Dumping data for table `notification_settings`
--

INSERT INTO `notification_settings` (`id`, `event`, `category`, `enable_email`, `enable_web`, `notify_to_team`, `notify_to_team_members`, `notify_to_terms`, `sort`, `deleted`) VALUES
(1, 'project_created', 'project', 0, 0, '', '', '', 1, 0),
(2, 'project_deleted', 'project', 0, 0, '', '', '', 2, 0),
(3, 'project_task_created', 'project', 0, 1, '', '', 'project_members,task_assignee', 3, 0),
(4, 'project_task_updated', 'project', 0, 1, '', '', 'task_assignee', 4, 0),
(5, 'project_task_assigned', 'project', 0, 1, '', '', 'task_assignee', 5, 0),
(7, 'project_task_started', 'project', 0, 0, '', '', '', 7, 0),
(8, 'project_task_finished', 'project', 0, 0, '', '', '', 8, 0),
(9, 'project_task_reopened', 'project', 0, 0, '', '', '', 9, 0),
(10, 'project_task_deleted', 'project', 0, 1, '', '', 'task_assignee', 10, 0),
(11, 'project_task_commented', 'project', 0, 1, '', '', 'task_assignee', 11, 0),
(12, 'project_member_added', 'project', 0, 1, '', '', 'project_members', 12, 0),
(13, 'project_member_deleted', 'project', 0, 1, '', '', 'project_members', 13, 0),
(14, 'project_file_added', 'project', 0, 1, '', '', 'project_members', 14, 0),
(15, 'project_file_deleted', 'project', 0, 1, '', '', 'project_members', 15, 0),
(16, 'project_file_commented', 'project', 0, 1, '', '', 'project_members', 16, 0),
(17, 'project_comment_added', 'project', 0, 1, '', '', 'project_members', 17, 0),
(18, 'project_comment_replied', 'project', 0, 1, '', '', 'project_members,comment_creator', 18, 0),
(19, 'project_customer_feedback_added', 'project', 0, 1, '', '', 'project_members', 19, 0),
(20, 'project_customer_feedback_replied', 'project', 0, 1, '', '', 'project_members,comment_creator', 20, 0),
(21, 'client_signup', 'client', 0, 0, '', '', '', 21, 0),
(22, 'invoice_online_payment_received', 'invoice', 0, 0, '', '', '', 22, 0),
(23, 'leave_application_submitted', 'leave', 0, 0, '', '', '', 23, 0),
(24, 'leave_approved', 'leave', 0, 1, '', '', 'leave_applicant', 24, 0),
(25, 'leave_assigned', 'leave', 0, 1, '', '', 'leave_applicant', 25, 0),
(26, 'leave_rejected', 'leave', 0, 1, '', '', 'leave_applicant', 26, 0),
(27, 'leave_canceled', 'leave', 0, 0, '', '', '', 27, 0),
(28, 'ticket_created', 'ticket', 0, 0, '', '', '', 28, 0),
(29, 'ticket_commented', 'ticket', 0, 1, '', '', 'client_primary_contact,ticket_creator', 29, 0),
(30, 'ticket_closed', 'ticket', 0, 1, '', '', 'client_primary_contact,ticket_creator', 30, 0),
(31, 'ticket_reopened', 'ticket', 0, 1, '', '', 'client_primary_contact,ticket_creator', 31, 0),
(32, 'estimate_request_received', 'estimate', 0, 0, '', '', '', 32, 0),
(33, 'estimate_sent', 'estimate', 0, 0, '', '', '', 33, 0),
(34, 'estimate_accepted', 'estimate', 0, 0, '', '', '', 34, 0),
(35, 'estimate_rejected', 'estimate', 0, 0, '', '', '', 35, 0),
(36, 'new_message_sent', 'message', 0, 0, '', '', '', 36, 0),
(37, 'message_reply_sent', 'message', 0, 0, '', '', '', 37, 0),
(38, 'invoice_payment_confirmation', 'invoice', 0, 0, '', '', '', 22, 0),
(39, 'reassigned', 'project', 0, 0, '', '', 'project_members', 0, 0),
(40, 'reassigned', 'project', 0, 0, '', '', 'project_members', 50, 0);

-- --------------------------------------------------------

--
-- Table structure for table `payment_methods`
--

CREATE TABLE IF NOT EXISTS `payment_methods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'custom',
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `online_payable` tinyint(1) NOT NULL DEFAULT '0',
  `available_on_invoice` tinyint(1) NOT NULL DEFAULT '0',
  `minimum_payment_amount` double NOT NULL DEFAULT '0',
  `settings` longtext COLLATE utf8_unicode_ci NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Dumping data for table `payment_methods`
--

INSERT INTO `payment_methods` (`id`, `title`, `type`, `description`, `online_payable`, `available_on_invoice`, `minimum_payment_amount`, `settings`, `deleted`) VALUES
(1, 'Cash', 'custom', 'Cash payments', 0, 0, 0, '', 0),
(2, 'Stripe', 'stripe', 'Stripe online payments', 1, 0, 0, 'a:3:{s:15:"pay_button_text";s:6:"Stripe";s:10:"secret_key";s:6:"";s:15:"publishable_key";s:6:"";}', 0),
(3, 'PayPal Payments Standard', 'paypal_payments_standard', 'PayPal Payments Standard Online Payments', 1, 0, 0, 'a:4:{s:15:"pay_button_text";s:6:"PayPal";s:5:"email";s:4:"";s:11:"paypal_live";s:1:"0";s:5:"debug";s:1:"0";}', 0);

-- --------------------------------------------------------

--
-- Table structure for table `paypal_ipn`
--

CREATE TABLE IF NOT EXISTS `paypal_ipn` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `transaction_id` tinytext COLLATE utf8_unicode_ci,
  `ipn_hash` longtext COLLATE utf8_unicode_ci NOT NULL,
  `ipn_data` longtext COLLATE utf8_unicode_ci NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE IF NOT EXISTS `posts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_by` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `description` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `post_id` int(11) NOT NULL,
  `share_with` text COLLATE utf8_unicode_ci,
  `files` longtext COLLATE utf8_unicode_ci,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `problems`
--

CREATE TABLE IF NOT EXISTS `problems` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text NOT NULL,
  `cat_id` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=68 ;

--
-- Dumping data for table `problems`
--

INSERT INTO `problems` (`id`, `title`, `cat_id`) VALUES
(4, 'Burst Pipe', 1),
(5, 'Stolen Pipe', 1),
(6, 'Vandalism', 1),
(7, 'Geyser Leak', 1),
(8, 'Element Replacement', 1),
(36, 'Leak Type 2', 2),
(37, 'Replace a Cistern', 2),
(38, 'Replace a Cracked Pan', 1),
(40, 'Checkpoint 2', 1),
(41, 'Any Name of Incident', 1),
(42, 'Any Name of Maintenance', 1),
(43, 'Fix Element', 1),
(44, 'Water Metre Replacement', 1),
(45, 'Water Metre Reading', 1),
(46, 'Retro Fit', 1),
(47, 'Repair Work', 1),
(48, 'Reprogramming', 3),
(49, 'Leak Detection', 3),
(50, 'Manhole Cover', 1),
(51, 'Basin Installation', 1),
(52, 'Cistern Installation', 1),
(53, 'Other', 1),
(54, 'Inspection', 4),
(55, 'Pressure in tap', 1),
(56, 'Transformer', 4),
(57, 'leaky bucket', 1),
(58, 'Flow', 1),
(59, 'Check Flow', 1),
(60, 'First Checkup', 1),
(61, 'Road blockage', 1),
(62, 'Water Issue', 1),
(63, 'Community Issue', 1),
(64, 'Death in family', 1),
(65, 'kyle', 1),
(66, 'Whatever Issue', 1),
(67, 'Fines ', 1);

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

CREATE TABLE IF NOT EXISTS `projects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text COLLATE utf8_unicode_ci NOT NULL,
  `description` mediumtext COLLATE utf8_unicode_ci,
  `start_date` date NOT NULL,
  `deadline` date NOT NULL,
  `client_id` int(11) NOT NULL,
  `created_date` date NOT NULL,
  `created_by` int(11) NOT NULL DEFAULT '0',
  `status` enum('open','completed','canceled') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'open',
  `labels` text COLLATE utf8_unicode_ci,
  `price` double NOT NULL DEFAULT '0',
  `starred_by` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `project_comments`
--

CREATE TABLE IF NOT EXISTS `project_comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_by` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `description` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `project_id` int(11) NOT NULL DEFAULT '0',
  `comment_id` int(11) NOT NULL DEFAULT '0',
  `task_id` int(11) NOT NULL DEFAULT '0',
  `file_id` int(11) NOT NULL DEFAULT '0',
  `customer_feedback_id` int(11) NOT NULL DEFAULT '0',
  `files` longtext COLLATE utf8_unicode_ci,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `project_excel_fields`
--

CREATE TABLE IF NOT EXISTS `project_excel_fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `client_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `field_name` text NOT NULL,
  `date` date NOT NULL,
  `is_delete` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `project_excel_values`
--

CREATE TABLE IF NOT EXISTS `project_excel_values` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `json_values` longtext NOT NULL,
  `project_id` int(11) NOT NULL,
  `is_submitted` int(11) NOT NULL,
  `qa_assigned` int(11) NOT NULL,
  `qa_id` int(11) NOT NULL,
  `completed` int(11) NOT NULL,
  `locked_by_va` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `project_excel_values_other`
--

CREATE TABLE IF NOT EXISTS `project_excel_values_other` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `json_values` longtext NOT NULL,
  `project_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `project_files`
--

CREATE TABLE IF NOT EXISTS `project_files` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `file_name` text COLLATE utf8_unicode_ci NOT NULL,
  `description` mediumtext COLLATE utf8_unicode_ci,
  `file_size` double NOT NULL,
  `created_at` datetime NOT NULL,
  `project_id` int(11) NOT NULL,
  `uploaded_by` int(11) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `project_members`
--

CREATE TABLE IF NOT EXISTS `project_members` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `is_leader` tinyint(1) DEFAULT '0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `project_settings`
--

CREATE TABLE IF NOT EXISTS `project_settings` (
  `project_id` int(11) NOT NULL,
  `setting_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `setting_value` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  UNIQUE KEY `unique_index` (`project_id`,`setting_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `project_time`
--

CREATE TABLE IF NOT EXISTS `project_time` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `start_time` datetime NOT NULL,
  `end_time` datetime DEFAULT NULL,
  `status` enum('open','logged','approved') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'logged',
  `note` text COLLATE utf8_unicode_ci,
  `task_id` int(11) NOT NULL DEFAULT '0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE IF NOT EXISTS `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `permissions` mediumtext COLLATE utf8_unicode_ci,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE IF NOT EXISTS `settings` (
  `setting_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `setting_value` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  UNIQUE KEY `setting_name` (`setting_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`setting_name`, `setting_value`, `deleted`) VALUES
('accepted_file_formats', 'jpg,jpeg,doc', 0),
('allowed_ip_addresses', '', 0),
('app_title', 'WS Reporting', 0),
('company_email', 'khushal.yadav@outlook.com', 0),
('currency_position', 'left', 0),
('currency_symbol', 'INR', 0),
('date_format', 'Y-m-d', 0),
('decimal_separator', '.', 0),
('default_currency', 'USD', 0),
('email_sent_from_address', 'khushal.yadav@outlook.com', 0),
('email_sent_from_name', 'khushal', 0),
('first_day_of_week', '0', 0),
('invoice_logo', 'default-invoice-logo.png', 0),
('item_purchase_code', '', 0),
('language', 'english', 0),
('module_announcement', '1', 0),
('module_attendance', '1', 0),
('module_estimate', '1', 0),
('module_estimate_request', '1', 0),
('module_event', '1', 0),
('module_expense', '1', 0),
('module_help', '1', 0),
('module_invoice', '1', 0),
('module_knowledge_base', '1', 0),
('module_leave', '1', 0),
('module_message', '1', 0),
('module_note', '1', 0),
('module_project_timesheet', '1', 0),
('module_ticket', '1', 0),
('module_timeline', '1', 0),
('rows_per_page', '10', 0),
('scrollbar', 'jquery', 0),
('show_background_image_in_signin_page', 'yes', 0),
('show_logo_in_signin_page', 'yes', 0),
('site_logo', '_file5a686ddf25263-site-logo.jpeg', 0),
('time_format', 'small', 0),
('timezone', 'UTC', 0);

-- --------------------------------------------------------

--
-- Table structure for table `social_links`
--

CREATE TABLE IF NOT EXISTS `social_links` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `facebook` text COLLATE utf8_unicode_ci,
  `twitter` text COLLATE utf8_unicode_ci,
  `linkedin` text COLLATE utf8_unicode_ci,
  `googleplus` text COLLATE utf8_unicode_ci,
  `digg` text COLLATE utf8_unicode_ci,
  `youtube` text COLLATE utf8_unicode_ci,
  `pinterest` text COLLATE utf8_unicode_ci,
  `instagram` text COLLATE utf8_unicode_ci,
  `github` text COLLATE utf8_unicode_ci,
  `tumblr` text COLLATE utf8_unicode_ci,
  `vine` text COLLATE utf8_unicode_ci,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tasks`
--

CREATE TABLE IF NOT EXISTS `tasks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text COLLATE utf8_unicode_ci NOT NULL,
  `description` mediumtext COLLATE utf8_unicode_ci,
  `project_id` int(11) NOT NULL,
  `milestone_id` int(11) NOT NULL DEFAULT '0',
  `assigned_to` int(11) NOT NULL,
  `contact` int(11) DEFAULT NULL,
  `labels` text COLLATE utf8_unicode_ci,
  `points` tinyint(4) NOT NULL DEFAULT '1',
  `status` enum('to_do','in_progress','done') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'to_do',
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `collaborators` text COLLATE utf8_unicode_ci NOT NULL,
  `deleted` tinyint(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `tasks`
--

INSERT INTO `tasks` (`id`, `title`, `description`, `project_id`, `milestone_id`, `assigned_to`, `contact`, `labels`, `points`, `status`, `email`, `collaborators`, `deleted`) VALUES
(1, 'asasasda', 'sddfsdfsdf', 1, 1, 1, 0, '', 2, 'in_progress', '0000-00-00', 'sdfsdf', 0);

-- --------------------------------------------------------

--
-- Table structure for table `taxes`
--

CREATE TABLE IF NOT EXISTS `taxes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` tinytext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `percentage` double NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `taxes`
--

INSERT INTO `taxes` (`id`, `title`, `percentage`, `deleted`) VALUES
(1, 'Tax (10%)', 10, 0);

-- --------------------------------------------------------

--
-- Table structure for table `team`
--

CREATE TABLE IF NOT EXISTS `team` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text COLLATE utf8_unicode_ci NOT NULL,
  `members` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `deleted` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `team_member_job_info`
--

CREATE TABLE IF NOT EXISTS `team_member_job_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `date_of_hire` date NOT NULL DEFAULT '0000-00-00',
  `deleted` int(1) NOT NULL DEFAULT '0',
  `salary` double NOT NULL DEFAULT '0',
  `salary_term` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=9 ;

--
-- Dumping data for table `team_member_job_info`
--

INSERT INTO `team_member_job_info` (`id`, `user_id`, `date_of_hire`, `deleted`, `salary`, `salary_term`) VALUES
(1, 2, '0000-00-00', 0, 0, NULL),
(2, 3, '0000-00-00', 0, 0, NULL),
(3, 4, '0000-00-00', 0, 0, NULL),
(4, 5, '0000-00-00', 0, 0, NULL),
(5, 6, '0000-00-00', 0, 0, NULL),
(6, 7, '0000-00-00', 0, 0, NULL),
(7, 8, '0000-00-00', 0, 0, NULL),
(8, 9, '0000-00-00', 0, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tickets`
--

CREATE TABLE IF NOT EXISTS `tickets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `client_id` int(11) NOT NULL,
  `ticket_type_id` int(11) NOT NULL,
  `title` text COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `status` enum('new','client_replied','open','closed') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'new',
  `last_activity_at` datetime DEFAULT NULL,
  `assigned_to` int(11) NOT NULL DEFAULT '0',
  `labels` text COLLATE utf8_unicode_ci,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ticket_comments`
--

CREATE TABLE IF NOT EXISTS `ticket_comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_by` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `description` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `ticket_id` int(11) NOT NULL,
  `files` longtext COLLATE utf8_unicode_ci,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ticket_types`
--

CREATE TABLE IF NOT EXISTS `ticket_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text COLLATE utf8_unicode_ci NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `ticket_types`
--

INSERT INTO `ticket_types` (`id`, `title`, `deleted`) VALUES
(1, 'General Support', 0);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `user_type` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `is_admin` tinyint(1) NOT NULL DEFAULT '0',
  `role_id` int(11) NOT NULL DEFAULT '0',
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` text COLLATE utf8_unicode_ci,
  `status` enum('active','inactive') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'active',
  `message_checked_at` datetime DEFAULT NULL,
  `client_id` int(11) NOT NULL DEFAULT '0',
  `notification_checked_at` datetime DEFAULT NULL,
  `is_primary_contact` tinyint(1) NOT NULL DEFAULT '0',
  `job_title` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Untitled',
  `disable_login` tinyint(1) NOT NULL DEFAULT '0',
  `note` mediumtext COLLATE utf8_unicode_ci,
  `address` text COLLATE utf8_unicode_ci,
  `alternative_address` text COLLATE utf8_unicode_ci,
  `phone` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `alternative_phone` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `ssn` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gender` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `sticky_note` mediumtext COLLATE utf8_unicode_ci,
  `skype` text COLLATE utf8_unicode_ci,
  `enable_web_notification` tinyint(1) NOT NULL DEFAULT '1',
  `enable_email_notification` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted` int(1) NOT NULL DEFAULT '0',
  `last_logged_in` datetime NOT NULL,
  `username` text COLLATE utf8_unicode_ci NOT NULL,
  `managername` text COLLATE utf8_unicode_ci NOT NULL,
  `password_text` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_type` (`user_type`),
  KEY `email` (`email`),
  KEY `client_id` (`client_id`),
  KEY `deleted` (`deleted`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=40 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `user_type`, `is_admin`, `role_id`, `email`, `password`, `image`, `status`, `message_checked_at`, `client_id`, `notification_checked_at`, `is_primary_contact`, `job_title`, `disable_login`, `note`, `address`, `alternative_address`, `phone`, `alternative_phone`, `dob`, `ssn`, `gender`, `sticky_note`, `skype`, `enable_web_notification`, `enable_email_notification`, `created_at`, `updated_at`, `deleted`, `last_logged_in`, `username`, `managername`, `password_text`) VALUES
(1, 'Wayne', 'Lazarus', 'staff', 1, 0, 'wayne@themagicmill.com', 'e26f49b83e98d6ae0a4514ef7650d8fe', '_file5badb2ccb5b18-avatar.png', 'active', '2019-06-17 00:00:00', 0, '2018-07-22 15:41:48', 0, 'Admin', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, 1, '2018-01-23 16:50:13', NULL, 0, '2019-04-18 16:06:02', 'admin', '', 'MoSalahisnotthatgreatok'),
(2, 'Karlind ', 'Govender', 'staff', 1, 0, 'karlind@themagicmill.com', '2b2fffac636f409f1f2e5ac9227268a5', '_file5ba3203a4bcc9-avatar.png', 'active', '2019-06-17 00:00:00', 0, '0000-00-00 00:00:00', 0, 'admin', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, 1, '2018-07-25 17:59:43', NULL, 0, '2019-05-27 11:01:42', 'admin', '', 'ManUnitedMuhammedAli'),
(3, 'Karlind', 'Govender', 'staff', 0, 1, 'karlind@themagicmill.com', 'e10adc3949ba59abbe56e057f20f883e', '_file5b5976e82a1d5-avatar.png', 'active', '2019-06-17 00:00:00', 0, '0000-00-00 00:00:00', 0, 'WS_123', 0, NULL, NULL, NULL, NULL, NULL, '0000-00-00', NULL, 'male', NULL, NULL, 1, 1, '2018-07-26 07:19:09', NULL, 1, '2018-10-24 06:43:39', 'WS_123', '', '123456'),
(4, 'imran', 'khan', 'staff', 0, 1, 'imk@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', '_file5ba32a1f02f34-avatar.png', 'active', '2019-06-17 00:00:00', 0, '0000-00-00 00:00:00', 0, '101', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, 1, '2018-07-29 11:14:30', NULL, 1, '0000-00-00 00:00:00', '101', '', '123456'),
(5, 'Wayne', 'Lazarus', 'staff', 1, 0, 'wayne@themagicmill.com', '5a4e69f466bfe40611d44951ae4b44b1', '_file5b96ce18d5fdc-avatar.png', 'active', '2019-06-17 00:00:00', 0, '0000-00-00 00:00:00', 0, 'WayneLaz!*', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, 1, '2018-07-31 15:35:17', NULL, 0, '0000-00-00 00:00:00', 'WayneLaz!*', '', '123456'),
(6, 'test', 'test', 'staff', 0, 1, 'tse@test.tes', 'e10adc3949ba59abbe56e057f20f883e', '_file5b710b696e243-avatar.png', 'active', '2019-06-17 00:00:00', 0, '0000-00-00 00:00:00', 0, 'test', 0, NULL, NULL, NULL, NULL, NULL, '0000-00-00', NULL, 'male', NULL, NULL, 1, 1, '2018-08-13 04:38:10', NULL, 1, '0000-00-00 00:00:00', 'test', '', ''),
(7, 'Mo', 'Salah', 'staff', 0, 1, 'Waynel@nandos.com', 'e10adc3949ba59abbe56e057f20f883e', '_file5bb9023377f81-avatar.png', 'active', '2019-06-17 00:00:00', 0, '0000-00-00 00:00:00', 0, 'WayneLaz1*', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, 1, '2018-09-05 16:16:27', NULL, 0, '0000-00-00 00:00:00', 'WayneLaz1*', '', '123456'),
(8, 'imk', 'khan', 'staff', 0, 1, 'imk213@gmail.com', '55587a910882016321201e6ebbc9f595', '_file5ba1df2dd2c56-avatar.png', 'active', '2019-06-17 00:00:00', 0, '0000-00-00 00:00:00', 0, 'imk213', 0, NULL, NULL, NULL, NULL, NULL, '0000-00-00', NULL, 'male', NULL, NULL, 1, 1, '2018-09-10 06:45:05', NULL, 1, '0000-00-00 00:00:00', 'imk213', '', '123789'),
(9, 'Test ', 'Worker', 'staff', 0, 1, 'test@testworker.com', '42830de4cf88f63438ef58e106f4a9af', NULL, 'active', '2019-06-17 00:00:00', 0, '0000-00-00 00:00:00', 0, 'Testworker123', 0, NULL, NULL, NULL, NULL, NULL, '0000-00-00', NULL, 'male', NULL, NULL, 1, 1, '2018-09-11 05:51:54', NULL, 1, '0000-00-00 00:00:00', 'Testworker123', '', ''),
(10, 'Mzwandile', 'Mkhize', 'staff', 0, 1, 'testmz@mz.com', 'e10adc3949ba59abbe56e057f20f883e', '_file5b977fd80b0ac-avatar.png', 'active', '2019-06-17 00:00:00', 0, '0000-00-00 00:00:00', 0, 'MZ123', 0, NULL, NULL, NULL, NULL, NULL, '0000-00-00', NULL, 'male', NULL, NULL, 1, 1, '2018-09-11 08:40:44', NULL, 1, '0000-00-00 00:00:00', 'MZ123', '', '123456'),
(11, 'Test', 'pic', 'staff', 0, 1, 'testpic@testpic.com', 'e10adc3949ba59abbe56e057f20f883e', NULL, 'active', '2019-06-17 00:00:00', 0, '0000-00-00 00:00:00', 0, '12345', 0, NULL, NULL, NULL, NULL, NULL, '0000-00-00', NULL, 'male', NULL, NULL, 1, 1, '2018-09-13 10:53:27', NULL, 1, '0000-00-00 00:00:00', '12345', '', '123456'),
(12, 'test', 'user', 'staff', 0, 1, 'test@rew.sdsd', 'e10adc3949ba59abbe56e057f20f883e', '_file5ba289ce48360-avatar.png', 'active', '2019-06-17 00:00:00', 0, '0000-00-00 00:00:00', 0, 'testuser', 0, NULL, NULL, NULL, NULL, NULL, '0000-00-00', NULL, 'male', NULL, NULL, 1, 1, '2018-09-19 17:36:37', NULL, 1, '0000-00-00 00:00:00', 'testuser', '', '123456'),
(13, 'nadeem', 'sheikh', 'staff', 0, 1, 'nadee.m@sheikh.haq', 'e10adc3949ba59abbe56e057f20f883e', '_file5ba32af74e134-avatar.png', 'active', '2019-06-17 00:00:00', 0, '0000-00-00 00:00:00', 0, 'nadeem', 0, NULL, NULL, NULL, NULL, NULL, '0000-00-00', NULL, 'male', NULL, NULL, 1, 1, '2018-09-20 05:04:58', NULL, 1, '0000-00-00 00:00:00', 'nadeem', '', '123456'),
(14, 'juned', 'ali ali', 'staff', 0, 1, 'juni.ali@nadeem.sheikh', '25f9e794323b453885f5181f1b624d0b', '_file5bad9d0020e13-avatar.png', 'active', '2019-06-17 00:00:00', 0, '0000-00-00 00:00:00', 0, 'junia', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, 1, '2018-09-22 03:29:09', NULL, 1, '0000-00-00 00:00:00', 'junia', '', '123456789'),
(15, 'sadio', 'mane', 'staff', 0, 1, 'sadio@themagicmill.com', '5a4e69f466bfe40611d44951ae4b44b1', NULL, 'active', '2019-06-17 00:00:00', 0, '0000-00-00 00:00:00', 0, 'sadio1', 0, NULL, NULL, NULL, NULL, NULL, '0000-00-00', NULL, 'male', NULL, NULL, 1, 1, '2018-09-24 11:01:37', NULL, 1, '0000-00-00 00:00:00', 'sadio1', '', 'WayneLaz1*'),
(16, 'rahul', 'gupta', 'staff', 0, 1, 'rahul@gmail.com', '7b7f71bff78951c020e9c647a32bb839', '_file5ba8d685f1c2d-avatar.png', 'active', '2019-06-17 00:00:00', 0, '0000-00-00 00:00:00', 0, 'rahul_123', 0, NULL, NULL, NULL, NULL, NULL, '0000-00-00', NULL, 'male', NULL, NULL, 1, 1, '2018-09-24 12:19:58', NULL, 1, '0000-00-00 00:00:00', 'rahul_123', '', 'Rahul@123'),
(17, 'Karlind 2', 'Test 2', 'staff', 1, 0, 'katharina@themagicmill.com', '84d8206c46b6f13e4e017ff470572a88', NULL, 'active', '2019-06-17 00:00:00', 0, '0000-00-00 00:00:00', 0, '1234X', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, 1, '2018-09-27 14:54:33', NULL, 0, '2018-10-19 12:41:14', '1234X', '', ')863kNMK'),
(18, 'imran', 'khan', 'staff', 1, 0, 'imkhan213@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', NULL, 'active', '2019-06-17 00:00:00', 0, '0000-00-00 00:00:00', 0, 'imk', 0, NULL, NULL, NULL, NULL, NULL, '0000-00-00', NULL, 'male', NULL, NULL, 1, 1, '2018-10-12 05:55:55', NULL, 0, '2018-10-12 07:56:53', 'imk', '', '123456'),
(19, 'Client ', 'Test ', 'staff', 1, 0, 'clienttest@cirms.xyz', 'dd5dd1bd4387f4c92f2450d20c8cb5d5', NULL, 'active', '2019-06-17 00:00:00', 0, '0000-00-00 00:00:00', 0, 'Admin', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, 1, '0000-00-00 00:00:00', NULL, 0, '2019-05-28 15:04:08', 'admin2', '', 'Xsd123x*'),
(20, 'dev', 'nad', 'staff', 1, 0, 'dev@dev.dev', 'e10adc3949ba59abbe56e057f20f883e', NULL, 'active', '2019-06-17 00:00:00', 0, '0000-00-00 00:00:00', 0, 'dev', 0, NULL, NULL, NULL, NULL, NULL, '0000-00-00', NULL, 'male', NULL, NULL, 1, 1, '2018-10-28 06:24:53', NULL, 0, '2019-01-17 18:56:51', 'dev', '', '123456'),
(21, 'imk', 'test', 'staff', 1, 0, 'imktest@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', NULL, 'active', '2019-06-17 00:00:00', 0, '0000-00-00 00:00:00', 0, 'hjk', 0, NULL, NULL, NULL, NULL, NULL, '0000-00-00', NULL, 'male', NULL, NULL, 1, 1, '2018-11-01 11:47:47', NULL, 0, '0000-00-00 00:00:00', 'hjk', '', '123456'),
(22, 'Bobo', 'Thwane', 'staff', 1, 0, 'thwaneb@yahoo.co.uk', 'fe52229afbfb301aacdc611b958a749d', NULL, 'active', '2019-06-17 00:00:00', 0, '0000-00-00 00:00:00', 0, 'Bobo123', 0, NULL, NULL, NULL, NULL, NULL, '0000-00-00', NULL, 'male', NULL, NULL, 1, 1, '2018-11-19 17:54:25', NULL, 0, '0000-00-00 00:00:00', 'Bobo123', '', 'Xc)wf1!p'),
(23, 'Durban', 'Plumbers', 'staff', 0, 1, 'dbnplumbers@gmail.com', '094a2940df421236de0dd9f9070ff642', '_file5bfe3bf841f9a-avatar.png', 'active', '2019-06-17 00:00:00', 0, '0000-00-00 00:00:00', 0, 'DbnPlumbersTrial123', 0, NULL, NULL, NULL, NULL, NULL, '0000-00-00', NULL, 'male', NULL, NULL, 1, 1, '2018-11-28 06:12:33', NULL, 0, '0000-00-00 00:00:00', 'DbnPlumbersTrial123', '', 'qRjmQX(a'),
(24, 'DBNPlumbers', 'Admin', 'staff', 1, 0, 'dbnplumbers@cirms.xyz', '4bb4988cb231fabd252baf1f482248e7', NULL, 'active', '2019-06-17 00:00:00', 0, '0000-00-00 00:00:00', 0, 'DbnPlTrial123', 0, NULL, NULL, NULL, NULL, NULL, '0000-00-00', NULL, 'male', NULL, NULL, 1, 1, '2018-11-28 06:16:29', NULL, 0, '0000-00-00 00:00:00', 'DbnPlTrial123', '', '7bhviD)f'),
(25, 'Mario', 'Carelse', 'staff', 0, 1, 'mario.carelse@capetown.gov.za', 'cc03e747a6afbbcbf8be7668acfebee5', NULL, 'active', '2019-06-17 00:00:00', 0, '0000-00-00 00:00:00', 0, '123', 0, NULL, NULL, NULL, NULL, NULL, '0000-00-00', NULL, 'male', NULL, NULL, 1, 1, '2018-11-30 09:49:43', NULL, 0, '0000-00-00 00:00:00', '123', '', 'test123'),
(26, 'Test ', 'Seattle', 'staff', 0, 1, 'test@themagicmill.com', '99190b0a00913ef28900a6a268ca4e6f', '_file5c0bb3cb07fe6-avatar.png', 'active', '2019-06-17 00:00:00', 0, '0000-00-00 00:00:00', 0, 'BonMGov123', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, 1, '2018-12-08 12:05:15', NULL, 0, '0000-00-00 00:00:00', 'BonMGov123', '', 'VaeM5Ook'),
(27, 'Nivesh', 'hariram', 'staff', 0, 1, 'hariramnivesh@gmail.com', '3824325ff03adbef258a00c820c4cb6c', NULL, 'active', '2019-06-17 00:00:00', 0, '0000-00-00 00:00:00', 0, 'Omesh2012', 0, NULL, NULL, NULL, NULL, NULL, '0000-00-00', NULL, 'male', NULL, NULL, 1, 1, '2019-01-11 11:46:27', NULL, 1, '0000-00-00 00:00:00', 'Omesh2012', '', 'Omesh2012'),
(28, 'Nivesh', 'Hariram', 'staff', 0, 1, 'hariramnivesh@gmail.com', '3824325ff03adbef258a00c820c4cb6c', 'profile-1560930409.jpg', 'active', '2019-06-17 00:00:00', 0, '0000-00-00 00:00:00', 0, 'NH001', 0, NULL, NULL, NULL, NULL, NULL, '0000-00-00', NULL, 'male', NULL, NULL, 1, 1, '2019-01-11 12:05:48', NULL, 0, '2019-01-14 17:04:27', 'NH001', '', 'Omesh2012'),
(29, 'Kelly', 'Zulu', 'staff', 0, 1, 'kellyzulu@magebamg.co.za', '043962edbb19aa71826753d627fa388a', 'profile-1561204387.jpg', 'active', '2019-06-17 00:00:00', 0, '0000-00-00 00:00:00', 0, 'Kelly1', 0, NULL, NULL, NULL, NULL, NULL, '1985-01-01', NULL, 'male', NULL, NULL, 1, 1, '2019-02-27 16:09:06', NULL, 0, '0000-00-00 00:00:00', 'Kelly1', '', 'kelly2'),
(30, 'Courtney', 'Edwards', 'staff', 0, 1, 'rclcedarhigh@gmail.com', '2c234c42c9165e685c5e5e534b7dbb88', '_file5ca10afa345a1-avatar.png', 'active', '2019-06-17 00:00:00', 0, '0000-00-00 00:00:00', 0, '1234', 0, NULL, NULL, NULL, NULL, NULL, '0000-00-00', NULL, 'male', NULL, NULL, 1, 1, '2019-03-31 18:43:24', NULL, 1, '0000-00-00 00:00:00', '1234', '', 'N0Gejdh6'),
(31, 'Kyle', 'Wilson', 'staff', 0, 1, 'kylejwilson@live.co.za', 'abd7372bba55577590736ef6cb3533c6', NULL, 'active', '2019-06-17 00:00:00', 0, '0000-00-00 00:00:00', 0, 'Milky', 0, NULL, NULL, NULL, NULL, NULL, '0000-00-00', NULL, 'male', NULL, NULL, 1, 1, '2019-04-05 14:36:54', NULL, 0, '0000-00-00 00:00:00', 'Milky', '', 'wilson'),
(32, 'kyle', 'wilson', 'staff', 0, 1, 'milkstout09@gmail.com', 'abd7372bba55577590736ef6cb3533c6', NULL, 'active', '2019-06-17 00:00:00', 0, '0000-00-00 00:00:00', 0, 'milky1', 0, NULL, NULL, NULL, NULL, NULL, '0000-00-00', NULL, 'male', NULL, NULL, 1, 1, '2019-04-05 14:39:41', NULL, 0, '0000-00-00 00:00:00', 'milky1', '', 'wilson'),
(33, 'Desi', 'Moodley', 'staff', 0, 1, 'desiganmoodley@gmail.com', 'b8e4967a801abc4fbb1cd3c936c020bd', NULL, 'active', '2019-06-17 00:00:00', 0, '0000-00-00 00:00:00', 0, 'Desi1', 0, NULL, NULL, NULL, NULL, NULL, '0000-00-00', NULL, 'male', NULL, NULL, 1, 1, '2019-04-26 19:50:03', NULL, 0, '0000-00-00 00:00:00', 'Desi1', '', 'Amara123'),
(34, 'Ashley', 'Govender', 'staff', 0, 1, 'agovender27@gmail.com', '39fc856a472559ac2891e76df823a805', NULL, 'active', '2019-06-17 00:00:00', 0, '0000-00-00 00:00:00', 0, 'Ash123', 0, NULL, NULL, NULL, NULL, NULL, '0000-00-00', NULL, 'male', NULL, NULL, 1, 1, '2019-05-02 09:54:00', NULL, 0, '0000-00-00 00:00:00', 'Ash123', '', 'Govender27'),
(35, 'salman', 'ahmed', 'staff', 0, 1, 'ahmedkamran265@gmail.com', '03346657feea0490a4d4f677faa0583d', NULL, 'active', '2019-06-17 00:00:00', 0, '0000-00-00 00:00:00', 0, 'salman01', 0, NULL, NULL, NULL, NULL, NULL, '0000-00-00', NULL, 'male', NULL, NULL, 1, 1, '2019-06-16 07:38:23', NULL, 0, '0000-00-00 00:00:00', 'salman01', '', 'salman'),
(36, 'salman', 'ahmed', 'staff', 0, 0, 'salmddan@gamil.com', NULL, NULL, 'active', NULL, 0, NULL, 0, 'Untitled', 0, NULL, NULL, NULL, NULL, NULL, '2019-06-11', NULL, 'male', NULL, NULL, 1, 1, NULL, NULL, 0, '2019-06-11 00:00:00', 'Untitled', 'admin', 'salman123456'),
(37, 'salman', 'ahmed', 'staff', 0, 0, 'salmddasdfsdn@gamil.com', NULL, NULL, 'active', NULL, 0, NULL, 0, 'Untitled', 0, NULL, NULL, NULL, NULL, NULL, '2019-06-11', NULL, 'male', NULL, NULL, 1, 1, NULL, NULL, 0, '2019-06-18 11:19:34', 'Untitled', 'admin', 'salman123456'),
(38, 'probal', 'roy', 'staff', 0, 0, 'probal@gamil.com', NULL, NULL, 'active', NULL, 0, NULL, 0, 'Untitled', 0, NULL, NULL, NULL, NULL, NULL, '2019-06-11', NULL, 'male', NULL, NULL, 1, 1, NULL, NULL, 0, '2019-06-18 11:27:48', 'prabal', 'admin', '123456'),
(39, 'Prabal', 'Bhattacharjee', 'General Public', 0, 0, 'prabal230193@gmail.com', NULL, 'profile-1561366368.jpg', 'active', NULL, 0, NULL, 0, 'Untitled', 0, NULL, NULL, NULL, NULL, NULL, '1993-07-23', NULL, 'male', NULL, NULL, 1, 1, NULL, NULL, 0, '2019-06-24 05:53:25', 'Untitled', 'admin', '123456');

-- --------------------------------------------------------

--
-- Table structure for table `wsphotos`
--

CREATE TABLE IF NOT EXISTS `wsphotos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `report_id` int(11) NOT NULL,
  `photo` text,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=117 ;

--
-- Dumping data for table `wsphotos`
--

INSERT INTO `wsphotos` (`id`, `report_id`, `photo`, `created_at`, `updated_at`) VALUES
(1, 1, 'upload/1_1_name1.jpg', NULL, NULL),
(2, 1, 'upload/1_0_name1.jpg', NULL, NULL),
(3, 2, 'upload/2_1_name1.jpg', NULL, NULL),
(4, 3, 'upload/3_1_name1.jpg', NULL, NULL),
(5, 3, 'upload/3_0_name1.jpg', NULL, NULL),
(6, 3, 'upload/3_4_name1.jpg', NULL, NULL),
(7, 3, 'upload/3_3_name1.jpg', NULL, NULL),
(8, 3, 'upload/3_2_name1.jpg', NULL, NULL),
(9, 4, 'upload/4_0_name1.jpg', NULL, NULL),
(10, 4, 'upload/4_2_name1.jpg', NULL, NULL),
(11, 4, 'upload/4_1_name1.jpg', NULL, NULL),
(12, 5, 'upload/5_0_name1.jpg', NULL, NULL),
(13, 5, 'upload/5_1_name1.jpg', NULL, NULL),
(14, 5, 'upload/5_2_name1.jpg', NULL, NULL),
(15, 5, 'upload/5_4_name1.jpg', NULL, NULL),
(16, 5, 'upload/5_3_name1.jpg', NULL, NULL),
(17, 6, 'upload/6_0_name1.jpg', NULL, NULL),
(18, 6, 'upload/6_1_name1.jpg', NULL, NULL),
(19, 7, 'upload/7_0_name1.jpg', NULL, NULL),
(20, 7, 'upload/7_1_name1.jpg', NULL, NULL),
(21, 8, 'upload/8_2_name1.jpg', NULL, NULL),
(22, 8, 'upload/8_1_name1.jpg', NULL, NULL),
(23, 8, 'upload/8_0_name1.jpg', NULL, NULL),
(24, 9, 'upload/9_0_name1.jpg', NULL, NULL),
(25, 9, 'upload/9_2_name1.jpg', NULL, NULL),
(26, 9, 'upload/9_1_name1.jpg', NULL, NULL),
(27, 10, 'upload/10_1_name1.jpg', NULL, NULL),
(28, 10, 'upload/10_0_name1.jpg', NULL, NULL),
(29, 11, 'upload/11_1_name1.jpg', NULL, NULL),
(30, 11, 'upload/11_3_name1.jpg', NULL, NULL),
(31, 11, 'upload/11_4_name1.jpg', NULL, NULL),
(32, 12, 'upload/12_1_name1.jpg', NULL, NULL),
(33, 12, 'upload/12_3_name1.jpg', NULL, NULL),
(34, 12, 'upload/12_4_name1.jpg', NULL, NULL),
(35, 12, 'upload/12_2_name1.jpg', NULL, NULL),
(36, 12, 'upload/12_0_name1.jpg', NULL, NULL),
(37, 13, 'upload/13_2_name1.jpg', NULL, NULL),
(38, 13, 'upload/13_0_name1.jpg', NULL, NULL),
(39, 13, 'upload/13_1_name1.jpg', NULL, NULL),
(40, 14, 'upload/14_3_name1.jpg', NULL, NULL),
(41, 14, 'upload/14_1_name1.jpg', NULL, NULL),
(42, 14, 'upload/14_0_name1.jpg', NULL, NULL),
(43, 14, 'upload/14_2_name1.jpg', NULL, NULL),
(44, 15, 'upload/15_0_name1.jpg', NULL, NULL),
(45, 15, 'upload/15_1_name1.jpg', NULL, NULL),
(46, 16, 'upload/16_0_name1.jpg', NULL, NULL),
(47, 17, 'upload/17_0_name1.jpg', NULL, NULL),
(48, 17, 'upload/17_1_name1.jpg', NULL, NULL),
(49, 18, 'upload/18_0_name1.jpg', NULL, NULL),
(50, 18, 'upload/18_1_name1.jpg', NULL, NULL),
(51, 19, 'upload/19_0_name1.jpg', NULL, NULL),
(52, 20, 'upload/20_0_name1.jpg', NULL, NULL),
(53, 21, 'upload/21_0_name1.jpg', NULL, NULL),
(54, 22, 'upload/22_0_name1.jpg', NULL, NULL),
(55, 23, 'upload/23_0_name1.jpg', NULL, NULL),
(56, 25, 'upload/25_0_name1.jpg', NULL, NULL),
(57, 26, 'upload/26_0_name1.jpg', NULL, NULL),
(58, 27, 'upload/27_0_name1.jpg', NULL, NULL),
(59, 28, 'upload/28_0_name1.jpg', NULL, NULL),
(60, 29, 'upload/29_0_name1.jpg', NULL, NULL),
(61, 30, 'upload/30_0_name1.jpg', NULL, NULL),
(62, 31, 'upload/31_0_name1.jpg', NULL, NULL),
(63, 33, 'upload/33_0_name1.jpg', NULL, NULL),
(64, 34, 'upload/34_0_name1.jpg', NULL, NULL),
(65, 35, 'upload/35_0_name1.jpg', NULL, NULL),
(66, 36, 'upload/36_0_name1.jpg', NULL, NULL),
(67, 37, 'upload/37_0_name1.jpg', NULL, NULL),
(68, 38, 'upload/38_0_name1.jpg', NULL, NULL),
(69, 39, 'upload/39_0_name1.jpg', NULL, NULL),
(70, 40, 'upload/40_0_name1.jpg', NULL, NULL),
(71, 41, 'upload/41_0_name1.jpg', NULL, NULL),
(72, 42, 'upload/42_0_name1.jpg', NULL, NULL),
(73, 43, 'upload/43_0_name1.jpg', NULL, NULL),
(74, 44, 'upload/44_0_name1.jpg', NULL, NULL),
(75, 45, 'upload/45_0_name1.jpg', NULL, NULL),
(76, 46, 'upload/46_0_name1.jpg', NULL, NULL),
(77, 47, 'upload/47_0_name1.jpg', NULL, NULL),
(78, 47, 'upload/47_1_name1.jpg', NULL, NULL),
(79, 48, 'upload/48_0_name1.jpg', NULL, NULL),
(80, 49, 'upload/49_1_name1.jpg', NULL, NULL),
(81, 49, 'upload/49_0_name1.jpg', NULL, NULL),
(82, 51, 'upload/two.png', NULL, NULL),
(83, 51, 'upload/two.png', NULL, NULL),
(84, 51, 'upload/two.png', NULL, NULL),
(85, 51, 'upload/two.png', '2019-06-17 04:09:22', '2019-06-17 04:09:22'),
(86, 51, 'upload/two.png', '2019-06-17 04:09:22', '2019-06-17 04:09:22'),
(87, 51, 'upload/two.png', '2019-06-17 04:09:22', '2019-06-17 04:09:22'),
(88, 35, 'data:image/gif;base64,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', '2019-06-19 02:44:35', '2019-06-19 02:44:35'),
(89, 35, 'data:image/gif;base64,R0lGODlhPQBEAPeoAJosM//AwO/AwHVYZ/z595kzAP/s7P+goOXMv8+fhw/v739/f+8PD98fH/8mJl+fn/9ZWb8/PzWlwv///6wWGbImAPgTEMImIN9gUFCEm/gDALULDN8PAD6atYdCTX9gUNKlj8wZAKUsAOzZz+UMAOsJAP/Z2ccMDA8PD/95eX5NWvsJCOVNQPtfX/8zM8+QePLl38MGBr8JCP+zs9myn/8GBqwpAP/GxgwJCPny78lzYLgjAJ8vAP9fX/+MjMUcAN8zM/9wcM8ZGcATEL+QePdZWf/29uc/P9cmJu9MTDImIN+/r7+/vz8/P8VNQGNugV8AAF9fX8swMNgTAFlDOICAgPNSUnNWSMQ5MBAQEJE3QPIGAM9AQMqGcG9vb6MhJsEdGM8vLx8fH98AANIWAMuQeL8fABkTEPPQ0OM5OSYdGFl5jo+Pj/+pqcsTE78wMFNGQLYmID4dGPvd3UBAQJmTkP+8vH9QUK+vr8ZWSHpzcJMmILdwcLOGcHRQUHxwcK9PT9DQ0O/v70w5MLypoG8wKOuwsP/g4P/Q0IcwKEswKMl8aJ9fX2xjdOtGRs/Pz+Dg4GImIP8gIH0sKEAwKKmTiKZ8aB/f39Wsl+LFt8dgUE9PT5x5aHBwcP+AgP+WltdgYMyZfyywz78AAAAAAAD///8AAP9mZv///wAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAACH5BAEAAKgALAAAAAA9AEQAAAj/AFEJHEiwoMGDCBMqXMiwocAbBww4nEhxoYkUpzJGrMixogkfGUNqlNixJEIDB0SqHGmyJSojM1bKZOmyop0gM3Oe2liTISKMOoPy7GnwY9CjIYcSRYm0aVKSLmE6nfq05QycVLPuhDrxBlCtYJUqNAq2bNWEBj6ZXRuyxZyDRtqwnXvkhACDV+euTeJm1Ki7A73qNWtFiF+/gA95Gly2CJLDhwEHMOUAAuOpLYDEgBxZ4GRTlC1fDnpkM+fOqD6DDj1aZpITp0dtGCDhr+fVuCu3zlg49ijaokTZTo27uG7Gjn2P+hI8+PDPERoUB318bWbfAJ5sUNFcuGRTYUqV/3ogfXp1rWlMc6awJjiAAd2fm4ogXjz56aypOoIde4OE5u/F9x199dlXnnGiHZWEYbGpsAEA3QXYnHwEFliKAgswgJ8LPeiUXGwedCAKABACCN+EA1pYIIYaFlcDhytd51sGAJbo3onOpajiihlO92KHGaUXGwWjUBChjSPiWJuOO/LYIm4v1tXfE6J4gCSJEZ7YgRYUNrkji9P55sF/ogxw5ZkSqIDaZBV6aSGYq/lGZplndkckZ98xoICbTcIJGQAZcNmdmUc210hs35nCyJ58fgmIKX5RQGOZowxaZwYA+JaoKQwswGijBV4C6SiTUmpphMspJx9unX4KaimjDv9aaXOEBteBqmuuxgEHoLX6Kqx+yXqqBANsgCtit4FWQAEkrNbpq7HSOmtwag5w57GrmlJBASEU18ADjUYb3ADTinIttsgSB1oJFfA63bduimuqKB1keqwUhoCSK374wbujvOSu4QG6UvxBRydcpKsav++Ca6G8A6Pr1x2kVMyHwsVxUALDq/krnrhPSOzXG1lUTIoffqGR7Goi2MAxbv6O2kEG56I7CSlRsEFKFVyovDJoIRTg7sugNRDGqCJzJgcKE0ywc0ELm6KBCCJo8DIPFeCWNGcyqNFE06ToAfV0HBRgxsvLThHn1oddQMrXj5DyAQgjEHSAJMWZwS3HPxT/QMbabI/iBCliMLEJKX2EEkomBAUCxRi42VDADxyTYDVogV+wSChqmKxEKCDAYFDFj4OmwbY7bDGdBhtrnTQYOigeChUmc1K3QTnAUfEgGFgAWt88hKA6aCRIXhxnQ1yg3BCayK44EWdkUQcBByEQChFXfCB776aQsG0BIlQgQgE8qO26X1h8cEUep8ngRBnOy74E9QgRgEAC8SvOfQkh7FDBDmS43PmGoIiKUUEGkMEC/PJHgxw0xH74yx/3XnaYRJgMB8obxQW6kL9QYEJ0FIFgByfIL7/IQAlvQwEpnAC7DtLNJCKUoO/w45c44GwCXiAFB/OXAATQryUxdN4LfFiwgjCNYg+kYMIEFkCKDs6PKAIJouyGWMS1FSKJOMRB/BoIxYJIUXFUxNwoIkEKPAgCBZSQHQ1A2EWDfDEUVLyADj5AChSIQW6gu10bE/JG2VnCZGfo4R4d0sdQoBAHhPjhIB94v/wRoRKQWGRHgrhGSQJxCS+0pCZbEhAAOw==', '2019-06-19 02:44:35', '2019-06-19 02:44:35'),
(90, 35, 'data:image/gif;base64,R0lGODlhPQBEAPeoAJosM//AwO/AwHVYZ/z595kzAP/s7P+goOXMv8+fhw/v739/f+8PD98fH/8mJl+fn/9ZWb8/PzWlwv///6wWGbImAPgTEMImIN9gUFCEm/gDALULDN8PAD6atYdCTX9gUNKlj8wZAKUsAOzZz+UMAOsJAP/Z2ccMDA8PD/95eX5NWvsJCOVNQPtfX/8zM8+QePLl38MGBr8JCP+zs9myn/8GBqwpAP/GxgwJCPny78lzYLgjAJ8vAP9fX/+MjMUcAN8zM/9wcM8ZGcATEL+QePdZWf/29uc/P9cmJu9MTDImIN+/r7+/vz8/P8VNQGNugV8AAF9fX8swMNgTAFlDOICAgPNSUnNWSMQ5MBAQEJE3QPIGAM9AQMqGcG9vb6MhJsEdGM8vLx8fH98AANIWAMuQeL8fABkTEPPQ0OM5OSYdGFl5jo+Pj/+pqcsTE78wMFNGQLYmID4dGPvd3UBAQJmTkP+8vH9QUK+vr8ZWSHpzcJMmILdwcLOGcHRQUHxwcK9PT9DQ0O/v70w5MLypoG8wKOuwsP/g4P/Q0IcwKEswKMl8aJ9fX2xjdOtGRs/Pz+Dg4GImIP8gIH0sKEAwKKmTiKZ8aB/f39Wsl+LFt8dgUE9PT5x5aHBwcP+AgP+WltdgYMyZfyywz78AAAAAAAD///8AAP9mZv///wAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAACH5BAEAAKgALAAAAAA9AEQAAAj/AFEJHEiwoMGDCBMqXMiwocAbBww4nEhxoYkUpzJGrMixogkfGUNqlNixJEIDB0SqHGmyJSojM1bKZOmyop0gM3Oe2liTISKMOoPy7GnwY9CjIYcSRYm0aVKSLmE6nfq05QycVLPuhDrxBlCtYJUqNAq2bNWEBj6ZXRuyxZyDRtqwnXvkhACDV+euTeJm1Ki7A73qNWtFiF+/gA95Gly2CJLDhwEHMOUAAuOpLYDEgBxZ4GRTlC1fDnpkM+fOqD6DDj1aZpITp0dtGCDhr+fVuCu3zlg49ijaokTZTo27uG7Gjn2P+hI8+PDPERoUB318bWbfAJ5sUNFcuGRTYUqV/3ogfXp1rWlMc6awJjiAAd2fm4ogXjz56aypOoIde4OE5u/F9x199dlXnnGiHZWEYbGpsAEA3QXYnHwEFliKAgswgJ8LPeiUXGwedCAKABACCN+EA1pYIIYaFlcDhytd51sGAJbo3onOpajiihlO92KHGaUXGwWjUBChjSPiWJuOO/LYIm4v1tXfE6J4gCSJEZ7YgRYUNrkji9P55sF/ogxw5ZkSqIDaZBV6aSGYq/lGZplndkckZ98xoICbTcIJGQAZcNmdmUc210hs35nCyJ58fgmIKX5RQGOZowxaZwYA+JaoKQwswGijBV4C6SiTUmpphMspJx9unX4KaimjDv9aaXOEBteBqmuuxgEHoLX6Kqx+yXqqBANsgCtit4FWQAEkrNbpq7HSOmtwag5w57GrmlJBASEU18ADjUYb3ADTinIttsgSB1oJFfA63bduimuqKB1keqwUhoCSK374wbujvOSu4QG6UvxBRydcpKsav++Ca6G8A6Pr1x2kVMyHwsVxUALDq/krnrhPSOzXG1lUTIoffqGR7Goi2MAxbv6O2kEG56I7CSlRsEFKFVyovDJoIRTg7sugNRDGqCJzJgcKE0ywc0ELm6KBCCJo8DIPFeCWNGcyqNFE06ToAfV0HBRgxsvLThHn1oddQMrXj5DyAQgjEHSAJMWZwS3HPxT/QMbabI/iBCliMLEJKX2EEkomBAUCxRi42VDADxyTYDVogV+wSChqmKxEKCDAYFDFj4OmwbY7bDGdBhtrnTQYOigeChUmc1K3QTnAUfEgGFgAWt88hKA6aCRIXhxnQ1yg3BCayK44EWdkUQcBByEQChFXfCB776aQsG0BIlQgQgE8qO26X1h8cEUep8ngRBnOy74E9QgRgEAC8SvOfQkh7FDBDmS43PmGoIiKUUEGkMEC/PJHgxw0xH74yx/3XnaYRJgMB8obxQW6kL9QYEJ0FIFgByfIL7/IQAlvQwEpnAC7DtLNJCKUoO/w45c44GwCXiAFB/OXAATQryUxdN4LfFiwgjCNYg+kYMIEFkCKDs6PKAIJouyGWMS1FSKJOMRB/BoIxYJIUXFUxNwoIkEKPAgCBZSQHQ1A2EWDfDEUVLyADj5AChSIQW6gu10bE/JG2VnCZGfo4R4d0sdQoBAHhPjhIB94v/wRoRKQWGRHgrhGSQJxCS+0pCZbEhAAOw==', '2019-06-19 02:44:35', '2019-06-19 02:44:35'),
(91, 35, 'profile-1560933970.jpg', '2019-06-19 02:46:10', '2019-06-19 02:46:10'),
(92, 35, 'profile-1560933970.jpg', '2019-06-19 02:46:10', '2019-06-19 02:46:10'),
(93, 35, 'profile-1560933970.jpg', '2019-06-19 02:46:10', '2019-06-19 02:46:10'),
(94, 1, 'someimage.png', '2019-06-22 05:16:48', '2019-06-22 05:16:48'),
(95, 1, 'someimage.png', '2019-06-22 05:18:02', '2019-06-22 05:18:02'),
(96, 1, 'someimage.png', '2019-06-22 05:20:31', '2019-06-22 05:20:31'),
(97, 1, 'someimage.png', '2019-06-22 05:21:50', '2019-06-22 05:21:50'),
(98, 1, 'someimage.png', '2019-06-22 05:22:30', '2019-06-22 05:22:30'),
(99, 79, 'profile-1561205332.jpg', '2019-06-22 06:08:52', '2019-06-22 06:08:52'),
(100, 79, 'profile-1561205332.jpg', '2019-06-22 06:08:52', '2019-06-22 06:08:52'),
(101, 85, 'profile-1561205634.jpg', '2019-06-22 06:13:54', '2019-06-22 06:13:54'),
(102, 85, 'profile-1561205634.jpg', '2019-06-22 06:13:54', '2019-06-22 06:13:54'),
(103, 86, 'profile-1561205661.jpg', '2019-06-22 06:14:21', '2019-06-22 06:14:21'),
(104, 86, 'profile-1561205662.jpg', '2019-06-22 06:14:23', '2019-06-22 06:14:23'),
(105, 87, 'profile-1561205753.jpg', '2019-06-22 06:15:53', '2019-06-22 06:15:53'),
(106, 87, 'profile-1561205753.jpg', '2019-06-22 06:15:53', '2019-06-22 06:15:53'),
(107, 88, 'profile-1561205793.jpg', '2019-06-22 06:16:33', '2019-06-22 06:16:33'),
(108, 88, 'profile-1561205793.jpg', '2019-06-22 06:16:33', '2019-06-22 06:16:33'),
(109, 89, 'profile-1561208626.jpg', '2019-06-22 07:03:46', '2019-06-22 07:03:46'),
(110, 89, 'profile-1561208626.jpg', '2019-06-22 07:03:46', '2019-06-22 07:03:46'),
(111, 90, 'profile-1561356904.jpg', '2019-06-24 00:15:04', '2019-06-24 00:15:04'),
(112, 90, 'profile-1561356904.jpg', '2019-06-24 00:15:04', '2019-06-24 00:15:04'),
(113, 91, 'profile-1561391579.jpg', '2019-06-24 09:52:59', '2019-06-24 09:52:59'),
(114, 91, 'profile-1561391579.jpg', '2019-06-24 09:52:59', '2019-06-24 09:52:59'),
(115, 92, 'profile-1561394186.jpg', '2019-06-24 10:36:26', '2019-06-24 10:36:26'),
(116, 92, 'profile-1561394186.jpg', '2019-06-24 10:36:26', '2019-06-24 10:36:26');

-- --------------------------------------------------------

--
-- Table structure for table `wsreports`
--

CREATE TABLE IF NOT EXISTS `wsreports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `manager_name` text NOT NULL,
  `reporting_person` int(11) NOT NULL,
  `work_code` text NOT NULL,
  `lat` varchar(250) NOT NULL,
  `longi` varchar(250) NOT NULL,
  `address` text NOT NULL,
  `situation` text NOT NULL,
  `report_date` datetime NOT NULL,
  `problem_id` text NOT NULL,
  `notes` text NOT NULL,
  `admin_notes` text NOT NULL,
  `admin_situation` text NOT NULL,
  `status` int(11) NOT NULL,
  `show_status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=93 ;

--
-- Dumping data for table `wsreports`
--

INSERT INTO `wsreports` (`id`, `manager_name`, `reporting_person`, `work_code`, `lat`, `longi`, `address`, `situation`, `report_date`, `problem_id`, `notes`, `admin_notes`, `admin_situation`, `status`, `show_status`, `created_at`, `updated_at`) VALUES
(1, 'admin', 23, 'DbnPlumbersTrial123', '-29.907315', '30.9006673', 'Dbn', 'red', '2018-11-28 09:25:12', 'Vandalism   \n						', 'Stolen pipe ', '', 'yellow', 0, 1, NULL, NULL),
(2, 'admin', 3, 'WS_123', '-33.9688599', '18.5965382', 'test', 'yellow', '2018-11-28 10:50:25', 'Other   \n						', 'ajjsjndbx', '', '', 0, 1, NULL, NULL),
(3, 'admin', 6, 'test', '24.5866554', '73.6970164', 'Tedt imran', 'green', '2018-11-28 11:17:05', 'Stolen Pipe   \n						', 'Test description', '', '', 0, 1, NULL, NULL),
(4, 'admin', 3, 'WS_123', '-33.9906478', '18.4729877', 'Test', 'orange', '2018-11-28 12:55:57', 'Geyser Leak   \n						', 'jsnjdbdbsdhd', '', '', 0, 1, NULL, NULL),
(5, 'admin', 23, 'DbnPlumbersTrial123', '-29.889929', '30.9211268', 'Umlazi DSW', 'red', '2018-11-28 15:56:56', 'Burst Pipe   \n						', 'Exposed and located burst pipe. Repaired using 1x 22mm coupler and ring and nut. Connected up,  tested and backfilled on completion. ', 'it''s actually yellow', 'yellow', 0, 0, NULL, NULL),
(6, 'admin', 23, 'DbnPlumbersTrial123', '-29.889929', '30.9211268', 'Kwamnyandu sizakala', 'green', '2018-11-28 16:05:55', 'Inspection   \n						', 'Inspected male and female toilets,  need to replace paraplegic cisterns with standard. ', 'Situation is confirmed to be yellow and not green', 'yellow', 0, 0, NULL, NULL),
(7, 'admin', 3, 'WS_123', '-33.8941705', '18.5095986', 'test', 'green', '2018-11-28 20:30:44', 'Geyser Leak   \n						', 'hjkknv', '', '', 0, 1, NULL, NULL),
(8, 'admin', 6, 'test', '24.593837', '73.6670701', 'Test', 'orange', '2018-11-29 08:22:19', 'Geyser Leak   \n						', 'Chhff', '', '', 0, 1, NULL, NULL),
(9, 'admin', 6, 'test', '24.589317', '73.6653952', 'Tesst', 'red', '2018-11-29 08:34:30', 'Element Replacement   \n						', 'Jfjfhgjgug', '', '', 0, 1, NULL, NULL),
(10, 'admin', 6, 'test', '24.593837', '73.6670701', 'Vdbddh', 'yellow', '2018-11-29 08:36:08', 'Leak Type 1   \n						', 'hdhfh', '', '', 0, 1, NULL, NULL),
(11, 'admin', 23, 'DbnPlumbersTrial123', '-29.9143966', '30.9896136', 'Clairwood metro police ', 'orange', '2018-11-29 08:55:55', 'Burst Pipe   \n						', 'Repaired u/g burst pipe . Used 2 x 15mm conex couplers and 1m polycop pipe. ', '', '', 0, 0, NULL, NULL),
(12, 'admin', 23, 'DbnPlumbersTrial123', '-30.0578141', '30.8760061', 'Toti library ', 'orange', '2018-11-29 12:57:55', 'Stolen Pipe   \n						', 'Removed damaged basin and taps and replaced with new. Replaced stolen pipes with speedfit pipe and fittings. Used 1x new basin, tap, waste fitting, 2m. x 15mm s/f pipe, 6 x 15mm s/f elbows. ', 'Situation is yellow!', 'yellow', 0, 0, NULL, NULL),
(13, 'admin', 3, 'WS_123', '-33.9554036', '18.4724395', '7 Hope Road, Rosebank/Rondebosch', 'red', '2018-11-29 15:14:29', 'Inspection   \n						', 'The cover is missing. Very dangerous, its on the pavement outside 2 blocks of flat, people walking by can seriously injure themselves. There are small children and the elderly in this road. It is near Rosebank train station and near UCT.', 'Residents have advised that the situation has existed for more than 2 months.', 'red', 0, 0, NULL, NULL),
(14, 'admin', 23, 'DbnPlumbersTrial123', '-29.9077815', '30.9013848', 'Phoenix electrical ', 'orange', '2018-11-30 11:27:10', '', 'Replaced pipework to outide toilets,  used 2l x 1/2" copper pipe, 6 x 1/2" delcop elbows,  12 x 1/2" master bats', 'It''s actually yellow', 'yellow', 0, 0, NULL, NULL),
(15, 'admin', 25, '123', '-33.9025392', '18.6117283', 'test address', 'red', '2018-11-30 11:53:09', 'Vandalism   \n						', 'bdkdndn', 'adsng,dfgnladfg', 'yellow', 0, 1, NULL, NULL),
(16, 'admin', 7, 'WayneLaz1*', '-26.172915', '28.1330627', '20 bird rd', 'red', '2018-12-05 07:21:28', 'Burst Pipe   \n						', '10 inch pipe', '', '', 0, 1, NULL, NULL),
(17, 'admin', 3, 'WS_123', '-33.9801035', '18.4819844', 'ksbdkkdnd', 'red', '2018-12-05 09:42:53', 'Manhole Cover   \n						', 'gkgjgvd', 'dgdfshdfg', 'orange', 1, 1, NULL, NULL),
(18, 'admin', 3, 'WS_123', '-33.9804081', '18.4633415', 'ufigkgggy', 'orange', '2018-12-08 13:57:33', 'Inspection   \n						', 'needs ', 'very urgent send sfsgf', 'red', 1, 1, NULL, NULL),
(19, 'admin', 3, 'WS_123', '47.3671055', '8.6833416', 'jsjxjd', 'red', '2018-12-20 21:46:07', 'Inspection   \n						', 'nxnxnxnx', '', '', 0, 1, NULL, NULL),
(20, 'admin', 7, 'WayneLaz1*', '-25.8817656', '28.1096734', '6 Rooshout Avenue ', 'red', '2018-12-29 17:30:42', 'Burst Pipe   \n						', 'Enjoying drinks ', '', '', 0, 1, NULL, NULL),
(21, 'admin', 7, 'WayneLaz1*', '-26.1929568', '28.0698438', '10 a Victoria street', 'red', '2019-01-11 13:41:56', '', 'Please need to order new pipes', '', '', 0, 1, NULL, NULL),
(22, 'admin', 27, 'Omesh2012', '-26.1928637', '28.0698104', '10a Victoria street', 'red', '2019-01-11 13:48:46', '', 'Please send additional support', '', '', 0, 1, NULL, NULL),
(23, 'admin', 27, 'Omesh2012', '-26.1928688', '28.0698149', '10a Victoria Street', 'red', '2019-01-11 13:52:16', 'Stolen Pipe   \n						', 'Need assistance ', 'Copper Pipe Stolen', 'red', 0, 1, NULL, NULL),
(24, 'admin', 27, 'Omesh2012', '-25.7322369', '28.1592614', 'University of Pretoria ', 'red', '2019-01-14 17:07:13', 'Leak Type 2   \n						', 'Please order new pipes', '', '', 0, 1, NULL, NULL),
(25, 'admin', 27, 'Omesh2012', '-26.1292607', '28.1032899', 'Lyndhurst ', 'red', '2019-01-15 17:52:12', 'Stolen Pipe   \n						', 'Please order a pipe 4mm', '', '', 0, 1, NULL, NULL),
(26, 'admin', 27, 'Omesh2012', '-25.7443267', '28.192261', 'City tshwane', 'red', '2019-01-23 14:27:07', 'Stolen Pipe   \n						', 'Please order 1mm pipes', '', '', 0, 1, NULL, NULL),
(27, 'admin', 3, 'WS_123', '-33.9909821', '18.4729666', 'xjjajcjd', 'red', '2019-02-05 15:51:47', 'Inspection   \n						', 'cjjsjjdjdx', '', '', 0, 0, NULL, NULL),
(28, 'admin', 27, 'Omesh2012', '-26.7257417', '27.8674107', 'Vaal', 'orange', '2019-02-23 19:47:18', 'Element Replacement   \n						', 'Very clean pool ', '', '', 0, 0, NULL, NULL),
(29, 'admin', 27, 'Omesh2012', '-25.9595681', '28.1288353', '10 and 0 Phoenix ', 'red', '2019-02-27 17:57:33', 'Stolen Pipe   \n						', 'Very bad damaged, excess loss of water ', 'copper', 'red', 0, 0, NULL, NULL),
(30, 'admin', 27, 'Omesh2012', '-25.9995227', '28.0850542', 'Madibas house', 'yellow', '2019-03-11 18:31:20', 'Burst Pipe   \n						', 'Main pipe from. The meter ', 'Uergent', 'red', 0, 0, NULL, NULL),
(31, 'admin', 27, 'Omesh2012', '-25.8685861', '28.1406118', 'Heuweloord ', 'orange', '2019-03-15 19:12:07', 'Repair Work   \n						', 'Road is badly damaged requires repair work ', '', '', 0, 0, NULL, NULL),
(32, 'admin', 3, 'WS_123', '-33.9482752', '18.4792779', 'p bxhjxk k', 'yellow', '2019-03-19 16:07:19', 'Retro Fit   \n						', 'jf', '', '', 0, 0, NULL, NULL),
(33, 'admin', 3, 'WS_123', '-28.5461992', '29.7733727', 'jsjsjs', 'green', '2019-03-27 17:54:39', 'First Checkup   \n						', 'jsnnd djsjs', '', '', 0, 0, NULL, NULL),
(34, 'admin', 29, 'Kelly1', '-28.5553826', '29.7702897', 'jfjsjd', 'red', '2019-03-27 18:24:42', 'Vandalism   \n						', 'omemdms  fjdndjxndd', '', 'green', 0, 0, NULL, NULL),
(35, 'admin', 3, 'WS_123', '-28.7309698', '29.3462826', 'hdksjdj', 'orange', '2019-03-28 10:41:32', 'Burst Pipe   \n						', 'sjjdjdjs', '', 'yellow', 0, 0, NULL, NULL),
(36, 'admin', 3, 'WS_123', '-29.6082302', '30.3754636', 'dhsjjdkdf', 'orange', '2019-03-28 15:08:19', 'Burst Pipe   \n						', 'hsjdjjdbdjhhx', '', '', 0, 0, NULL, NULL),
(37, 'admin', 29, 'Kelly1', '-33.9905909', '18.4728771', 'hsjsjjdc', 'red', '2019-03-31 20:35:57', 'Community Issue   \n						', 'hdjjdnjdbxbd', 'adsgasdg\r\ndfgdsf', 'green', 0, 0, NULL, NULL),
(38, 'admin', 32, 'milky1', '-25.9921169', '28.0813585', '200 Kyalami hills', 'red', '2019-04-05 16:58:32', 'kyle   \n						', 'Hazardous', '', '', 0, 0, NULL, NULL),
(39, 'admin', 27, 'Omesh2012', '-26.1244869', '28.0325712', 'Hyde park Sandton ', 'orange', '2019-04-08 17:50:22', 'Fix Element   \n						', '', '', '', 0, 0, NULL, NULL),
(40, 'admin', 29, 'Kelly1', '-25.9590593', '28.1280371', '200 kyalami ', 'orange', '2019-04-11 13:41:20', 'Burst Pipe   \n						', 'Please look at the pipe ', '', '', 0, 0, NULL, NULL),
(41, 'admin', 30, '1234', '-34.0515196', '18.3414263', 'djjfjsbf. ds', 'orange', '2019-04-14 18:37:53', 'Inspection   \n						', 'xjsjdjhdf', '', 'red', 0, 0, NULL, NULL),
(42, 'admin', 29, 'Kelly1', '-29.7198936', '31.0424564', 'Mount Edgecombe driving range ', 'green', '2019-04-16 12:47:57', 'Stolen Pipe   \n						', '', '', '', 0, 0, NULL, NULL),
(43, 'admin', 3, 'WS_123', '-33.9396618', '18.4984422', 'djckskf d&_2', 'orange', '2019-04-24 14:02:43', 'Community Issue   \n						', 'fhdjd;_;&', '', '', 0, 0, NULL, NULL),
(44, 'admin', 33, 'Desi1', '-25.999445', '28.0850625', '200 kyalami hills', 'yellow', '2019-04-26 21:54:56', 'Replace a Cistern   \n						', 'Ceramic', 'urgent', 'red', 0, 0, NULL, NULL),
(45, 'admin', 29, 'Kelly1', '-26.0254426', '28.0665623', 'Naivasha', 'red', '2019-05-02 11:59:08', 'Vandalism   \n						', 'Copper pipe', '2 inch pipe', 'orange', 0, 0, NULL, NULL),
(46, 'admin', 30, '1234', '-33.9482272', '18.4793418', 'hxxjfdd', 'orange', '2019-05-17 17:15:15', 'Whatever Issue   \n						', 'hxjdjdjjdhchdhbxbx', 'lkk', 'yellow', 0, 0, NULL, NULL),
(47, 'admin', 23, 'DbnPlumbersTrial123', '-33.9906703', '18.4730379', 'jxjdkks', 'yellow', '2019-05-28 20:23:06', 'Any Name of Incident   \n						', 'Send trucks, 3 plumbers, washes, budget 100', '', '', 0, 0, NULL, NULL),
(48, 'admin', 23, 'DbnPlumbersTrial123', '-33.9039081', '18.4214006', '', 'green', '2019-06-05 15:38:39', 'Geyser Leak   \n						', '', '', '', 0, 0, NULL, NULL),
(49, 'admin', 23, 'DbnPlumbersTrial123', '-33.9039544', '18.4213598', '', 'orange', '2019-06-05 15:42:36', 'Element Replacement   \n						', '', '', '', 0, 0, NULL, NULL),
(50, 'admin', 37, 'salman1', '32', '55', 'omo', 'green', '1000-01-01 00:00:00', '1', '12', 'dgsfgfd', 'white', 1, 1, '2019-06-17 03:14:02', '2019-06-17 03:14:02'),
(51, 'admin', 35, 'salman1', '32', '55', 'omo', 'green', '1000-01-01 00:00:00', '1', '12', 'dgsfgfd', 'white', 1, 1, '2019-06-17 03:25:30', '2019-06-17 03:25:30'),
(53, 'admin', 29, 'kelly1', '24.9112688', '91.8500025', 'Pollobi Rd, Sylhet, Bangladesh', 'green', '2019-06-20 05:40:17', '6', 'New problem', 'undefined', 'green', 0, 0, '2019-06-20 05:44:10', '2019-06-20 05:44:10'),
(54, 'admin', 29, 'kelly1', '24.9112624', '91.8499974', 'Pollobi Rd, Sylhet, Bangladesh', 'green', '2019-06-22 03:49:57', '6', 'vandalism problem', 'undefined', 'green', 0, 0, '2019-06-22 04:19:34', '2019-06-22 04:19:34'),
(55, 'admin', 29, 'kelly1', '24.9112624', '91.8499974', 'Pollobi Rd, Sylhet, Bangladesh', 'green', '2019-06-22 03:49:57', '6', 'vandalism problem', 'undefined', 'green', 0, 0, '2019-06-22 04:22:02', '2019-06-22 04:22:02'),
(56, 'admin', 29, 'kelly1', '24.9112624', '91.8499974', 'Pollobi Rd, Sylhet, Bangladesh', 'green', '2019-06-22 03:49:57', '6', 'vandalism problem', 'undefined', 'green', 0, 0, '2019-06-22 04:24:27', '2019-06-22 04:24:27'),
(57, 'admin', 29, 'kelly1', '24.9112624', '91.8499974', 'Pollobi Rd, Sylhet, Bangladesh', 'green', '2019-06-22 03:49:57', '6', 'vandalism problem', 'undefined', 'green', 0, 0, '2019-06-22 04:27:48', '2019-06-22 04:27:48'),
(58, 'admin', 29, 'kelly1', '24.9112624', '91.8499974', 'Pollobi Rd, Sylhet, Bangladesh', 'green', '2019-06-22 03:49:57', '6', 'vandalism problem', 'undefined', 'green', 0, 0, '2019-06-22 04:33:16', '2019-06-22 04:33:16'),
(59, 'admin', 29, 'kelly1', '24.9112624', '91.8499974', 'Pollobi Rd, Sylhet, Bangladesh', 'green', '2019-06-22 03:49:57', '6', 'vandalism problem', 'undefined', 'green', 0, 0, '2019-06-22 04:36:03', '2019-06-22 04:36:03'),
(60, 'admin', 29, 'kelly1', '24.9112624', '91.8499974', 'Pollobi Rd, Sylhet, Bangladesh', 'green', '2019-06-22 03:49:57', '6', 'vandalism problem', 'undefined', 'green', 0, 0, '2019-06-22 04:38:04', '2019-06-22 04:38:04'),
(61, 'admin', 29, 'kelly1', '24.9112624', '91.8499974', 'Pollobi Rd, Sylhet, Bangladesh', 'green', '2019-06-22 03:49:57', '6', 'vandalism problem', 'undefined', 'green', 0, 0, '2019-06-22 04:38:33', '2019-06-22 04:38:33'),
(62, 'admin', 29, 'kelly1', '24.9112688', '91.8500025', 'Pollobi Rd, Sylhet, Bangladesh', 'yellow', '2019-06-22 05:07:02', '5', 'problem notes', 'undefined', 'green', 0, 0, '2019-06-22 05:10:43', '2019-06-22 05:10:43'),
(63, 'admin', 29, 'kelly1', '24.9112688', '91.8500025', 'Pollobi Rd, Sylhet, Bangladesh', 'yellow', '2019-06-22 05:07:02', '5', 'problem notes', 'undefined', 'green', 0, 0, '2019-06-22 05:16:44', '2019-06-22 05:16:44'),
(64, 'admin', 29, 'kelly1', '24.9112688', '91.8500025', 'Pollobi Rd, Sylhet, Bangladesh', 'yellow', '2019-06-22 05:07:02', '5', 'problem notes', 'undefined', 'green', 0, 0, '2019-06-22 05:18:00', '2019-06-22 05:18:00'),
(65, 'admin', 29, 'kelly1', '24.9112688', '91.8500025', 'Pollobi Rd, Sylhet, Bangladesh', 'yellow', '2019-06-22 05:07:02', '5', 'problem notes', 'undefined', 'green', 0, 0, '2019-06-22 05:20:27', '2019-06-22 05:20:27'),
(66, 'admin', 29, 'kelly1', '24.9112688', '91.8500025', 'Pollobi Rd, Sylhet, Bangladesh', 'yellow', '2019-06-22 05:07:02', '5', 'problem notes', 'undefined', 'green', 0, 0, '2019-06-22 05:21:48', '2019-06-22 05:21:48'),
(67, 'admin', 29, 'kelly1', '24.9112688', '91.8500025', 'Pollobi Rd, Sylhet, Bangladesh', 'yellow', '2019-06-22 05:07:02', '5', 'problem notes', 'undefined', 'green', 0, 0, '2019-06-22 05:22:28', '2019-06-22 05:22:28'),
(68, 'admin', 29, 'kelly1', '24.9112688', '91.8500025', 'Pollobi Rd, Sylhet, Bangladesh', 'yellow', '2019-06-22 05:07:02', '5', 'problem notes', 'undefined', 'green', 0, 0, '2019-06-22 05:24:17', '2019-06-22 05:24:17'),
(69, 'admin', 29, 'kelly1', '24.9112688', '91.8500025', 'Pollobi Rd, Sylhet, Bangladesh', 'yellow', '2019-06-22 05:07:02', '5', 'problem notes', 'undefined', 'green', 0, 0, '2019-06-22 05:25:21', '2019-06-22 05:25:21'),
(70, 'admin', 29, 'kelly1', '24.9112688', '91.8500025', 'Pollobi Rd, Sylhet, Bangladesh', 'yellow', '2019-06-22 05:07:02', '7', 'leakage', 'undefined', 'green', 0, 0, '2019-06-22 05:33:13', '2019-06-22 05:33:13'),
(71, 'admin', 29, 'kelly1', '24.9112688', '91.8500025', 'Pollobi Rd, Sylhet, Bangladesh', 'yellow', '2019-06-22 05:07:02', '7', 'leakage', 'undefined', 'green', 0, 0, '2019-06-22 05:36:37', '2019-06-22 05:36:37'),
(72, 'admin', 29, 'kelly1', '24.9112688', '91.8500025', 'Pollobi Rd, Sylhet, Bangladesh', 'green', '2019-06-22 05:38:06', '6', 'odjdjd', 'undefined', 'green', 0, 0, '2019-06-22 05:40:06', '2019-06-22 05:40:06'),
(73, 'admin', 29, 'kelly1', '24.9112688', '91.8500025', 'Pollobi Rd, Sylhet, Bangladesh', 'orange', '2019-06-22 05:47:19', '7', 'ybduaf', 'undefined', 'green', 0, 0, '2019-06-22 05:48:39', '2019-06-22 05:48:39'),
(74, 'admin', 29, 'kelly1', '24.9112688', '91.8500025', 'Pollobi Rd, Sylhet, Bangladesh', 'yellow', '2019-06-22 05:54:07', '40', 'gvy', 'undefined', 'green', 0, 0, '2019-06-22 05:55:07', '2019-06-22 05:55:07'),
(75, 'admin', 29, 'kelly1', '24.9112688', '91.8500025', 'Pollobi Rd, Sylhet, Bangladesh', 'yellow', '2019-06-22 05:54:07', '40', 'gvy', 'undefined', 'green', 0, 0, '2019-06-22 05:58:45', '2019-06-22 05:58:45'),
(76, 'admin', 29, 'kelly1', '24.9112688', '91.8500025', 'Pollobi Rd, Sylhet, Bangladesh', 'yellow', '2019-06-22 06:00:23', '6', 'udhf', 'undefined', 'green', 0, 0, '2019-06-22 06:01:05', '2019-06-22 06:01:05'),
(77, 'admin', 29, 'kelly1', '24.9112688', '91.8500025', 'Pollobi Rd, Sylhet, Bangladesh', 'green', '2019-06-22 06:02:12', '7', 'hdhd', 'undefined', 'green', 0, 0, '2019-06-22 06:03:03', '2019-06-22 06:03:03'),
(78, 'admin', 29, 'kelly1', '24.9112688', '91.8500025', 'Pollobi Rd, Sylhet, Bangladesh', 'green', '2019-06-22 06:06:47', '7', 'ruduf', 'undefined', 'green', 0, 0, '2019-06-22 06:07:37', '2019-06-22 06:07:37'),
(79, 'admin', 29, 'kelly1', '24.9112688', '91.8500025', 'Pollobi Rd, Sylhet, Bangladesh', 'green', '2019-06-22 06:06:47', '7', 'ruduf', 'undefined', 'green', 0, 0, '2019-06-22 06:08:49', '2019-06-22 06:08:49'),
(80, 'admin', 29, 'kelly1', '24.9112688', '91.8500025', 'Pollobi Rd, Sylhet, Bangladesh', 'green', '2019-06-22 06:06:47', '7', 'ruduf', 'undefined', 'green', 0, 0, '2019-06-22 06:10:32', '2019-06-22 06:10:32'),
(81, 'admin', 29, 'kelly1', '24.9112688', '91.8500025', 'Pollobi Rd, Sylhet, Bangladesh', 'green', '2019-06-22 06:06:47', '7', 'ruduf', 'undefined', 'green', 0, 0, '2019-06-22 06:11:06', '2019-06-22 06:11:06'),
(82, 'admin', 29, 'kelly1', '24.9112688', '91.8500025', 'Pollobi Rd, Sylhet, Bangladesh', 'green', '2019-06-22 06:06:47', '7', 'ruduf', 'undefined', 'green', 0, 0, '2019-06-22 06:11:56', '2019-06-22 06:11:56'),
(83, 'admin', 29, 'kelly1', '24.9112688', '91.8500025', 'Pollobi Rd, Sylhet, Bangladesh', 'green', '2019-06-22 06:06:47', '7', 'ruduf', 'undefined', 'green', 0, 0, '2019-06-22 06:13:14', '2019-06-22 06:13:14'),
(84, 'admin', 29, 'kelly1', '24.9112688', '91.8500025', 'Pollobi Rd, Sylhet, Bangladesh', 'green', '2019-06-22 06:06:47', '7', 'ruduf', 'undefined', 'green', 0, 0, '2019-06-22 06:13:33', '2019-06-22 06:13:33'),
(85, 'admin', 29, 'kelly1', '24.9112688', '91.8500025', 'Pollobi Rd, Sylhet, Bangladesh', 'green', '2019-06-22 06:06:47', '7', 'ruduf', 'undefined', 'green', 0, 0, '2019-06-22 06:13:51', '2019-06-22 06:13:51'),
(86, 'admin', 29, 'kelly1', '24.9112688', '91.8500025', 'Pollobi Rd, Sylhet, Bangladesh', 'green', '2019-06-22 06:06:47', '7', 'ruduf', 'undefined', 'green', 0, 0, '2019-06-22 06:14:16', '2019-06-22 06:14:16'),
(87, 'admin', 29, 'kelly1', '24.9112688', '91.8500025', 'Pollobi Rd, Sylhet, Bangladesh', 'green', '2019-06-22 06:06:47', '7', 'ruduf', 'undefined', 'green', 0, 0, '2019-06-22 06:15:51', '2019-06-22 06:15:51'),
(88, 'admin', 29, 'kelly1', '24.9112688', '91.8500025', 'Pollobi Rd, Sylhet, Bangladesh', 'green', '2019-06-22 06:06:47', '7', 'ruduf', 'undefined', 'green', 0, 0, '2019-06-22 06:16:31', '2019-06-22 06:16:31'),
(89, 'admin', 29, 'kelly1', '24.9112688', '91.8500025', 'Pollobi Rd, Sylhet, Bangladesh', 'yellow', '2019-06-22 06:59:43', '7', 'bdb', 'undefined', 'green', 0, 0, '2019-06-22 07:03:45', '2019-06-22 07:03:45'),
(90, 'admin', 39, '123456', '24.9112688', '91.8500025', 'Pollobi Rd, Sylhet, Bangladesh', 'green', '2019-06-24 12:09:16', '7', 'notes', 'undefined', 'green', 0, 0, '2019-06-24 00:15:00', '2019-06-24 00:15:00'),
(91, 'admin', 39, '123456', '24.8908032', '91.87658', '3100 Kastoghar Rd, Sylhet 3100, Bangladesh', 'yellow', '2019-06-24 09:52:16', '8', 'hdhdgd', 'undefined', 'green', 0, 0, '2019-06-24 09:52:58', '2019-06-24 09:52:58'),
(92, 'admin', 39, '123456', '24.8910328', '91.8765999', '29 Kastoghar Rd, Sylhet, Bangladesh', 'green', '2019-06-24 10:33:27', '37', 'new note', 'undefined', 'green', 0, 0, '2019-06-24 10:36:24', '2019-06-24 10:36:24');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
