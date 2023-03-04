<template>
  <div
    id="paginated-list"
    data-current-page="1"
    aria-live="polite"
    class="grid grid-cols-1 gap-4 sm:grid-cols-2 items-start md:grid-cols-3 lg:grid-cols-4"
  >
    <CardComponent
      v-for="movie in movies"
      :key="movie.id"
      :image="movie.image"
      :title="movie.title"
      :id="movie.id"
    />
  </div>
</template>

<script>
import CardComponent from "./CardComponent.vue";

export default {
  name: "CardsCollection",
  components: {
    CardComponent,
  },
  props: {
    movies: Array,
  },
};
</script>
<style scoped></style>
