<template>
  <div class="landing-page">
    <div class="header">
      <h1 id="title">DEI Cello Repertoire Finder</h1>
      <p>Discover diverse cello repertoire to enrich your teaching</p>
    </div>
  <div class="search-section">
    <div class="background-slideshow"></div>
    <h2 id="search-title">Find DEI Cello Repertoire</h2>
      <div class="search-input">
        <input type="text" v-model="searchQuery" placeholder="Search by composer, piece name, or book level" />
        <button @click="search">Search</button>
      </div>
    </div>
    <div class="results-section">
      <h2>Search Results</h2>
      <div v-if="isLoading" class="loading-spinner">
        <img src="loading-spinner.gif" alt="Loading" />
      </div>
      <div v-else>
        <ul v-if="searchResults.length > 0">
          <li v-for="result in searchResults" :key="result.piece_id">
            <h3 class= "piece-results">{{ result.piece_name }}</h3>
            <p class= "piece-results"><strong>Composer:</strong> {{ getComposerName(result.composer_id) }}</p>
            <p class= "piece-results"><strong>Book Level:</strong> {{ getBookLevel(result.suzuki_book_level_id) }}</p>
            <p class= "piece-results"><strong>Is Arrangement:</strong> {{ result.isArrangment }}</p>
            <p class= "piece-results">{{ result.description }}</p>
            <a :href="result.sheet_music_url" target="_blank">Sheet Music</a>
            <a :href="result.audio_url" target="_blank">Audio</a>
          </li>
        </ul>
        <p v-else>No results found. Try a different search query.</p>
      </div>
    </div>
    <div class="footer">
      <p>&copy; 2023 DEI Cello Repertoire Finder. All rights reserved.</p>
    </div>
  </div>
</template>


<script>
export default {
  data() {
    return {
      searchQuery: '',
      searchResults: [],
      isLoading: false,
      composers: [],
      bookLevels: []
    };
  },
  created() {
    // Fetch composers and book levels data from an API
    // Replace 'apiEndpoint' with the actual endpoint URL
    fetch('apiEndpoint')
      .then(response => response.json())
      .then(data => {
        this.composers = data.composers;
        this.bookLevels = data.bookLevels;
      })
      .catch(error => {
        console.error('Error:', error);
      });
  },
  methods: {
    search() {
      // Perform search logic based on the searchQuery
      // Replace this with your own implementation or API call
      this.isLoading = true;
      // Simulating a delay for demonstration purposes
      setTimeout(() => {
        // Replace this with your own search results
        this.searchResults = [
          {
            piece_id: 1,
            piece_name: 'Piece 1',
            composer_id: 1,
            suzuki_book_level_id: 2,
            isArrangment: false,
            description: 'Description of the piece',
            sheet_music_url: 'https://example.com/piece1-sheet-music.pdf',
            audio_url: 'https://example.com/piece1-audio.mp3'
          },
          // Add more search results here
        ];
        this.isLoading = false;
              })
      .catch(error => {
        console.error('Error:', error);
        this.isLoading = false;
      });
    },
    getComposerName(composerId) {
      // Find and return the composer name based on the composerId
      const composer = this.composers.find(composer => composer.composer_id === composerId);
      return composer ? composer.composer_name : '';
    },
    getBookLevel(bookLevelId) {
      // Find and return the book level name based on the bookLevelId
      const bookLevel = this.bookLevels.find(level => level.suzuki_book_level_id === bookLevelId);
      return bookLevel ? bookLevel.suzuki_book_level : '';
    }
  }
};
</script>

<style>
/* Reset some default styles */
html, body, h1, h2, h3, p, ul {
  margin: 0;
  padding: 0;
}
#title{
  align-self: center;
}
#search-title {
  color: white;
}

body {
  font-family: Arial, sans-serif;
}

.landing-page {
  max-width: 1200px;
  margin: 0 auto;
  padding: 20px;
}

.header {
  background-color: #1a1f71;
  padding: 40px;
  text-align: center;
  color: #fff;
}

.header h1 {
  font-size: 2.5rem;
  margin-bottom: 20px;
}

.header p {
  font-size: 1.2rem;
}

.search-section {
  background-color: #1a1f71;
  padding: 40px;
  text-align: center;
}

.search-input {
  display: flex;
  align-items: center;
  justify-content: center;
  margin-top: 20px;
}

.search-input input {
  padding: 10px;
  font-size: 16px;
  border-radius: 4px;
  border: 1px solid #ccc;
  width: 100%;
  max-width: 400px;
}

.search-input button {
  margin-left: 10

  px;
  padding: 10px 20px;
  background-color: #1a1f71;
  color: #fff;
  font-size: 16px;
  border-radius: 4px;
  border: none;
  cursor: pointer;
}

.results-section {
  padding: 40px;
  text-align: left;
}

.results-section h2 {
  text-align: center;
  margin-bottom: 20px;
}

ul {
  list-style-type: none;
  padding: 0;
}

