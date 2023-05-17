<template>
    <div class="modal">
      <div class="modal-content">
        <h2>Add a new composer</h2>
        <label for="composerName">Composer Name:</label>
        <input v-model="newComposer.composerName" type="text" id="composerName" />
  
        <label for="composerBio">Composer Biography:</label>
        <textarea v-model="newComposer.composerBio" id="composerBio"></textarea>
  
        <label for="wikipediaLink">Wikipedia Link:</label>
        <input v-model="newComposer.wikipediaLink" type="text" id="wikipediaLink" />
  
        <button @click="addComposer">Add Composer</button>
        <button @click="closeModal">Close</button>
  
        <p v-if="errorMessage" class="error-message">{{ errorMessage }}</p>
      </div>
    </div>
  </template>
  
  <script>
  import composerService from '../services/CelloComposerService'
  
  export default {
    data() {
      return {
        // showModal: true,
        newComposer: {
          composerName: '',
          composerBio: '',
          wikipediaLink: ''
        },
        errorMessage: ''
      };
    },
    methods: {
      addComposer() {
        if (!this.validateForm()) {
          this.errorMessage = 'Please fill in all required fields.';
          return;
        }
  
        composerService
          .addComposer(this.newComposer)
          .then(response => {
            // Handle success, e.g., show a success message and update composer list
            console.log('Composer added successfully:', response.data);
            this.resetComposer();
            this.closeModal();
          })
          .catch(error => {
            // Handle error, e.g., display an error message
            console.error('Error adding composer:', error);
            this.errorMessage = 'Failed to add composer. Please try again.';
          });
      },
      validateForm() {
        // Perform validation here and return true if the form is valid, false otherwise
        // Example validation: Ensure required fields are filled
        return (
          this.newComposer.composerName.trim() !== ''
        );
      },
      resetComposer() {
        this.newComposer = {
          composerName: '',
          composerBio: '',
          wikipediaLink: ''
        };
      },
      closeModal() {
      this.$emit('close');
    }
    }
  };
  </script>
  
  <style scoped>
  .modal {
    position: fixed;
    z-index: 9998;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, .5);
    display: flex;
    justify-content: center;
    align-items: center;
  }
  
  .modal-content {
    background: white;
    padding: 20px;
    border-radius: 5px;
    width: 50%;
    max-width: 500px;
  }
  
  .error-message {
    color: red;
    margin-top: 10px;
  }
  </style>
  