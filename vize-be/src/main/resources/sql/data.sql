TRUNCATE posts RESTART IDENTITY CASCADE;
TRUNCATE boards RESTART IDENTITY CASCADE;
TRUNCATE threads RESTART IDENTITY CASCADE;

INSERT INTO boards (board_code, board_name, description) VALUES
                                                             ('tech', 'Technology', 'Discussions about technology, programming, and gadgets'),
                                                             ('art', 'Art & Design', 'Share and discuss artwork, design, and creative projects');

-- Insert threads (without op_post_id for now)
INSERT INTO threads (board_id, title) VALUES
-- Tech board threads
(1, 'Best programming languages for beginners'),
(1, 'New AI developments in 2025'),
(1, 'Mechanical keyboards discussion'),
-- Art board threads
(2, 'Digital art software recommendations'),
(2, 'Traditional vs digital art techniques'),
(2, 'Share your latest artwork');

-- Insert posts
INSERT INTO posts (id, is_op, board_id, thread_id, content) VALUES
-- Tech board threads - OP posts
(1, TRUE, 1, 1, 'Hi everyone! I''m looking to start learning programming. Which languages would you recommend for absolute beginners?'),
(2, TRUE, 1, 2, 'Let''s discuss the latest developments in AI this year. What breakthroughs have you found most impressive?'),
(3, TRUE, 1, 3, 'What''s your favorite mechanical keyboard? I''m looking to upgrade and need some recommendations.'),

-- Tech board threads - Reply posts
(4, FALSE, 1, 1, 'Python is great for beginners. Easy syntax, tons of learning resources, and useful for many applications from web development to data science.'),
(5, FALSE, 1, 2, 'The recent advancements in multimodal models have been incredible. They can now understand context across text, images, and audio simultaneously.'),
(6, FALSE, 1, 3, 'I use a Keychron Q1 with Gateron Brown switches. Amazing build quality and the sound is perfect for my preferences.'),

-- Art board threads - OP posts
(7, TRUE, 2, 4, 'I''m looking for new digital art software. What are you all using these days?'),
(8, TRUE, 2, 5, 'How have you incorporated traditional techniques into your digital workflow? Or vice versa?'),
(9, TRUE, 2, 6, 'Post your latest artwork here! I''ll start with a landscape piece I finished last week.'),

-- Art board threads - Reply posts
(10, FALSE, 2, 4, 'Procreate on iPad is my go-to. The brushes are fantastic and the interface is intuitive. For desktop, I recommend Clip Studio Paint.'),
(11, FALSE, 2, 5, 'I often sketch traditionally with pencil, scan it, and then finish the coloring digitally. It gives my work a unique texture.'),
(12, FALSE, 2, 6, 'Love your landscape! Here''s a character design I completed recently for a personal project.');

UPDATE threads t
SET op_post_id = p.id
FROM posts p
WHERE t.id = p.thread_id AND p.is_op = TRUE