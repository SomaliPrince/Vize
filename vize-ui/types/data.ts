export interface Board {
    code: string;
    name: string;
}

export interface Post {
    id: number;
    comment: string;
    createdAt: Date;
}

export interface Thread {
    id: number;
    name: string
    posts: Post[];
}