li {
  margin-bottom: 20px;
  padding: 20px;
  background-color: #1a1f71;
  border-radius: 4px;
}

.loading-spinner {
  display: flex;
  justify-content: center;
  margin-top: 40px;
}

.footer {
  text-align: center;
  padding: 20px;
  background-color: #1a1f71;
  color: #fff;
}

.piece-results {
  color: white;
}


<style>
  ...
  .search-section {
    position: relative;
    padding: 40px;
    text-align: center;
    overflow: hidden;
  }
  
  .background-slideshow {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    z-index: -1;
    background-image: url('../../assets/scroll1.jpg');
    background-size: cover;
    background-repeat: no-repeat;
    background-position: center;
    animation: slideshow 40s infinite;
  }

  @keyframes slideshow {
    0% {
      background-image: url('../../assets/CleTOursArUs.jpg');
    }
    25% {
      background-image: url('data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAkGBwgHBgkIBwgKCgkLDRYPDQwMDRsUFRAWIB0iIiAdHx8kKDQsJCYxJx8fLT0tMTU3Ojo6Iys/RD84QzQ5OjcBCgoKDQwNGg8PGjclHyU3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3N//AABEIAHoAswMBIgACEQEDEQH/xAAcAAACAgMBAQAAAAAAAAAAAAAEBQIDAAEGBwj/xAA7EAABBAECAgcECQIHAQAAAAABAAIDBBEFIRIxBhMiQVFhcVKBkaEUIzIzQnKiscEV4RYmYpLC0fAH/8QAGQEAAwEBAQAAAAAAAAAAAAAAAAEDAgQF/8QAHhEBAQEBAQADAQEBAAAAAAAAAAECEQMEEiExURP/2gAMAwEAAhEDEQA/APHmNREbMquNuUZFGsqpwx7phXiVVeNMq8W6DWQw5HJHwV/JarMwQmsEILdhuEBCvVymEFVTrw7BM4IUBXWqDA2TGGqAFZBFgBHQxpshm1ttgrGVgjmx+CtZD5IHQkdZEMhx3ItkXkrerCCtUxMxsiY41FjN0VG3bllMusazCtjwQCNxjOVzVo6uzVzah1CJlBskcTqzocl2TuQ7O3MIzo7WFGWSo2SV8fUseBI8uw4FzXY8uyFnvLw5ns6fBWAKLVILTCQWLAsQG1ixYgPjeBuUwhb3ISAckxgbusqiq8e4TWtGCgoG8k0rN3QOi60XJNK7MYQ9dmQNkzgizhBrIWYIGE0qxnbIUK8QwNkdEADhBLomDCKiaq4mk4ARkbMJspxt2V7GhYxquATJprcq1rAsYFa0IJEMVgbgLYCkdmoBRZi+qA8bDD81ZG0xayz2SZoz5k8Eg/5KvU79GjFxW7cMeJG4Y6QBzj3ADxVjrEVizVtQuzGXsd6ZDmHPn2gp7s7xTMvOm4UworaokkFi0FtAbWLSxAfIMDeSZ12JfAOSaVxyWVR9Zg2B7k2qxjOUvqM3704rM5YQDCqzkmteMFA1W8k1rjCAKhYAAjImAqiIbDKNgCbK6FuEYxqojCJYglrArmhVtGFcwpkkAptUQpNQEwl2o3Ynw2K0F6GGw2Mklzh9XtzIRFuz1EZcI3OxzwuA198esaoINPq4kJAkeG7k+ZS1eNZnXE3JJNU/qHARJLHLIBMyTLgWtJaT37uGNu5egaDrJmqUI4KVetTNQWBw8eeMFjiCSACcgcifVb1Do1BpXRi2Io4InMMc7pIo8PdJxN3J5ro9Jga7oxUjbhrQwDYYwCcH5EqWs/2q/efkP/RbCHpS9dThkI3cwE+uFdlWiFia3lV5WuJBLcrSr4liA+TKwTas1K6w5JvVasqmtQDIKb1RsEprNGyc1G4AwgGVYZTOHGcJdWOOSZweKCGRN5I2FoQsW4CMh5JkJibjkUSxDR7IhhQVXtVjSqmq1qZLGjxVg2VQKx7+FqAB1exwR8DPtvOFfpVSKvXGGjiO5PeUt3taiPZaidZ1qto8MTZQ6SaTPVwsGSccz5AeJ/ssb1nE+2r+N5zdX65DdMXf5eut7ncLf1BH6RGTocMf4jEQF550g6YWLtyvo76MMUdrtmQTlzm8OSBjhHguxOvxaU6KtZrTdSyFjjPEOPGR3t5/DKxPbG8TUv5VL47mvrz9hzpcgdWcAfsyO+BOR8iEXxJRo88Ukk/USNkikDZI3tOQRu0Ee5rUzJW8XuUtzlT4lBzsKBcq3OWmeLuNYhuM+KxB8fL1buTeqd0lrOxhOKbt0NHVXuTmoM4SWq7knFV4AGEA2rgYCZQpXWcdt0yhckQ+HYIyI7IOEjCLYQmBUZRDUIwohh3QQhpVrFQCp9YGjKYEDZB37DY43FxxsgtT1iOs3dwB8Fx2p63LcdhpLWfus2nM9dXpmo12P7TxxFcJrupyW+k2oySOyGSGGMeDWuI/cE+9bisPa8EH3pFdsPbqtmV8T2te7Z7m44j3keIyfmuH50u/GyO74XMevaoc/j6X0MnJY0Z8skj+V6pr08VUuleRxfRGcI8TggLxmhZ6zpM2YuABIAJ/M1ek9LZGvsxOD8gVY84Pqpetvj8PKvnzfyrRXQW31Wovqs+4c3iYPBz+I4+Mbj6uK7svK826LSxtpy34z2o7EfHt9lrS3f8A2ySn3L0Vxwuj4X2/4ya/rn+Zy+tsbLlBzlFzlTJJhdjkSL91iFMu6xBvmmueSa1TvzSWu8bJpWk5JE6Co7knNVwHeucqyHbdOKr9xkpg/rvGBhMYXckmrP5JlDJthIGsTzjCKZIUthfsEYx4QB0bz3omN6AZIiI3JkNEmAgr9vqonEHkFuSTASTWZ+GJw8UdNzuoWn2J3OLj5boZvmoSOAK0HqakEDHclfSmTh06Fmd3TZHoGuz+4RVqZ0VKeVjg1zI3EE9xxsuT1C5ctCB9lwk4W4Aa3HDnv9VLepPxbyxb+/4nommtuu45Gve0tB7I5b966sllX+m1HRxshk4G4BwcZGcj0BXH6QdRgkArW560bsDEcpZnB25J9qM8s9ek6aaacxZa5zjl3LmuL2k1ufa9dvn2ZvJx69q9OF2n/R4Y2Qse4sLWNDQOsBbnHq4FWaVeN7Sqlo5DpYWucDzBxuPiuS0Ppe/Xar6D6UzbsVQzPkJaGFzcY2zkEnG2E/0QdTXsVw8ObHYe5h/0PPWN+T16ObLex5282TlM3PKpkeovkwh5ZQeSpUki/fmsQRm35rEj4+coXeaY1n+aTRuwjIZcd60y6KrLnG6dVZOS5apOMjdPak3LJSDo60oON0yhf5pDXmbgbpjDMPEIM7ik80WyXsjdJY5htgoyOXYIBtHJ5olknmlbJBgbohkvmghUsmx3SXVHcTXZPII2eXDSSVzes6myNrhxb+qVOFb5MvK21wPelZuNJJyFOO2zxWVI30klMelsaDgSyta705/9JD9OjfsSPBdTcot1nSH12E9Y3ts4eZ8QF5/LQmhkMbh2hnfx/wDeHcp68M+l/arj3vnOSLrFyR1ljA7HCSG8PuTuK4+GiG2HZOc81zUccvWsEnEQHZBTG3I6aIFv4eeFj38pMTC3xt27uq6joVqra3TDT3DHBYJgkHk4bfqDV6DpVqaDW3U3Oaa8lMFm24fE8xu39OBeVdAKE+o9KabmNPVVHieZ3c0DOPicD4+C66Zuo6f/APSYrDoJDp0pMYlDOw0ytBILvzgbKnlj6xP5GprbvppMd6W2rYY7HFhETv2OFz2o2wwuyeXmqOcS/UXBxAGfcsXG2tXaLEgDtsrEG8wa7CYUqViyQWt4We27kqtJY190B7Q4YzgjK6eNbtSjKGm14QC/613i7l7gnEMUAH3TPggIkXGs9bMImxADsN+CLj6r2GpdGiIygGcfVD8Dfgio3M9kfBLIyio0yM4ntHIBEslCWMRLOSAMeWSNIe0EeCXW9I06x95WB9CUUCsdySpE56Maa77Mbh78rX+Fq2fqw0/mb/dOAd1cxB9Kq+hy18dUIvc4j+FVqOgNvA/SaMUj/bZYLHH1ON/euh5DZQyc80h1wj+gkxlYa08kcYPbZJPx5HlhmyJpdA4WSA3ZZJWfiYycNB/Rn5rtGlZ3Is7/AFrOrP4t0inS02qK+m12QQ8yBuSfEnmT5lT1Ssy7UMBIY7jje1wGcFrg4H5KFUnKud96EF39EObGfwBJtV0Orea8guhkIPbZ/ITZyrcg3mVroJqxsSGK3VezPZc7skj0wVtejFxB2JWJB//Z');
    }
    50% {
      background-image: url('data:image/jpeg;base64,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');
    }
    75% {
      background-image: url('data:image/jpeg;base64,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');
    }
    100% {
      background-image: url('data:image/jpeg;base64,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');
    }
  }

  #search-title {
    position: relative;
    color: white;
    z-index: 1;
  }

</style>