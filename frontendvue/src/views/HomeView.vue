<template>
  <div class="home">
    <!-- <img alt="Vue logo" src="../assets/logo.png"> -->
    <NavbarComponent></NavbarComponent>
    <HeroComponent></HeroComponent>
    <!-- Movies -->
    <section
      id="cruises"
      class="my-10 px-6 md:px-8 md:my-14"
      style="font-family: 'Prosto One', cursive"
    >
      <h1
        class="max-w-md text-1xl font-bold text-center my-6 md:text-3xl md:text-left md:my-8"
      >
        All Movies
      </h1>
      <div
      id="paginated-list" data-current-page="1" aria-live="polite" class="grid grid-cols-1 gap-4 sm:grid-cols-2 items-start md:grid-cols-3 lg:grid-cols-4"
      >
    
        <CardComponent
          v-for="movie in movies"
          v-bind:key="movie.id"
          :image="movie.image"
          :title="movie.title"
          
        />
       
      </div>
      <nav class="pagination-container inline-flex overflow-x-scroll">
            <button class="pagination-button px-1 sm:px-3 sm:py-1 ml-0 leading-tight text-white bg-orange-500 rounded-l-sm hover:bg-gray-900 hover:text-gray-100 " id="prev-button" aria-label="Previous page" title="Previous page">
                Previous
            </button>

            <div id="pagination-numbers">

            </div>

            <button class="pagination-button px-3 py-2 ml-0 leading-tight text-white bg-orange-500 rounded-r-sm hover:bg-gray-900 hover:text-gray-100" id="next-button" aria-label="Next page" title="Next page">
                Next
            </button>
        </nav>
    </section>
  </div>
</template>

<script>

// @ is an alias to /src
import NavbarComponent from "@/components/NavbarComponent.vue";
import HeroComponent from "@/components/HeroComponent.vue";
import CardComponent from "@/components/CardComponent.vue";
import axios from "axios";

export default {
  name: "HomeView",
  components: {
    NavbarComponent,
    HeroComponent,
    CardComponent,
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
        console.log(this.movies);
      });

      
  },
};
</script>
