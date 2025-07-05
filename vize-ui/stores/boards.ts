import type {Board} from "~/types/data";
import {defineStore} from "pinia";

interface BoardsState {
    data: Board[] | null // Initialize as null or empty array
    isLoading: boolean
    error: any
}

export const useBoardStore = defineStore('boardList', {
    state: (): BoardsState => ({
        data: null,
        isLoading: false,
        error: null,
    }),
    actions: {
        async fetchBoardData() {
            if (this.data || this.isLoading) return this.data

            this.isLoading = true
            this.error = null
            try {

                const {data, error}
                    = await useFetch<Board[]>(useRuntimeConfig().public.backendUrl.concat('/boards'), {
                    key: 'boards',
                    server: true,
                })

                if (error.value) throw error.value

                this.data = data.value
                return this.data

            } catch (e) {
                this.error = e
                console.error('Failed to fetch board data:', e)
                return null
            } finally {
                this.isLoading = false
            }
        },
    },
    getters: {
        getBoardItems(state): Board[] {
            return state.data || []
        }
    }
})