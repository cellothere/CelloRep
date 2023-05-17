
<template>
  <div class="admin-contribute">
    <h1>Admin Database Addition</h1>
    <AddComposerWindow v-if="showModal" @close="showModal = false" @add-composer="composerId = $event"></AddComposerWindow>

    <form @submit.prevent="submitForm">
      <div class="form-group">
        <label for="pieceName">Piece Name: (Required)</label>
        <input type="text" id="pieceName" v-model="pieceName" required class="form-control" />
      </div>
      <div class="form-group">
        <label for="composer">Composer: (Required)</label>
        <input type="text" id="composer" v-model="composerName" required class="form-control" />
      </div>
      <div class="form-group">
        <label for="coverImage">Cover Image:</label>
        <input type="text" id="coverImage" v-model="coverImage" class="form-control" />
      </div>
      <div class="form-group">
        <label for="whereToBuyOrDownload">Where can we find, buy, or download this piece? (Required)</label>
        <input type="text" id="whereToBuyOrDownload" v-model="whereToBuyOrDownload" required class="form-control" />
      </div>
      <div class="form-group">
        <label for="description">Description: (Required)</label>
        <textarea id="description" v-model="description" required class="form-control"></textarea>
      </div>
      <div class="form-group">
        <label for="suzukiBookLevel">Approximate Suzuki Book Level:</label>
        <select id="suzukiBookLevel" v-model="suzukiBookLevelId" class="form-control">
          <option value="">Select Book Level</option>
          <option v-for="level in suzukiBookLevels" :value="level.value" :key="level.value">{{ level.label }}</option>
        </select>
      </div>
      <div class="form-group">
        <label for="technicalOverview">Technical Overview:</label>
        <textarea id="technicalOverview" v-model="technicalOverview" class="form-control"></textarea>
      </div>
      <div class="form-group">
        <label for="audioLink">Audio Link:</label>
        <input type="text" id="audioLink" v-model="audioLink" class="form-control" />
      </div>

      <div class="form-group">
        <label for="duration">Duration: </label>
        <div class="duration-input">
          <input type="text" id="hours" v-model="duration.hours" maxlength="2" @input="formatDuration"
            class="form-control duration-input-field" placeholder="hour" />
          <span>:</span>
          <input type="text" id="minutes" v-model="duration.minutes" maxlength="2" @input="formatDuration"
            class="form-control duration-input-field" placeholder="minute" />
          <span>:</span>
          <input type="text" id="seconds" v-model="duration.seconds" maxlength="2" @input="formatDuration"
            class="form-control duration-input-field" placeholder="second" />
        </div>
      </div>
      <div class="form-check">
  <label for="arrangement" class="form-check-label">
    Is this an Arrangement?
  </label>
  <div>
    <button
      type="button"
      class="btn btn-outline-primary"
      :class="{ active: arrangement === false }"
      @click="arrangement = false"
    >
      No
    </button>
    <button
      type="button"
      class="btn btn-outline-primary"
      :class="{ active: arrangement === true }"
      @click="arrangement = true"
    >
      Yes
    </button>
  </div>

</div>
      <div class="form-group">
        <label for="publicDomain" class="form-check-label">
          Is this Piece in public domain?
        </label>
        <div>
          <button type="button" class="btn btn-outline-primary" :class="{ active: publicDomain === false }"
            @click="publicDomain = false">
            No
          </button>
          <button type="button" class="btn btn-outline-primary" :class="{ active: publicDomain === true }"
            @click="publicDomain = true">
            Yes
          </button>
        </div>
      </div>
      <div class="form-group">
        <label for="publisherInfo">Publisher Info: (Required)</label>
        <input type="text" id="publisherInfo" v-model="publisherInfo" required class="form-control" />
      </div>
      <button type="submit" class="btn btn-primary">Submit</button>
      <span><p>{{ successMessage }}</p></span>
    </form>
  </div>
</template>
<script>

import emailjs from "emailjs-com";
import CelloPiecesService from "../services/CelloPieceService";
import CelloComposerService from "../services/CelloComposerService";
import AddComposerWindow from '../components/AddComposerWindow.vue';


