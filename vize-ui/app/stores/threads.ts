import {defineStore} from 'pinia';
import type {CreatePost, OpPost, Post, Thread} from "~/types/data";

export interface ThreadsState {
    threads: Thread[];
    isLoading: boolean;
    error: string | null;
}

export interface ThreadsStoreState {
    data: Record<string, ThreadsState>
}

export const useThreadStore = defineStore('threads', {
    state: (): ThreadsStoreState => <ThreadsStoreState>({
        data: {}
    }),
    actions: {
        async createPost(post: CreatePost): Promise<void> {
            try {
                const createdPost: Post = await $fetch<Post>(`${useRuntimeConfig().public.backendUrl}/posts`, {
                    method: 'POST',
                    body: post
                })
                this.data[post.board]?.threads.find(t => t.id === post.threadId)?.posts.push(createdPost);
            } catch (error) {
                console.error('Failed to add post:', error);
                throw error;
            }
        },
        async fetchThreads(boardCode: string): Promise<void> {
            if (!this.data[boardCode]) {
                this.data[boardCode] = {threads: [], isLoading: false, error: null};
            }
            if (this.data.isLoading) {
                console.log(`Fetch for board ${boardCode} already in progress.`);
                return;
            }
            this.data[boardCode].isLoading = true;
            this.data[boardCode].error = null;

            try {
                const {data, error} = await useFetch<Thread[]>(
                    `${useRuntimeConfig().public.backendUrl}/threads/${boardCode}`,
                    {
                        key: `threads-${boardCode}`,
                        server: true,
                        default: () => [] as Thread[]
                    }
                )
                if (error.value) throw new Error(error.value.message || 'Failed to fetch threads')

                this.data[boardCode].threads = data.value;
            } catch (error) {
                this.data[boardCode].error = error instanceof Error ? error.message : 'Unknown error occurred'
                console.error('Failed to fetch thread data:', error)
                throw error
            } finally {
                this.data[boardCode].isLoading = false
            }
        }
    },
    getters: {
        getThreadPostsOnBoard: (state) => (boardId: string, threadId: number): Post[] => {
            const foundThread = state.data[boardId]?.threads.find(t => t.id === threadId);
            if (!foundThread) throw new Error(`Thread with id ${threadId} not found`);

            return foundThread.posts.toSpliced(0, 1)
        },

        getThreadOpPostOnBoard: (state) => (boardId: string, threadId: number): OpPost => {
            const thread = state.data[boardId]?.threads.find(t => t.id === threadId);

            if (!thread) throw new Error(`Thread with id ${threadId} not found`);

            const firstPost = thread.posts.at(0);
            if (!firstPost) throw new Error(`Thread ${threadId} has no posts`);

            return {
                id: thread.id,
                comment: firstPost.comment,
                createdAt: firstPost.createdAt,
                name: thread.name
            };
        },
        isBoardLoading: (state) => (boardId: string): boolean => {
            return state.data[boardId]?.isLoading || false;
        },
    },

})