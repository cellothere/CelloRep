<template>
  <div>
    <div class="composerInfo">
        <h2>{{ composer.composerName }}</h2>
        <article class="bio">{{ composer.composerBio}}</article>
        <a :href="composer.wikipediaLink" target="_blank" rel="noopener noreferrer">Wikipedia Article</a>
    </div>

    <h3>Cello Works by {{ composer.composerName }}:</h3>
    <div class="list-of-pieces">
        <cello-piece-card v-for="piece in celloPieces" :key="piece.id" :piece="piece" :composerNames="composerNames"/>
    </div>
  </div>
</template>

<!-- ... Remaining script and style sections ... -->


<script>

import composerService from "../services/CelloComposerService";
import celloPieceService from "../services/CelloPieceService";
import celloPieceCard from '../components/CelloPieceCard.vue';

export default {
    components: {
  celloPieceCard,
},
data() {
  return {
    composer: {},
    composerNames: {}, 
    celloPieces: [],
  };
},

created() {
  const composerId = this.$route.params.id;
  this.fetchComposer(composerId);
  this.fetchCelloPieces(composerId);
},

methods: {
  fetchComposer(id) {
    composerService.getComposerById(id)
      .then(response => {
        this.composer = response.data;
      })
      .catch(error => {
        console.error("Error fetching composer:", error);
      });
  },
  fetchCelloPieces(composerId) {
    celloPieceService.getCelloPiecesByComposerId(composerId)
      .then(response => {
        this.celloPieces = response.data;
      })
      .catch(error => {
        console.error("Error fetching cello pieces:", error);
      });
  },
},
}
</script>

<style>
/* General style */
body {
  font-family: 'Roboto', sans-serif;
  color: #333;
  line-height: 1.6;
  background-color: #f9f9f9;
}

.container {
  max-width: 1100px;
  margin: 0 auto;
  padding: 0 2rem;
  text-align: center;
}

/* Composer info */
.composerInfo {
  padding: 2rem 0;
  background-color: #fff;
  box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
  margin-bottom: 2rem;
  border-radius: 5px;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center; /* Center horizontally */
  text-align: center; /* Center text horizontally */
}

.composerInfo h2 {
  font-size: 2.5rem;
  margin-bottom: 0.5rem;
}

.composerInfo p {
  font-size: 1.1rem;
}

/* Cello pieces title */
h3 {
  font-size: 1rem;
  margin-bottom: 1.5rem;
  text-align: center;
}

/* Cello piece cards */
.cello-piece-card {
  background-color: #fff;
  box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
  padding: 1rem 2rem;
  margin-bottom: 1.5rem;
  border-radius: 5px;
  display: flex;
  justify-content: space-between;
  align-items: center;
  flex-wrap: wrap;
}

.cello-piece-card:hover {
  transform: translateY(-5px);
  box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.2);
  transition: all 0.3s;
}

.bio {
    margin-left: 2%;
    margin-right: 2%;
}

.list-of-pieces {
    display: flex;
    margin: 2%;
    align-content: center;
    justify-content: center;
    flex-wrap: wrap;
}
</style>