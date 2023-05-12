<template>
  <div class="cello-piece-overview">
    <h1>Overview</h1>
    <div class="piece-info">
      <div class="left-column">
        <img :src="celloPiece.coverImage" alt="Cello Piece Cover" class="piece-image" />
      </div>
      <div class="right-column">
        <h2>{{ celloPiece.pieceName }}</h2>
        <div class="composer">{{ composer.name }}</div>
        <div class="detail-row">
          <strong>Composer:</strong>
          <router-link :to="getComposerPageLink(celloPiece.composerId)">{{ composer.composerName }}</router-link>
        </div>
        <div class="detail-row">
          <strong>Suzuki Book Level (approx):</strong>
          <span>{{ celloPiece.suzukiBookLevelId }}</span>
        </div>
        <div class="detail-row">
          <strong>Audio Link:</strong>
          <a :href="celloPiece.audioLink" target="_blank">Listen</a>
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
      <span>
        <a v-for="(link, index) in getLinksArray(celloPiece.whereToBuyOrDownload)" :key="index" :href="addProtocol(link)" target="_blank">
  {{ link }}<span v-if="index < getLinksArray(celloPiece.whereToBuyOrDownload).length - 1">, </span>
</a>
      </span>
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
        <div class="detail-row">
          <strong>Publisher Info:</strong>
          <span>{{ celloPiece.publisherInfo }}</span>
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
  },
  methods: {
    getComposerPageLink(composerId) {
      return `/composers/${composerId}`;
    },
    emitComposerClicked() {
      this.$emit("composer-clicked", this.piece.composerId);
    },
    // This does not yet remove the string
    getLinksArray(linksString) {
      return linksString.split(',').map(link => link.trim().replace(/,$/, ''));
    },
    addProtocol(url) {
    if (!/^https?:\/\//i.test(url)) {
      url = 'http://' + url;
    }
    return url;
  }
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

.piece-image {
  max-width: 100%;
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

