export interface Board {
    code: string;
    name: string;
}

export interface Post {
    id: number;
    comment: string;
    createdAt: string;
}

export interface CreatePost {
    board: string;
    threadId: number;
    comment: string;
}

export interface Thread {
    id: number;
    name: string;
    posts: Post[];
}

export interface OpPost {
    id: number;
    comment: string;
    name: string
    createdAt: string;
}