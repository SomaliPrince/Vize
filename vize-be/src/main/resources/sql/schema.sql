DROP TABLE IF EXISTS boards CASCADE;
DROP TABLE IF EXISTS threads CASCADE;
DROP TABLE IF EXISTS posts;

CREATE TABLE boards
(
    code VARCHAR(5) PRIMARY KEY, --pol, biz, mu
    name VARCHAR(100) NOT NULL UNIQUE,
    post_id_counter INTEGER DEFAULT 0
);

CREATE TABLE threads
(
    id         INTEGER   DEFAULT next_post_id(board_id),
    board_id   VARCHAR(5)   NOT NULL REFERENCES boards (code) ON DELETE RESTRICT,
    title      VARCHAR(100) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id, board_id)
);

CREATE TABLE posts
(
    id         INTEGER   DEFAULT next_post_id(),
    board_id   VARCHAR(5) NOT NULL REFERENCES boards (code) ON DELETE RESTRICT,
    thread_id  INTEGER REFERENCES threads (id) ON DELETE CASCADE,
    content    TEXT       NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id, board_id)
);

CREATE INDEX IF NOT EXISTS idx_posts_parent ON posts (id);
CREATE INDEX IF NOT EXISTS idx_posts_thread ON threads (id);