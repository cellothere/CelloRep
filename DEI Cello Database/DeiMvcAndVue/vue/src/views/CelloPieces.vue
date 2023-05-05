<template>
  <div class="cello-pieces-container">
    <h1>Discover Repertoire</h1>
    <div class="search-input">
      <input type="text" v-model="searchQuery" placeholder="Search" />
    </div>
    <div class="filter-bar">
      <button
        v-for="level in suzukiBookLevels"
        :key="level.id"
        @click="setSelectedLevel(level.id)"
        :class="{ 'active': selectedLevel === level.id }"
        :style="{ backgroundColor: level.color }"
        class="filter-button"
      >{{ level.name }}
      </button>
    </div>
    <div class="cello-pieces-list">
      <cello-piece-card
        v-for="(piece) in filteredCelloPieces.slice(0, numVisibleCards)"
        :key="piece.pieceId"
        :piece="piece"
        :composerNames="composerNames"
      />
    </div>
    <div class="show-more">
      <button v-if="numVisibleCards < filteredCelloPieces.length" class="show-more-button" @click="showMoreCards">
        Show More
      </button>
      <button v-if="numVisibleCards > 12" class="show-more-button" @click="showLessCards">
        Show Less
      </button>
    </div>
  </div>
</template>

<script>
import CelloComposerService from '../services/CelloComposerService';
import CelloPiecesService from '../services/CelloPieceService';
import CelloPieceCard from '../components/CelloPieceCard.vue';

export default {
  components: {
    CelloPieceCard,
  },
  data() {
    return {
      celloPieces: [],
      searchQuery: '',
      composerNames: {},
      suzukiBookLevels: [
        { id: 1, name: 'Book 1', color: 'green' },
        { id: 2, name: 'Book 2', color: 'green' },
        { id: 3, name: 'Book 3', color: 'green' },
        { id: 4, name: 'Book 4', color: 'green' },
        { id: 5, name: 'Book 5', color: 'green' },
        { id: 6, name: 'Book 6', color: 'green' },
        { id: 7, name: 'Book 7', color: 'green' },
        { id: 8, name: 'Book 8', color: 'green' },
        { id: 9, name: 'Book 9+', color: 'green' },
      ],
      selectedLevel: null,
      numVisibleCards: 12,
    };
  },
  computed: {
    filteredCelloPieces() {
      if (!this.searchQuery) {
        return this.celloPieces.filter(
          piece => !this.selectedLevel || piece.suzukiBookLevelId === this.selectedLevel
        );
      }
      const query = this.searchQuery.toLowerCase();
      return this.celloPieces.filter(
        piece =>
          (piece.pieceName.toLowerCase().includes(query) ||
            this.composerNames[piece.composerId].toLowerCase().includes(query)) &&
          (!this.selectedLevel || piece.suzukiBookLevelId === this.selectedLevel)
      );
    },
  },
  created() {
    this.fetchCelloPieces();
  },
  methods: {
    fetchCelloPieces() {
      CelloPiecesService.getAllCelloPieces()
              .then(response => {
        this.celloPieces = response.data;
        this.fetchComposerNames();
      })
      .catch(error => {
        console.error('Error fetching cello pieces:', error);
      });
    },
    fetchComposerNames() {
      const composerIds = this.celloPieces.map(piece => piece.composerId);
      composerIds.forEach(id => {
        CelloComposerService.getComposerById(id)
          .then(response => {
            const composer = response.data;
            this.$set(this.composerNames, id, composer.composerName);
          })
          .catch(error => {
            console.error('Error fetching composer:', error);
            this.$set(this.composerNames, id, 'Unknown Composer');
          });
      });
    },
    setSelectedLevel(level) {
      if (this.selectedLevel === level) {
        // Clear the filter
        this.selectedLevel = null;
      } else {
        // Set the selected filter
        this.selectedLevel = level;
      }
    },
    showMoreCards() {
      this.numVisibleCards += 12;
    },
    showLessCards() {
      this.numVisibleCards = 12;
    },
  },
};
</script>

<style>
.cello-pieces-container {
  max-width: 800px;
  margin: 0 auto;
  padding: 40px;
}

h1 {
  font-size: 2rem;
  margin-bottom: 20px;
  text-align: center;
}

.search-input {
  display: flex;
  justify-content: center;
  margin-bottom: 20px;
}

.search-input input {
  padding: 10px;
  font-size: 16px;
  border: 1px solid #ccc;
  border-radius: 4px;
  width: 100%;
  max-width: 400px;
}

.filter-bar {
  display: flex;
  justify-content: center;
  margin-bottom: 20px;
}

.filter-button {
  padding: 10px;
  font-size: 16px;
  border: none;
  border-radius: 4px;
  margin-right: 10px;
  cursor: pointer;
}

.filter-button.active {
  background-color: #888;
  color: white;
}

.cello-pieces-list {
  display: flex;
  flex-wrap: wrap;
}

.cello-piece-card {
  flex-basis: 30%;
  background-color: #f8f8f8;
  border-radius: 4px;
  padding: 10px;
  margin-bottom: 20px;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
  transition: box-shadow 0.3s ease;
}

.cello-piece-card:hover {
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.15);
}

.cello-piece-card h3 {
  margin-bottom: 5px;
}

.cello-piece-card p {
  margin-bottom: 3px;
}

.show-more {
  display: flex;
  justify-content: center;
  margin-top: 20px;
}

.show-more-button {
  padding: 10px;
  font-size: 16px;
  border: none;
  border-radius: 4px;
  background-color: #888;
  color: white;
  cursor: pointer;
  margin-right: 10px;
}

.show-more-button:hover {
  background-color: #555;
}
@media screen and (max-width: 600px) {
  .cello-pieces-container {
    padding: 20px;
  }

  .filter-bar{
    display: none;
  }

  h1 {
    font-size: 1.5rem;
  }

  .search-input input {
    font-size: 14px;
  }

  .filter-button {
    font-size: 14px;
    padding: 8px;
  }

  .cello-pieces-list {
    justify-content: space-between;
  }

  .cello-piece-card {
    flex-basis: 100%;
    margin-bottom: 15px;
  }
}



</style>