<template>
    <div class="new-addition-banner">
      <img :src="piece.coverImage" alt="Composer" class="piece-img">
      <router-link :to="getPieceOverview(piece.pieceId)">{{ piece.pieceName }}</router-link>
  
      <router-link :to="getComposerPageLink(piece.composerId)" @click="emitComposerClicked">
        {{ composerNames[piece.composerId] }}
      </router-link>
  
      <p class="book-level">Book Level: {{ piece.suzukiBookLevelId }}</p>
  
      <button class="overview-button" @click="$router.push(getPieceOverview(piece.pieceId))">Overview</button>
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
    },
    methods: {
      getComposerPageLink(composerId) {
        return `/composers/${composerId}`;
      },
      emitComposerClicked() {
        this.$emit("composer-clicked", this.piece.composerId);
      },
      getPieceOverview(id) {
          return `/pieces/${id}`
      }
    }
    
  };
  </script>
  
  <style scoped>
  .new-addition-banner {
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
    width: 100%;
  }
  
  .new-addition-banner:hover {
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.15);
  }
  
  .new-addition-banner h3 {
    margin-bottom: 5px;
    font-size: 1rem;
  }
  
  .new-addition-banner p {
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
  
  .piece-img {
    width: 5rem;
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
  
  .new-addition-banner a {
    color: black;
    text-decoration: underline;
  }
  
  .new-addition-banner a:visited {
    color: black;
  }
  
  </style>
  