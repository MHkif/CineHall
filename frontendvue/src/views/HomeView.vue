<template>
  <div class="home bg-gray-900">
    <NavbarComponent></NavbarComponent>

    <div
      class="flex flex-col-reverse pt-8 pb-24 justify-bewteen gap-4 w-full h-screen md:px-12 md:flex-row md:gap-10"
    >
      <div class="h-full rounded-md md:w-2/3">
        <iframe
          class="rounded-md h-full w-full"
          src="https://www.youtube.com/embed/EXeTwQWrcwY"
        >
        </iframe>
      </div>
      <div
        class="h-full rounded md:w-1/3 transition ease-in-out delay-150 hover:-translate-y-1 hover:scale-105 hover:rounded-md"
      >
        <img
          class="object-fill h-full w-full rounded-md"
          src="https://m.media-amazon.com/images/M/MV5BMTMxNTMwODM0NF5BMl5BanBnXkFtZTcwODAyMTk2Mw@@._V1_QL75_UX380_CR0,0,380,562_.jpg"
        />
      </div>
    </div>

   <div class="flex gap-8 overflow-auto">

    <SpecialForYou
      v-for="movie in movies"
      v-bind:key="movie.id"
      :image="movie.image"
      :title="movie.title"
    />

   </div>
    <!-- Movies -->
    <section
      class="my-10 px-6 md:px-8 md:my-14"
      style="font-family: 'Prosto One', cursive"
    >
      <h1
        class="max-w-md text-1xl text-white font-bold text-center my-6 md:text-3xl md:text-left md:my-8"
      >
        All Movies
      </h1>
      <div
        id="paginated-list"
        data-current-page="1"
        aria-live="polite"
        class="grid grid-cols-1 gap-4 sm:grid-cols-2 items-start md:grid-cols-3 lg:grid-cols-4"
      >
        <CardComponent
          v-for="movie in movies"
          v-bind:key="movie.id"
          :image="movie.image"
          :title="movie.title"
        />
      </div>
    </section>
  </div>
</template>

<script>
// @ is an alias to /src
import NavbarComponent from "@/components/NavbarComponent.vue";
import SpecialForYou from "@/components/SpecialForYou.vue";
import CardComponent from "@/components/CardComponent.vue";
import axios from "axios";

export default {
  name: "HomeView",
  components: {
    NavbarComponent,
    SpecialForYou,
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
