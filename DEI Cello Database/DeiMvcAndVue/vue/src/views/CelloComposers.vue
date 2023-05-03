<template>
  <div>
    <h1>Cello Composers</h1>
    <ul>
      <li v-for="composer in composers" :key="composer.composerId">
        {{ composer.composerName }} - {{ composer.composerBio }}
      </li>
    </ul>
  </div>
</template>

<script>
import celloComposerService from '../services/CelloComposerService';

export default {
  data() {
    return {
      composers: [],
    };
  },
  created() {
    celloComposerService.getAllComposers().then(response => {
      this.composers = response.data;
    })
  },
  methods: {
}
};
</script>