<template>
  <div class="reservation bg-gray-900 h-screen">
    <NavbarComponent></NavbarComponent>
    <section
      class="container p-6 mx-auto bg-gray-900 font-mono md:p-12"
      style="font-family: 'Poppins', sans-serif"
    >
      <h1
        v-if="reservedMovies.length > 0"
        class="text-xl font-semibold leading-relaxed text-gray-200 p-4 md:text-left md:text-2xl"
      >
        My Reservations
      </h1>
      <h1
        v-else
        class="text-xl font-semibold leading-relaxed text-gray-200 p-4 text-center md:text-2xl"
      >
        {{ this.error }}
      </h1>

      <ReservationTable
        @cancel="cancel"
        v-if="reservedMovies.length"
        :movies="reservedMovies"
      />
    </section>
  </div>
</template>

<script>
import NavbarComponent from "@/components/NavbarComponent.vue";
import ReservationTable from "@/components/ReservationTable.vue";
import Swal from "sweetalert2";

import axios from "axios";

export default {
  name: "ReservationsView",
  components: {
    NavbarComponent,
    ReservationTable,
  },
  data() {
    return {
      reservedMovies: [],
      error: "",
      user_ref: localStorage.getItem("ref"),
      user_name: localStorage.getItem("user_name"),
    };
  },
  methods: {
    getUserReservation() {
      axios
        .get(
          `http://localhost/CineHall/BackEnd/reservations/getUserReservations/${this.user_ref}`
        )
        .then((res) => {
          if (res.data.Success) {
            this.reservedMovies = res.data.Success;
            this.error = "";
          } else if (res.data.Error) {
            this.error = res.data.Error;
            console.log(res.data.Error);
            this.reservedMovies = [];
          } else {
            this.error = "";
            this.reservedMovies = [];
            console.log(res.data);
          }
        });
    },
    cancel(res_id, ref, movie_id, hall_id) {
      console.log("id : ", res_id, "user_ref : ", ref, "hall : ",hall_id);
      const formdata = new FormData();
      formdata.append("user_ref", ref);
      formdata.append("res_id", res_id);
      formdata.append("movie_id", movie_id);
      formdata.append("hall_id", hall_id);

      axios({
        url: "http://localhost/CineHall/BackEnd/reservations/cancelReservation",
        method: "post",
        data: formdata,
      })
        .then((res) => {
          if (res.data.Success) {
            console.log(res.data.Success);
          } else if (res.data.Error) {
            console.log(res.data.Error);
          } else if (res.data.OutOfDate) {
            Swal.fire({
              icon: "error",
              title: "Out Of Date",
              text: `${res.data.OutOfDate}`,
              showConfirmButton: false,
              timer: 2500,
            });
            console.log(res.data.OutOfDate);
          } else {
            console.log("From Else ", res.data);
          }
        })
        .then(() => this.getUserReservation());
    },
  },
  beforeCreate() {
    if (!localStorage.getItem("ref")) {
      this.$router.push("/login");
    }
  },
  async beforeMount() {
    await this.getUserReservation();
  },
};
</script>
