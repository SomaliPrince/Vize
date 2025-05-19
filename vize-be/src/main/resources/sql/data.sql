TRUNCATE users RESTART IDENTITY CASCADE;
TRUNCATE boards RESTART IDENTITY CASCADE;
TRUNCATE posts RESTART IDENTITY;

-- Populate Users table
INSERT INTO users (username, password_hash, email, is_admin, created_at) VALUES
                                                                             ('admin', '$2a$12$1234567890123456789012OQRl8KHWo1HZ7MKLnLbxDUXJXC2WcR2', 'admin@example.com', TRUE, '2024-01-01 00:00:00'),
                                                                             ('moderator', '$2a$12$1234567890123456789012OsJoTqO/HLx9k5sQh4WrJ5Wo0XcBl.', 'mod@example.com', FALSE, '2024-01-15 12:30:00'),
                                                                             ('user1', '$2a$12$1234567890123456789012OvPBn9AMxgbC5/lTGGT5JXCCIUkR0Uu', 'user1@example.com', FALSE, '2024-02-01 09:15:00'),
                                                                             ('user2', '$2a$12$1234567890123456789012O3LIhK1MK3SbQg.o.FjGeqXa5eQnN/a', 'user2@example.com', FALSE, '2024-02-10 14:20:00'),
                                                                             ('techguy', '$2a$12$1234567890123456789012OQhP5PzCVVGG3iC.fUlxZ.AhNsOaZbm', 'tech@example.com', FALSE, '2024-02-15 18:45:00'),
                                                                             ('artlover', '$2a$12$1234567890123456789012OdW5FP3iC7ICMjzBu4QUl4wGCUQDOq', 'art@example.com', FALSE, '2024-03-01 11:10:00'),
                                                                             ('anonymous', '$2a$12$1234567890123456789012O9Xd8GwLUyhRlD3.TtUOVZxvLkCv3we', NULL, FALSE, '2024-03-10 07:30:00');

-- Populate Boards table
INSERT INTO boards (board_code, board_name, description) VALUES
                                                             ('tech', 'Technology', 'Discussion about computers, programming, and technology'),
                                                             ('art', 'Artwork & Creativity', 'Showcase and discuss artworks, drawings, and creative projects'),
                                                             ('music', 'Music', 'Everything related to music, bands, and instruments'),
                                                             ('anime', 'Anime & Manga', 'Discussion about Japanese animation and comics'),
                                                             ('games', 'Video Games', 'Video game discussion, news, and reviews');

-- Populate Posts table (threads)
-- Tech threads
INSERT INTO posts (board_id, user_id, parent_id, subject, content, image_url, created_at) VALUES
                                                                                              (1, 3, NULL, 'Getting started with PostgreSQL', 'I''m new to PostgreSQL. What are some good resources to learn it properly?', NULL, '2024-04-01 09:30:00'),
                                                                                              (1, 5, NULL, 'Best Linux distro for developers', 'I''m looking for a Linux distribution that''s good for software development. Any recommendations?', NULL, '2024-04-02 14:15:00'),
                                                                                              (1, NULL, NULL, 'New Raspberry Pi model released', 'Has anyone tried the latest Raspberry Pi model? What do you think about it?', 'https://example.com/images/raspberry.jpg', '2024-04-03 16:40:00');

-- Art threads
INSERT INTO posts (board_id, user_id, parent_id, subject, content, image_url, created_at) VALUES
                                                                                              (2, 6, NULL, 'Digital art tips', 'What software do you use for digital art? Looking for recommendations for a beginner.', NULL, '2024-04-01 10:45:00'),
                                                                                              (2, 4, NULL, 'My latest painting', 'Just finished this landscape painting. Feedback appreciated!', 'https://example.com/images/landscape.jpg', '2024-04-02 18:20:00');

-- Music threads
INSERT INTO posts (board_id, user_id, parent_id, subject, content, image_url, created_at) VALUES
                                                                                              (3, 3, NULL, 'Learning guitar', 'I''m starting to learn guitar. Any tips for absolute beginners?', NULL, '2024-04-03 11:30:00'),
                                                                                              (3, 7, NULL, 'New indie bands to check out', 'Looking for new indie bands. Who are you listening to these days?', NULL, '2024-04-04 15:25:00');

-- Anime threads
INSERT INTO posts (board_id, user_id, parent_id, subject, content, image_url, created_at) VALUES
                                                                                              (4, 6, NULL, 'Anime recommendations for Spring 2024', 'What are the best new anime series of this season?', NULL, '2024-04-02 13:15:00'),
                                                                                              (4, 5, NULL, 'Classic anime everyone should watch', 'Let''s make a list of must-watch classic anime series for newcomers.', NULL, '2024-04-05 10:10:00');

