export default defineNuxtRouteMiddleware(async (to, from) => {
    const store = useBoardStore()
    await store.fetchBoards()
    const boardParam: string = to.params.board as string

    if (!store.boardExists(boardParam)) {
        return abortNavigation({
            statusCode: 404,
            statusMessage: `The board "${boardParam}" does not exist.`
        })
    }
})