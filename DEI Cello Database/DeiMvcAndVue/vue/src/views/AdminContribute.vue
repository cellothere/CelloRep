
<template>
    <div class="admin-contribute">
      <h1>Admin Database Addition</h1>
      <p>

      </p>
      <form @submit.prevent="submitForm">
        <div class="form-group">
          <label for="pieceName">Piece Name: (Required)</label>
          <input type="text" id="pieceName" v-model="pieceName" required class="form-control" />
        </div>
        <div class="form-group">
          <label for="composer">Composer: (Required)</label>
          <input type="text" id="composer" v-model="composer" required class="form-control" />
        </div>
        <div class="form-group">
            <label for="coverImage">Cover Image:</label>
            <input
              type="text"
              id="coverImage"
              v-model="coverImage"
              required
              class="form-control"
            />
          </div>
        <div class="form-group">
          <label for="whereToBuyOrDownload">Where can we find, buy, or download this piece? (Required)</label>
          <input type="text" id="whereToBuyOrDownload" v-model="whereToBuyOrDownload" required class="form-control" />
        </div>
        <div class="form-group">
          <label for="description">Description: (Optional)</label>
          <textarea id="description" v-model="description" class="form-control"></textarea>
        </div>
        <div class="form-group">
            <label for="technicalOverview">Technical Overview:</label>
            <textarea
              id="technicalOverview"
              v-model="technicalOverview"
              class="form-control"
            ></textarea>
          </div>
        <div class="form-group">
            <label for="audioLink">Audio Link:</label>
            <input
              type="text"
              id="audioLink"
              v-model="audioLink"
              class="form-control"
            />
          </div>
  
        <div class="form-group">
            <label for="duration">Duration:</label>
            <input
              type="text"
              id="duration"
              v-model="duration"
              class="form-control"
            />
          </div>
          <div class="form-check">
            <input
              type="checkbox"
              id="arrangement"
              v-model="arrangement"
              class="form-check-input"
            />
            <label for="arrangement" class="form-check-label">
              Is This an Arrangement?
            </label>
          </div>
          <div class="form-check">
            <input
              type="checkbox"
              id="publicDomain"
              v-model="publicDomain"
              class="form-check-input"
            />
            <label for="publicDomain" class="form-check-label">
              Public Domain?
            </label>
          </div>
          <div class="form-group">
            <label for="publisherInfo">Publisher Info:</label>
            <input
              type="text"
              id="publisherInfo"
              v-model="publisherInfo"
              class="form-control"
            />
          </div>
        <button type="submit" class="btn btn-primary">Submit</button>
      </form>
    </div>
  </template>
  <script>
  import emailjs from "emailjs-com";
  import CelloPiecesService from "../services/CelloPieceService";
  
  
  export default {
    name: "Contribute",
    data() {
  return {
    pieceName: "",
    composerId: "",
    suzukiBookLevelId: "",
    audioLink: "",
    sheetMusicLink: "",
    publisherInfo: "",
    description: "",
    technicalOverview: "",
    whereToBuyOrDownload: "",
    duration: "",
    coverImage: "",
    arrangement: false,
    publicDomain: false
  };
},
    created() {
      emailjs.init("zxjhLDmpRSIw4Gqlu");
    },
    methods: {
      sendEmail(celloPiece) {
        // Email template parameters
        const templateParams = {
          pieceName: celloPiece.pieceName,
          composer: celloPiece.composer,
          whereToBuyOrDownload: celloPiece.whereToBuyOrDownload,
          description: celloPiece.description,
        };
  
        // Send the email using EmailJS
        emailjs
          .send("service_ytjldce", "template_qw94mwl", templateParams, "zxjhLDmpRSIw4Gqlu")
          .then(
            (response) => {
              console.log("Email sent", response.status, response.text);
            },
            (error) => {
              console.log("Email not sent...", error);
            }
          );
      },
      submitForm() {
        const celloPiece = {
  pieceName: this.pieceName,
  composerId: this.composer,
  coverImage: this.coverImage,
  whereToBuyOrDownload: this.whereToBuyOrDownload,
  description: this.description,
  technicalOverview: this.technicalOverview,
  audioLink: this.audioLink,
  duration: this.duration,
  arrangement: this.arrangement,
  publicDomain: this.publicDomain,
  publisherInfo: this.publisherInfo
};

  // Call the createCelloPiece method from the CelloPiecesService
  CelloPiecesService.createCelloPiece(celloPiece)
    .then(response => {
      // Handle the successful creation of the cello piece
      console.log('Cello piece created:', response.data);
      // Optionally, show a success message to the user
    })
    .catch(error => {
      // Handle any errors that occurred during the creation
      console.error('Error creating cello piece:', error);
      // Optionally, show an error message to the user
    });
}
    }
  }
  </script>
  
  <style scoped>
  .contribute {
    max-width: 1000px;
    margin: 0 auto;
    padding: 2rem;
    font-family: Arial, sans-serif;
  }
  
  h1 {
    margin-bottom: 1rem;
    font-size: 2rem;
  }
  
  .form-group {
    margin-bottom: 1rem;
  }
  
  label {
    display: block;
    margin-bottom: 0.5rem;
    font-size: 1.25rem;
  }
  
  .form-control {
    display: block;
    width: 100%;
    padding: 0.5rem;
    font-size: 1rem;
    border: 1px solid #ccc;
    border-radius: 0.25rem;
  }
  
  .form-check {
    display: block;
    margin-bottom: 1rem;
  }
  
  .form-check-input {
    margin-right: 0.5rem;
    appearance: none;
    border: 1px solid #ccc;
    width: 1.2rem;
    height: 1.2rem;
    border-radius: 0.2rem;
    display: inline-block;
    position: relative;
    cursor: pointer;
  }
  
  .form-check-input::before {
    content: "";
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    width: 0.6rem;
    height: 0.6rem;
    background-color: #fff;
    border-radius: 0.1rem;
    border: 1px solid #ccc;
    box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
  }
  
  .form-check-input:checked::before {
    content: "\2713";
    color: #fff;
    font-size: 0.8rem;
    line-height: 0.8rem;
    text-align: center;
    background-color: #3c3;
    border: 1px solid #3c3;
  }
  
  .btn {
    padding: 0.5rem 1rem;
    font-size: 1rem;
    border: none;
    border-radius: 0.25rem;
    cursor: pointer;
    background-color: #007bff;
    color: #fff;
    transition: background-color 0.2s;
  }
  
  .btn:hover {
    background-color: #0056b3;
  }
  </style>