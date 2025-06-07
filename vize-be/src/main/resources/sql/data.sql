TRUNCATE posts RESTART IDENTITY CASCADE;
TRUNCATE boards RESTART IDENTITY CASCADE;
TRUNCATE threads RESTART IDENTITY CASCADE;

BEGIN DEFERRABLE;

INSERT INTO boards (code, name)
VALUES ('tech', 'Technology Discussions'),
       ('art', 'Art Showcase');

INSERT INTO threads (board_id, op_post_id, title)
VALUES ('tech', 1, 'Latest AI Advancements'),
       ('tech', 4, 'Best Programming Languages for Web Development'),
       ('art', 6, 'Post Your Digital Paintings'),
       ('art', 8, 'Photography Tips and Tricks');

INSERT INTO posts (is_op, board_id, thread_id, content)
VALUES (TRUE, 'tech', 1, 'What are your thoughts on the recent breakthroughs in large language models?'),
       (FALSE, 'tech', 1, 'I think generative AI is truly revolutionizing content creation.'),
       (FALSE, 'tech', 1, 'Are there any ethical concerns we should be aware of?'),
       (TRUE, 'tech', 2, 'Which programming language do you prefer for backend web development?'),
       (FALSE, 'tech', 2, 'Python with Django is fantastic for rapid development.'),
       (TRUE, 'art', 3, 'Show off your best digital artwork here!'),
       (FALSE, 'art', 3, 'Here''s a piece I finished last week, made with Procreate.'),
       (TRUE, 'art', 4, 'Share your favorite photography tips, techniques, and gear advice.'),
       (FALSE, 'art', 4, 'Always shoot in RAW if you can, it gives you so much more flexibility in post-processing.');

COMMIT;