<template>
  <div class="w-full mb-8 overflow-hidden rounded shadow-lg">
    <div class="w-full overflow-x-auto">
      <table class="w-full">
        <thead>
          <tr
            class="text-xs tracking-wide text-left text-gray-100 bg-gray-800 rounded uppercase border-b border-gray-600 font-semibold md:text-sm"
          >
            <th class="p-3">Movie</th>
            <th class="p-3">Reserved At</th>
            <th class="p-3">Hall</th>
            <th class="p-3">Show Date</th>
            <th class="p-3 w-20">Seat's Number</th>
            <th class="p-3">Action</th>
          </tr>
        </thead>
        <tbody class="bg-gray-700">
          <tr
            v-for="movie in this.movies"
            :key="movie.id"
            class="text-gray-300 text-left"
          >
            <td class="px-4 py-3">
              <div class="flex justify-start items-center text-sm">
                <div class="relative w-16 h-20 mr-3 rounded-sm md:block">
                  <img
                    class="object-fit w-full h-full rounded-sm"
                    :src="movie.image"
                    alt=""
                    loading="lazy"
                  />
                  <div
                    class="absolute inset-0 rounded-sm shadow-inner"
                    aria-hidden="true"
                  ></div>
                </div>
                <div class="flex flex-col items-start">
                  <p class="font-semibold text-white text-left">
                    {{ movie.title }}
                  </p>
                </div>
              </div>
            </td>
            <td class="px-4 py-3 text-sm font-semibold">
              {{ movie.reserved_at }}
            </td>

            <td class="px-4 py-3 text-sm font-semibold">{{ movie.hall_name }}</td>
            <td class="px-4 py-3 text-sm font-semibold">
              {{ movie.show_date }}
            </td>
            <td class="px-4 py-3 text-sm">{{ movie.seat_number }}</td>
            <td class="py-4 px-6 text-sm space-x-2 text-center text-red-600">
              <!-- <div $emit('cancle', movie.res_id, movie.user_ref)  @click="cancel(movie.res_id, movie.user_ref)">Cancel</div> -->
              <div @click="this.$emit('cancel', movie.res_id, movie.user_ref, movie.id_of_movie, movie.id_of_hall)">
                Cancel
              </div>
            </td>
          </tr>
        </tbody>
      </table>
    </div>
  </div>
</template>

<script>
// import axios from "axios";

export default {
  name: "ReservationTable",

  props: {
    movies: Array,
  },
  methods: {
    // cancel(res_id, ref) {
    //   console.log("id : ", res_id, "user_ref : ", ref);
    //   const formdata = new FormData();
    //   formdata.append("user_ref", ref);
    //   formdata.append("res_id", res_id);
    //   axios({
    //     url: "http://localhost/CineHall/BackEnd/reservations/cancelReservation",
    //     method: "post",
    //     data: formdata,
    //   }).then((res) => {
    //     if (res.data.Success) {
    //       console.log(res.data.Success);
    //     } else if (res.data.Error) {
    //       console.log(res.data.Error);
    //     } else {
    //       console.log(res.data);
    //     }
    //   });
    // },
  },
};
</script>
<style scoped></style>
