export interface Board {
    code: string;
    name: string;
}
export interface Thread {
    id: number;
    title: string;
}

export function findBoardByCode(boards: Board[], codeToFind: string): Board {
    const result = boards.find(board => board.code === codeToFind);
    if(result) return result;
    else return { code: 'g', name: 'General Discussion'}
}