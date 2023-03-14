<template>
  <div class="movie bg-gray-900">
    <NavbarComponent></NavbarComponent>

    <div class="container p-10 mx-auto bg-gray-900 md:p-20">
      <div
        class="container w-full flex flex-col-reverse mx-auto bg-gray-800 rounded-md md:flex-row"
      >
        <div
          id="Content"
          class="text-left gap-12 flex flex-col backdrop-blur-sm bg-black/20 border border-gray-700 p-8 rounded-l w-full md:w-[70%] md:flex-row"
        >
          <div
            id="left-side"
            class="flex flex-col justify-between w-full md:w-[60%]"
          >
            <div id="description" class="w-full">
              <h1 class="text-white font-medium pb-4 border-b border-gray-700">
                Title
              </h1>
              <h1 class="text-white text-md font-bold py-4">
                {{ movie.title }}
              </h1>
            </div>

            <div id="description" class="w-full">
              <h1 class="text-white font-medium pb-4 border-b border-gray-700">
                Description
              </h1>
              <p class="text-sm text-gray-500 tracking-wider pt-4">
                {{ movie.description }}
              </p>
            </div>
          </div>

          <div id="right-side" class="flex flex-col gap-4 w-full md:w-[40%]">
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
            <div
              class="flex items-center justify-between pb-4 border-b border-gray-700"
            >
              <h1 class="text-white font-medium">Hall</h1>
              <h1 class="text-red-600 font-medium">
                {{ movie.hall_id }}
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

      <div class="py-16 space-y-16">
        <div class="space-y-16">
          <div
            v-if="!full"
            class="grid grid-cols-5 contant-center gap-3 md:w-[45%] mx-auto"
          >
            <!-- <div @click="reserve(seat)" v-for="seat in 50" :key="seat"> -->
            <i
              @click="reserve(seat)"
              v-for="seat in 50"
              :key="seat"
              class="fa-solid fa-couch text-white text-2xl"
              :class="reservedSeats.includes(seat) ? 'text-red-600' : ''"
            ></i>
            <!-- </div> -->
          </div>
          <div
            v-else
            class="flex flex-col items-center justify-center text-2xl text-gray-100 mt-20"
          >
            {{ full }}
          </div>
          <!-- <input
          type="button"
          value="Reserve"
          class="bg-red-500 text-gray-100 py-3 px-6 rounded tracking-wide font-semibold font-display focus:outline-none focus:shadow-outline hover:text-red-600 hover:border border-red-700 hover:bg-gray-900 shadow-lg md:mt-4"
        /> -->
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import NavbarComponent from "@/components/NavbarComponent.vue";
import Swal from "sweetalert2";
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
      user_ref: localStorage.getItem("ref"),
      user_name: localStorage.getItem("user_name"),
      selectedDate: new Date().toISOString().substring(0, 10),
      currentDate: new Date().toISOString().substring(0, 10),
      reservedSeats: [],
      halls: [],

      full: "",
    };
  },

  mounted() {
    this.getMovie();
    this.getHall();
    console.log(this.$route);
    // this.removeWeekend();
  },
  methods: {
    // changes() {
    //   console.log(
    //     "Input Date  : ",
    //     this.selectedDate,
    //     " Input Hall : ",
    //     this.selectedHall
    //   );
    //   this.getMovieReservedSeats();
    // },

    getMovie() {
      axios
        .get(
          `http://localhost/CineHall/BackEnd/movies/getMovie/${this.$route.query.id}`
        )
        .then((res) => (this.movie = res.data))
        .then(() => {
          this.getMovieReservedSeats();
        });
    },
    getMovieReservedSeats() {
      // console.log("Hall Id : ", this.movie.hall_id);
      const seatsForm = new FormData();
      // formdata.append("user_ref", this.user_ref);
      seatsForm.append("hall_id", this.movie.hall_id);
      seatsForm.append("show_date", this.$route.query.date);
      seatsForm.append("movie_id", this.movie.id);
      // formdata.append("seat", seat);
      axios({
        url: "http://localhost/CineHall/BackEnd/movies/reservedSeats",
        method: "post",
        data: seatsForm,
      }).then((res) => {
        if (res.data.Success) {
          this.reservedSeats = res.data.Success;
          console.log("Reserved Seats Response : ", res.data.Success);
          this.full = "";
        } else if (res.data.Full) {
          (this.reservedSeats = []),
            console.log("Reserved Seats Response  Full: ", res.data.Full);
          this.full = res.data.Full;
        } else if (res.data.Empty) {
          console.log("Reserved Seats Response : ", res.data.Empty);
          this.reservedSeats = [];
          this.full = "";
        } else {
          console.log("Reserved Seats Response : ", res.data);
          this.reservedSeats = [];
          this.full = "";
        }
      });
    },
    getHall() {
      // console.log("Hall Id : ", this.movie.hall_id);
      const seatsForm = new FormData();
      // formdata.append("user_ref", this.user_ref);
      seatsForm.append("hall_id", this.selectedHall);
      seatsForm.append("show_date", this.selectedDate);
      seatsForm.append("movie_id", this.movie.id);
      // formdata.append("seat", seat);
      axios({
        url: "http://localhost/CineHall/BackEnd/halls/getAllHalls",
        method: "get",
      }).then((res) => (this.halls = res.data));
    },
    // removeWeekend() {
    //   const picker = document.getElementById("date1");
    //   picker.addEventListener("change", function (e) {
    //     var day = new Date(this.value).getDay();
    //     if (day === 0) {
    //       e.preventDefault();
    //       this.value = "";
    //       alert("Weekends not allowed");
    //     }
    //   });
    // },
    reserve(seat) {
      if (seat != null) {
        if (!this.reservedSeats.includes(seat)) {
          const formdata = new FormData();
          formdata.append("user_ref", this.user_ref);
          formdata.append("hall_id", this.movie.hall_id);
          formdata.append("show_date", this.$route.query.date);
          formdata.append("movie_id", this.movie.id);
          formdata.append("seat", seat);

          axios({
            url: "http://localhost/CineHall/BackEnd/reservations/addReservation",
            method: "post",
            data: formdata,
          })
            .then((res) => {
              if (res.data.Full) {
                Swal.fire({
                  icon: "warning",
                  title: "Full Hall",
                  text: `${res.data.Full}`,
                  showConfirmButton: false,
                  timer: 2500,
                });
              } else if (res.data.Success) {
                Swal.fire({
                  icon: "success",
                  title: "Seat Reserved",
                  text: `${res.data.Success}`,
                  showConfirmButton: false,
                  timer: 2000,
                }).then((res) => {
                  if (res.isConfirmed || res.isDenied || res.isDismissed) {
                    this.getMovieReservedSeats();
                  } else {
                    console.log("The Res  : ", res);
                  }
                });
              } else if (res.data.Error) {
                Swal.fire({
                  icon: "error",
                  title: "Oops...",
                  text: `${res.data.Error}`,
                });
              } else {
                console.log(res.data);
              }
            })
            .catch((res) => {
              // console.log("Error", res.data);
              console.log(res.data);
              Swal.fire({
                icon: "error",
                title: "Oops...",
                text: `${res.data.Error}`,
              });
            });
        } else {
          Swal.fire({
            icon: "warning",
            title: "Taken Seat",
            text: "This Seat is Already Taken",
            confirmButtonText: "Try Again ",
            confirmButtonColor: "#1C1B1F",
          });
        }
      } else {
        Swal.fire({
          icon: "error",
          title: "Empty Selection",
          text: "Please Pick Date And Select A Hall First",
          confirmButtonText: "Try Again ",
          confirmButtonColor: "#1C1B1F",
        });
      }
    },
  },
  beforeCreate() {
    if (!localStorage.getItem("ref")) {
      this.$router.push("/login");
    }
  },
};
</script>
