<template>
  <div class="movie bg-gray-900">
    <NavbarComponent></NavbarComponent>
    <div class="container p-10 mx-auto bg-gray-900 md:p-20">
      <h1 class="text-white text-lg font-bold pb-4 border-b border-gray-700">
        {{ movie.title }}
      </h1>
      <div
        class="container w-full flex flex-col-reverse mx-auto bg-gray-800 rounded-md md:flex-row"
      >
        <div
          id="Content"
          class="text-left gap-12 flex flex-col backdrop-blur-sm bg-black/20 border border-gray-700 p-8 rounded-l w-full md:w-[70%] md:flex-row"
        >
          <div
            id="description"
            class="flex flex-col justify-between w-full md:w-[60%]"
          >
            <h1 class="text-white font-medium pb-4 border-b border-gray-700">
              Description
            </h1>
            <p class="text-sm text-gray-500 tracking-wider pt-4">
              {{ movie.description }}
            </p>
            <div id="display" class="w-full md:w-[60%]">
              <h1 class="text-white font-medium pb-4 border-b border-gray-700">
                Display date
              </h1>
              <p class="text-sm text-gray-500 tracking-wider pt-4">
                {{ movie.date }}
              </p>
            </div>
          </div>

          <div id="table" class="flex flex-col gap-4 w-full md:w-[40%]">
            <div
              class="flex items-center justify-between pb-4 border-b border-gray-700"
            >
              <h1 class="text-white font-medium">Genre</h1>
              <h1 class="text-red-600 font-medium">
                {{ movie.genre }}
              </h1>
            </div>
            <div
              class="flex items-center justify-between pb-4 border-b border-gray-700"
            >
              <h1 class="text-white font-medium">Film Director</h1>
              <h1 class="text-red-600 font-medium">
                {{ movie.director }}
              </h1>
            </div>
            <div
              class="flex items-center justify-between pb-4 border-b border-gray-700"
            >
              <h1 class="text-white font-medium">Year</h1>
              <h1 class="text-red-600 font-medium">
                {{ movie.year }}
              </h1>
            </div>
            <div
              class="flex items-center justify-between pb-4 border-b border-gray-700"
            >
              <h1 class="text-white font-medium">Rating</h1>
              <h1 class="text-red-600 font-medium">
                {{ movie.rating }}
              </h1>
            </div>
          </div>
        </div>
        <div
          id="image"
          class="max-h-80 bg-gray-600 rounded-r w-full md:w-[30%] overflow-hidden"
        >
          <img class="w-full rounded-r h-full" :src="movie.image" alt="" />
        </div>
      </div>
      <div class="py-10">
        <h1 class="text-white text-lg font-bold pb-4 border-b border-gray-700 mb-8">
          Raserve Now
        </h1>
        <div class=" grid grid-cols-5 justify-items-center">
          <div  v-for="n in 50" :key="n">
            <i class="fa-solid fa-couch text-white text-2xl"></i>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import NavbarComponent from "@/components/NavbarComponent.vue";
// import CardComponent from "@/components/CardComponent.vue";
import axios from "axios";

export default {
  name: "MovieView",
  components: {
    NavbarComponent,
    // CardComponent,
  },
  data() {
    return {
      movie: "",
      reservedSeats: [],
    };
  },
  props: ["id"],
  methods: {
    updateRes() {
      axios
        .get(
          `http://localhost/CineHall/Backend/halls/getTakenSeats/${this.$route.query.is}`
        )
        .then((res) => (this.reservedSeats = res.data))
        .then(console.log(this.reservedSeats));
    },
    getChecked() {
      let seats = document.getElementsByClassName("seat");
      let checked_seat;
      for (let i = 0; i < seats.length; i++) {
        if (seats[i].checked && !seats[i].disabled) {
          checked_seat = parseInt(seats[i].value);
        }
      }
      return checked_seat;
    },
  },
  mounted() {
    axios
      .get(
        `http://localhost/CineHall/BackEnd/movies/getMovie/${this.$route.query.is}`
      )
      .then((res) => {
        this.movie = res.data;
        console.log(this.movie);
        console.log(this.$route.query.is);
      });
  },
};
</script>
