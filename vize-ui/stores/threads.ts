import {defineStore} from 'pinia';
import type {Thread} from "~/types/data";

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
            } catch (e) {
                this.data[boardCode].error = e instanceof Error ? e.message : 'Unknown error occurred'
                console.error('Failed to fetch thread data:', e)
                throw e
            } finally {
                this.data[boardCode].isLoading = false
            }
        }
    },
    getters: {
        getThreadsByBoard: (state) => (boardId: string): Thread[] => {
            return state.data[boardId]?.threads || [];
        },

        getThreadOnBoard: (state) => (boardId: string, threadId: number): Thread | undefined => {
            return state.data[boardId]?.threads.find(t => t.id === threadId);
        },

        isBoardLoading: (state) => (boardId: string): boolean => {
            return state.data[boardId]?.isLoading || false;
        },

        getBoardError: (state) => (boardId: string): string | null => {
            return state.data[boardId]?.error || null;
        }
    },

})