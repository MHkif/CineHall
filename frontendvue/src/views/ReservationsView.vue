<template>
  <div class="reservations"></div>
</template>

<script>
// import NavbarComponent from "@/components/NavbarComponent.vue";
// import CardComponent from "@/components/CardComponent.vue";
import axios from "axios";

export default {
  name: "ReservationsView",
  components: {
    // NavbarComponent,
    // CardComponent,
  },
  data() {
    return {
      movies: "",
    };
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
