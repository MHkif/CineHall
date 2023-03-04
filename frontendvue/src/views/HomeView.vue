<template>
  <div class="home bg-gray-900">
    <NavbarComponent/>

    <!-- Movies -->
    <section class="px-6 md:px-8" style="font-family: 'Prosto One', cursive">
      <h1
        class="max-w-md text-1xl text-white font-bold text-center my-6 md:text-3xl md:text-left md:my-8"
      >
        All Movies
      </h1>
      <Cards :movies="movies" />
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
    };
  },
  methods: {
    logout() {
      localStorage.clear();
    },
  },
  mounted() {
    axios
      .get("http://localhost/CineHall/BackEnd/movies/getAllMovies")
      .then((res) => {
        this.movies = res.data;
        // console.log(this.movies);
      });
  },
};
</script>