-- Games threads
INSERT INTO posts (board_id, user_id, parent_id, subject, content, image_url, created_at) VALUES
                                                                                              (5, 4, NULL, 'PC gaming setup advice', 'I''m building a new gaming PC. What components would you recommend?', NULL, '2024-04-01 19:45:00'),
                                                                                              (5, NULL, NULL, 'Favorite indie games', 'What are some underrated indie games that more people should play?', NULL, '2024-04-04 17:30:00');

-- Populate Posts table (replies)
-- Replies to tech threads
INSERT INTO posts (board_id, user_id, parent_id, subject, content, image_url, created_at) VALUES
                                                                                              (1, 5, 1, NULL, 'The official PostgreSQL documentation is actually quite good. Also check out "PostgreSQL: Up and Running" book.', NULL, '2024-04-01 10:15:00'),
                                                                                              (1, 2, 1, NULL, 'pgAdmin is a great tool to start with. It provides a nice GUI for managing your databases.', NULL, '2024-04-01 11:20:00'),
                                                                                              (1, 3, 2, NULL, 'Ubuntu is pretty good for beginners. Pop!_OS is also designed with developers in mind.', NULL, '2024-04-02 14:45:00'),
                                                                                              (1, 5, 2, NULL, 'I personally use Arch Linux, but it has a steeper learning curve. Fedora might be a good middle ground.', NULL, '2024-04-02 15:30:00'),
                                                                                              (1, 4, 3, NULL, 'Yes, I got one last week! The performance improvements are noticeable, especially for IoT projects.', 'https://example.com/images/pi_project.jpg', '2024-04-03 17:15:00');

-- Replies to art threads
INSERT INTO posts (board_id, user_id, parent_id, subject, content, image_url, created_at) VALUES
                                                                                              (2, 3, 4, NULL, 'Krita is a great free option. If you can spend some money, Procreate is excellent if you have an iPad.', NULL, '2024-04-01 11:30:00'),
                                                                                              (2, 6, 5, NULL, 'The colors are beautiful! I love the way you captured the light on the mountains.', NULL, '2024-04-02 19:05:00'),
                                                                                              (2, 2, 5, NULL, 'This is really impressive. How long did it take you to complete?', NULL, '2024-04-02 20:15:00'),
                                                                                              (2, 4, 5, NULL, 'Thanks for the kind words! It took about 20 hours over a couple of weeks.', NULL, '2024-04-02 21:30:00');

-- Replies to music threads
INSERT INTO posts (board_id, user_id, parent_id, subject, content, image_url, created_at) VALUES
                                                                                              (3, 4, 6, NULL, 'Start with basic chords and practice daily, even if just for 15 minutes. Consistency is key.', NULL, '2024-04-03 12:10:00'),
                                                                                              (3, 5, 6, NULL, 'Justin Guitar has some excellent free lessons online for beginners.', NULL, '2024-04-03 13:45:00'),
                                                                                              (3, 6, 7, NULL, 'Check out "The Beths" if you haven''t already. Their latest album is fantastic.', NULL, '2024-04-04 16:00:00'),
                                                                                              (3, 3, 7, NULL, 'I''ve been enjoying "Wet Leg" and "Yard Act" lately. Both have very interesting lyrics.', NULL, '2024-04-04 17:10:00');

-- Replies to anime threads
INSERT INTO posts (board_id, user_id, parent_id, subject, content, image_url, created_at) VALUES
                                                                                              (4, 4, 8, NULL, '"Bluish Reentry" is my favorite of the season so far. Great animation and story.', NULL, '2024-04-02 14:00:00'),
                                                                                              (4, 7, 8, NULL, 'I''m enjoying the new season of "Wind Breaker" - solid character development.', NULL, '2024-04-02 15:30:00'),
                                                                                              (4, 3, 9, NULL, 'Cowboy Bebop is a must-watch classic that still holds up today.', NULL, '2024-04-05 10:45:00'),
                                                                                              (4, 6, 9, NULL, 'Studio Ghibli films like "Spirited Away" and "Princess Mononoke" are essential viewing.', NULL, '2024-04-05 11:20:00');

-- Replies to games threads
INSERT INTO posts (board_id, user_id, parent_id, subject, content, image_url, created_at) VALUES
                                                                                              (5, 5, 10, NULL, 'What''s your budget? RTX 4070 is a good mid-range GPU right now, pair it with a Ryzen 7 CPU.', NULL, '2024-04-01 20:30:00'),
                                                                                              (5, 4, 10, NULL, 'Thanks! Budget is around $1500. I''ll look into those components.', NULL, '2024-04-01 21:15:00'),
                                                                                              (5, 3, 11, NULL, '"Hollow Knight" is an amazing metroidvania if you haven''t played it yet.', NULL, '2024-04-04 18:00:00'),
                                                                                              (5, 6, 11, NULL, '"Stardew Valley" may not be underrated anymore, but it''s still one of the best indie games ever made.', NULL, '2024-04-04 19:25:00');
