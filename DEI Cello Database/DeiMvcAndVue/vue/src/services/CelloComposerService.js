import axios from 'axios';

const http = axios.create({
  baseURL: "http://localhost:9000/composers"
});

export default {
  getAllComposers() {
      return http.get();
  },
  getComposerById(id) {
    return http.get(`/${id}`);
  },

  addComposer(composer) {
    return http.post('/create', composer);
  },

  updateComposer(id, composer) {
    return http.put(`/update/${id}`, composer);
  },

  deleteComposer(id) {
    return http.delete(`/delete/${id}`);
  },

};
