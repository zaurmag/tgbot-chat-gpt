import { unlink } from 'fs/promises'

export const removeFile = async (path) => {
    try {
        await unlink(path)
    } catch (e) {
        console.error('Error while remove file', e.message)
    }
}