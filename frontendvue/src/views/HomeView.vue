<template>
  <div class="home bg-gray-900">
    <NavbarComponent />

    <!-- Movies -->

    <section class="px-6 md:px-8" style="font-family: 'Prosto One', cursive">
      <div
        class="flex flex-col justify-between items-center gap-6 mt-4 md:flex-row my-8 md:my-10"
      >
        <h1
          class="max-w-md text-2xl text-white font-bold text-center md:text-3xl md:text-left"
        >
          All Movies
        </h1>
        <div>
          <input
            type="text"
            name="searchName"
            id="inputMovie"
            v-model="inputMovie"
            @change="searchMovies"
            placeholder="Search a Movie"
            class="bg-gray-100 border border-gray-500 rounded py-1 px-3 block focus:ring-red-500 focus:border-red-500 text-gray-100"
          />
        </div>
      </div>

      <Cards v-if="!empty" :movies="movies" />
      <div
        v-if="this.empty"
        class="flex flex-col items-center justify-center text-2xl text-gray-100 mt-20"
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
      movies: "",
      user_ref: localStorage.getItem("ref"),
      user_name: localStorage.getItem("user_name"),
      inputDate: "",
      empty: "",
    };
  },

  methods: {
    // changes() {
    //   console.log("Input Date  : ", this.inputDate);
    //   this.filterMovies();
    // },
    logout() {
      localStorage.clear();
    },
    searchMovies() {
      axios
        .get(
          `http://localhost/CineHall/BackEnd/movies/filterMovies/${this.inputDate}`
        )
        .then((res) => {
          this.movies = res.data;
          if (res.data.Success) {
            this.movies = res.data.Success;
            this.empty = "";
          } else if (res.data.Empty) {
            this.empty = res.data.Empty;
          }
          // console.log('Filter Movies  : ', this.movies);
        });
    },
  },
  async beforeMount() {
    await axios
      .get(`http://localhost/CineHall/BackEnd/movies/getAllMovies`)
      .then((res) => {
        this.movies = res.data;
        // console.log('Movies  : ', this.movies);
      });
  },
  beforeCreate() {
    if (!localStorage.getItem("ref")) {
      this.$router.push("/login");
    }
  },
};
</script>
