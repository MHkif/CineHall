<template>
  <div class="home bg-gray-900 h-full">
    <NavbarComponent />

    <!-- Movies -->

    <section class="p-6 md:p-8" style="font-family: 'Prosto One', cursive">
      <div
        class="flex flex-col justify-between items-center gap-6 mt-4 md:flex-row my-8 md:my-10"
      >
        <h1
          class="max-w-md text-2xl text-white font-bold text-center md:text-3xl md:text-left"
        >
          All Movies
        </h1>
        <!-- <div> -->
        <!-- <input
            type="text"
            name="searchName"
            id="inputMovie"
            v-model="inputMovie"
            @change="searchMovies"
            placeholder="Search a Movie"
            class="bg-gray-100 border border-gray-500 rounded py-1 px-3 block focus:ring-red-500 focus:border-red-500 text-gray-100"
          />
        </div> -->
        <input
          type="date"
          name="filterDate"
          id="dateInput"
          :min="this.currentDate"
          v-model="selectedDate"
          @change="getMovies"
          class="bg-gray-800 border border-gray-400 rounded py-2 px-3 block focus:ring-red-500 focus:border-red-500 text-gray-100"
        />
      </div>

      <Cards
        v-if="movies.length"
        :movies="movies"
        :date="selectedDate"
       
      />
      <div
        v-else
        class="flex justify-center items-center text-2xl text-gray-100 min-h-screen"
      >
        {{ empty }}
      </div>
    </section>
  </div>
</template>

<script>
// @ is an alias to /src
import NavbarComponent from "@/components/NavbarComponent.vue";
import Cards from "@/components/CardsCollection.vue";
import axios from "axios";
export default {
  name: "HomeView",
  components: {
    NavbarComponent,
    Cards,
  },
  data() {
    return {
      movies: [],
      user_ref: localStorage.getItem("ref"),
      user_name: localStorage.getItem("user_name"),
      selectedDate: new Date().toISOString().substring(0, 10),
      currentDate: new Date().toISOString().substring(0, 10),
      empty: "",
    };
  },

  methods: {
    // changes() {
    //   console.log("Input Date  : ", this.inputDate);
    //   this.filterMovies();
    // },
    removeWeekend() {
      const picker = document.getElementById("dateInput");
      picker.addEventListener("change", function () {
        var day = new Date(this.value).getDay();
        if (day === 0) {
          this.empty = "It is Saturday !";
          // e.reload();
          this.value = "";

          alert("Weekends not allowed").then(() => this.removeWeekend());
        }
      });
    },
    logout() {
      localStorage.clear();
    },
    getMovies() {
      console.log("Selected Date  : ", this.selectedDate);
      axios
        .get(
          `http://localhost/CineHall/BackEnd/movies/filterMovies/${this.selectedDate}`
        )
        .then((res) => {
          this.movies = res.data;
          if (res.data.Success) {
            this.movies = res.data.Success;

            this.empty = "";
          } else if (res.data.Empty) {
            this.movies = [];
            this.empty = res.data.Empty;
          }
          console.log("Filter Movies  : ", this.movies);
        });
    },
  },
  async beforeMount() {
    // await axios
    //   .get(`http://localhost/CineHall/BackEnd/movies/getAllMovies`)
    //   .then((res) => {
    //     this.movies = res.data;
    //     // console.log('Movies  : ', this.movies);
    //   });
    this.getMovies();
  },
  beforeCreate() {
    if (!localStorage.getItem("ref")) {
      this.$router.push("/login");
    }
  },
  mounted() {
    this.removeWeekend();
  },
};
</script>
