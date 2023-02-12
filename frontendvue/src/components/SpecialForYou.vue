<template>
  <div class=" bg-gray-800 bg-opacity-0 relative rounded-lg glass">
    <img class="w-80 rounded-lg " :src="image" alt="" />

    <div class="p-3 flex flex-col gap-2 md:gap-4">
      <h5
        class="text-md tracking-tight font-bold text-white dark:text-white md:text-lg"
      >
        {{ title }}
      </h5>
    </div>
  </div>
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
  ],
  methods: {},
};
</script>

<style></style>