export default {
  name: "Contribute",
  components: {
  AddComposerWindow,
},
  data() {
    return {

      successMessage: "",
      pieceName: "",
      composerId: "",
      composerName: "",
      suzukiBookLevelId: "",
      showModal: false,
      audioLink: "",
      sheetMusicLink: "",
      publisherInfo: "",
      description: "",
      technicalOverview: "",
      whereToBuyOrDownload: "",
      duration: {
        hours: "",
        minutes: "",
        seconds: ""
      },
      coverImage: "",
      arrangement: false,
      publicDomain: false,
      suzukiBookLevels: [
        { value: 1, label: "Book 1" },
        { value: 2, label: "Book 2" },
        { value: 3, label: "Book 3" },
        { value: 4, label: "Book 4" },
        { value: 5, label: "Book 5" },
        { value: 6, label: "Book 6" },
        { value: 7, label: "Book 7" },
        { value: 8, label: "Book 8" },
        { value: 9, label: "Book 9" },
        { value: 10, label: "Professional" }
      ]
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

    async getComposerId() {
      try {
        const response = await CelloComposerService.getComposerIdByComposerName(
          this.composerName
        );
        this.composerId = response.data; // Update composerId with the retrieved value
      } catch (error) {
        this.promptNewComposer();
        console.error("Error retrieving composer ID: ", error);
      }
    },

    formatDuration() {
      const hours = this.duration.hours || "";
      const minutes = this.duration.minutes || "";
      const seconds = this.duration.seconds || "";

      // Restrict hours, minutes, and seconds to two digits
      const formattedHours = hours.slice(0, 2);
      const formattedMinutes = minutes.slice(0, 2);
      const formattedSeconds = seconds.slice(0, 2);

      // Update the duration with the formatted string
      this.duration = {
        hours: formattedHours,
        minutes: formattedMinutes,
        seconds: formattedSeconds
      };
    },

    submitForm() {
      this.getComposerId()
        .then(() => {
          const formattedDuration = `${this.duration.hours.padStart(2, "0")}:${this.duration.minutes.padStart(
            2,
            "0"
          )}:${this.duration.seconds.padStart(2, "0")}`;

          const celloPiece = {
            pieceName: this.pieceName,
            composerId: this.composerId,
            coverImage: this.coverImage,
            whereToBuyOrDownload: this.whereToBuyOrDownload,
            description: this.description,
            technicalOverview: this.technicalOverview,
            audioLink: this.audioLink,
            duration: formattedDuration,
            arrangement: this.arrangement,
            publicDomain: this.publicDomain,
            publisherInfo: this.publisherInfo,
            suzukiBookLevelId: this.suzukiBookLevelId
          };
          // Call the createCelloPiece method from the CelloPiecesService
          CelloPiecesService.createCelloPiece(celloPiece)
            .then((response) => {
              console.log("Cello piece created:", response.data);
              this.successMessage = "Piece Submitted Successfully!";
              this.resetForm();
              setTimeout(() => {
                this.successMessage = "";
              }, 5000);
            })
            .catch((error) => {
              console.error("Error creating cello piece:", error);
            });
        })
        .catch((error) => {
          console.error("Error retrieving composer ID:", error);
        });
    },
    resetForm() {
      this.pieceName = "";
      this.composerName = "";
      this.suzukiBookLevelId = "";
      this.description = "";
      this.technicalOverview = "";
      this.audioLink = "";
      this.duration = "";
      this.whereToBuyOrDownload = "";
      this.publisherInfo = "";
      this.coverImage = "";
      this.publicDomain = false;
      this.arrangement = false;
  },

  promptNewComposer() {
      const newComposer = this.composerName.trim();

      if (newComposer === "") {
        console.error("Composer name cannot be empty");
        return;
      }
      // Show the AddComposerWindow modal
      this.showModal = true;
    },
},

}
</script>
  
<style scoped>

@import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap');
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
  margin-right: 7rem;
  margin-left: 1rem;
}

.form-check {
  margin-bottom: 1rem;
  margin-right: 7rem;
  margin-left: 1rem;
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

.btn {
  padding: 0.5rem 1rem;
  font-size: 1rem;
  border: none;
  border-radius: 0.25rem;
  cursor: pointer;
  background-color: #007bff;
  color: #fff;
  transition: all 0.3s ease;
  box-shadow: 0 5px 15px rgba(0,0,0,0.2);
  margin-right: 1rem;
}

.btn:hover {
  background-color: #0056b3;
  transform: translateY(-2px);
}

.btn:active {
  transform: translateY(0);
  box-shadow: 0 3px 10px rgba(0,0,0,0.2);
}

.btn-outline-primary {
  border: 1px solid #007bff;
  background-color: transparent;
  color: #007bff;
}

.btn-outline-primary:hover {
  background-color: #007bff;
  color: #fff;
}

.btn-outline-primary.active {
  background-color: #0056b3;
  color: #fff;
}

.duration-input {
  display: flex;
  flex-wrap: wrap;
  align-content: center;
}

.duration-input-field {
  flex: 1;
  margin-right: 0.5rem;
  max-width: 50px;
}
p {
  font-family: Poppins;
  font-size: 20px;
}


</style>
