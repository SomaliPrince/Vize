export interface Board {
    code: string;
    name: string;
}

export interface Thread {
    id: number;
    name: string;
    comment: string;
    createdAt: Date;
}