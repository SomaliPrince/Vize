TRUNCATE posts RESTART IDENTITY CASCADE;
TRUNCATE boards RESTART IDENTITY CASCADE;
TRUNCATE threads RESTART IDENTITY CASCADE;

BEGIN DEFERRABLE;

INSERT INTO boards (board_code, board_name, description)
VALUES ('tech', 'Technology Discussions', 'A board for all things technology, from programming to hardware.'),
       ('art', 'Art Showcase',
        'Share and discuss various forms of art, including digital, traditional, and photography.');

INSERT INTO threads (board_id, title)
VALUES (1, 'Latest AI Advancements'),
       (1, 'Best Programming Languages for Web Development'),
       (2, 'Post Your Digital Paintings'),
       (2, 'Photography Tips and Tricks');

INSERT INTO posts (is_op, board_id, thread_id, content)
VALUES (TRUE, 1, 1, 'What are your thoughts on the recent breakthroughs in large language models?'),
       (FALSE, 1, 1, 'I think generative AI is truly revolutionizing content creation.'),
       (FALSE, 1, 1, 'Are there any ethical concerns we should be aware of?'),
       (TRUE, 1, 2, 'Which programming language do you prefer for backend web development?'),
       (FALSE, 1, 2, 'Python with Django is fantastic for rapid development.'),
       (TRUE, 2, 3, 'Show off your best digital artwork here!'),
       (FALSE, 2, 3, 'Here''s a piece I finished last week, made with Procreate.'),
       (TRUE, 2, 4, 'Share your favorite photography tips, techniques, and gear advice.'),
       (FALSE, 2, 4, 'Always shoot in RAW if you can, it gives you so much more flexibility in post-processing.');

COMMIT;