<template>
  <div class="cello-piece-card">
    <img src="https://static.alfred.com/cache/c3/73/c373b66d76600d945e94da44f068041d.jpg" alt="Composer" class="composer-img">
    <h3>{{ piece.pieceName }}</h3>

    <router-link :to="getComposerPageLink(piece.composerId)" @click="emitComposerClicked">
      {{ composerNames[piece.composerId] }}
      Composer
    </router-link>

    <p class="book-level">Book Level: {{ piece.suzukiBookLevelId }}</p>

    <button class="overview-button">Overview</button>
  </div>
</template>

<script>
export default {
  props: {
    piece: {
      type: Object,
      required: true,
    },
    composerNames: {
      type: Object,
      required: true,
    },
    composerImages: {
      type: Object,
      required: true,
    },
  },
  methods: {
    getComposerPageLink(composerId) {
      return `/composers/${composerId}`;
    },
    emitComposerClicked() {
      this.$emit("composer-clicked", this.piece.composerId);
    }
  }
  
};
</script>

<style scoped>
.cello-piece-card {
  background-color: #fff;
  border: 1px solid #eaeaea;
  border-radius: 4px;
  padding: 10px;
  margin-bottom: 10px;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
  transition: box-shadow 0.3s ease;
  display: flex;
  flex-direction: column;
  align-items: center;
  text-align: center;
  height: 20rem;
}

.cello-piece-card:hover {
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.15);
}

.cello-piece-card h3 {
  margin-bottom: 5px;
  font-size: 1rem;
}

.cello-piece-card p {
  margin-bottom: 3px;
  font-size: 1rem;
}

.composer {
  color: #888;
  font-size: 10px;
}

.book-level {
  color: #666;
}

.composer-img {
  width: 6rem;
  height: 100px;
  margin-bottom: 10px;
}

  .overview-button {
    background-color: #114D97;
    color: #fff;
    border: none;
    border-radius: 4px;
    padding: 8px 16px;
    font-size: 1rem;
    margin-top: 1px;
    cursor: pointer;
    transition: background-color 0.3s ease;
  }

  .overview-button:hover {
    background-color: green;
  }
</style>