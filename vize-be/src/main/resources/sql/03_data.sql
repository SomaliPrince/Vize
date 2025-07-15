TRUNCATE posts RESTART IDENTITY CASCADE;
TRUNCATE boards RESTART IDENTITY CASCADE;
TRUNCATE threads RESTART IDENTITY CASCADE;

INSERT INTO boards (code, name)
VALUES ('pol', 'Politics'),
       ('biz', 'Business & Finance'),
       ('mu', 'Music'),
       ('tech', 'Technology'),
       ('g', 'General Discussion'),
       ('test', 'Escape Board');

INSERT INTO posts (board_code, comment)
VALUES ('pol', 'Thoughts on the recent parliamentary debate? Seems like a lot of back and forth.'),
       ('pol', 'I read an interesting article on local election turnout. What are your predictions for next year?'),
       ('pol', 'Is anyone else concerned about the proposed changes to the healthcare bill?'),

       ('biz', 'The market volatility this week has been wild. Anyone making big moves?'),
       ('biz', 'Just started looking into passive income streams. Any success stories or warnings?'),
       ('biz', 'Heard about that new startup getting massive funding. What do you think of their business model?'),

       ('mu', 'Discovered a fantastic new indie band today. Their sound is so unique!'),
       ('mu', 'What album are you currently listening to on repeat? Need some new recommendations.'),
       ('mu', 'Attended a live concert last night; the energy was incredible!'), -- Corrected grammar here

       ('tech', 'My new gadget just arrived! Still figuring out all the features, but it''s pretty cool.'),
       ('tech', 'Anyone else having trouble with their internet provider lately? Connection keeps dropping.'),
       ('tech', 'Just finished a coding project. The satisfaction of seeing it work is unmatched.'),

       ('g', 'Had the most bizarre dream last night. It involved flying squirrels and a talking teapot.'),
       ('g', 'What''s your go-to comfort food after a long day? Mine is definitely pizza.'),
       ('g', 'Planning a weekend trip. Any suggestions for a relaxing getaway spot?');

INSERT INTO threads (post_id, board_code, name)
VALUES (1, 'pol', 'Current Political Climate'),
       (1, 'biz', 'Market & Investment Talk'),
       (1, 'mu', 'New Music Discoveries'),
       (1, 'tech', 'Gadgets & Connectivity'),
       (1, 'g', 'Random Daily Thoughts');
