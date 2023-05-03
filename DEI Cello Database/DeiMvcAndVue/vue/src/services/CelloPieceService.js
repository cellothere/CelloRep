import axios from 'axios';

const http = axios.create({
  baseURL: 'http://localhost:9000/cello-pieces',
});

const CelloPiecesService = {
  getAllCelloPieces() {
    return http.get();
  },

  getCelloPieceById(id) {
    return http.get(`/${id}`);
  },

  createCelloPiece(celloPiece) {
    return http.post('/create', celloPiece);
  },

  updateCelloPiece(id, celloPiece) {
    return http.put(`/update/${id}`, celloPiece);
  },

  deleteCelloPiece(id) {
    return http.delete(`/delete/${id}`);
  },

  getCelloPiecesByComposerId(composerId) {
    return http.get(`/composers/${composerId}`)
  }

};

export default CelloPiecesService;