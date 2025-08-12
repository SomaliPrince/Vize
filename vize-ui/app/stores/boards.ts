import type {Board} from "~/types/data";
import {defineStore} from "pinia";

interface BoardsState {
    data: Board[]
    isLoading: boolean
    error: string | null
}

export const useBoardStore = defineStore('boardList', {
    state: (): BoardsState => ({
        data: [],
        isLoading: false,
        error: null,
    }),

    actions: {
        async fetchBoardData(forceRefresh = false): Promise<Board[]> {
            if (this.data.length > 0 && !forceRefresh && !this.isLoading)
                return this.data

            if (this.isLoading) {
                while (this.isLoading) await new Promise(resolve => setTimeout(resolve, 50))
                return this.data
            }

            this.isLoading = true
            this.error = null

            try {
                const {data, error} = await useFetch<Board[]>(
                    `${useRuntimeConfig().public.backendUrl}/boards`,
                    {
                        key: 'boards',
                        server: true,
                        default: () => [] as Board[],
                    }
                )
                if (error.value) throw new Error(error.value.message || 'Failed to fetch boards')

                this.data = data.value || []
                return this.data

            } catch (e) {
                this.error = e instanceof Error ? e.message : 'Unknown error occurred'
                console.error('Failed to fetch board data:', e)
                throw e
            } finally {
                this.isLoading = false
            }
        },
    },

    getters: {
        getBoardItems: (state): Board[] => state.data,

        getBoardByCode: (state) => (code: string): Board => {
            const foundBoard = state.data.find(board => board.code === code)
            if (!foundBoard)
                throw new Error(`Board with code "${code}" not found. Available boards: ${state.data.map(b => b.code).join(', ')}`)
            else return foundBoard
        }
    }
})