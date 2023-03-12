<template>
  <router-link :to="{ name: 'movie', query: { is: id } }">
    <div class="w-full bg-gray-800 bg-opacity-0 relative rounded-lg glass">
      <img class="w-full h-80 rounded-lg sm:max-h-80" :src="image" alt="" />

      <div class="p-3 flex flex-col gap-2 md:gap-4">
        <h5
          class="text-md tracking-tight font-bold text-white dark:text-white md:text-lg"
        >
          {{ title }}
        </h5>

        <!-- <div>
        <p
          class="font-normal text-gray-500 text-xs dark:text-gray-400 md:text-sm"
        ></p>
        <h5
          class="text-md tracking-tight font-bold text-gray-900 dark:text-white md:text-lg"
        ></h5>
      </div> -->
        <div class="w-full flex items-align justify-center">
          <router-link
            :to="{ name: 'movie', query: { is: id } }"
            class="w-full inline-flex justify-center px-6 py-2.5 bg-black text-white font-medium text-xs leading-normal uppercase rounded shadow-md hover:bg-orange-700 hover:shadow-lg focus:bg-orange-600 focus:shadow-lg focus:outline-none focus:ring-0 active:bg-orange-600 active:shadow-lg transition duration-150 ease-in-out"
          >
            Book now
            <svg
              aria-hidden="true"
              class="w-4 h-4 ml-2 -mr-1"
              fill="currentColor"
              viewBox="0 0 20 20"
              xmlns="http://www.w3.org/2000/svg"
            >
              <path
                fill-rule="evenodd"
                d="M10.293 3.293a1 1 0 011.414 0l6 6a1 1 0 010 1.414l-6 6a1 1 0 01-1.414-1.414L14.586 11H3a1 1 0 110-2h11.586l-4.293-4.293a1 1 0 010-1.414z"
                clip-rule="evenodd"
              ></path>
            </svg>
          </router-link>
        </div>
      </div>
    </div>
  </router-link>
</template>

<script>
export default {
  name: "CardComponent",
  props: ["id", "title", "image", "rating", "date", "year", "price", "hall_id"],
  methods: {},
};
</script>

<style></style>
