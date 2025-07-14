TRUNCATE posts RESTART IDENTITY CASCADE;
TRUNCATE boards RESTART IDENTITY CASCADE;
TRUNCATE threads RESTART IDENTITY CASCADE;

BEGIN DEFERRABLE;

INSERT INTO boards (code, name)
VALUES ('pol', 'Politics'),
       ('biz', 'Business & Finance'),
       ('mu', 'Music'),
       ('tech', 'Technology'),
       ('g', 'General Discussion');

INSERT INTO threads (board_code, title)
VALUES ('pol', 'Discussion on recent election results'),
       ('pol', 'Impact of climate policy on global relations'),
       ('biz', 'Current stock market trends'),
       ('biz', 'Future of remote work and its economic impact'),
       ('mu', 'Favorite albums of the 90s'),
       ('mu', 'New artists to watch in indie pop'),
       ('tech', 'Why AI might be more hype than help'),
       ('tech', 'Best programming languages for web development in 2024'),
       ('g', 'Share your favorite hobby!'),
       ('g', 'Recommendations for good non-fiction books');

INSERT INTO posts (board_code, thread_id, content)
VALUES ('pol', 1, 'Very interesting to see the voter turnout this year.'),
       ('pol', 1, 'I think the new government will face significant challenges.'),
       ('pol', 1, 'The public reaction has been quite mixed, as expected.');

INSERT INTO posts (board_code, thread_id, content)
VALUES ('biz', 3, 'The tech sector seems to be recovering steadily.'),
       ('biz', 3, 'Concerns about inflation are still present, though.'),
       ('biz', 3, 'What are your predictions for the next quarter?');

INSERT INTO posts (board_code, thread_id, content)
VALUES ('mu', 5, 'Nirvana''s Nevermind is a timeless classic.'),
       ('mu', 5, 'I also love "The Miseducation of Lauryn Hill".'),
       ('mu', 5, 'Don''t forget Radiohead''s "OK Computer"!');

INSERT INTO posts (board_code, thread_id, content)
VALUES ('tech', 7, 'The ethical considerations of AI are becoming more pressing.'),
       ('tech', 7, 'Excited to see the progress in quantum computing.'),
       ('tech', 7, 'What are the practical applications we can expect soon?');

INSERT INTO posts (board_code, thread_id, content)
VALUES ('g', 9, 'I''ve recently gotten into woodworking, it''s very therapeutic.'),
       ('g', 9, 'For me, it''s always been reading and hiking.'),
       ('g', 9, 'Anyone into board games?');

COMMIT;