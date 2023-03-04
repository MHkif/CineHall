<template>
  <div class="snap-start scroll-mx-6 shrink-0">
    <!-- <img class="shrink-0 w-72 h-40 rounded-lg shadow-xl bg-white" :src="image" alt="" /> -->

    <iframe id="trailers" class="rounded-md h-full w-full" :src="trailer">
    </iframe>

    <div class="p-3 flex flex-col gap-2 md:gap-4">
      <!-- <h5
        class="text-md tracking-tight font-medium text-white dark:text-white "
      >
        {{ title }}
      </h5> -->
    </div>
  </div>

  <!-- <div class=" bg-gray-800 bg-opacity-0 relative rounded-lg glass">
    <img class="w-80 rounded-lg " :src="image" alt="" />

    <div class="p-3 flex flex-col gap-2 md:gap-4">
      <h5
        class="text-md tracking-tight font-bold text-white dark:text-white md:text-lg"
      >
        {{ title }}
      </h5>
    </div>
  </div> -->
</template>

<script>
export default {
  name: "SpecialForYou",
  props: [
    "id",
    "title",
    "image",
    "rating",
    "date",
    "year",
    "price",
    "hall_name",
    "trailer",
  ],
  methods: {},
};
</script>

<style>

</style>
