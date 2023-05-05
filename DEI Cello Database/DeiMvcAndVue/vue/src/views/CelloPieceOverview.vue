<template>
  <div class="cello-piece-overview">
    <h1>Overview</h1>
    <div class="piece-info">
      <div class="left-column">
        <img src="https://via.placeholder.com/300x400" alt="Cello Piece Cover" />
      </div>
      <div class="right-column">
        <h2>{{ celloPiece.pieceName }}</h2>
        <div class="composer">{{ composer.name }}</div>
        <div class="detail-row">
          <strong>Suzuki Book Level:</strong>
          <span>{{ celloPiece.suzukiBookLevelId }}</span>
        </div>
        <div class="detail-row">
          <strong>Audio Link:</strong>
          <a :href="celloPiece.audioLink">Listen</a>
        </div>
        <div class="detail-row">
          <strong>Publisher Info:</strong>
          <span>{{ celloPiece.publisherInfo }}</span>
        </div>
        <div class="detail-row">
          <strong>Description:</strong>
          <span>{{ celloPiece.description }}</span>
        </div>
        <div class="detail-row">
          <strong>Technical Overview:</strong>
          <span>{{ celloPiece.technicalOverview }}</span>
        </div>
        <div class="detail-row">
          <strong>Where to Buy or Download:</strong>
          <span>{{ celloPiece.whereToBuyOrDownload }}</span>
        </div>
        <div class="detail-row">
          <strong>Duration:</strong>
          <span>{{ celloPiece.duration }}</span>
        </div>
        <div class="detail-row">
          <strong>Is This an Arrangement? </strong>
          <span>{{ celloPiece.arrangement ? 'Yes' : 'No' }}</span>
        </div>
        <div class="detail-row">
          <strong>Public Domain:</strong>
          <span>{{ celloPiece.publicDomain ? 'Yes' : 'No' }}</span>
        </div>
      </div>
    </div>
  </div>
</template>


<script>
import celloComposerService from '../services/CelloComposerService';
import celloPiecesService from '../services/CelloPieceService';

export default {
  name: 'CelloPieceOverview',
  data() {
    return {
      celloPiece: {},
      composer: {}
    };
  },
  created() {
    let id = this.$route.params.id;
    celloPiecesService.getCelloPieceById(id)
      .then(response => {
        this.celloPiece = response.data;
        let composerId = this.celloPiece.composerId;
        return celloComposerService.getComposerById(composerId);
      })
      .then(response => {
        this.composer = response.data;
      })
      .catch(error => {
        console.log(error);
      })
  }
};
</script>

<style scoped>
.cello-piece-overview {
  max-width: 1000px;
  margin: 0 auto;
  padding: 2rem;
  font-family: Arial, sans-serif;
}

h1 {
  margin-bottom: 1rem;
  font-size: 2rem;
}

h2 {
  font-size: 1.5rem;
  margin-bottom: 0.5rem;
}

.piece-info {
  display: flex;
  flex-wrap: wrap;
}

.left-column {
  flex: 0 0 300px;
  margin-right: 1rem;
}

.right-column {
  flex: 1;
}

.composer {
  margin-bottom: 1rem;
  font-size: 1.25rem;
  font-weight: bold;
}

.detail-row {
  margin-bottom: 0.5rem;
}

strong {
  margin-right: 0.5rem;
}

a {
  color: #0099cc;
  text-decoration: none;
}

a:hover {
  text-decoration: underline;
}
</style>

